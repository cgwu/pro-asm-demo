/*
An example of using global variables in functions.
编译命令:
$ as -gstabs -o func_test2.o func_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o func_test2.out func_test2.o
$ gdb -q func_test2.out
vim替换
:%s/func_test2/filename/g
*/
.section .data
precision:
	.byte 0x7f, 0x00

.section .bss
	.lcomm radius, 4
	.lcomm res1, 4
	.lcomm trash, 4

.section .text
.globl _start
_start:
	finit
	fldcw precision
	movl $10, radius 
	call area

	movl $2, radius
	call area

	movl $120, radius
	call area

	movl $1, %eax
	movl $0, %ebx
	int $0x80

.type area, @function
area:
	fldpi
	filds radius
	fmul %st(0), %st(0)
	fmulp %st(0), %st(1)
	fstps res1
	ret

