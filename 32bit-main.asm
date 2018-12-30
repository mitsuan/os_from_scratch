[org 0x7c00]    ;bootloader offset
 
 mov bp, 0x9000 ;set the stack base
 mov sp, bp     ;set the stack pointer to the top (for empty stack)
 
 mov bx, MSG_REAL_MODE
 call print     ;This will be written after the BIOS messages
 
 call switch_to_pm
 jmp $
 
 %include "print_string.asm"
 %include "32bit-gdt.asm"
 %include "32bit-print.asm"
 %include "32bit-switch.asm"
 
 [bits 32]
 BEGIN_PM:  ;After the switch we will get here
    mov ebx, MSG_PROT_MODE
    call print_string_pm    ;Note that this will be written at the top right corner
    jmp $   ;Hang
 
 MSG_REAL_MODE: db "Started in 16bit real mode",0
 MSG_PROT_MODE: db "Loaded 32bit protected mode"
                times 100 db " "
                db 0
 
 ;bootsector
 
 times 510 -($-$$) db 0
 dw 0xaa55

