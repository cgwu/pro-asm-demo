/*
编译命令:
$ as -gstabs -o param_test2.o param_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o param_test2.out param_test2.o
$ gdb -q param_test2.out
vim替换
:%s/param_test2/filename/g
*/
.section .data
output:
	.asciz "%s\n"

.section .text
.globl _start
_start:
	movl %esp, %ebp
	addl $12, %ebp
loop1:
	cmpl $0, (%ebp)
	je endit
	pushl (%ebp)
	pushl $output
	call printf
	addl $12, %esp
	addl $4, %ebp
	loop loop1
endit:
	pushl $0
	call exit

