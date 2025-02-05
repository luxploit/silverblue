#include <silverblue/hal.h>

__attribute__((__noreturn__)) void HalCatchFire() {
    for (;;) {
        asm volatile("hlt");
    }

    __builtin_unreachable();
}