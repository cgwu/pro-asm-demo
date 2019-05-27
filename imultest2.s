/*
编译命令:
$ as -gstabs -o imultest2.o imultest2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o imultest2.out imultest2.o
vim替换
:%s/imultest2/filename/g
*/
.section .text
.globl _start
_start:
	xor %eax, %eax
	xor %ecx, %ecx
	xor %edx, %edx
	
	movw $680, %ax
	#movw $100, %cx
	movw $10, %cx
	imulw %cx
	jo over

	movl $0, %ebx
	movl $1, %eax
	int $0x80
over:
	movl $1, %ebx
	movl $1, %eax
	int $0x80

