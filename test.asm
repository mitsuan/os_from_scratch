[org 0x7c00]
 mov ah, 0x0e

mov al, 0x04

cmp al,0x04
jne not_equal
 mov bx, string
call print
je equal


 not_equal:
    mov bx, n_eq
    call print
 
 n_eq:
    db "it's not equal",10,13,0
 
 equal:
    mov bx, eq
    call print
 
 
 eq:
    db "it's equal",10,13,0
 
 string:
    db "Welcome to FeynOS",10,13,0
 
 print:
    mov al, [bx]
    cmp al,0x00
    je end
    int 0x10
    add bx, 0x01
    jmp print
 end: ret
 
 
 times 510 - ($-$$) db 0
 dw 0xaa55
