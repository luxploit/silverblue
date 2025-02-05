#include "limine.h"

#define KiRequestBootData(reqType, reqName, reqTag, reqRev) \
    __attribute__((used, section(".bootldr_requests"))) \
    static volatile struct reqType _KiLdr##reqName##Request = { \
        .id = reqTag, \
        .revision = reqRev, \
        .response = NULL, \
    }