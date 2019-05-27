/*
Another example of using sytem calls: nanosleep.
编译命令:
$ as -gstabs -o nanotest.o nanotest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o nanotest.out nanotest.o
$ gdb -q nanotest.out
vim替换
:%s/nanotest/filename/g

$ ./nanotest.out &			#后台执行进程
$ ps ax | grep nanotest.out
$ sudo strace -p [PID]  	#监控系统调用
*/
.section .data
timespec:
	.int 5,0
output:
	.ascii "This is a test\n"
output_end:
	.equ len, output_end - output

.section .bss
	.lcomm rem, 8

.section .text
.globl _start
_start:
	movl $10, %ecx
loop1:
	pushl %ecx
	movl $4, %eax	# write syscall.
	movl $1, %ebx
	movl $output, %ecx
	movl $len, %edx
	int $0x80

	movl $162, %eax # nanosleep
	movl $timespec, %ebx
	movl $rem, %ecx
	int $0x80
	
	popl %ecx
	loop loop1

	movl $1, %eax
	movl $0, %ebx
	int $0x80

