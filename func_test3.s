/*
An example of using C style in functions.
编译命令:
$ as -gstabs -o func_test3.o func_test3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o func_test3.out func_test3.o
$ gdb -q func_test3.out
vim替换
:%s/func_test3/filename/g
*/
.section .data
precision:
	.byte 0x7f, 0x00
msg:
	#.asciz "Area = %.2f\n"
	.asciz "面积Area = %f\n"
foo:	.float 3.125
doo:	.double 3.125

.section .bss
	.lcomm res1, 4

.section .text
.globl _start
_start:
	finit
	fldcw precision

	pushl $10
	call area
	add $4, %esp
	movl %eax, res1
	call print_area
/*
	subl $8, %esp
	flds res1		#float进FPU栈
	fstpl (%esp)	#double出FPU栈,保存到函数栈
	pushl $msg
	call printf
	add $12, %esp
*/
	pushl $2
	call area
	add $4, %esp
	movl %eax, res1
	call print_area

	pushl $120
	call area
	add $4, %esp
	movl %eax, res1
	call print_area

	movl $1, %eax
	movl $0, %ebx
	int $0x80

.type area, @function
area:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	fldpi
	filds 8(%ebp) #引用参数1(4B原EBP值, 4B返回地址)
	fmul %st(0), %st(0)
	fmulp %st(0), %st(1) # 执行后, st0即为面积
	fstps -4(%ebp)
	movl -4(%ebp), %eax  # eax当成函数返回

	movl %ebp, %esp
	popl %ebp
	ret

/*
float使用C的printf输出时，需要转换为8字节的double.
*/
.type print_area, @function
print_area:
	subl $8, %esp
	flds res1		#float进FPU栈
	fstpl (%esp)	#double出FPU栈,保存到函数栈
	pushl $msg
	call printf
	add $12, %esp
	ret

