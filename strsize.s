/*
编译命令:
$ as -gstabs -o strsize.o strsize.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o strsize.out strsize.o
$ gdb -q strsize.out
vim替换
:%s/strsize/filename/g
*/
.section .data
string1:
	.asciz "Testing, one, two, three, testing.\n"

.section .text
.globl _start
_start:
	leal string1, %edi
	movl $0xffff, %ecx
	movb $0, %al
	cld
	repne scasb
	jne notfound
	subw $0xffff, %cx
	neg %cx
	dec %cx
	movl $1, %eax
	movl %ecx, %ebx
	int $0x80
notfound:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

