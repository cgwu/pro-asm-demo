# cpuidfunc.s - An example of returning a string value.
.section .bss
	.comm output, 13

.section .text
.type cpuidfunc, @function
.globl cpuidfunc
cpuidfunc:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx

	movl $0, %eax
	cpuid
	movl $output, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)
	movl $output, %eax  #返回字符串地址

	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret

