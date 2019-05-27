/*
编译命令:
$ as -gstabs -o fpuvals.o fpuvals.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o fpuvals.out fpuvals.o
vim替换
:%s/fpuvals/filename/g
(gdb) i all
*/
.section .data
#len = (. - values)/4

.section .text
.globl _start
_start:
	fld1
	fldl2t
	fldl2e
	fldpi
	fldlg2
	fldln2
	fldz
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

