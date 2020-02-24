MEMORY
{
    rom(rx)     : o = 0x20010000, l = 0x30000000
    ram(rwx)    : o = 0x80000000, l = 0x00004000
    buffer(rwx) : o = 0x80000000, l = 0x00001000
    data(rwx)   : o = 0x80001000, l = 0x00001000
    stack(rw)   : o = 0x80004000, l = 0x00000000
}

ENTRY(start)

SECTIONS
{
    .boot : {} > rom
    .text : {
        _text_start = .;
        *(.text*)
        e_etext = .;
    } > rom
    .rodata : {
        _rodata_start = .;
        *(.strings)
        *(.rodata)
        *(.rodata*)
        _erodata = .;
    } > rom
    .buffer : {
        _buffer_start = .;
    } > buffer
    .data : {
        _data_start = .;
        *(.data)
        *(.sdata)
        _edata = .;
    } > data AT>rom
    .bss : {
        _bss_start = .;
        *(.bss*)
        _ebss = .;
    } > data AT>rom
    
    . = ALIGN(4);
    _end = .;
    .stack : {
        _stack = .;
    } > stack
}