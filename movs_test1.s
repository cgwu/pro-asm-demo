/*
编译命令:
$ as -gstabs -o movs_test1.o movs_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movs_test1.out movs_test1.o
$ gdb -q movs_test1.out
vim替换
:%s/movs_test1/filename/g
*/
.section .data
value1:
	.ascii "This is a test string.\n"
len = (. - value1)

.section .bss
	.lcomm output, len

.section .text
.globl _start
_start:
	leal value1, %esi
	leal output, %edi
	movsb
	movsw
	movsl

	movl $1, %eax
	movl $0, %ebx
	int $0x80

