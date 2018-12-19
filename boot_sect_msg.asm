[org 0x7c00]
 
 
mov bx,hello_msg
 call print
 call print_nl
 
mov bx, bye_msg
 call print
 
 
 jmp $
 
 %include "print_string.asm"
 
 hello_msg:
    db "Hello! Welcome to FeynOS",10,13,0
 
 bye_msg:
    db "Bye! Hope you had a good experience!",10,13,0
 
 
 times 510-($-$$) db 0
 dw 0xaa55
