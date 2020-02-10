MEMORY
{
    rom : ORIGIN = 0x20010000, LENGTH = 0x6a120
    ram : ORIGIN = 0x80000000, LENGTH = 0x4000
}

ENTRY(start)

SECTIONS
{
    .boot : {} > rom
    .text : { *(.text*) } > rom
    .rodata : {*(.rodata*)} > rom
    .bss : {*(.bss*)} > ram
}