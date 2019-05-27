/*
$ as -gstabs -o movtest4.o movtest4_r1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movtest4.out movtest4.o
$ ./movtest4.out
$ echo $?
15
*/
.section .data
values:
	.int 10,15,20,25,99,-123

.section .text
.globl _start
_start:
	nop
	movl values, %eax
	movl $values+4, %edi #将values地址传入edi
	movl $100, -4(%edi) #将100传入edi内容所在内存，往前偏移4字节
	movl $1, %edi
	movl $4, %eax
dbg:
	movl values(%eax, %edi, 4), %ebx 	#ebx = 20
	movl values(, %edi, 4), %ebx 		#ebx = 15
	movl $1, %eax
	int $0x80

