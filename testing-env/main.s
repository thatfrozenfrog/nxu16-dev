;; Compile Options : 
;; Version Number  : Ver.1.30.0
;; File Name       : main.cpp

	.ident "TYPE:"
	.ident "CODE:large"
	.ident "DATA:far"
	.file  "main.cpp"

	.text
	.globl	main
	.type	main,@function
	.p2align	2
main :
	mov	fp, sp
	add	sp, #-4
	mov	r0, #0
	mov	r1, #-112
	mov	r2, #0
	mov	r3, #95
	bl	memzero_n
	bl	_Z10reset_sfrsv
	mov	r0, #64
	mov	r1, #6
	bl	_Z5delayt
	mov	r0, #-127
	st	r0, 0x0F00A
	bl	_Z17reset_screen_sfrsv
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	mov	r3, #12
	bl	memzero_n
	mov	r0, 0x00
	st	r0, -1[fp]
	bl	render_copy
	bl	LCD_BufferClear
	l	r1, -1[fp]
	mov	r0, 0x01
	push	r0
	mov	r2, 0x03F
	mov	r3, 0x01F
	mov	r0, r1
	bl	LCD_BufferDrawLine
	l	r0, -1[fp]
	add	sp, 0x02
	bl	render_copy
	;APP-asm string
brk
	;NO_APP-asm string
	mov	er0, #0

.Lfunc_end0:
	.size	main, .Lfunc_end0-main


	.ident	"clang version 1.30"

