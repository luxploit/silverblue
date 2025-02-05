#include "abort.h"

#define KiAssert(expr) do { if (!(expr)) { KiPanicAttack(); } } while(0)