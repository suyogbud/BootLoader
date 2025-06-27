ENTRY(_start)
OUTPUT_FORMAT(binary)
SECTIONS
{
    . = 0x0100000;
    .text : ALIGN(4096)
    {
        *(.text)
    }

    .rodata : ALIGN(4096)
    {
        *(.rodata)
    }

    .data : ALIGN(4096)
    {
        *(.data)
    }

    .bss : ALIGN(4096)
    {
        *(COMMON)
        *(.bss)
    }

    /DISCARD/ :
    {
        *(.comment)
        *(.eh_frame)
        *(.note.GNU-stack)
        *(.ARM.exidx)
        *(.debug*)
        *(.interp)
        *(.dynsym)
        *(.dynstr)
        *(.hash)
        *(.gnu.version_r)
        *(.gnu.version)
        *(.gnu.version_d)
        *(.rela*)
        *(.rel*)
        *(.iplt)
        *(.igot)
        *(.got)
        *(.got.plt)
        *(.plt)
        *(.fini)
        *(.init)
    }
}
