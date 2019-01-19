# $@ : target file
# $< : first dependency
# $^ : all dependencies

# First rule is the one executed when no parameteres are fed to the Makefile

all: run


kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel_entry.o: kernel_entry.asm
	nasm $<  -f elf  -o $@

kernel.o: kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

boot_sect.bin: boot_sect.asm
	nasm $< -f bin -o $@

os-image.bin: boot_sect.bin kernel.bin 
	cat $^ > $@

run: os-image.bin
	qemu-system-i386 -fda  $<

#clean: 
#	rm *.bin *.o
