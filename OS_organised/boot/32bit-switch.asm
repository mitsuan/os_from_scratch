[bits 16]

 switch_to_pm:
    cli                    ;disable interrupts
    lgdt [gdt_descriptor]  ;load gdt using gdt descriptor
    mov eax, cr0           ;load CPU control register
    or eax, 0x1            ;setting the 1st bit for 32bit mode
    mov cr0, eax
    jmp CODE_SEG:init_pm   ;far jump by using a different seg.

[bits 32]

 init_pm:   ;we are now using 32-bit instructions
    mov ax, DATA_SEG    ;update the segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
 
    mov ebp, 0x90000    ;update stack to the top of free space
    mov esp, ebp        ;

    call BEGIN_PM
