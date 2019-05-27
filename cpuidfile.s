/*
An example of writing data to a file.
编译命令:
$ as -gstabs -o cpuidfile.o cpuidfile.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cpuidfile.out cpuidfile.o
$ gdb -q cpuidfile.out
vim替换
:%s/cpuidfile/filename/g
*/
.section .data
filename:
	.asciz "./cpuid.txt"
output:
	.ascii "The processor Vendor ID is '"
vendorid:
	.asciz "xxxxxxxxxxxx'\n"
len = (. - output)

.section .bss
	.lcomm filehandle, 4

.section .text
.globl _start
_start:
	movl $0, %eax
	cpuid
	movl $vendorid, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)

	movl $5, %eax #open
	movl $filename, %ebx
	#movl $01101, %ecx	# O_CREATE | O_WRONLY
	movl $02101, %ecx	# O_CREATE | O_WRONLY | O_APPEND
	movl $0644, %edx
	int $0x80

	test %eax, %eax
	js badfile # minus means error.
	movl %eax, filehandle

	movl $4, %eax #write
	movl filehandle, %ebx
	movl $output, %ecx
	movl $len, %edx
	int $0x80
	test %eax, %eax
	js badfile

	movl $6, %eax # close
	movl filehandle, %ebx
	int $0x80

badfile:
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

