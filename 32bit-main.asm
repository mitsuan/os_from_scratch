[org 0x7c00]    ;bootloader offset
 
 mov bp, 0x9000 ;set the stack base
 mov sp, bp     ;set the stack pointer to the top (for empty stack)
 
 mov bx, MSG_REAL_MODE
 call print     ;This will be written after the BIOS messages
 
 call switch_to_pm
 jmp $
 
 %include "print_string.asm"
 %include ""

