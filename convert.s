/*
Converting lower to upper case.
编译命令:
$ as -gstabs -o convert.o convert.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o convert.out convert.o
$ gdb -q convert.out
vim替换
:%s/convert/filename/g
*/
.section .data
string1:
	.asciz "This is a TEST, of the conversion program!\n"
length = (. - string1)

.section .text
.globl _start
_start:
	leal string1, %esi
	movl %esi, %edi
	movl $length, %ecx
	cld
loop1:
	lodsb
	cmpb $'a', %al
	jl skip
	cmpb $'z', %al
	jg skip
	subb $0x20, %al
skip:
	stosb
	loop loop1
end:
	pushl $string1
	call printf
	addl $4, %esp
	pushl $0
	call exit

