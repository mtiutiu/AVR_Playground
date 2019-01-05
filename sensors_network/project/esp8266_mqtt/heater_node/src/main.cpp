//#define DEBUG

#ifdef DEBUG
  #ifndef DEBUG_OUTPUT
    #define DEBUG_OUTPUT Serial
  #endif
  #ifndef SERIAL_DEBUG_BAUDRATE
    #define SERIAL_DEBUG_BAUDRATE 115200
  #endif
#endif

#include <Arduino.h>
#include <Ticker.h>
#include "common.h"

// ----------------------------- OTA -------------------------------------------
#include "Ota.h"
// -----------------------------------------------------------------------------

// ------------------------ Module CONFIG --------------------------------------
#include "AppConfig.h"
#include "WiFiConfig.h"
#include "WebConfig.h"
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include "MySensorsApp.h"
// ------------------------ END MySensors---------------------------------------

// ------------------------ LED SIGNALING --------------------------------------
#if defined(HAS_BTN_LED) && ! defined(BTN_LED_PIN)
#define BTN_LED_PIN	D5
#endif

#define INVERSE_LED_LOGIC
#ifndef LED_SIGNAL_PIN
#define LED_SIGNAL_PIN  LED_BUILTIN
#endif
const uint32_t NOT_CONNECTED_SIGNALING_INTERVAL_MS = 300; // 300 ms

Ticker noTransportLedTicker;
// -----------------------------------------------------------------------------

// --------------------- ERASE CONFIG BUTTON -----------------------------------
//#define ERASE_CFG_BTN_INVERSE_LOGIC
#ifndef ERASE_CONFIG_BTN_PIN
#define ERASE_CONFIG_BTN_PIN  D1
#endif
// -----------------------------------------------------------------------------

// --------------------- HEATER CTRL BUTTON -----------------------------------
//#define HEATER_CTRL_BTN_INVERSE_LOGIC
// same button used for both configuration erasing and relay triggering
const uint8_t HEATER_CTRL_BTN = ERASE_CONFIG_BTN_PIN;
const uint32_t HEATER_CTRL_BTN_CHECK_INTERVAL_MS = 100; // 100 ms

Ticker heaterCtrlBtnCheckTicker;
// -----------------------------------------------------------------------------


void checkTransportConnection() {
  if (!MySensorsApp::connected()) {
    digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
  } else {
    // make sure led is off when connected
    digitalWrite(LED_SIGNAL_PIN,
  #ifdef INVERSE_LED_LOGIC
      HIGH
  #else
      LOW
  #endif
    );
  }
}

void checkHeaterCtrlBtn() {
  static uint32_t stillPressedCounter = 0;

#ifdef HEATER_CTRL_BTN_INVERSE_LOGIC
  if(digitalRead(ERASE_CONFIG_BTN_PIN)) {
#else
  if(!digitalRead(ERASE_CONFIG_BTN_PIN)) {
#endif
    if(stillPressedCounter++ > 0) {
      return;
    }
    // toggle relay
    TOGGLE_HEATER_RELAY();
    if(MySensorsApp::connected()) {
      // send relay state to gw
      MySensorsApp::sendHeaterState();
    }
  } else {
    stillPressedCounter = 0;
  }
}

void disableTickers() {
  heaterCtrlBtnCheckTicker.detach();
}

void portsConfig() {
#ifdef HAS_BTN_LED
  pinMode(BTN_LED_PIN, OUTPUT);
  digitalWrite(BTN_LED_PIN, HIGH);
#endif
  pinMode(LED_SIGNAL_PIN, OUTPUT);
  pinMode(ERASE_CONFIG_BTN_PIN,
#ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    INPUT
#else
    INPUT_PULLUP
#endif
  );

  pinMode(HEATER_CTRL_BTN,
#ifdef HEATER_CTRL_BTN_INVERSE_LOGIC
    INPUT
#else
    INPUT_PULLUP
#endif
  );

  digitalWrite(LED_SIGNAL_PIN,
#ifdef INVERSE_LED_LOGIC
    HIGH
#else
    LOW
#endif
  );

  pinMode(HEATER_CTRL_RELAY_PIN, OUTPUT);
  HEATER_RELAY_OFF();

  heaterCtrlBtnCheckTicker.detach();
  heaterCtrlBtnCheckTicker.attach_ms(HEATER_CTRL_BTN_CHECK_INTERVAL_MS, checkHeaterCtrlBtn);
}

void nodeWiFiConfig() {
  // transport connection signaling
  // enabling this before WiFiManager in order to have visual feedback ASAP
  noTransportLedTicker.detach();
  noTransportLedTicker.attach_ms(
    NOT_CONNECTED_SIGNALING_INTERVAL_MS,
    checkTransportConnection
  );

  // pressing erase config button and then pressing-releasing the reset button
  //  will erase wifi data and starts on demand portal
  // get reset cause first
  bool isExternalReset = (ESP.getResetInfoPtr()->reason == REASON_EXT_SYS_RST);
  WiFiConfig::startWiFiConfig(
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    isExternalReset && digitalRead(ERASE_CONFIG_BTN_PIN),
  #else
    isExternalReset && !digitalRead(ERASE_CONFIG_BTN_PIN)
  #endif
  );
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  portsConfig();
  AppConfig::init();
  nodeWiFiConfig();  // this blocks untill networking is configured and active
  WebConfig::begin(AppConfig::get()); // start web config server
  MySensorsApp::init(AppConfig::get());
  Ota::init();
}

void loop() {
  Ota::loop();

  if(Ota::inProgress()) {
    disableTickers();
  } else {
    WebConfig::loop();
    MySensorsApp::loop();
  }
}
