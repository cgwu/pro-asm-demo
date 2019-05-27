/*
An example of passing input values to a sysstem call.
编译命令:
$ as -gstabs -o syscall_test1.o syscall_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o syscall_test1.out syscall_test1.o
$ gdb -q syscall_test1.out
vim替换
:%s/syscall_test1/filename/g
*/
.section .data
output:
	.ascii "This is a test message中文测试.\n"
output_end:
	.equ len, output_end - output

.section .text
.globl _start
_start:
	// ssize_t write(int fd, const void *buf, size_t count);
	movl $4, %eax #write syscall
	movl $1, %ebx
	movl $output, %ecx
	movl $len, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80

