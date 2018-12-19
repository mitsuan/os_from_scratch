[org 0x7c00]

 mov dx, 0xface
mov cx, 0
 
 loop:
    cmp cx, 4
    je end
    mov ax, dx
    and al, 0x0f
    cmp al, 0x09
    jle less
    add al, 7
 
 less:
    add al, 0x30
    mov ah, 0x0e
    int 0x10
    ror dx, 4
    add cx, 1
    jmp loop
 
 end:
 
 jmp $
 hex_string:
    db "0x0000"
 
 
 times 510 - ($-$$) db 0
 dw 0xaa55
 
