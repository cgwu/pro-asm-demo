/*
An example of using the STOS instruction.
编译命令:
$ as -gstabs -o stos_test1.o stos_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o stos_test1.out stos_test1.o
$ gdb -q stos_test1.out
vim替换
:%s/stos_test1/filename/g
*/
.section .data
space:
	#.ascii " "
	.ascii "A"

.section .bss
	.lcomm buf1, 256

.section .text
.globl _start
_start:
	leal space, %esi
	leal buf1, %edi
	#movl $256, %ecx
	movl $100, %ecx
	cld
	lodsb
	rep stosb

	movl $1, %eax
	movl $0, %ebx
	int $0x80

