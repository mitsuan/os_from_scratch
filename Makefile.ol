#Build the os image
os-image.bin : boot_sect.bin kernel.bin
	cat boot_sect.bin kernel.bin > os-image.bin

#Build the kernel binary
kernel.bin : kernel_entry.o kernel.o
	i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

#Build the kernel object file
kernel.o : kernel.c
	i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o

#Build the kernel_entry object file
	nasm kernel_entry.asm -f elf -o kernel_entry.o

#Build the bootsector
boot_sect.bin : boot_sect.asm
	nasm boot_sect.asm -f bin -o boot_sect.bin 
