#include "os/mynewt.h"
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
#include "console/console.h"
#endif
#include "app_ble_mesh.h"
#include "app_gpio.h"
#if MYNEWT_VAL(PWM_0)
#include "app_pwm.h"
#define MTSA_PERC_LVL 50
#endif
#include "host/ble_hs.h"


// static struct os_callout led_code_blink_callout;

// static void led_timer_ev_cb(struct os_event *ev) {
//     assert(ev != NULL);

//     hal_gpio_toggle(S1_LED_PIN);

//     os_callout_reset(&led_code_blink_callout, OS_TICKS_PER_SEC);
// }

// void init_led_timer(void) {
//     os_callout_init(&led_code_blink_callout, os_eventq_dflt_get(), led_timer_ev_cb, NULL);
//     os_callout_reset(&led_code_blink_callout, OS_TICKS_PER_SEC);
// }

int main(int argc, char **argv) {
    /* Initialize OS */
    sysinit();

    /* Initialize the NimBLE host configuration. */
    ble_hs_cfg.reset_cb = blemesh_on_reset;
    ble_hs_cfg.sync_cb = blemesh_on_sync;
    ble_hs_cfg.store_status_cb = ble_store_util_status_rr;

    init_app_gpio();
    //init_led_timer();
#if MYNEWT_VAL(PWM_0)
    // init pwm0 and set touch sensor sensitivity
    init_app_pwm0_dev();
    set_pwm0_duty_cycle_perc(MTSA_PERC_LVL);
#endif
    while (1) {
        os_eventq_run(os_eventq_dflt_get());
    }
    return 0;
}