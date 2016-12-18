#main.S
.section .data
iostring:
  .asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl  _start
_start:
	mov $iostring,%esi
	call Inthandler
	mov $4,%eax
	mov $1,%ebx
	mov $iostring,%ecx
	mov $13,%ebx
	int $0x80
	mov $1,%eax
	mov $0,%ebx
	int $0x80