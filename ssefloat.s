/*
编译命令:
$ as -gstabs -o ssefloat.o ssefloat.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o ssefloat.out ssefloat.o
vim替换
:%s/ssefloat/filename/g
*/
.section .data
value1:
	.float 12.34, 2345.543, -3493.2, 0.44901
value2:
	.float -5439.234, 32121.4, 1.0094, 0.000003

.section .bss
	.lcomm data, 16

.section .text
.globl _start
_start:
	movups value1, %xmm0
	movups value2, %xmm1
	movups %xmm0, %xmm2
	movups %xmm0, data
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

