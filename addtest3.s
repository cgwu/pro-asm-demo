/*
unsigned add.
addtest3.s - An example of detecting a carry condition.

编译命令:
$ as -gstabs -o addtest3.o addtest3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o addtest3.out addtest3.o
vim替换
:%s/addtest3/filename/g
*/
.section .text
.globl _start
_start:
	movl $0, %ebx
	movb $190, %bl
	movb $10, %al
	addb %al, %bl
	jc over	# jump if carry flag = 1.

	movl $1, %eax
	int $0x80
over:
	movl $0, %ebx
	movl $1, %eax
	int $0x80
