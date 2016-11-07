#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
//#define HAS_NODE_ID_SET_SWITCH
// -----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RF69_868MHZ

#define MY_NODE_ID 252

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

#include <MySensors.h>
// --------------------------------------------------------------------------------------------------------------

// -------------------------------- LIVOLO ACTUATOR SECTION ---------------------
const uint8_t NODE_SENSORS_COUNT = 1;
const uint8_t LIVOLO_ACTUATOR_SENSOR_ID = 1;

const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 300;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 1200;

// we expect 3 values: remote id, remote key and tx retries
//	remote_id:remote_key:tx_retries
struct LivoloCmd {
    uint16_t remoteId;
    uint8_t remoteKey;
    uint8_t txRetries;
};
LivoloCmd livoloCmdData;

bool livoloCmdMsgReceived = false;
bool sendStatus = false;

// transmitter connected to PC0(Arduino A0 - Rboard)
const uint8_t TX_DATA_PIN = A0;

// transmitter power supply pin
const uint8_t TX_POWER_SUPPLY_ENABLE_PIN = 0;
const uint32_t TX_POWER_SUPPLY_SETTLE_TIME_MS = 50;
const uint32_t KNOCK_MSG_WAIT_INTERVAL_MS = 3000;

#define TX_ENABLE_POWER_SUPPLY()   digitalWrite(TX_POWER_SUPPLY_ENABLE_PIN, HIGH)
#define TX_DISABLE_POWER_SUPPLY()  digitalWrite(TX_POWER_SUPPLY_ENABLE_PIN, LOW)

#include <Livolo.h>

Livolo livolo(TX_DATA_PIN);
// ------------------------------------------------------------------------------

// ---------------------------------------- DIP SW NODE ID CONFIGURATION ------------------------
#ifdef HAS_NODE_ID_SET_SWITCH
/*
| C0 | C1 | C2 | C3 | C4 | C5 | C6 |
|  3 |  4 | 5  |  6 |  7 |  8 |  9 |
*/

const uint8_t NODE_ID_SWITCH_PINS[] = {3, 4, 5, 6, 7, 8, 9};
#endif
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------------ BATTERY STATUS SECTION ---------------------------------
const uint32_t BATTERY_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)
// -----------------------------------------------------------------------------------------------------------

// --------------------------------- EEPROM CUSTOM CONFIG DATA SECTION ----------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
// we add 1 for storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown:Unknown"
// -------------------------------------------------------------------------------------------------------------

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
    return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char *metadata, char **nodeInfo, uint8_t maxFields) {
    if (!metadata || !nodeInfo) {
        return;
    }

    for (uint8_t i = 0; i < maxFields; i++) {
        if (i == 0) {
            strncpy(nodeInfo[i], strtok(metadata, ":"), MAX_NODE_METADATA_LENGTH);
            continue;
        }
        strncpy(nodeInfo[i], strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
    }
}

void loadNodeDefaultMetadata(char **nodeInfo, uint8_t maxFields) {
    char metadata[MAX_NODE_METADATA_LENGTH];
    memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy_P(metadata, PSTR(DEFAULT_NODE_METADATA), MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(metadata, nodeInfo, maxFields);
}

void loadNodeEepromRawMetadata(char *destBuffer, uint8_t len) {
    memset(destBuffer, '\0', len);
    for (uint16_t i = 0; i < len; i++) {
        destBuffer[i] = EEPROM.read(EEPROM_CUSTOM_METADATA_INDEX + i);
    }
}

void loadNodeEepromMetadataFields(char **nodeInfo, uint8_t maxFields) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                              EEPROM_FIRST_WRITE_MARK) ||
        !nodeInfo) {
        loadNodeDefaultMetadata(nodeInfo, maxFields);
        return;
    }

    char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
    loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(rawNodeMetadata, nodeInfo, maxFields);
}

void saveNodeEepromMetadata(const char *metadata) {
    if (metadata) {
        if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                                  EEPROM_FIRST_WRITE_MARK)) {
            EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
        }

        for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
            EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
        }
    }
}

void presentNodeMetadata() {
    char nodeName[MAX_NODE_METADATA_LENGTH];
    char livoloSensorName[MAX_NODE_METADATA_LENGTH];
    memset(nodeName, '\0', MAX_NODE_METADATA_LENGTH);
    memset(livoloSensorName, '\0', MAX_NODE_METADATA_LENGTH);

    char *nodeInfo[] = {
        nodeName,     // node friendly name
        livoloSensorName // node sensor friendly name
    };

    // load node metadata based on attached sensors count + the node name
    loadNodeEepromMetadataFields(nodeInfo, (NODE_SENSORS_COUNT + 1));

    sendSketchInfo(nodeName, MY_SENSOR_NODE_SKETCH_VERSION);
    present(LIVOLO_ACTUATOR_SENSOR_ID, S_CUSTOM, livoloSensorName);
}

#ifdef HAS_NODE_ID_SET_SWITCH
uint8_t readNodeIdSwitch() {
    uint8_t nodeId = 0;

    for (uint8_t i = 0; i < sizeof(NODE_ID_SWITCH_PINS); i++) {
        pinMode(NODE_ID_SWITCH_PINS[i], INPUT_PULLUP);
        nodeId |= !digitalRead(NODE_ID_SWITCH_PINS[i]) << i;
    }

    return nodeId;
}
#endif

void sendData(uint8_t sensorId, const char sensorData[], uint8_t dataType) {
    MyMessage sensorDataMsg(sensorId, dataType);

    for (uint8_t retries = 0; !send(sensorDataMsg.set(sensorData), false) &&
         (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
        // random sleep interval between retries for collisions
        wait(random(SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS,
            SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS));
    }
}

void sendKnockSyncMsg() {
    MyMessage knockMsg(LIVOLO_ACTUATOR_SENSOR_ID, V_VAR1);

    send(knockMsg.set("knock"), false);
    wait(KNOCK_MSG_WAIT_INTERVAL_MS);
}

// called by mysensors to set node id internally
// this is useful to set node id at runtime and
//  not at compile time with MY_NODE_ID preprocesor define
// needs mysensors core patched
uint8_t setNodeId() {
#ifdef HAS_NODE_ID_SET_SWITCH
	return readNodeIdSwitch();
#else
	return MY_NODE_ID;
#endif
}

// called automatically by mysensors core for doing node presentation
void presentation() {
    presentNodeMetadata();
}

// // called automatically by mysensors core for incomming messages
void receive(const MyMessage &message) {
    switch (message.type) {
        case V_VAR1:
            char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
            loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

            // save new node metadata only when they differ
            if (strncmp(message.getString(), rawNodeMetadata,
                        MAX_NODE_METADATA_LENGTH) != 0) {
                char recvMetadata[MAX_NODE_METADATA_LENGTH];
                memset(recvMetadata, '\0', MAX_NODE_METADATA_LENGTH);
                strncpy(recvMetadata, message.getString(), MAX_NODE_METADATA_LENGTH);
                saveNodeEepromMetadata(recvMetadata);
            }
            presentNodeMetadata();
            break;
        case V_VAR2:
            parseLivoloCmdMessage(message, livoloCmdData);
            livoloCmdMsgReceived = true;
            break;
        default:;
    }
}

void parseLivoloCmdMessage(const MyMessage &message, struct LivoloCmd& cmd) {
	char recvLivoloCmdData[MAX_NODE_METADATA_LENGTH];
    memset(recvLivoloCmdData, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy(recvLivoloCmdData, message.getString(), MAX_NODE_METADATA_LENGTH);

    char remoteIdStr[MAX_NODE_METADATA_LENGTH];
    memset(remoteIdStr, '\0', MAX_NODE_METADATA_LENGTH);

    char remoteKeyStr[MAX_NODE_METADATA_LENGTH];
    memset(remoteKeyStr, '\0', MAX_NODE_METADATA_LENGTH);

    char txRetriesStr[MAX_NODE_METADATA_LENGTH];
    memset(txRetriesStr, '\0', MAX_NODE_METADATA_LENGTH);

    strncpy(remoteIdStr, strtok(recvLivoloCmdData, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(remoteKeyStr, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(txRetriesStr, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);

    cmd.remoteId = (uint16_t)strtoul(remoteIdStr, NULL, 0);
    cmd.remoteKey = (uint8_t)strtoul(remoteKeyStr, NULL, 0);
    cmd.txRetries = (uint8_t)strtoul(txRetriesStr, NULL, 0);
}

void setup() {
    pinMode(TX_POWER_SUPPLY_ENABLE_PIN, OUTPUT);
}

void loop() {
    static bool firstInit = false;
    if(!firstInit) {
        sendKnockSyncMsg();
        firstInit = true;
        sendHeartbeat();
        sendBatteryLevel(100);
    }

    if (livoloCmdMsgReceived) {
        TX_ENABLE_POWER_SUPPLY(); //enable tx power supply line
        wait(TX_POWER_SUPPLY_SETTLE_TIME_MS);  // give it some time to settle

        livolo.sendButton(livoloCmdData.remoteId,
        				  livoloCmdData.remoteKey,
        				  livoloCmdData.txRetries);

        TX_DISABLE_POWER_SUPPLY();  // disable tx power supply line

        // send reply
        sendStatus = true;
        livoloCmdMsgReceived = false;
    }

    // echo back received livolo command string
    if (sendStatus) {
        char recvLivoloCmdData[MAX_NODE_METADATA_LENGTH];
        memset(recvLivoloCmdData, '\0', MAX_NODE_METADATA_LENGTH);
        sprintf_P(recvLivoloCmdData,
        		PSTR("sent:%d:%d:%d"),
        		livoloCmdData.remoteId,
        		livoloCmdData.remoteKey,
        		livoloCmdData.txRetries);

        MyMessage statusMsg(LIVOLO_ACTUATOR_SENSOR_ID, V_VAR2);
        // send new state back to controller
        sendData(LIVOLO_ACTUATOR_SENSOR_ID, recvLivoloCmdData, S_CUSTOM);

        sendStatus = false;
    }

    static uint32_t lastHeartbeatReportTimestamp;
    if ((millis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
        sendHeartbeat();
        lastHeartbeatReportTimestamp = millis();
    }

    // this is always on
    //  (I don't see a reason on sending battery level here - but if the client requested it...oh well)
    static uint32_t lastBatteryLvlReportTimestamp;
    if ((millis() - lastBatteryLvlReportTimestamp) >= BATTERY_LVL_REPORT_INTERVAL_MS) {
        sendBatteryLevel(100);
        lastBatteryLvlReportTimestamp = millis();
    }
}
