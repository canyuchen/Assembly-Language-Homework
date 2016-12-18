.section ,data
iostring:
	.asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl _start
_start:
	mov $iostring,%esi

	pushl %eax
	pushl %ebx
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
	popl %ebx
	popl %eax
	
	mov $4,%eax
	mov $1,%ebx
	mov %esi,%ecx
	mov $13,%ebx
	int $0x80

	mov $1,%eax
	mov $0,%ebx
	int $0x80