/*
编译命令:
$ as -gstabs -o cfunc_test.o cfunc_test.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cfunc_test.out cfunc_test.o
$ gdb -q cfunc_test.out
vim替换
:%s/cfunc_test/filename/g
$ strace -c ./cfunc_test.out
*/
.section .data
output:
	.asciz "This is a test\n"

.section .text
.globl _start
_start:
	movl $10, %ecx
loop1:
	pushl %ecx
	pushl $output
	call printf
	addl $4, %esp
	
	pushl $5
	call sleep
	addl $4, %esp
	popl %ecx
	loop loop1

	pushl $0
	call exit

