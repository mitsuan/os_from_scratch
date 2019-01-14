gdt_start:  ;the labels are needed to compute the sizes and jumps

    ;NULL descriptor
    dd 0x0          ; using define-double-word
    dd 0x0          ; total size 64 bits (2 x 32 bits)

    ;CODE SEGMENT descriptor
    gdt_code:
        dw 0xffff   ;segment length, bits 0-15
        dw 0x0      ;segment base, bits 0-15
        db 0x0      ;segment base, bits 16-23
        db 10011010b    ;flags (8 bits)
        db 11001111b    ;flags (4 bits) + segment length, bits 16-19
        db 0x0          ;segment base, bits 24-31

    ;DATA SEGMENT descriptor
    gdt_data:
        dw 0xffff   ;segment length, bits 0-15
        dw 0x0      ;segment base, bits 0-15
        db 0x0      ;segment base, bits 16-23
        db 10010010b    ;flags (8 bits)
        db 11001111b    ;flags (4 bits) + segment length, bits 16-19
        db 0x0          ;segment base, bits 24-31



gdt_end:

;GDT descriptor
gdt_descriptor:
    dw gdt_end - gdt_start - 1  ;size 16bits
    dd gdt_start                ;size 32 bits

;defining some constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

