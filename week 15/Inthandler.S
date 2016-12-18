.section .text
.globl Inthandler
.type Inthandler,@function
Inthandler:
	pushl %ax
	pushl %bx
	mov %si,%bx
1:
	movb (%si),%al
	test %al,%al
	jz 1f
	cmp $'9',%al
	ja 2f
	cmp $'0',%al
	jae 3f
2:
	mov %al,(%bx)
	inc %bx
3:
	inc %si
	jmp 1b
1:
	mov %al,(%bx)
	popl %bx
	popl %ax
	iret