[org 0x7c00]
 
mov ah, 0x0e

 mov bp, 0x8000     ; address far from 0x7c00 to avoid overwriting existing code
 mov sp, bp         ; If the stack is empty, sp points to bp
 
 
push 'a'
push 'b'
push 'c'

 ;printing the values from the stack
pop bx
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10

mov al, [0x7ffe]
int 0x10

 display:
    int 0x10
    ret
 jmp $
 
times 510-($-$$) db 0
dw 0xaa55
