
disk_load:
    pusha

    push dx

    mov ah, 0x02    ; read block
    mov al, dh      ; no. of sectors to read
    mov cl, 0x02    ; sector
                    ; 0x01 is the first sector(boot sector)
                    ; 0x02 is the first available sector to read

    mov ch, 0x00    ; cylinder

    mov dh, 0x00    ; head

    int 0x13        ; BIOS interrupt to read
    jc disk_error

    pop dx
    cmp al, dh
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah      ; error code
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error",0
SECTORS_ERROR: db "Incorrect number of sectors read",0
