/*
编译命令:
$ as -gstabs -o rep_test4.o rep_test4.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o rep_test4.out rep_test4.o
$ gdb -q rep_test4.out
vim替换
:%s/rep_test4/filename/g
*/
.section .data
value1:
	.asciz "This is a test of the conversion program!\n"
length = (. - value1) 

.section .bss
	.lcomm output, length

.section .text
.globl _start
_start:
	leal value1 + length - 1, %esi
	leal output + length - 1, %edi
	movl $length, %ecx
	std
	rep movsb

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

