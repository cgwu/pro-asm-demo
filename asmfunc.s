/*
An example of a simple assembly language function.
编译命令:
$ as -gstabs -o asmfunc.o asmfunc.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o asmfunc.out asmfunc.o
$ gdb -q asmfunc.out
vim替换
:%s/asmfunc/filename/g
*/
.section .data
testdata:
	.ascii "This is a test message from the asm function\n"
len = (. - testdata)

.section .text
.type asmfunc, @function
.globl asmfunc
asmfunc:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx

	movl $4, %eax
	movl $1, %ebx
	movl $testdata, %ecx
	movl $len, %edx
	int $0x80

	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
	
