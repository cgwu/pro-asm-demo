# calltest.s - An example of using the CALL instruction.
/*
as -gstabs -o calltest.o calltest.s
ld -dynamic-linker /lib/ld-linux.so.2 -lc -o calltest.out calltest.o
*/
.section .data
output:
	.asciz "This is section %d\n"

.section .text
.globl _start
_start:
	pushl $1
	pushl $output
	call printf
	add $8, %esp	# should clear up stack
	call overthere	# 调用自定义函数
	pushl $3
	pushl $output
	call printf
	add $8, %esp	# clear up stack
	pushl $0
	call exit

overthere:
	pushl %ebp
	movl %esp, %ebp	#将%ebp作为该函数调用的基地址
	pushl $2
	pushl $output
	call printf
	add $8, %esp	# clear up stack
	movl %ebp, %esp	#恢复%ebp到%esp
	pop %ebp
	ret
	
