
print_hex:
    pusha
    mov cx, 0
    mov bx, hex_string
    add bx, 0x0006
 
 start_hexp:
    cmp cx, 4
    je stop_hexp
    mov ax, dx
    and al, 0x0f
    cmp al, 0x09
    jle less_hexp
    add al, 7
 
 less_hexp:
    add al, 0x30
    sub bx, 0x0001
    mov  [bx], al
    ror dx, 4
    add cx, 1
    jmp start_hexp
 

 stop_hexp:
    mov bx, hex_string
    call print
    popa
    ret

;%include "print_string.asm"

 hex_string:
    db "0x0000",0
