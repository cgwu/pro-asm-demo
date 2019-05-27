/*
fpmath2.s - An example of the FABS, FCHS, and FSQRT instructions.
编译命令:
$ as -gstabs -o fpmath2.o fpmath2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o fpmath2.out fpmath2.o
$ gdb -q fpmath2.out
vim替换
:%s/fpmath2/filename/g
*/
.section .data
value1:
	.float 395.21
value2:
	.float -9145.290
value3:
	.float 64.0

.section .text
.globl _start
_start:
	finit
	flds value1
	fchs		#改变符号
	flds value2
	fabs
	flds value3
	fsqrt

	movl $1, %eax
	movl $0, %ebx
	int $0x80

