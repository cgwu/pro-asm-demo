/*
编译命令:
$ as -gstabs -o rep_test3.o rep_test3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o rep_test3.out rep_test3.o
$ gdb -q rep_test3.out
vim替换
:%s/rep_test3/filename/g
*/
.section .data
value1:
	.asciz "This is a test of the conversion program!\n"
length = (. - value1) 
divisor:
	.int 4

.section .bss
	.lcomm buf1, length

.section .text
.globl _start
_start:
	movl $length, %ecx
	shrl $2, %ecx  #长度右移2位，相当于除以4
	leal value1, %esi
	leal buf1, %edi
	cld		# clear DF flag in EFLAGS, increment after movs.
	rep movsl

	movl $length, %ecx
	andl $3, %ecx
	rep movsb

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

