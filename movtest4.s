/*
$ as -gstabs -o movtest4.o movtest4.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movtest4.out movtest4.o
*/
.section .data
values:
	.int 10,15,20,25,99,-123

.section .text
.globl _start
_start:
	nop
	movl values, %eax
	movl $values, %edi #将values地址传入edi
	movl $100, 4(%edi) #将100传入edi内容所在内存，往后偏移4字节
	movl $1, %edi
	movl values(, %edi, 4), %ebx
	movl $1, %eax
	int $0x80

