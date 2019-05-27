/*
编译命令:
$ as -gstabs -o sysinfo.o sysinfo.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o sysinfo.out sysinfo.o
$ gdb -q sysinfo.out
vim替换
:%s/sysinfo/filename/g
*/
.section .data
result:
	uptime:
	.int 0
	load1:
	.int 0
	load5:
	.int 0
	load15:
	.int 0
	totalram:
	.int 0
	freeram:
	.int 0
	sharedram:
	.int 0
	bufferram:
	.int 0
	totalswap:
	.int 0
	freeswap:
	.int 0
	totalhigh:
	.int 0
	memunit:
	.int 0

.section .text
.globl _start
_start:
	movl $result, %ebx
	movl $116, %eax #sysinfo
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80

