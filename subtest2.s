/*
subtest2.s - An example of a subtraction carry flag.
编译命令:
$ as -gstabs -o subtest2.o subtest2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o subtest2.out subtest2.o
vim替换
:%s/subtest2/filename/g
*/
.section .text
.globl _start
_start:
	#movl $5, %eax
	movl $1, %eax
	movl $2, %ebx
	subl %eax, %ebx	# ebx = ebx - eax
	jc under	# jump if carry flag is set.
	movl $1, %eax
	int $0x80
under:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

