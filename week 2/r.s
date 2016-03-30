.section .data
stringvar:
	.ascii "0123456789abcdef"
.section .text
.globl _start
_start:

#reverse
	movl $8,%ecx
	movl $stringvar,%eax
r:
    	movb (%eax),%bl
    	xchgb 1(%eax),%bl
    	mov %bl,(%eax)
	addl $2,%eax
	loop r

#output
	movl $4,%eax
	movl $1,%ebx
	movl $stringvar,%ecx
	movl $16,%edx
	int $0x80

#exit
	movl $1,%eax
	movl $0,%ebx
	int $0x80
