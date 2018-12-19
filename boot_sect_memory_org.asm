[org 0x7c00]    ; global offset
 mov ah, 0x0e

 ;mov bx, 0x7c00
 ;add bx, the_secret
 ;mov al, [bx]
 mov al, [the_secret]   ; now offset is not required
int 0x10

the_secret:
    db "O"


times 510-($-$$) db 0
dw 0xaa55
