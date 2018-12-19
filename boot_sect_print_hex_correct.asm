[org 0x7c00]

mov dx, 0xab18
mov cx, 0
mov bx, hex_string
add bx, 0x0006
 
 start:
    cmp cx, 4
    je stop
    mov ax, dx
    and al, 0x0f
    cmp al, 0x09
    jle less
    add al, 7
 
 less:
    add al, 0x30
    sub bx, 0x0001
    mov  [bx], al
    ror dx, 4
    add cx, 1
    jmp start
 
%include "print_string.asm"
 stop:
    mov bx, hex_string
    call print
 
 jmp $
 hex_string:
    db "0x0000",0
 
 
 times 510 - ($-$$) db 0
 dw 0xaa55
 
