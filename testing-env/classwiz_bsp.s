;; Compile Options : 
;; Version Number  : Ver.1.30.0
;; File Name       : classwiz_bsp.cpp

	.ident "TYPE:"
	.ident "CODE:large"
	.ident "DATA:far"
	.file  "classwiz_bsp.cpp"

	.text
	.type	_ZL1av,@function
	.p2align	2
_ZL1av :
	push	elr
	push	epsw
	pop	psw
	pop	pc

.Lfunc_end0:
	.size	_ZL1av, .Lfunc_end0-_ZL1av

	.globl	_Z11reset_timerv
	.type	_Z11reset_timerv,@function
	.p2align	2
_Z11reset_timerv :
	mov	er0, #0
	st	er0, 0x0F022
	mov	r2, #-98
	mov	r3, #7
	st	er2, 0x0F020
	mov	r2, #15
	mov	r3, #1
	st	er2, 0x0F024
	st	er0, 0x0F014
	ei
	rt

.Lfunc_end1:
	.size	_Z11reset_timerv, .Lfunc_end1-_Z11reset_timerv

	.globl	_Z5delayt
	.type	_Z5delayt,@function
	.p2align	2
_Z5delayt :
	push	fp
	mov	fp, sp
	add	sp, #-4
	st	er0, -2[fp]
	l	r0, 0x0F00A
	xor	r1, r1
	mov	er2, #2
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB2_2
	b	.LBB2_1

.LBB2_1:
	l	r0, 0x0F00A
	xor	r1, r1
	mov	r2, #-3
	mov	r3, #0
	and	r0, r2
	and	r1, r3
	st	r0, 0x0F00A
	b	.LBB2_2

.LBB2_2:
	di
	l	r0, 0x0fffe[fp]
	l	r1, 0x0ffff[fp]
	st	er0, 0x0F020
	mov	er0, #0
	st	er0, 0x0F022
	mov	r2, #1
	mov	r3, #1
	st	er2, 0x0F024
	st	er0, 0x0F014
	mov	r0, 0x050
	st	r0, 0x0F008
	mov	r0, #-96
	st	r0, 0x0F008
	mov	r0, 0x02
	st	r0, 0x0F009
	;APP-asm string
nop
	;NO_APP-asm string
	;APP-asm string
nop
	;NO_APP-asm string
	ei
	mov	sp, fp
	pop	fp
	rt

.Lfunc_end2:
	.size	_Z5delayt, .Lfunc_end2-_Z5delayt

	.globl	_Z10reset_sfrsv
	.type	_Z10reset_sfrsv,@function
	.p2align	2
_Z10reset_sfrsv :
	push	lr
	push	fp
	push	er4
	mov	fp, sp
	add	sp, #-6
	mov	r0, 0x031
	st	r0, 0x0F00A
	mov	r0, #-9
	st	r0, 0x0F028
	mov	er0, #50
	st	er0, -2[fp]
	b	.LBB3_1

.LBB3_1:
	l	r0, 0x0fffe[fp]
	l	r1, 0x0ffff[fp]
	mov	r4, #-1
	mov	r5, #-1
	mov	er2, er0
	add	er2, er4
	st	er2, -2[fp]
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB3_3
	b	.LBB3_2

.LBB3_2:
	b	.LBB3_1

.LBB3_3:
	mov	r0, 0x022
	st	r0, 0x0F010
	mov	r0, 0x00
	st	r0, -3[fp]
	st	r0, 0x0F011
	st	r0, 0x0F012
	st	r0, 0x0F058
	st	r0, 0x0F042
	st	r0, 0x0F018
	mov	r0, 0x07
	st	r0, -4[fp]
	st	r0, 0x0F03D
	mov	r0, #-56
	mov	r1, #0
	bl	_Z5delayt
	l	r1, -4[fp]
	l	r0, -3[fp]
	mov	r2, 0x04
	st	r2, 0x0F030
	st	r1, 0x0F033
	mov	r2, 0x06
	st	r2, 0x0F034
	mov	r2, 0x017
	st	r2, 0x0F035
	mov	r3, 0x08
	st	r3, 0x0F036
	st	r0, 0x0F039
	st	r2, 0x0F031
	mov	r2, 0x012
	st	r2, 0x0F032
	st	r0, 0x0F220
	mov	r2, 0x07F
	st	r2, 0x0F221
	st	r0, 0x0F222
	st	r2, 0x0F223
	st	r0, 0x0F224
	st	r0, 0x0F225
	st	r0, 0x0F048
	st	r0, 0x0F049
	st	r1, 0x0F04A
	st	r0, 0x0F04B
	st	r1, 0x0F04C
	st	r0, 0x0F04E
	st	r0, 0x0F041
	st	r0, 0x0F046
	st	r0, 0x0F044
	mov	sp, fp
	pop	er4
	pop	fp
	pop	pc

.Lfunc_end3:
	.size	_Z10reset_sfrsv, .Lfunc_end3-_Z10reset_sfrsv

	.globl	_Z17reset_screen_sfrsv
	.type	_Z17reset_screen_sfrsv,@function
	.p2align	2
_Z17reset_screen_sfrsv :
	mov	r0, 0x04
	st	r0, 0x0F030
	mov	r0, 0x03
	st	r0, 0x0F033
	mov	r0, 0x06
	st	r0, 0x0F034
	mov	r0, 0x017
	st	r0, 0x0F035
	mov	r0, 0x08
	st	r0, 0x0F036
	mov	r0, 0x00
	st	r0, 0x0F039
	mov	r0, 0x015
	st	r0, 0x0F031
	rt

.Lfunc_end4:
	.size	_Z17reset_screen_sfrsv, .Lfunc_end4-_Z17reset_screen_sfrsv

	.globl	_Z8scan_keyPU3AS24kiko
	.type	_Z8scan_keyPU3AS24kiko,@function
	.p2align	2
_Z8scan_keyPU3AS24kiko :
	push	fp
	push	r4
	mov	fp, sp
	add	sp, #-12
	st	er0, -4[fp]
	mov	r0, 0x01
	st	r0, -5[fp]
	st	r0, -6[fp]
	b	.LBB5_1

.LBB5_1:
	l	r0, -6[fp]
	xor	r1, r1
	mov	er2, #7
	cmp	er0, er2
	bgts	.LBB5_6
	b	.LBB5_2

.LBB5_2:
	l	r0, -5[fp]
	st	r0, 0x0F046
	l	r0, 0x0F040
	st	r0, -7[fp]
	l	r0, -7[fp]
	cmp	r0, #-1
	bne	.LBB5_4
	b	.LBB5_3

.LBB5_3:
	l	r0, -5[fp]
	sll	r0, 0x01
	st	r0, -5[fp]
	l	r0, -6[fp]
	add	r0, 0x01
	st	r0, -6[fp]
	b	.LBB5_5

.LBB5_4:
	l	r0, -5[fp]
	l	r2, 0x0fffc[fp]
	l	r3, 0x0fffd[fp]
	add	er2, 0x01
	st	r0, [er2]
	l	r0, -7[fp]
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #-1
	xor	r0, r2
	xor	r1, r3
	l	r2, 0x0fffc[fp]
	l	r3, 0x0fffd[fp]
	st	r0, [er2]
	mov	r0, 0x01
	st	r0, -1[fp]
	b	.LBB5_9

.LBB5_5:
	b	.LBB5_1

.LBB5_6:
	l	r0, -6[fp]
	xor	r1, r1
	mov	er2, #8
	mov	r4, 0x00
	st	r4, -9[fp]
	mov	r4, 0x01
	st	r4, -8[fp]
	cmp	er0, er2
	blts	.LBB5_7
	b	.LBB5_8

.LBB5_7:
	l	r0, -8[fp]
	and	r0, 0x01
	st	r0, -1[fp]
	b	.LBB5_9

.LBB5_8:
	l	r0, -9[fp]
	st	r0, -8[fp]
	b	.LBB5_7

.LBB5_9:
	l	r0, -1[fp]
	xor	r1, r1
	mov	er2, #0
	mov	sp, fp
	pop	r4
	pop	fp
	rt

.Lfunc_end5:
	.size	_Z8scan_keyPU3AS24kiko, .Lfunc_end5-_Z8scan_keyPU3AS24kiko

	.globl	_Z12key_debouncePU3AS24kiko
	.type	_Z12key_debouncePU3AS24kiko,@function
	.p2align	2
_Z12key_debouncePU3AS24kiko :
	push	lr
	push	fp
	mov	fp, sp
	add	sp, #-10
	st	er0, -2[fp]
	mov	r0, 0x00
	st	r0, -3[fp]
	mov	r0, 0x01
	st	r0, -4[fp]
	b	.LBB6_1

.LBB6_1:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #5
	cmp	er0, er2
	bgts	.LBB6_5
	b	.LBB6_2

.LBB6_2:
	mov	er0, #10
	bl	_Z5delayt
	l	r0, 0x0fffe[fp]
	l	r1, 0x0ffff[fp]
	add	er0, 0x01
	l	r0, [er0]
	st	r0, 0x0F046
	l	r0, 0x0F040
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #-1
	xor	r0, r2
	xor	r1, r3
	st	r0, -5[fp]
	mov	r0, 0x00
	st	r0, 0x0F046
	l	r0, -5[fp]
	l	r2, 0x0fffe[fp]
	l	r3, 0x0ffff[fp]
	l	r1, [er2]
	and	r0, r1
	cmp	r0, 0x00
	beq	.LBB6_4
	b	.LBB6_3

.LBB6_3:
	l	r0, -3[fp]
	add	r0, 0x01
	st	r0, -3[fp]
	l	r1, -5[fp]
	l	r2, 0x0fffe[fp]
	l	r3, 0x0ffff[fp]
	l	r0, [er2]
	and	r0, r1
	st	r0, [er2]
	b	.LBB6_4

.LBB6_4:
	l	r0, -4[fp]
	add	r0, 0x01
	st	r0, -4[fp]
	b	.LBB6_1

.LBB6_5:
	l	r0, -3[fp]
	mov	r1, 0x00
	st	r1, -7[fp]
	mov	r1, 0x01
	st	r1, -6[fp]
	cmp	r0, 0x05
	beq	.LBB6_6
	b	.LBB6_7

.LBB6_6:
	l	r0, -6[fp]
	xor	r1, r1
	mov	er2, #0
	mov	sp, fp
	pop	fp
	pop	pc

.LBB6_7:
	l	r0, -7[fp]
	st	r0, -6[fp]
	b	.LBB6_6

.Lfunc_end6:
	.size	_Z12key_debouncePU3AS24kiko, .Lfunc_end6-_Z12key_debouncePU3AS24kiko

	.globl	_Z9wait_kikov
	.type	_Z9wait_kikov,@function
	.p2align	2
_Z9wait_kikov :
	push	lr
	push	fp
	mov	fp, sp
	add	sp, #-6
	st	er0, -4[fp]
	b	.LBB7_1

.LBB7_1:
	mov	r0, #-1
	st	r0, 0x0F046
	st	r0, 0x0F042
	b	.LBB7_2

.LBB7_2:
	mov	r0, #-96
	mov	r1, #15
	bl	_Z5delayt
	l	r0, 0x0F014
	xor	r1, r1
	mov	er2, #2
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB7_11
	b	.LBB7_3

.LBB7_3:
	mov	r0, 0x00
	st	r0, 0x0F046
	st	r0, 0x0F042
	mov	r0, 0x028
	st	r0, -1[fp]
	b	.LBB7_4

.LBB7_4:
	l	r0, -1[fp]
	mov	r1, r0
	add	r1, #-1
	st	r1, -1[fp]
	cmp	r0, 0x00
	beq	.LBB7_6
	b	.LBB7_5

.LBB7_5:
	;APP-asm string
nop
	;NO_APP-asm string
	b	.LBB7_4

.LBB7_6:
	l	er0, -4[fp]
	bl	_Z8scan_keyPU3AS24kiko
	cmp	r0, 0x00
	beq	.LBB7_10
	b	.LBB7_7

.LBB7_7:
	l	er0, -4[fp]
	bl	_Z12key_debouncePU3AS24kiko
	l	er0, -4[fp]
	l	r0, [er0]
	cmp	r0, 0x00
	beq	.LBB7_9
	b	.LBB7_8

.LBB7_8:
	mov	sp, fp
	pop	fp
	pop	pc

.LBB7_9:
	b	.LBB7_10

.LBB7_10:
	b	.LBB7_1

.LBB7_11:
	b	.LBB7_2

.Lfunc_end7:
	.size	_Z9wait_kikov, .Lfunc_end7-_Z9wait_kikov

	.globl	_Z10draw_glyphhhh
	.type	_Z10draw_glyphhhh,@function
	.p2align	2
_Z10draw_glyphhhh :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-42
	st	r0, -1[fp]
	st	r1, -2[fp]
	st	r2, -3[fp]
	mov	er2, #10
	st	er2, -6[fp]
	mov	er0, #13
	st	er0, -8[fp]
	l	r0, -3[fp]
	xor	r1, r1
	bl	__imulu8lw
	st	er0, -10[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	srlc	r0, 0x04
	sra	r1, 0x04
	st	er0, -12[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	er2, #15
	and	r0, r2
	and	r1, r3
	st	er0, -14[fp]
	l	r2, 0x0fff2[fp]
	l	r3, 0x0fff3[fp]
	mov	er0, #16
	sub	r0, r2
	subc	r1, r3
	st	er0, -16[fp]
	l	r0, 0x0fff0[fp]
	l	r1, 0x0fff1[fp]
	mov	er2, #11
	cmp	er0, er2
	blts	.LBB8_2
	b	.LBB8_1

.LBB8_1:
	mov	er0, #10
	st	er0, -16[fp]
	b	.LBB8_2

.LBB8_2:
	bl	_Z15GetScreenBufferv
	st	er0, -18[fp]
	bl	_Z15GetScreenBufferv
	mov	r2, #0
	mov	r3, #6
	add	er0, er2
	st	er0, -20[fp]
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	mov	er2, #12
	bl	__imulu8lw
	mov	er4, er0
	mov	r6, #0
	sllc	r6, 0x01
	sllc	r5, 0x01
	sll	r4, 0x01
	mov	r0, #BYTE1 OFFSET _ZL11normal_font
	mov	r1, #BYTE2 OFFSET _ZL11normal_font
	mov	r2, #SEG _ZL11normal_font
	add	er0, er4
	st	er0, -24[fp]
	st	r2, -22[fp]
	mov	er0, #0
	st	er0, -26[fp]
	b	.LBB8_3

.LBB8_3:
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	mov	er2, #12
	cmp	er0, er2
	bles	.LBB8_4
	b	.LBB8_10

.LBB8_4:
	l	er4, -24[fp]
	l	r6, -22[fp]
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	st	er0, -32[fp]
	mov	r2, #0
	sllc	r2, 0x01
	sllc	r1, 0x01
	sll	r0, 0x01
	mov	er8, er4
	mov	er10, er6
	add	er8, er0
	l	er2, -32[fp]
	l	er0, r10:[er8]
	l	r8, -14[fp]
	push	r8
	cmp	r8, 0x00
	beq	.LBB8_12
.LBB8_11:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r8, 0x0FF
	bne	.LBB8_11
.LBB8_12:
	pop	r8
	add	er2, 0x0D
	mov	er8, er2
	mov	r10, #0
	sllc	r10, 0x01
	sllc	r9, 0x01
	sll	r8, 0x01
	add	er4, er8
	l	er2, r6:[er4]
	l	r4, -16[fp]
	push	r4
	cmp	r4, 0x00
	beq	.LBB8_14
.LBB8_13:
	srlc	r2, 0x01
	srl	r3, 0x01
	add	r4, 0x0FF
	bne	.LBB8_13
.LBB8_14:
	pop	r4
	or	r0, r2
	or	r1, r3
	mov	r2, #-64
	mov	r3, #-1
	and	r0, r2
	and	r1, r3
	st	er0, -28[fp]
	l	r0, 0x0ffe4[fp]
	l	r1, 0x0ffe5[fp]
	l	r4, -1[fp]
	mov	r2, r4
	mov	er4, #7
	and	r2, r4
	and	r3, r5
	mov	er4, #8
	or	r2, r4
	or	r3, r5
	push	r2
	cmp	r2, 0x00
	beq	.LBB8_16
.LBB8_15:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB8_15
.LBB8_16:
	pop	r2
	st	r0, -29[fp]
	l	r0, 0x0ffe4[fp]
	l	r1, 0x0ffe5[fp]
	l	r2, -1[fp]
	and	r2, 0x07
	push	r2
	cmp	r2, 0x00
	beq	.LBB8_18
.LBB8_17:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB8_17
.LBB8_18:
	pop	r2
	st	r0, -30[fp]
	l	r0, 0x09207
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB8_5
	b	.LBB8_6

.LBB8_5:
	l	r0, -29[fp]
	st	r0, -34[fp]
	l	r6, 0x0ffee[fp]
	l	r7, 0x0ffef[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r2, -2[fp]
	xor	r3, r3
	add	er0, er2
	mov	er2, #24
	st	er2, -36[fp]
	bl	__imulu8lw
	l	er2, -36[fp]
	mov	er4, er0
	l	r1, -34[fp]
	l	r0, -1[fp]
	mov	r8, r0
	xor	r9, r9
	srlc	r8, 0x03
	srl	r9, 0x03
	add	er4, er8
	add	er4, er6
	add	er4, 0x018
	l	r0, [er4]
	xor	r0, r1
	st	r0, [er4]
	l	r0, -30[fp]
	st	r0, -33[fp]
	l	r4, 0x0ffee[fp]
	l	r5, 0x0ffef[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r6, -2[fp]
	xor	r7, r7
	add	er0, er6
	bl	__imulu8lw
	mov	er2, er0
	l	r1, -33[fp]
	l	r0, -1[fp]
	mov	r6, r0
	xor	r7, r7
	srlc	r6, 0x03
	srl	r7, 0x03
	add	er2, er6
	add	er2, er4
	add	er2, 0x019
	l	r0, [er2]
	xor	r0, r1
	st	r0, [er2]
	b	.LBB8_6

.LBB8_6:
	l	r0, 0x09207
	xor	r1, r1
	mov	er2, #2
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB8_7
	b	.LBB8_8

.LBB8_7:
	l	r0, -29[fp]
	st	r0, -38[fp]
	l	r6, 0x0ffec[fp]
	l	r7, 0x0ffed[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r2, -2[fp]
	xor	r3, r3
	add	er0, er2
	mov	er2, #24
	st	er2, -40[fp]
	bl	__imulu8lw
	l	er2, -40[fp]
	mov	er4, er0
	l	r1, -38[fp]
	l	r0, -1[fp]
	mov	r8, r0
	xor	r9, r9
	srlc	r8, 0x03
	srl	r9, 0x03
	add	er4, er8
	add	er4, er6
	add	er4, 0x018
	l	r0, [er4]
	xor	r0, r1
	st	r0, [er4]
	l	r0, -30[fp]
	st	r0, -37[fp]
	l	r4, 0x0ffec[fp]
	l	r5, 0x0ffed[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r6, -2[fp]
	xor	r7, r7
	add	er0, er6
	bl	__imulu8lw
	mov	er2, er0
	l	r1, -37[fp]
	l	r0, -1[fp]
	mov	r6, r0
	xor	r7, r7
	srlc	r6, 0x03
	srl	r7, 0x03
	add	er2, er6
	add	er2, er4
	add	er2, 0x019
	l	r0, [er2]
	xor	r0, r1
	st	r0, [er2]
	b	.LBB8_8

.LBB8_8:
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	add	er0, 0x01
	st	er0, -12[fp]
	b	.LBB8_9

.LBB8_9:
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	add	er0, 0x01
	st	er0, -26[fp]
	b	.LBB8_3

.LBB8_10:
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc









.Lfunc_end8:
	.size	_Z10draw_glyphhhh, .Lfunc_end8-_Z10draw_glyphhhh

	.section	.text._Z15GetScreenBufferv,"axG",@progbits,_Z15GetScreenBufferv,comdat
	.weak	_Z15GetScreenBufferv
	.type	_Z15GetScreenBufferv,@function
	.p2align	2
_Z15GetScreenBufferv :
	mov	r0, #84
	mov	r1, #-42
	rt

.Lfunc_end9:
	.size	_Z15GetScreenBufferv, .Lfunc_end9-_Z15GetScreenBufferv

	.text
	.globl	_Z12line_print_nPU3AS2Kchh
	.type	_Z12line_print_nPU3AS2Kchh,@function
	.p2align	2
_Z12line_print_nPU3AS2Kchh :
	push	lr
	push	fp
	push	er4
	mov	fp, sp
	add	sp, #-8
	st	er0, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	b	.LBB10_1

.LBB10_1:
	l	r0, 0x0fffe[fp]
	l	r1, 0x0ffff[fp]
	mov	er2, er0
	add	er2, 0x01
	st	er2, -2[fp]
	l	r0, [er0]
	st	r0, -5[fp]
	l	r0, -5[fp]
	cmp	r0, 0x00
	bne	.LBB10_3
	b	.LBB10_2

.LBB10_2:
	b	.LBB10_6

.LBB10_3:
	l	r0, -3[fp]
	l	r1, -4[fp]
	l	r2, -5[fp]
	xor	r3, r3
	mov	r4, #-16
	mov	r5, #-1
	add	er2, er4
	bl	_Z10draw_glyphhhh
	l	r0, -3[fp]
	xor	r1, r1
	add	er0, 0x0B
	st	r0, -3[fp]
	l	r0, -3[fp]
	xor	r1, r1
	mov	r2, #-75
	mov	r3, #0
	cmp	er0, er2
	blts	.LBB10_5
	b	.LBB10_4

.LBB10_4:
	mov	r0, 0x00
	st	r0, -3[fp]
	l	r0, -4[fp]
	xor	r1, r1
	add	er0, 0x010
	st	r0, -4[fp]
	b	.LBB10_5

.LBB10_5:
	b	.LBB10_1

.LBB10_6:
	mov	sp, fp
	pop	er4
	pop	fp
	pop	pc

.Lfunc_end10:
	.size	_Z12line_print_nPU3AS2Kchh, .Lfunc_end10-_Z12line_print_nPU3AS2Kchh

	.globl	_Z12line_print_fPKchh
	.type	_Z12line_print_fPKchh,@function
	.p2align	2
_Z12line_print_fPKchh :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-10
	mov	er4, er0
	mov	er6, er2
	l	r0, 16[fp]
	l	r1, 14[fp]
	st	er4, -4[fp]
	st	r6, -2[fp]
	st	r1, -5[fp]
	st	r0, -6[fp]
	b	.LBB11_1

.LBB11_1:
	l	er0, -4[fp]
	l	r2, -2[fp]
	mov	er8, #1
	mov	r10, #0
	mov	er4, er0
	mov	er6, er2
	add	er4, er8
	st	er4, -4[fp]
	st	r6, -2[fp]
	l	r0, r2:[er0]
	st	r0, -7[fp]
	l	r0, -7[fp]
	cmp	r0, 0x00
	bne	.LBB11_3
	b	.LBB11_2

.LBB11_2:
	b	.LBB11_4

.LBB11_3:
	l	r0, -5[fp]
	l	r1, -6[fp]
	l	r2, -7[fp]
	xor	r3, r3
	mov	r4, #-16
	mov	r5, #-1
	add	er2, er4
	bl	_Z10draw_glyphhhh
	l	r0, -5[fp]
	xor	r1, r1
	add	er0, 0x0B
	st	r0, -5[fp]
	b	.LBB11_1

.LBB11_4:
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc

.Lfunc_end11:
	.size	_Z12line_print_fPKchh, .Lfunc_end11-_Z12line_print_fPKchh

	.globl	_Z9rect_linehh
	.type	_Z9rect_linehh,@function
	.p2align	2
_Z9rect_linehh :
	push	lr
	push	fp
	push	er4
	mov	fp, sp
	add	sp, #-14
	st	r0, -1[fp]
	st	r1, -2[fp]
	bl	_Z15GetScreenBufferv
	st	er0, -4[fp]
	bl	_Z15GetScreenBufferv
	mov	r2, #0
	mov	r3, #6
	add	er0, er2
	st	er0, -6[fp]
	l	r0, -1[fp]
	st	r0, -7[fp]
	b	.LBB12_1

.LBB12_1:
	l	r0, -7[fp]
	xor	r1, r1
	l	r2, -1[fp]
	xor	r3, r3
	l	r4, -2[fp]
	xor	r5, r5
	add	er2, er4
	cmp	er0, er2
	blts	.LBB12_2
	b	.LBB12_12

.LBB12_2:
	mov	r0, 0x00
	st	r0, -8[fp]
	b	.LBB12_3

.LBB12_3:
	l	r0, -8[fp]
	xor	r1, r1
	mov	er2, #22
	cmp	er0, er2
	bles	.LBB12_4
	b	.LBB12_10

.LBB12_4:
	l	r0, 0x09207
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB12_6
	b	.LBB12_5

.LBB12_5:
	l	r0, 0x0fffc[fp]
	l	r1, 0x0fffd[fp]
	st	er0, -10[fp]
	l	r0, -7[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	l	er2, -10[fp]
	l	r4, -8[fp]
	xor	r5, r5
	add	er0, er4
	add	er2, er0
	l	r0, [er2]
	xor	r1, r1
	mov	r4, #-1
	mov	r5, #0
	xor	r0, r4
	xor	r1, r5
	st	r0, [er2]
	b	.LBB12_6

.LBB12_6:
	l	r0, 0x09207
	xor	r1, r1
	mov	er2, #2
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB12_8
	b	.LBB12_7

.LBB12_7:
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	st	er0, -12[fp]
	l	r0, -7[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	l	er2, -12[fp]
	l	r4, -8[fp]
	xor	r5, r5
	add	er0, er4
	add	er2, er0
	l	r0, [er2]
	xor	r1, r1
	mov	r4, #-1
	mov	r5, #0
	xor	r0, r4
	xor	r1, r5
	st	r0, [er2]
	b	.LBB12_8

.LBB12_8:
	b	.LBB12_9

.LBB12_9:
	l	r0, -8[fp]
	add	r0, 0x01
	st	r0, -8[fp]
	b	.LBB12_3

.LBB12_10:
	b	.LBB12_11

.LBB12_11:
	l	r0, -7[fp]
	add	r0, 0x01
	st	r0, -7[fp]
	b	.LBB12_1

.LBB12_12:
	mov	sp, fp
	pop	er4
	pop	fp
	pop	pc

.Lfunc_end12:
	.size	_Z9rect_linehh, .Lfunc_end12-_Z9rect_linehh

	.globl	_Z4recthhhh
	.type	_Z4recthhhh,@function
	.p2align	2
_Z4recthhhh :
	push	lr
	push	fp
	push	er4
	push	r6
	mov	fp, sp
	add	sp, #-32
	st	r0, -1[fp]
	st	r1, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	bl	_Z15GetScreenBufferv
	st	er0, -6[fp]
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	mov	r2, #0
	mov	r3, #6
	add	er0, er2
	st	er0, -8[fp]
	l	r0, -1[fp]
	xor	r1, r1
	mov	er2, #7
	and	r0, r2
	and	r1, r3
	st	r0, -9[fp]
	l	r4, -1[fp]
	mov	r0, r4
	l	r6, -3[fp]
	mov	r4, r6
	add	er0, er4
	and	r0, r2
	and	r1, r3
	st	r0, -10[fp]
	l	r4, -9[fp]
	mov	r0, #-1
	mov	r1, #0
	mov	er2, er0
	push	r4
	cmp	r4, 0x00
	beq	.LBB13_19
.LBB13_18:
	srlc	r2, 0x01
	srl	r3, 0x01
	add	r4, 0x0FF
	bne	.LBB13_18
.LBB13_19:
	pop	r4
	st	r2, -11[fp]
	l	r2, -10[fp]
	mov	r4, r2
	xor	r5, r5
	mov	er2, #8
	sub	r2, r4
	subc	r3, r5
	push	r2
	cmp	r2, 0x00
	beq	.LBB13_21
.LBB13_20:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r2, 0x0FF
	bne	.LBB13_20
.LBB13_21:
	pop	r2
	st	r0, -12[fp]
	l	r0, -1[fp]
	mov	r2, r0
	xor	r3, r3
	l	r0, -3[fp]
	mov	r4, r0
	xor	r5, r5
	mov	er0, er2
	add	er0, er4
	add	er0, 0x07
	srlc	r0, 0x03
	srl	r1, 0x03
	srlc	r2, 0x03
	srl	r3, 0x03
	sub	r0, r2
	subc	r1, r3
	st	er0, -24[fp]
	l	r0, -9[fp]
	mov	r1, 0x00
	st	r1, -21[fp]
	mov	r1, 0x01
	st	r1, -20[fp]
	cmp	r0, 0x00
	bne	.LBB13_1
	b	.LBB13_2

.LBB13_1:
	l	r0, -21[fp]
	l	er2, -24[fp]
	l	r1, -20[fp]
	mov	r4, r1
	xor	r5, r5
	sub	r2, r4
	subc	r3, r5
	mov	r1, r2
	st	r1, -13[fp]
	st	r0, -14[fp]
	b	.LBB13_3

.LBB13_2:
	l	r0, -21[fp]
	st	r0, -20[fp]
	b	.LBB13_1

.LBB13_3:
	l	r0, -14[fp]
	xor	r1, r1
	l	r2, -4[fp]
	xor	r3, r3
	cmp	er0, er2
	blts	.LBB13_4
	b	.LBB13_17

.LBB13_4:
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	st	er0, -28[fp]
	l	r0, -2[fp]
	xor	r1, r1
	l	r2, -14[fp]
	xor	r3, r3
	add	er0, er2
	mov	er2, #24
	st	er2, -30[fp]
	bl	__imulu8lw
	l	er2, -30[fp]
	mov	er4, er0
	l	er0, -28[fp]
	add	er0, er4
	l	r4, -1[fp]
	xor	r5, r5
	srlc	r4, 0x03
	srl	r5, 0x03
	add	er0, er4
	st	er0, -16[fp]
	l	r0, 0x0fff8[fp]
	l	r1, 0x0fff9[fp]
	st	er0, -26[fp]
	l	r0, -2[fp]
	xor	r1, r1
	l	r4, -14[fp]
	xor	r5, r5
	add	er0, er4
	bl	__imulu8lw
	mov	er2, er0
	l	er0, -26[fp]
	add	er0, er2
	l	r2, -1[fp]
	xor	r3, r3
	srlc	r2, 0x03
	srl	r3, 0x03
	add	er0, er2
	st	er0, -18[fp]
	l	r0, -13[fp]
	cmp	r0, 0x00
	bne	.LBB13_6
	b	.LBB13_5

.LBB13_5:
	l	r0, -11[fp]
	mov	r4, r0
	l	r0, -12[fp]
	xor	r1, r1
	and	r4, r0
	and	r5, r1
	l	r2, 0x0fff0[fp]
	l	r3, 0x0fff1[fp]
	l	r0, [er2]
	xor	r1, r1
	or	r0, r4
	or	r1, r5
	st	r0, [er2]
	l	r0, -11[fp]
	mov	r4, r0
	l	r0, -12[fp]
	xor	r1, r1
	and	r4, r0
	and	r5, r1
	l	r2, 0x0ffee[fp]
	l	r3, 0x0ffef[fp]
	l	r0, [er2]
	xor	r1, r1
	or	r0, r4
	or	r1, r5
	st	r0, [er2]
	b	.LBB13_15

.LBB13_6:
	l	r0, -9[fp]
	cmp	r0, 0x00
	beq	.LBB13_8
	b	.LBB13_7

.LBB13_7:
	l	r1, -11[fp]
	l	r2, 0x0fff0[fp]
	l	r3, 0x0fff1[fp]
	l	r0, [er2]
	or	r0, r1
	st	r0, [er2]
	l	r1, -11[fp]
	l	r2, 0x0ffee[fp]
	l	r3, 0x0ffef[fp]
	l	r0, [er2]
	or	r0, r1
	st	r0, [er2]
	l	r0, 0x0fff0[fp]
	l	r1, 0x0fff1[fp]
	add	er0, 0x01
	st	er0, -16[fp]
	l	r0, 0x0ffee[fp]
	l	r1, 0x0ffef[fp]
	add	er0, 0x01
	st	er0, -18[fp]
	b	.LBB13_8

.LBB13_8:
	mov	r0, 0x00
	st	r0, -19[fp]
	b	.LBB13_9

.LBB13_9:
	l	r0, -19[fp]
	xor	r1, r1
	l	r2, -13[fp]
	xor	r3, r3
	cmp	er0, er2
	bges	.LBB13_12
	b	.LBB13_10

.LBB13_10:
	l	r2, 0x0fff0[fp]
	l	r3, 0x0fff1[fp]
	l	r0, -19[fp]
	xor	r1, r1
	add	er2, er0
	mov	r0, #-1
	st	r0, [er2]
	l	r2, 0x0ffee[fp]
	l	r3, 0x0ffef[fp]
	l	r1, -19[fp]
	mov	r4, r1
	xor	r5, r5
	add	er2, er4
	st	r0, [er2]
	b	.LBB13_11

.LBB13_11:
	l	r0, -19[fp]
	add	r0, 0x01
	st	r0, -19[fp]
	b	.LBB13_9

.LBB13_12:
	l	r0, -10[fp]
	cmp	r0, 0x00
	beq	.LBB13_14
	b	.LBB13_13

.LBB13_13:
	l	r1, -12[fp]
	l	r2, 0x0fff0[fp]
	l	r3, 0x0fff1[fp]
	l	r0, -13[fp]
	mov	r4, r0
	xor	r5, r5
	add	er2, er4
	l	r0, [er2]
	or	r0, r1
	st	r0, [er2]
	l	r1, -12[fp]
	l	r2, 0x0ffee[fp]
	l	r3, 0x0ffef[fp]
	l	r0, -13[fp]
	mov	r4, r0
	xor	r5, r5
	add	er2, er4
	l	r0, [er2]
	or	r0, r1
	st	r0, [er2]
	b	.LBB13_14

.LBB13_14:
	b	.LBB13_15

.LBB13_15:
	b	.LBB13_16

.LBB13_16:
	l	r0, -14[fp]
	add	r0, 0x01
	st	r0, -14[fp]
	b	.LBB13_3

.LBB13_17:
	mov	sp, fp
	pop	r6
	pop	er4
	pop	fp
	pop	pc





.Lfunc_end13:
	.size	_Z4recthhhh, .Lfunc_end13-_Z4recthhhh

	.globl	_Z10getkeycodev
	.type	_Z10getkeycodev,@function
	.p2align	2
_Z10getkeycodev :
	push	lr
	push	fp
	push	xr4
	mov	fp, sp
	add	sp, #-14
	mov	er0, fp
	add	er0, #-2
	mov	r2, 0x00
	mov	er0, er0
	bl	_Z9wait_kikov
	mov	r0, #BYTE1 OFFSET _ZL6keymap
	mov	r1, #BYTE2 OFFSET _ZL6keymap
	mov	r2, #SEG _ZL6keymap
	st	er0, -6[fp]
	st	r2, -4[fp]
	l	r0, FAR key_mod
	cmp	r0, 0x01
	bne	.LBB14_2
	b	.LBB14_1

.LBB14_1:
	mov	r0, #BYTE1 OFFSET _ZL12keymap_shift
	mov	r1, #BYTE2 OFFSET _ZL12keymap_shift
	mov	r2, #SEG _ZL12keymap_shift
	st	er0, -6[fp]
	st	r2, -4[fp]
	b	.LBB14_2

.LBB14_2:
	l	er0, -6[fp]
	l	r2, -4[fp]
	st	er0, -12[fp]
	st	r2, -10[fp]
	l	r0, -1[fp]
	bl	get_msb
	mov	r4, r0
	xor	r5, r5
	sllc	r5, 0x03
	sll	r4, 0x03
	l	r0, -2[fp]
	bl	get_msb
	mov	r6, r0
	l	er0, -12[fp]
	l	r2, -10[fp]
	xor	r7, r7
	add	er4, er6
	mov	er4, er4
	mov	r6, 0x00
	sllc	r6, 0x01
	sllc	r5, 0x01
	sll	r4, 0x01
	add	er0, er4
	l	er0, r2:[er0]
	st	er0, -8[fp]
	l	r0, 0x0fff8[fp]
	l	r1, 0x0fff9[fp]
	mov	r2, #8
	mov	r3, #-4
	cmp	er0, er2
	bne	.LBB14_7
	b	.LBB14_3

.LBB14_3:
	l	r0, FAR key_mod
	cmp	r0, 0x00
	beq	.LBB14_5
	b	.LBB14_4

.LBB14_4:
	mov	r0, 0x00
	st	r0, FAR key_mod
	b	.LBB14_6

.LBB14_5:
	mov	r0, 0x01
	st	r0, FAR key_mod
	b	.LBB14_6

.LBB14_6:
	mov	er0, #0
	st	er0, -8[fp]
	b	.LBB14_7

.LBB14_7:
	l	r0, 0x0fff8[fp]
	l	r1, 0x0fff9[fp]
	mov	er2, #0
	mov	sp, fp
	pop	xr4
	pop	fp
	pop	pc

.Lfunc_end14:
	.size	_Z10getkeycodev, .Lfunc_end14-_Z10getkeycodev

	.type	_ZL11normal_font,@object
	.section	.rodata,"a",@progbits
_ZL11normal_font:
	.asciz	"\000\000\000\000\000\000\334x\336\375\206\337\006\017\007\036\003<\301~\363\357\277\307\036\000\000\000\000\000\000\000\3743\3707sp\343`\300\341\200\303\000\307\370\217\360\017\000\000\000\000\000\000\f\000\f\000\036\000\0363?3?\000\177\000\177\000\000\000\000\000\000\000\000\000\000\000\340\037\343\037\303\017\303\017\203\007\203\007\003\203\000\203\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\300\000\360\000\360\000\300\000\000\370\000\000\000\000\000\000\000\000\f\000?\200\177\200m\001l\006\177\230?\206\r\201m\200\177\000?\000\f\000\000\300\003\340\007`\006\341f\301\247\200#\330'\330.\370\254pl\374\017\334\007\000\000\000\000\0000\0000\000\376\000\376\000`~`~\340\030\300\030\314\030\374\030x\030\000\000\000\000\000\000\000\000\000\000\000\000\000\006\006\206\017\207\017\007\006\006\006\206\007\206\003\000\000\000\000\000\000\000\000\000\000\000\000\374\000\374\000\300\300\370\340\f`\374`\370`\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\000\000\000\000\003\000\003\000\000\000`\003`\003`\003`\003\000\000\000\000\000\000\001\000\001\000\000\000\000\000\000\000\000\000\0006@6\3416s\377?\377\036l\036l?\376s\376\341\330@\330\000\330\000\000`\034\340\266\300\366\300\267\200\035\217\003\017\007\340\006\260\217\260\315\260\235\340\030\000\0000\3000\3000\3000\000\000\000\000\374\000\374\000\000\000\000\000\300\000\300\000\300\000\000\f\003\016\007\007\016\003\f\003\034\001\030\001\030\003\034\003\f\007\016\016\007\f\003\000\000\000\000\000\000\000\000\000\000\300\200\343\201\343\201\300\200\000\000\000\000\000\000\000\000\000\000\000\000\0000\0000\0000\0000\000\377\000\377\00008080800\0000\000\000\000\000\000\000\000\000\000\000\000\360?\360?\000\000\001\000\003\000\003\000\001\000\000\000\f\000\f\000\034\000\030\0008\0000\0000\000p\000`\200\340\300\300\300\300\200\000\000\003?\207\177\217a\215a\201a\201a\201a\201a\201a\201a\201\177\001?\000\000\360\203\371\207\031\206\030\200\030\2008\200\360\200\340\201\200\203\001\207\371\207\370\207\000\000\007\374\017\376\037\206\033\006;\0063|s~c\006\177\006\177\206\003\376\003\374\000\000\343\037\347\037\006\030\006\030\306\037\347\037g\000f\000f\200f\230\347\037\303\017\000\000\376\361\376\371\006\030\016\000\f\000\034\360\030\3708\0300\030p\030`\370`\360\000\000\017?\237\177\230a\230a\230a\037?\217\177\200a\200a\230a\237\177\017?\000\000\000\300\000\340\340`\340`\340`\000\340\000\340\000`\340`\340`\340\340\000\300\000\000\000\000\003\000\0078\0168\03488\0000\0008\000\0348\0168\0078\0030\0000\000\000\003\000\003\000\361?\360?\000\000\000\000\360?\360?\001\000\003\000\003\000\000\000x\000\374\000\314\200\f\300\030\340\030p000p\000\340\000\3000\2000\000\000\000\003?\203\177\307\341\306\316\316\336\314\332\314\332\337\332\337\337\230\315\030\340\230\177\200?\360\207\370\207\031\306\031\306\031\346\361g\371g\031\366\031\366\0316\3707\3607\000\000~|\177\376c\306a\200a\200a\200a\200a\200a\200c\306\177\376~|\000\000\347\037\347\037\006\230\006\230\006\230\307\237\307\237\006\230\006\230\006\230\346\037\346\037\000\000|\370\376\370\306\001\200\001\200\001\236\361\236\361\206\001\206\001\306\001\376\000|\000\000\000\217a\217a\203a\203a\203a\203\177\203\177\203a\203a\203a\217a\217a\000\0001\3001\3001\0001\0001\0001\0001\0001\0001\0001\000q\300\341\303\300\003`\206`\216`\234`\270`\360`\370`\330`\234`\214`\216\177\206\177\206\000\000f\030g\030g\030\347\034\347\034\346\034\346\037\346\037f\033f\033f\233f\233\000\000|\030\376\030\307\031\203\231\203\231\203\331\203\331\203y\203y\3079\3768|\030\000\000\007\177\217\177\234a\230a\230a\230\177\030\177\033`\037`\034`\017`\007`\000\000\360\307\370\347\031v\0316\0316\3707\3607`\266p\3661v9\346\030\366\0000\177~\177\377\f\303\f\200\f\300\f\374\f~\f\007\f\003\f\207\f\376\f\374\000\000f\230f\230f\030g\030c\030c\030c\030a\030a\030a\030\340\037\300\017\000\000\206\r\206\r\266\r\266\035\266\031\266\031\266\271\374\260\374\260\314\360\314\340\314\340\000\000\230a\230a\234s\f3\017?\007\036\007\036\003?\0033\203s\203a\203a\000\000\370g\370g8\340p\300`\300\340\200\300\201\200\001\200\003\000\007\370\007\370\007\000\000|\370D\370D\300D\300|\300\000\300\000\300\000\300\000\300\000\300\000\370\000\370\000\000\301\007\303\007\307\000\306\000\300\000\300\000\300\000\300\000\300\000\300\000\300\007\300\007\000\000\000\340\000\360\0008\000\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\003\377\003\000\000\000\000\000\000\017\000\017\000\000?\017?\037\000\030\000\030\000\037\000\017\000\000\000\000\006\000\006\000\006\360\307\371\347\031f\031\346\031\346\031f\031f\371\347\360\347\000\000\001\000\001\000\001\000?\374\177\376a\206a\200a\200a\200a\206\177\376?\374\000\000\000\200\001\200\001\200\301\217\347\237g\230\341\237\341\237\001\230a\230\341\237\301\217\000\000\000\360\000\370\376\230\376\201\214\361\374\361\370\200`\200\374\200\376\201\206\201\376\201\374\000\003`\003`\000`\017o\217\177\203q\203a\203a\203a\203a\217a\217a\000\0001\0001\000\001\000\361\000\361\0001\0001\0001\0001\0001\0001\300\361\301\340\001<\200<\200\f\200\f\206\f\216\f\234\f\270\f\360\f\370\f\334?\216?\206\000\000\000\000\000\000\000\000\3466\367?\267;636363636363\000\000\000\000\000\000\000\000\374\360\376\371\206\031\206\031\206\031\206\031\206\031\376\031\374\030\000\000\000\000\000\000\000\000\017\177\237\177\230a\230a\230a\237\177\017\177\000`\000`\000`\000\000\000\000\000\000x\343\371\343\201c\001c\000c\000\343\001\343\001c\000c\000`\000\000\030\000\030\000\177\374\177\376\030\206\030\360\030\374\030\036\030\206\037\376\017\374\000\000\000\000\000\000\000\000f\030f\030f\030c\030c\030a\030\341\030\340\037`\017\000\000\000\000\000\000\000\0003\0333\0333\033{3{3\316\341\316\341\206\301\206\301\000\000\000\000\000\000\000\000\230a\230s\f?\f\036\007\f\007\036\003?\207s\236a\034\000\000\000\000\000\000\000\370g\370gp\300\340\300\300\201\200\203\000\007\370\007\370\007\000\000\340\034\340<\3400\3400\340p\340\340\340\300\340\340\340p\3400\3400\340<\000\034\000\007\200\007\200\001\200\001\307\001\357\000l\000\354\000\300\001\200\001\200\001\200\007\000\007`\000`\000`\000`\000`\214\177\354\177\374`8`\000`\000`\000`\000\000\000\000\007\000\007\000\000\003\036\017\036\036\016\034\036;\034?<\2709\237?\017\037\000\000\000\000\000\000\000\000\000\340\001\360\013q\233\341\361\300a\000\361\340\231\341\t\201\000\000\000\000\000\000\000\000\000\000\000\216\000\237s\233\377\233\314\233\314\233\314\237\377\216s\000\003\017\203\037\203\031\203\031\203\037\003\017\000\200\000\300\000\300\000\300\000\300\000\300\000\200\372p\334\361\370\200`\000\374\000\316\001\374\000\000\000\000\000\000\000\000\000\000\000\000\000\037\000\037\000\200\000\330\001\234\003\017\007\007\016\003\034\0078\017p\334\377\330\377\000\000\370\347\370\347\001\000\030f\031\3461\3030\203\340\001\340\201\300\300\301\341\201g\000\007\034p>\370w\334\000\000a\206a\3163\3743x\036x\036\374\f\316|\206x\000\017\000\017\000\206\000\306\000\346\200\366\277\366?\346\000\306\000\206\000\017\000\017\000\000\000\000\374\000\374\b\030\004\030\376\031\001\030\001\030\376\031\004\030\b\030\000<\000<\000\000\000\000\000\000\000\000\000\000\000\000\000!\0303\031\036\031\f\031\036\0313\030!\000\000\000\000\000\000|\000|\000\000\000\000\000\340\354\360\375\260\275\260\275\361\375\341\354\000\000\001\000\007\000\037\000|\006p\006|\006\037\006\007\006\001\006\000\006\177\376\177\376\000\000\207\301\207\301\201\001\360?\360?\000\003\001\003\367\377\367\377\000\006\007\306\007\306\000\000\000\000|\300D\360D|D\034\307}\001\361\202\300D\000(\000\020\374\000\374\000\000\300\003\301\003\001\003\001\007\001\346\001\346\003n\003|\003<\003<\033\030\037\030\016\000\000\340\000\360\000\260\000\200\000\200\000\200\300\200\340\001\340\0010\003\360\003\370\007\030\006\000\000\000\000\000\000\000\000\000\000\000\000>\370\177\374c\314`\370c\314\177\374>\370\000\000\000\000\000\000\006\000\007\000\007\000\007\000\207\033\307\037\306\034\300\030\300\030\300\030\000\000\000\000\000\000\006\000\036\200~\340\376\371~\340\036\200\006\000\000\000\000\000\000\000\003\036\017?\0173\0033\0033\003?\003\036\000\000\000\000\000\000\000\000\000\000\000\000\340\003\360\0030\000\340\000\200\001\360\003\360\003\000\000\000\000\000\000\000\000\000\000\000\000\016\370\036\374\026\f6x?\f?\374\006\370\000\000\000\000\000\000\000\000\000\000\000\000\301\017\303\017\003\f\203\017\303\000\303\017\201\017\000\000\000\000\000\000\000\000\000\000\000\000\374\340\374\340\f\000\030\340\03000\3600\340\000\000\000\000\000\000\000\000\000\000\000\000\007\036\017?\f3\007\036\0003\007?\007\036\000\000\000\000\000\000\000\000\000\000\000\000\030\200x\300y\300\231\317\230\317\031\300\031\200\000\000\000\000\000\000\000\000\000\000\000\000g\000\357\354\354\274l0ldo\354g\270\000\000\000\000\000\000\000\000\000\000\000\000\000\200\000\300\000\300\000\300\000\300\000\300\200\203\200\007\000\006\000\006\000\006\200\007\200\003\000\000\000\000\000\000\000\000\000\000\000\000\f\340\f\360?0\f0\f0\000\360?\340\000\000\000\000\000\000\000\000\000\000\000\000\003\036\017?\0173\0033\0033\003?\003\036\000\000\000\000\000\000\000\000\000\000\000\000\340\003\360\0030\000\343\000\203\001\360\003\360\003\000\000\000\000\000\000\000\000\000\000\000\000?\006?\0360\036>\346>\3460\0060\006\000\000\000\000\000\000\000\000\000\000\000\000\303\030\303\034\303\036\303\037\303\033\303\031\303\030\000\000\000\000\000\000\000\000\000\000\000\000f\340f\360\3140\314\360\374\340\266\001\200\001?\036?\036<?<?\274\177\277g\277g\374\377\374\377\374\303\377\303\377\303\000\000\373\341\377\367\2177\003?\003?\003\357\003\357\003?\003?\2177\377\367\373\341\000\000\177\374\177\376x\307x\303x\303\177\303\177\303x\303x\303x\307\177\376\177\374\000\000\377\337\377\337\017\036\017\036\017\036\357\237\357\237\017\036\017\036\017\036\017\336\017\336\000\000\000\370\000\374\000\f\200\r`\r\030\375\006\371\030\001`\001\200\001\000\000\000\000\000\000\300\377\300\377\300p\0178\037\0349\0160\0070\0160\03498\337p\317\377\300\377\000\000\000\000\000\000\034>|\277\360\343\300\341\200\303\001\343\001\347\001\266\0006\000\006\017\000\037\0009\0000~0\376\177\300\177xa\370a\300s\200?\374\036\374\000\000\000\007\200\207\200\301\201\301\201\303\201\303\303\307\303\206\303\216\307\214\366\034v\030\006\000\000\000\000\000\000\000\377\215\377\217\314\214\314\234\334\031\2309\230\371\236\333\016\003\000\000\000\000\000\000\000\000\307\037\317?\035s\231a\233\343\033\303\037\347\017~\006<\006\000q\300\371\300\333\301\233\341\231\3639\2631\263q3\341q\301\343\355\317}\0168\000\377\234\377\374\377\360\377\200\377\274\377\376\377\306\377\206\377\206\377\206\377\206\377\206\377\000\360\377\360\3770\3600\3600\3600\3603\3603\3600\3601\3600\360\363\377\363\377\000\000\000\000\000\000\000\000\000\000\000\000\000\340\000\360\0000\000\340\3773\377\363\377\343\200\017\300\037\300\034\037\034\237\177\234\177\034\034\034\034\037\034\037\034\034\034\034\034\034\000\000\000\000\000\000\000\360\346\370\367\270w8w8w8\3679\3479\0079\007\001\000\000\000\000\000\000\000\333w\377w\355w\355\356\355\356\355\377\355\367\355\300\355\300\000\300\016\034\016\034\017\034\177\234\377\334\357\335\317\337\216\337\316\337\356\335\376\334~\334\000\000~\034\377\035\343=\300?\300?\317\377\317\377\303\337\303\337\343\335\377\035~\034\000\000\337\177\337\177\034\016\034\016\034\016\037\016\037\016\034\016\034\016\034\016\034\016\034\016\000\000\370\347\370\367\000w\000w\000w\360\367\360\347\000\007\001\007\001\007\371\007\371\007\000\000\000\177\000\177\000`\000\340\000\300\000\376\000\376>\300?\3003\200?\200>\2000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\200\031\206\037\007\030\203\017\000\000\000\000\000\000\000\000\000\000\000\000\316`\334`\370`\360`\370`\334\340\316\300\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\214?\fL\f\f\217\017\007\007\000\000\000\000\000\000\000\000\000\000\000\000\340\001\360\0030\303\361\3011\300\361\301\340a\0008\000|\000l\0008\000|\000l\000\356\000\306\273\376\377\377\314\203\314\203\314\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\001\017\001\206\003\306\003\306\003\317\000\317\000\000\000\000\000\000\000\000\000\000\000\000\000\340\000\340\000`\000`\000\360\000\360\000`\000\000\000\000\000\0000\0000\0000\0000\0000\000?\000?\000\000\000\000\000\000\000\000\000\000\000\361\t\373\013\034\017\f\016\214\017\f\000\034\363\370\363\360\001\000\000\000\000n`\177\360s\370c\374c`cccc\000c\000c\000c\000\177\000>\000\000\000\016\300\017\360\017\300\017\000\016\000\000\000\000\340\000\341\007\347\037\341\007\340\000\000\000\340\000\374\000\377\000\374\000\340\000\000\000\000\000\0008\000\370\000\370\000\370\0008\000\000"
	.size	_ZL11normal_font, 3641

	.type	key_mod,@object
	.section	.bss,"aw",@nobits
	.globl	key_mod
key_mod:
	.byte	0
	.size	key_mod, 1

	.type	_ZL6keymap,@object
	.section	.rodata,"a",@progbits
	.p2align	1
_ZL6keymap:
	.short	49
	.short	52
	.short	55
	.short	0
	.short	0
	.short	64520
	.short	64521
	.short	0
	.short	50
	.short	53
	.short	56
	.short	0
	.short	0
	.short	64524
	.short	64523
	.short	64522
	.short	51
	.short	54
	.short	57
	.short	0
	.short	0
	.short	64525
	.short	64514
	.short	0
	.short	43
	.short	36
	.short	64528
	.short	0
	.short	0
	.short	64513
	.short	64517
	.short	64512
	.short	45
	.short	38
	.short	64529
	.short	0
	.short	0
	.short	64526
	.short	64515
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64527
	.short	64519
	.short	64518
	.short	64517
	.short	0
	.short	0
	.short	0
	.short	48
	.short	0
	.short	0
	.short	0
	.size	_ZL6keymap, 112

	.type	_ZL12keymap_shift,@object
	.p2align	1
_ZL12keymap_shift:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64520
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64514
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64513
	.short	64517
	.short	64512
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64515
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	64519
	.short	64518
	.short	64517
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.size	_ZL12keymap_shift, 112


	.ident	"clang version 1.30"
	.section .text0.vector.0x8
	.short	_ZL1av

	.section .text0.vector.0xa
	.short	_ZL1av

	.section .text0.vector.0xc
	.short	_ZL1av

	.section .text0.vector.0xe
	.short	_ZL1av

	.section .text0.vector.0x10
	.short	_ZL1av

	.section .text0.vector.0x12
	.short	_ZL1av

	.section .text0.vector.0x14
	.short	_ZL1av

	.section .text0.vector.0x16
	.short	_ZL1av

	.section .text0.vector.0x18
	.short	_ZL1av

	.section .text0.vector.0x1a
	.short	_ZL1av

	.section .text0.vector.0x1c
	.short	_ZL1av

	.section .text0.vector.0x1e
	.short	_ZL1av

	.section .text0.vector.0x20
	.short	_ZL1av

	.section .text0.vector.0x22
	.short	_ZL1av

	.section .text0.vector.0x24
	.short	_ZL1av

	.section .text0.vector.0x26
	.short	_ZL1av

	.section .text0.vector.0x28
	.short	_ZL1av

	.section .text0.vector.0x2a
	.short	_ZL1av

	.section .text0.vector.0x2c
	.short	_ZL1av

	.section .text0.vector.0x2e
	.short	_ZL1av

	.section .text0.vector.0x30
	.short	_ZL1av

	.section .text0.vector.0x32
	.short	_ZL1av

	.section .text0.vector.0x34
	.short	_ZL1av

	.section .text0.vector.0x36
	.short	_ZL1av

	.section .text0.vector.0x38
	.short	_ZL1av

	.section .text0.vector.0x3a
	.short	_ZL1av

	.section .text0.vector.0x3c
	.short	_ZL1av

