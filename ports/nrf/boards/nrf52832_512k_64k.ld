/*
    GNU linker script for NRF52832 blank w/ no SoftDevice
*/

/* Specify the memory areas */
MEMORY
{
    FLASH (rx)      : ORIGIN = 0x00000000, LENGTH = 0x080000 /* entire flash, 512 KiB */
    FLASH_ISR (rx)  : ORIGIN = 0x00000000, LENGTH = 0x001000 /* sector 0, 4 KiB */
    FLASH_TEXT (rx) : ORIGIN = 0x00001000, LENGTH = 0x066000 /* 408 KiB */
    FLASH_FATFS (r) : ORIGIN = 0x00067000, LENGTH = 0x019000 /* File system 100KB */
    RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 0x010000 /* 64 KiB */
}

/* produce a link error if there is not this amount of RAM for these sections */
_minimum_stack_size = 2K;
_minimum_heap_size = 0;

/* top end of the stack */

/*_stack_end = ORIGIN(RAM) + LENGTH(RAM);*/
_estack = ORIGIN(RAM) + LENGTH(RAM);

/* RAM extents for the garbage collector */
_ram_end = ORIGIN(RAM) + LENGTH(RAM);
_heap_end = 0x20008000; /* tunable */

INCLUDE "boards/common.ld"
