/*
编译命令:
$ as -gstabs -o getstatus.o getstatus.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o getstatus.out getstatus.o
$ gdb -q getstatus.out
vim替换
:%s/getstatus/filename/g
*/
.section .bss
	.lcomm status, 2

.section .text
.globl _start
_start:
	fstsw %ax
	fstsw status

	movl $1, %eax
	movl $0, %ebx
	int $0x80

