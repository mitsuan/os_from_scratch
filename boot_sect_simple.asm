; Infinite loop (e9 fd ff)
loop:
    jmp loop

; Fill with 510 zeros minus the size of the previous code
;$ in nasm means assembly position at the beginning of the line
;$$ means the beginning of the current section
;db -> define bytes

times 510-($-$$) db 0



; Magic number
;dw -> define words

dw 0xaa55
