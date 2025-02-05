#include <silverblue/hal.h>

__attribute__((__noreturn__)) void KiPanicAttack() {

    /* todo add like nice stack trace and why it crashed yada yada */

    HalCatchFire();

    __builtin_unreachable();
}