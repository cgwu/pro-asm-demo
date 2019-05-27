# bubble.s - An example of the XCHG instruction
.section .data
values:
	.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
len = (. - values)/4 - 1	#循环次数,元素个数少1

.section .text
.globl _start
_start:
	movl $values, %esi
	movl $len, %ecx #外层循环计数
	movl $len, %ebx	#内层循环计数
loop:
	movl (%esi), %eax
	cmp %eax, 4(%esi)	#当前元素与下一个元素进行比较
	jge skip
	xchg %eax, 4(%esi)  #当下一个元素小于当前元素时，交换
	movl %eax, (%esi)	#寄存器内容保存到内存数组
skip:
	add $4, %esi
	dec %ebx
	jnz loop #内层循环计数非0，则转到比较下一对数
	dec %ecx
	jz end		#外层循环为0则结束
	#开启下一轮外层循环
	movl $values, %esi
	movl %ecx, %ebx
	jmp loop
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

