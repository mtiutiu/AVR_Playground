#include <Arduino.h>
#include <SPI.h>
#include <MyTransportNRF24.h>
#include <MyHwATMega328.h>
#include <MySensor.h>
#include <EEPROM.h>

// -------------------------------- CHANGE THIS SECTION ACCORDINGLY ---------------------------------
#define BOARD_XTAL_FREQUENCY  8000000UL  // pro mini board xtal frequency
#define FAST_ADC
#define HAS_FIXED_VOLTAGE_REGULATOR
//#define INSPECT_SYSTEM_CLOCK            // this needs CLKOUT fuse to be set
//#define MOCK_SENSOR_DATA
const uint8_t THIS_NODE_ID = 4;
// ---------------------------------------------------------------------------------------------------

// ------------------------------------- CPU FREQUECNY SCALING SECTION -------------------------------
#if F_CPU == 8000000UL
  #define WANT_8MHZ_SYSCLK
#elif F_CPU == 4000000UL
  #define WANT_4MHZ_SYSCLK
#elif F_CPU == 2000000UL
  #define WANT_2MHZ_SYSCLK
#elif F_CPU == 1000000UL
  #define WANT_1MHZ_SYSCLK
#endif
// ---------------------------------------------------------------------------------------------------

// ------------------------------------- CPU CLOCK EXTERNAL INSPECTION -------------------------------
#ifdef INSPECT_SYSTEM_CLOCK
// system clock value can be seen on this pin using a digital probe
const uint8_t SYS_CLKOUT_PIN = 8;
#endif
// ---------------------------------------------------------------------------------------------------

// --------------------------------------------- MCU ADC SECTION -------------------------------------
const uint16_t ADC_MAX_SCALE = 1023;
#ifdef HAS_FIXED_VOLTAGE_REGULATOR
const float ANALOG_REF_V = 3.3;
#endif
// ---------------------------------------------------------------------------------------------------

// ---------------------------------------- VOLTAGE REGULATOR SECTION --------------------------------
#ifdef HAS_FIXED_VOLTAGE_REGULATOR
// we need to read the battery direclty
const uint8_t BATTERY_STATE_ANALOG_READ_PIN = A2; 
#else
// here we read the battery level using the MCU internal voltage reference
#include <Vcc.h>

// this must be computed for every board for better precision
// the ratio is given by measuring voltage with a voltmeter
//  and dividing that with the value reported by the Vcc library
const float VCC_CORRECTION = 1.0;
Vcc vcc(VCC_CORRECTION);
#endif
// ---------------------------------------------------------------------------------------------------

// ----------------------------------- TMP102 TEMPERATURE SENSOR SECTION ----------------------------
#ifndef MOCK_SENSOR_DATA
#include <Wire.h>
#include <Tmp102.h>
#endif

const uint8_t TEMPERATURE_SENSOR_ID = 1;
const uint32_t SENSOR_SLEEP_INTERVAL_MS = 12000;  // 12s sensor data report interval
const uint8_t SENSOR_DATA_SEND_RETRIES = 10;
const uint32_t SENSOR_DATA_SEND_RETRIES_INTERVAL_MS = 20;

const uint32_t SENSOR_CONFIG_DATA_TIMEOUT_MS = 3000;
const uint32_t SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS = 10;
// ---------------------------------------------------------------------------------------------------

// ------------------------------------------ BATTERY STATUS SECTION ---------------------------------
const float CHARGED_VBATT_THRESHOLD_V = 3.3;
const float LOW_VBATT_THRESHOLD_V = 1.5;
const uint8_t VBATT_THRESHOLD_SAMPLES = 10;

// battery level report interval
//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t BATTERY_LVL_REPORT_INTERVAL_MS = 300000; // 5min(5 * 60 * 1000)
const uint32_t BATTERY_LVL_REPORT_CYCLES = BATTERY_LVL_REPORT_INTERVAL_MS / SENSOR_SLEEP_INTERVAL_MS;
// ---------------------------------------------------------------------------------------------------

// --------------------------------- EEPROM CUSTOM CONFIG DATA SECTION -------------------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
//we add 1 for storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown"
// was this node metadata configuration processed already ?
bool metadataConfigRequestProcessed = false;
// ---------------------------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// NRF24L01 radio driver
#ifndef RF24_RADIO_CE_PIN
  #define RF24_RADIO_CE_PIN 7
#endif

#ifndef RF24_RADIO_CS_PIN
  #define RF24_RADIO_CS_PIN 6
#endif

#ifndef RF24_RADIO_PA_LEVEL
  #define RF24_RADIO_PA_LEVEL RF24_PA_HIGH
#endif

MyTransportNRF24 radio(RF24_RADIO_CE_PIN, RF24_RADIO_CS_PIN, RF24_RADIO_PA_LEVEL);

// Select AtMega328 hardware profile
MyHwATMega328 hw;

MySensor gw(radio, hw);
// ---------------------------------------------------------------------------------------------------

uint8_t getBatteryLvlPcnt(uint8_t analogReadPin, uint8_t samples) {
  float batteryLvlPcnt = 0;
  
#ifdef HAS_FIXED_VOLTAGE_REGULATOR
  float vBattAnalogRead = 0;

  for (uint8_t i = 0; i < samples; i++) {
    vBattAnalogRead += analogRead(analogReadPin) / (float)samples;
  }
  vBattAnalogRead = (vBattAnalogRead * ANALOG_REF_V) / (float)ADC_MAX_SCALE;
  batteryLvlPcnt = 100.0 * (vBattAnalogRead - LOW_VBATT_THRESHOLD_V) / (CHARGED_VBATT_THRESHOLD_V - LOW_VBATT_THRESHOLD_V);
  batteryLvlPcnt = constrain(batteryLvlPcnt, 0.0, 100.0);

#else  
  batteryLvlPcnt = vcc.Read_Perc(LOW_VBATT_THRESHOLD_V, CHARGED_VBATT_THRESHOLD_V);
#endif
  
  return round(batteryLvlPcnt);
}

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
  return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char* metadata, char* nodeName, char* sensorName) {
  if (!metadata || !nodeName || !sensorName) {
    return;
  }

  if (nodeName && sensorName) {
    strncpy(nodeName, strtok(metadata, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(sensorName, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
  }
}

void loadNodeDefaultMetadata(char* nodeName, char* sensorName) {
  char metadata[MAX_NODE_METADATA_LENGTH];
  memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
  strncpy_P(metadata, PSTR(DEFAULT_NODE_METADATA), MAX_NODE_METADATA_LENGTH);

  parseNodeMetadata(metadata, nodeName, sensorName);
}

void loadNodeEepromMetadata(char* nodeName, char* sensorName) {
  if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK) || 
      (!nodeName && !sensorName)) {
    loadNodeDefaultMetadata(nodeName, sensorName);
    return;
  }

  char metadata[MAX_NODE_METADATA_LENGTH];
  memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
  for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
    metadata[i] = EEPROM.read(EEPROM_CUSTOM_METADATA_INDEX + i);
  }
  
  parseNodeMetadata(metadata, nodeName, sensorName);
}

void saveNodeEepromMetadata(const char* metadata) {
  if (metadata) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK)) {
      EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
    }

    for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++ ) {
      EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
    }
  }
}

// this gets called when we receive a setup request from the gateway
void incomingConfigRequestProcessing(const MyMessage &message) {  
  if (message.type == V_VAR1) {
    char recvMetadata[MAX_NODE_METADATA_LENGTH];
    memset(recvMetadata, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy(recvMetadata, message.getString(), MAX_NODE_METADATA_LENGTH);
    
    saveNodeEepromMetadata(recvMetadata);
    metadataConfigRequestProcessed = true;
  }
}

void presentNodeMetadata() {
  char nodeName[MAX_NODE_METADATA_LENGTH];
  char sensorName[MAX_NODE_METADATA_LENGTH];
  memset(nodeName, '\0', MAX_NODE_METADATA_LENGTH);
  memset(sensorName, '\0', MAX_NODE_METADATA_LENGTH);
  
  loadNodeEepromMetadata(nodeName, sensorName);
    
  gw.sendSketchInfo(nodeName, "");
  gw.present(TEMPERATURE_SENSOR_ID, S_TEMP, sensorName);
}

void sendKnockKnockMessage() {
  MyMessage controllerSetupRequestMsg(TEMPERATURE_SENSOR_ID, V_VAR1);
  gw.send(controllerSetupRequestMsg.set("knock"));
}

void waitForControllerConfigRequestReply(uint32_t timeout, uint32_t checkInterval, 
                                          bool& requestProcessingFinishedFlag) {
  uint32_t maxRetries = timeout / checkInterval;
  
  for (uint32_t retries = 0; !requestProcessingFinishedFlag && (retries < maxRetries); ++retries) {
    gw.wait(checkInterval); // we wanted sleep here..but it doesn't work - don't know why yet
    if (retries == 0) {
      // for synchronization with the controller so that it knows when to send configuration data
      sendKnockKnockMessage();
    }
  }
}

void setup() {
// compute the sysclk divider based on the board xtal frequency
#if defined(WANT_8MHZ_SYSCLK)
  #if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_1);
  #elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_2);
  #else
    #error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
  #endif  
#elif defined(WANT_4MHZ_SYSCLK)
  #if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_2);
  #elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_4);
  #else
    #error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
  #endif
#elif defined(WANT_2MHZ_SYSCLK)
  #if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_4);
  #elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_8);
  #else
    #error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
  #endif
#elif defined(WANT_1MHZ_SYSCLK)
  #if BOARD_XTAL_FREQUENCY == 8000000UL
    clock_prescale_set(clock_div_8);
  #elif BOARD_XTAL_FREQUENCY == 16000000UL
    clock_prescale_set(clock_div_16);
  #else
    #error "Don't know how to handle this BOARD_XTAL_FREQUENCY!"
  #endif
#endif

#ifdef INSPECT_SYSTEM_CLOCK
  pinMode(SYS_CLKOUT_PIN, OUTPUT);
#endif

#ifdef FAST_ADC
  #if F_CPU == 1000000UL
    // ADC clock divided by 2 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
  #elif F_CPU == 2000000UL
    // ADC clock divided by 4 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitSet(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
  #elif F_CPU == 4000000UL
    // ADC clock divided by 8 - 500KHz
    bitClear(ADCSRA, ADPS2);
    bitSet(ADCSRA, ADPS1);
    bitSet(ADCSRA, ADPS0);
  #elif F_CPU == 8000000UL
    // ADC clock divided by 16 - 500KHz
    bitSet(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitClear(ADCSRA, ADPS0);
  #elif F_CPU == 16000000UL
    // ADC clock divided by 32 - 500KHz
    bitSet(ADCSRA, ADPS2);
    bitClear(ADCSRA, ADPS1);
    bitSet(ADCSRA, ADPS0);
  #else
    #error "Don't know how to handle this F_CPU!"
  #endif
#endif

  #ifndef MOCK_SENSOR_DATA
  Wire.begin();
  Tmp102.init();
  #endif

  // process incoming config requests
  gw.begin(incomingConfigRequestProcessing, THIS_NODE_ID);
  
  waitForControllerConfigRequestReply(SENSOR_CONFIG_DATA_TIMEOUT_MS, 
                                      SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS, 
                                      metadataConfigRequestProcessed);

  presentNodeMetadata();
}

void loop()  {
  #ifdef MOCK_SENSOR_DATA
  float currentTemperature = random(20.0, 40.0);
  uint8_t currentBatteryLvlPcnt = random(0, 100);
  #else
  float currentTemperature = Tmp102.readTemperature();
  uint8_t currentBatteryLvlPcnt = getBatteryLvlPcnt(BATTERY_STATE_ANALOG_READ_PIN, VBATT_THRESHOLD_SAMPLES);
  #endif  

  MyMessage tempDataMsg(TEMPERATURE_SENSOR_ID, V_TEMP);
  for (uint8_t retries = 0; !gw.send(tempDataMsg.set(currentTemperature, 2)) &&
        (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
  
    // random sleep interval between retries for collisions
    gw.sleep(random(SENSOR_DATA_SEND_RETRIES_INTERVAL_MS) + 1);
  }

  // send battery state after BATTERY_LVL_REPORT_INTERVAL_MS interval elapsed
  //  BATTERY_LVL_REPORT_CYCLES reflects that because it counts SENSOR_SLEEP_INTERVAL_MS cycles
  static uint32_t batteryLvlReportCyclesCounter = 0;
  if(batteryLvlReportCyclesCounter++ >= BATTERY_LVL_REPORT_CYCLES) {
    gw.sendBatteryLevel(currentBatteryLvlPcnt);
    batteryLvlReportCyclesCounter = 0;
  }
  
  gw.sleep(SENSOR_SLEEP_INTERVAL_MS);
}
