#main.S
.section .data
	var: .int 0x0812abcd
.section .text
.globl _start
_start:
	pushl var
	call print_sign_hex
	mov $1,%eax
	mov $0,%ebx
	int $0x80