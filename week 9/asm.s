	.file	"asm.c"
	.text
	.p2align 4,,15
	.globl	cshld5
	.type	cshld5, @function
cshld5:
.LFB24:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	sall	$5, %eax
	shrl	$27, %edx
	orl	%edx, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	cshld5, .-cshld5
	.p2align 4,,15
	.globl	shld5
	.type	shld5, @function
shld5:
.LFB25:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	8(%esp), %edx
#APP
# 14 "asm.c" 1
	shldl $5,%edx,%eax
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE25:
	.size	shld5, .-shld5
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%x\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$222176, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$3223, %edx
	movl	$6943, %eax
	movl	$.LC0, 4(%esp)
#APP
# 14 "asm.c" 1
	shldl $5,%edx,%eax
# 0 "" 2
#NO_APP
	movl	$1, (%esp)
	movl	%eax, 8(%esp)
	call	__printf_chk
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
