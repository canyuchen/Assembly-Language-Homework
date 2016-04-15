#print_sign_hex_proc.S
.section .text
.globl print_sign_hex
.type print_sign_hex,@function
print_sign_hex:
	push %ebp
	mov %esp,%ebp
	sub $16,%esp
	mov %ebx,12(%esp)
    mov 8(%ebp),%ecx
	movb $'0',1(%esp)
	movb $'x',2(%esp)
	movb $0,11(%esp)
	lea 10(%esp),%eax
	lea 3(%esp),%ebx
	sub $0,%ecx
	jge S
	neg %ecx
	movb $'-',(%esp)
	jmp L1
S:
	movb $'+',(%esp)
	jmp L1
L1:
	mov %ecx,%edx
	andb $0xf,%dl
	cmpb $10,%dl
	jb L2
	addb $0x57,%dl
	jmp L3
L2:
	orb $0x30,%dl
L3:
	movb %dl,(%eax)
	dec %eax
	shrl $4,%ecx
	cmp %ebx,%eax
	jae L1
	mov $4,%eax
	mov $1,%ebx
	mov %esp,%ecx
	mov $11,%edx
	int $0x80
	mov 12(%esp),%ebx
	leave
	ret
