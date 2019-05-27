/*
编译命令:
$ as -gstabs -o scas_test1.o scas_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o scas_test1.out scas_test1.o
$ gdb -q scas_test1.out
vim替换
:%s/scas_test1/filename/g
*/
.section .data
string1:
	.ascii "This- is a test - a long text string to scan."
len = (. - string1)
string2:
	#.ascii "-"
	.ascii "."
	#.ascii "T"

.section .text
.globl _start
_start:
	leal string1, %edi
	leal string2, %esi
	movl $len, %ecx
	lodsb
	cld
	repne scasb #如果不相等，则继续搜索
	jne notfound
	#subl $len, %ecx
	#neg %ecx
	subw $len, %cx
	neg %cx
	movl $1, %eax
	movl %ecx, %ebx
	int $0x80
notfound:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

