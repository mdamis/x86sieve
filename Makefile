all:	
	nasm -f elf32 -o crible_asm.o crible_asm.asm -g
	gcc -c -o crible.o crible.c -Wall -ansi
	gcc crible.o crible_asm.o -o crible
