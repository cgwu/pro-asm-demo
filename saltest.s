/*
编译命令:
$ as -gstabs -o saltest.o saltest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o saltest.out saltest.o
vim替换
:%s/saltest/filename/g
*/
.section .data
value1:
	.int 25

.section .text
.globl _start
_start:
	movl $10, %ebx
	sall %ebx # 算术左移1位
	movb $2, %cl
	sall %cl, %ebx
	sall $2, %ebx
	sall value1

	movl $0, %ebx
	movl $1, %eax
	int $0x80

