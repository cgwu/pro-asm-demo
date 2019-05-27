/*
An example of using  functions.
编译命令:
$ as -gstabs -o func_test1.o func_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o func_test1.out func_test1.o
$ gdb -q func_test1.out
vim替换
:%s/func_test1/filename/g
*/
.section .data
precision:
	.byte 0x7f, 0x00

.section .bss
	.lcomm value, 4

.section .text
.globl _start
_start:
	finit
	fldcw precision
	movl $10, %ebx
	call area

	movl $2, %ebx
	call area

	movl $120, %ebx
	call area

	movl $1, %eax
	movl $0, %ebx
	int $0x80

.type area, @function
area:
	fldpi
	imul %ebx, %ebx
	movl %ebx, value
	filds value
	fmulp %st(0), %st(1)
	ret

