/*
编译命令:
$ as -gstabs -o imultest.o imultest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o imultest.out imultest.o
vim替换
:%s/imultest/filename/g
*/
.section .data
value1:
	.int 10
value2:
	.int -35
value3:
	.int 400

.section .text
.globl _start
_start:
	movl value1, %ebx
	movl value2, %ecx
	imull %ebx, %ecx	# ecx = ebx * ecx
	movl value3, %edx
	imull $2, %edx, %eax # eax = 2 * edx

	movl $0, %ebx
	movl $1, %eax
	int $0x80

