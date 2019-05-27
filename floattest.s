/*
编译命令:
$ as -gstabs -o floattest.o floattest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o floattest.out floattest.o
vim替换
:%s/floattest/filename/g
(gdb)
x/4b &value1
x/8b &value2
x/wf &value1 #查看单精度浮点
x/gf &value2 #查看双精度浮点
*/
.section .data
value1:
	.float 12.34
value2:
	.double 2353.631

.section .bss
	.lcomm data, 8

.section .text
.globl _start
_start:
	flds value1
	fldl value2
	fstl data
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

