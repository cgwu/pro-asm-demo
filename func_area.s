.section .text

.type area, @function
.globl area
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
.globl print_area
print_area:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp

	flds 12(%ebp)    #float进FPU栈
	fstpl (%esp)    #double出FPU栈,保存到函数栈
	pushl 8(%ebp)
	call printf

	movl %ebp, %esp
	popl %ebp
	ret

