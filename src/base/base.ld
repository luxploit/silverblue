/* "I hate my life" linkerscript */

ENTRY(KiLdrStrapEntry)

PHDRS
{
    bootldr PT_LOAD;
    text    PT_LOAD;
    rodata  PT_LOAD;
    data    PT_LOAD;
}

SECTIONS
{
    /* kernel start address, required by limine to be that high up */
    . = 0xffffffff80000000;

    .bootldr ALIGN(CONSTANT(MAXPAGESIZE)) : {
        KEEP(*(.bootldr_requests_start))
        KEEP(*(.bootldr_requests))
        KEEP(*(.bootldr_requests_end))
    } :bootldr

    .text ALIGN(4K) : {
        *(.text .text.*)
    } :text

    .rodata ALIGN(4K) : {
        *(.rodata .rodata.*)
    } :rodata

    .data ALIGN(4K) : {
        *(.data .data.*)
    } :data

    .bss ALIGN(4K) : {
        *(COMMON)
        *(.bss .bss.*)
    } :data

    /DISCARD/ : {
        *(.eh_frame .eh_frame*)
		*(.note .note.*)
    }

}