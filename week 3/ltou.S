.section .data
iostring:
	.asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl _start
_start:
#transformation
	movb $'a',%al
	subb $'A',%al
	movl $20,%ecx
	movl $iostring,%edx
r:
	movb (%edx),%bl
	cmpb $'a',%bl
	jb L1
	cmpb $'z',%bl
	ja L1
	jmp L2
L1:
	addl $1,%edx
	loop r
	jmp L3

L2:
	subb %al,(%edx)
	jmp L1

L3:
#output
	movl $4,%eax
	movl $1,%ebx
	movl $iostring,%ecx
	subl %ecx,%edx
	int $0x80

#exit 
	movl $1,%eax
	movl $0,%ebx
	int $0x80