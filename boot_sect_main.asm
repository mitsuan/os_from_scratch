[org 0x7c00]

 ;keeping the stack safely away from the code
mov bp, 0x8000
mov sp, bp
 
 mov bx, 0x9000 ;es:bx = 0x0000: 0x9000 = 0x09000
 mov dh, 4   ; read 2 sectors
 
 call disk_load
 
 mov dx, [0x9000]
 call print_hex
 call print_nl
 
 mov dx, [0x9000+512]
 call print_hex
 call print_nl

 
 jmp $
 
 %include "print_string.asm"
 %include "print_hex.asm"
 %include "boot_sect_disk.asm"
 
 
 times 510-($-$$) db 0
 dw 0xaa55
 
 times 256 dw 0xdada
 times 256 dw 0xface
 
 
 

