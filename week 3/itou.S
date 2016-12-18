.section .data
iostring:
	.asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl _start
_start:
#transformation
	movl $iostring,%ebx
	mov $'A',%dl
	sub $'a',%dl

L3:
	movb (%ebx),%al
	test %al,%al
	je L1
	cmpl $'a',%al
	jb L2
	cmpl $'z',%al
	ja L2
	add %dl,%al
	movb %al,(%ebx)
L2:
	inc %ebx
	jmp L3


L1:
#output
	movl $4,%eax
	movl $1,%ebx
	movl $iostring,%ecx
	subl %ecx,%ebx
	int $0x80

#exit 
	movl $1,%eax
	movl $0,%ebx
	int $0x80