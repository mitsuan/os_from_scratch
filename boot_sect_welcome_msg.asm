[org 0x7c00]

mov ah, 0x0e

mov bx, welcome_msg
 
 loop:
    mov al, [bx]
    cmp al, 0x00
    je end
    int 0x10
    add bx, 0x0001
    jmp loop
 end:
 
 welcome_msg:
    db "Hello from the other side",10,13,"FeynOS",0
 

 
 times 510-($-$$) db 0
 dw 0xaa55
