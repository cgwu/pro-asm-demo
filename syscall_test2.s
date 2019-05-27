/*
An example of getting a return value from a system call.
编译命令:
$ as -gstabs -o syscall_test2.o syscall_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o syscall_test2.out syscall_test2.o
$ gdb -q syscall_test2.out
vim替换
:%s/syscall_test2/filename/g
*/
.section .bss
	.lcomm pid, 4
	.lcomm uid, 4
	.lcomm gid, 4

.section .text
.globl _start
_start:
	movl $20, %eax # getpid
	int $0x80
	movl %eax, pid

	movl $24, %eax # getuid
	int $0x80
	movl %eax, uid

	movl $47, %eax # getgid
	int $0x80
	movl %eax, gid

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

