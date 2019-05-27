/*
编译命令:
$ as -gstabs -o movs_test2.o movs_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movs_test2.out movs_test2.o
$ gdb -q movs_test2.out
vim替换
:%s/movs_test2/filename/g
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
	movl $len, %ecx
	leal value1+len-1, %esi
	leal output+len-1, %edi
	std		# set DF flag in EFLAGS, decrement after movs.
	movsb
	movsw
	movsl

	movl $1, %eax
	movl $0, %ebx
	int $0x80

