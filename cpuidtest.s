/*
编译命令:
$ as -gstabs -o cpuidtest.o cpuidtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cpuidtest.out cpuidtest.o
$ gdb -q cpuidtest.out
vim替换
:%s/cpuidtest/filename/g
*/
.section .data
output_cpuid:
	.asciz "This processor supports the CPUID instruction\n"
output_nocpuid:
.asciz "This processor does not support the CPUID instruction\n"

.section .text
.globl _start
_start:
	pushfl
	popl %eax
	movl %eax, %edx # eflags备份到edx
	xor $0x00200000, %eax
	pushl %eax
	popfl #把堆栈中的eflags替换当前eflags
	pushfl
	popl %eax
	xor %edx, %eax
	test $0x00200000, %eax
	jnz cpuid
	# 不支付CPUID指令
	pushl $output_nocpuid
	call printf
	add $4, %esp
	pushl $0
	call exit
cpuid: #支持CPUID指令
	pushl $output_cpuid
	call printf
	add $4, %esp
	pushl $0
	call exit

