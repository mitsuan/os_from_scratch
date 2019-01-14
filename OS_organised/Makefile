# $@ : target file
# $< : first dependency
# $^ : all dependencies

# First rule is the one executed when no parameteres are fed to the Makefile

all: run

kernel/kernel.bin: kernel/kernel_entry.o kernel/kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel/kernel_entry.o: kernel/kernel_entry.asm
	nasm $<  -f elf  -o $@

kernel/kernel.o: kernel/kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

boot/boot_sect.bin: boot/boot_sect.asm
	nasm $< -f bin -o $@

os-image.bin: boot/boot_sect.bin kernel/kernel.bin 
	cat $^ > $@

run: os-image.bin
	qemu-system-i386 -fda  $<

#clean: 
#	rm *.bin *.o
