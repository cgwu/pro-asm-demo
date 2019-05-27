/*
编译命令:
$ as -gstabs -o quadtest.o quadtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o quadtest.out quadtest.o
vim替换
:%s/quadtest/filename/g
*/
.section .data
data1:
	.int 1, -1, 463345, -333252322, 0
data2:
	.quad 1, -1, 463345, -333252322, 0

.section .text
.globl _start
_start:

	movl $0, %ebx
	movl $1, %eax
	int $0x80

