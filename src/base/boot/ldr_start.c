#include "helpers.h"

#include <silverblue/assert.h>
#include <common.h>

__attribute__((used, section(".bootldr_requests_start")))
static volatile LIMINE_REQUESTS_START_MARKER;

__attribute__((used, section(".bootldr_requests_end")))
static volatile LIMINE_REQUESTS_END_MARKER;

__attribute__((used, section(".bootldr_requests")))
static volatile LIMINE_BASE_REVISION(3);



/* Request data/objects via the limine protocol */

KiRequestBootData(limine_framebuffer_request, Framebuffer, LIMINE_FRAMEBUFFER_REQUEST, 0); // _KiLdrFramebufferRequest

// system entry point, invokes base/krnl/main.c:KiEntry after configuring basics from limine
void KiLdrStrapEntry() {

    // making sure the version of limine installed is supported
    KiAssert(LIMINE_BASE_REVISION_SUPPORTED == true);
    
    // ensure that we have a framebuffer, would be bad if we don't 
    // todo add support for serial output
    KiAssert(_KiLdrFramebufferRequest.response != NULL);
    KiAssert(_KiLdrFramebufferRequest.response->framebuffer_count >= 1);

    //! please fucking remove this shit and call KiEntry!!!!
    //! also make proper fucking init before we call KiEntry!!!

    // get the first framebuffer
    struct limine_framebuffer *framebuffer = _KiLdrFramebufferRequest.response->framebuffers[0];

    // Note: we assume the framebuffer model is RGB with 32-bit pixels.
    for (size_t i = 0; i < 100; i++) {
        volatile uint32_t *fb_ptr = framebuffer->address;
        fb_ptr[i * (framebuffer->pitch / 4) + i] = 0xffffff;
    }

    KiPanicAttack();
    //KiEntry();
}