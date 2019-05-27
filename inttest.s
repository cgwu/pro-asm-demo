/*
编译命令:
$ as -gstabs -o inttest.o inttest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o inttest.out inttest.o
vim替换
:%s/inttest/filename/g
*/
.section .data
data:
	.int -45

.section .text
.globl _start
_start:
	movl $-345, %ecx
	#movw $0xffb1, %dx
	movw $0xffb1, %ax
	#movw $0x7fb1, %ax
	#movzx %ax, %edx
	xor %edx, %edx
	movsx %ax, %edx
	movl data, %ebx
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

