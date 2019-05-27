/*
编译命令:
$ as -gstabs -o cmps_test2.o cmps_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cmps_test2.out cmps_test2.o
$ gdb -q cmps_test2.out
vim替换
:%s/cmps_test2/filename/g
*/
.section .data
value1:
	.ascii "This is a test of the CMPS instructions"
len = (. - value1)
value2:
	.ascii "this is a test of the CMPS instructions"

.section .text
.globl _start
_start:
	movl $1, %eax
	leal value1, %esi
	leal value2, %edi
	movl $len, %ecx
	cld
	repe cmpsb
	je equal
	#movl %ecx, %ebx #不相等则返回1
	movl $len, %edx
	subl %ecx, %edx # 总长度-未比较的长度
	movl %edx, %ebx
	int $0x80
equal:
	movl $0, %ebx #相等则返回0
	int $0x80

