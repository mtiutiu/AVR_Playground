/*
	All rights are reserved to JeeLabs(http://jeelabs.net).
	
	Sleepy class excerpted from jeelib library code: https://github.com/jcw/jeelib
	
*/

#ifndef SLEEPY_H
#define SLEEPY_H

#include <Arduino.h>

/// Low-power utility code using the Watchdog Timer (WDT). Requires a WDT
/// interrupt handler, e.g. EMPTY_INTERRUPT(WDT_vect);
class Sleepy {
public:
    /// start the watchdog timer (or disable it if mode < 0)
    /// @param mode Enable watchdog trigger after "16 << mode" milliseconds
    /// (mode 0..9), or disable it (mode < 0).
    /// @note If you use this function, you MUST included a definition of a WDT
    /// interrupt handler in your code. The simplest is to include this line:
    ///
    /// ISR(WDT_vect) { Sleepy::watchdogEvent(); }
    ///
    /// This will get called when the watchdog fires.
    static void watchdogInterrupts (char mode);
    
    /// enter low-power mode, wake up with watchdog, INT0/1, or pin-change
    static void powerDown ();
    
    /// Spend some time in low-power mode, the timing is only approximate.
    /// @param msecs Number of milliseconds to sleep, in range 0..65535.
    /// @returns 1 if all went normally, or 0 if some other interrupt occurred
    /// @note If you use this function, you MUST included a definition of a WDT
    /// interrupt handler in your code. The simplest is to include this line:
    ///
    /// ISR(WDT_vect) { Sleepy::watchdogEvent(); }
    ///
    /// This will get called when the watchdog fires.
    static byte loseSomeTime (word msecs);

    /// This must be called from your watchdog interrupt code.
    static void watchdogEvent();
};

#endif
