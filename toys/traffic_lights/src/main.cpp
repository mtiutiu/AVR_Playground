#include <Arduino.h>

// ------------------------ DEBUGGING STUFF ----------------------------
#ifndef SERIAL_DEBUG_PORT
#define SERIAL_DEBUG_PORT Serial
#endif

#ifndef SERIAL_DEBUG_BAUDRATE
#define SERIAL_DEBUG_BAUDRATE 9600
#endif
// -------------------- END DEBUGGING STUFF ----------------------------

// ----------------------- REMOTE STUFF ------------------------------
#include <LivoloRX.h>

#define REMOTE_INTERRUPT_CHANNEL 0

#define REMOTE_ID   22253
#define KEY_A_CODE      8
#define KEY_B_CODE     16
#define KEY_C_CODE     56
#define KEY_D_CODE     42

#define RED_LIGHT_KEY       KEY_A_CODE
#define GREEN_LIGHT_KEY     KEY_B_CODE

#ifndef REMOTE_PROCESS_INTERVAL_MS
#define REMOTE_PROCESS_INTERVAL_MS  1000
#endif

Remote remote;
// --------------------- END REMOTE STUFF ------------------------------

// --------------------- LIGHTS STUFF ----------------------------------
#ifndef RED_LED_PIN
#define RED_LED_PIN 9
#endif
#ifndef GREEN_LED_PIN
#define GREEN_LED_PIN 10
#endif
#ifndef YELLOW_LED_PIN
#define YELLOW_LED_PIN 11
#endif

#ifndef PWM_LEVEL
#define PWM_LEVEL 220
#endif

#ifndef LIGHT_SWITCH_DELAY_MS
#define LIGHT_SWITCH_DELAY_MS 2000
#endif

#ifndef STARTUP_DELAY_MS
#define STARTUP_DELAY_MS  1500
#endif

#ifndef FADE_OUT_STEP_DELAY_MS
#define FADE_OUT_STEP_DELAY_MS  5
#endif

typedef enum {
  RED,
  GREEN,
  YELLOW
} light_state;

light_state current_state = RED;
light_state next_state = GREEN;
// -------------------- END LIGHTS STUFF -------------------------------


void fade_out(uint8_t pwm_pin) {
  for (uint8_t level = PWM_LEVEL; level > 0; level -= FADE_OUT_STEP_DELAY_MS) {
    analogWrite(pwm_pin, level);
    delay(FADE_OUT_STEP_DELAY_MS);
  }
  analogWrite(pwm_pin, 0);
}

void lights_task() {
  if(next_state == current_state) {
    return;
  }

  if (next_state == RED) {
    fade_out(GREEN_LED_PIN);
    analogWrite(YELLOW_LED_PIN, PWM_LEVEL);
    delay(LIGHT_SWITCH_DELAY_MS);
    fade_out(YELLOW_LED_PIN);
    analogWrite(RED_LED_PIN, PWM_LEVEL);
    current_state = RED;
  }

  if (next_state == GREEN) {
    fade_out(RED_LED_PIN);
    analogWrite(YELLOW_LED_PIN, PWM_LEVEL);
    delay(LIGHT_SWITCH_DELAY_MS);
    fade_out(YELLOW_LED_PIN);
    analogWrite(GREEN_LED_PIN, PWM_LEVEL);
    current_state = GREEN;
  }
}

void remote_task() {
  static uint32_t last_remote_read_timestamp;

  if(LivoloRX::decode(remote) && (millis() - last_remote_read_timestamp >= REMOTE_PROCESS_INTERVAL_MS)) {
#ifdef DEBUG
    SERIAL_DEBUG_PORT.print(F("remoteID: "));
    SERIAL_DEBUG_PORT.print(remote.id);
    SERIAL_DEBUG_PORT.print(F(" - "));
    SERIAL_DEBUG_PORT.print(F("key code: "));
    SERIAL_DEBUG_PORT.println(remote.key);
#endif
    last_remote_read_timestamp = millis();
  }

  if(remote.id != REMOTE_ID) {
    return;
  }

  switch (remote.key) {
    case RED_LIGHT_KEY:
      next_state = RED;
      break;
    case GREEN_LIGHT_KEY:
      next_state = GREEN;
      break;
    default:;
  }
}

void setup() {
  analogWrite(RED_LED_PIN, PWM_LEVEL);
  analogWrite(GREEN_LED_PIN, 0);
  analogWrite(YELLOW_LED_PIN, 0);
  delay(STARTUP_DELAY_MS);

#ifdef DEBUG
  SERIAL_DEBUG_PORT.begin(SERIAL_DEBUG_BAUDRATE);
#endif
  LivoloRX::init(REMOTE_INTERRUPT_CHANNEL);
}

void loop() {
  remote_task();
  lights_task();
}