/*
ssetest.s - An example of using 128-bit SSE registers.
编译命令:
$ as -gstabs -o ssetest.o ssetest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o ssetest.out ssetest.o
vim替换
:%s/ssetest/filename/g
调试:
(gdb) print $xmm0
(gdb) print $xmm1
(gdb) print/x $xmm1
*/
.section .data
values1:
	.int 1, -1, 0, 135246
values2:
	.quad 1, -1

.section .text
.globl _start
_start:
	movdqu values1, %xmm0
	movdqu values2, %xmm1
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

