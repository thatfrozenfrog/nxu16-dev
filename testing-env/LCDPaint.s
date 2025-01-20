;; Compile Options : 
;; Version Number  : Ver.1.30.0
;; File Name       : LCDPaint.c

	.ident "TYPE:"
	.ident "CODE:large"
	.ident "DATA:far"
	.file  "LCDPaint.c"

	.text
	.globl	LCD_BufferSetPix
	.type	LCD_BufferSetPix,@function
	.p2align	2
LCD_BufferSetPix :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-12
	st	r0, -1[fp]
	st	r1, -2[fp]
	st	r2, -3[fp]
	mov	r0, 0x00
	st	r0, -4[fp]
	l	r0, -2[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er4, er0
	mov	r6, 0x00
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	add	er0, er4
	l	r4, -1[fp]
	xor	r5, r5
	xor	r6, r6
	mov	r8, 0x03
	push	r8
	cmp	r8, 0x00
	beq	.LBB0_5
.LBB0_4:
	srlc	r4, 0x01
	srlc	r5, 0x01
	srl	r6, 0x01
	add	r8, 0x0FF
	bne	.LBB0_4
.LBB0_5:
	pop	r8
	add	er0, er4
	st	er0, -8[fp]
	st	r2, -6[fp]
	l	r2, -1[fp]
	and	r2, 0x07
	mov	r0, #-128
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB0_7
.LBB0_6:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB0_6
.LBB0_7:
	pop	r2
	mov	r2, #-1
	mov	r3, #-1
	xor	r0, r2
	xor	r1, r3
	st	r0, -9[fp]
	b	.LBB0_1

.LBB0_1:
	l	er4, -8[fp]
	l	r6, -6[fp]
	l	r2, r6:[er4]
	mov	r0, r2
	l	r2, -9[fp]
	xor	r3, r3
	and	r0, r2
	and	r1, r3
	l	r2, -3[fp]
	xor	r3, r3
	mov	er8, #1
	and	r2, r8
	and	r3, r9
	l	r10, -1[fp]
	mov	r8, r10
	mov	r10, #-1
	mov	r11, #-1
	xor	r8, r10
	xor	r9, r11
	and	r8, 0x07
	push	r8
	cmp	r8, 0x00
	beq	.LBB0_9
.LBB0_8:
	sllc	r3, 0x01
	sll	r2, 0x01
	add	r8, 0x0FF
	bne	.LBB0_8
.LBB0_9:
	pop	r8
	or	r0, r2
	or	r1, r3
	st	r0, r6:[er4]
	l	er0, -8[fp]
	l	r2, -6[fp]
	mov	r4, #-24
	mov	r5, #5
	mov	r6, #0
	add	er0, er4
	st	er0, -8[fp]
	st	r2, -6[fp]
	l	r0, -3[fp]
	xor	r1, r1
	srlc	r0, 0x01
	srl	r1, 0x01
	st	r0, -3[fp]
	b	.LBB0_2

.LBB0_2:
	l	r0, -4[fp]
	add	r0, 0x01
	st	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	cmp	er0, er2
	blts	.LBB0_1
	b	.LBB0_3

.LBB0_3:
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc







.Lfunc_end0:
	.size	LCD_BufferSetPix, .Lfunc_end0-LCD_BufferSetPix

	.globl	LCD_BufferGetPix
	.type	LCD_BufferGetPix,@function
	.p2align	2
LCD_BufferGetPix :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-14
	st	r0, -1[fp]
	st	r1, -2[fp]
	mov	r0, 0x00
	st	r0, -10[fp]
	st	r0, -3[fp]
	l	r2, -1[fp]
	and	r2, 0x07
	mov	r0, #-128
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB1_7
.LBB1_6:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB1_6
.LBB1_7:
	pop	r2
	mov	r2, #-1
	mov	r3, #-1
	xor	r0, r2
	xor	r1, r3
	st	r0, -4[fp]
	l	r0, -2[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er2, er0
	l	r0, -10[fp]
	mov	er8, er2
	mov	r10, 0x00
	mov	r4, #-44
	mov	r5, #-35
	mov	r6, #0
	add	er4, er8
	l	r1, -1[fp]
	mov	r8, r1
	xor	r9, r9
	xor	r10, r10
	mov	r1, 0x03
	push	r1
	cmp	r1, 0x00
	beq	.LBB1_9
.LBB1_8:
	srlc	r8, 0x01
	srlc	r9, 0x01
	srl	r10, 0x01
	add	r1, 0x0FF
	bne	.LBB1_8
.LBB1_9:
	pop	r1
	add	er4, er8
	st	er4, -8[fp]
	st	r6, -6[fp]
	st	r0, -9[fp]
	b	.LBB1_1

.LBB1_1:
	l	er0, -8[fp]
	l	r2, -6[fp]
	l	r0, r2:[er0]
	l	r1, -4[fp]
	and	r0, r1
	mov	r1, 0x00
	st	r1, -12[fp]
	mov	r1, 0x01
	st	r1, -11[fp]
	cmp	r0, 0x00
	bne	.LBB1_2
	b	.LBB1_3

.LBB1_2:
	l	r0, -11[fp]
	mov	r2, r0
	xor	r3, r3
	l	r0, -3[fp]
	push	r0
	cmp	r0, 0x00
	beq	.LBB1_11
.LBB1_10:
	sllc	r3, 0x01
	sll	r2, 0x01
	add	r0, 0x0FF
	bne	.LBB1_10
.LBB1_11:
	pop	r0
	l	r0, -9[fp]
	xor	r1, r1
	or	r0, r2
	or	r1, r3
	st	r0, -9[fp]
	l	er0, -8[fp]
	l	r2, -6[fp]
	mov	r4, #-24
	mov	r5, #5
	mov	r6, #0
	add	er0, er4
	st	er0, -8[fp]
	st	r2, -6[fp]
	b	.LBB1_4

.LBB1_3:
	l	r0, -12[fp]
	st	r0, -11[fp]
	b	.LBB1_2

.LBB1_4:
	l	r0, -3[fp]
	add	r0, 0x01
	st	r0, -3[fp]
	xor	r1, r1
	mov	er2, #1
	cmp	er0, er2
	blts	.LBB1_1
	b	.LBB1_5

.LBB1_5:
	l	r0, -9[fp]
	xor	r1, r1
	mov	er2, #0
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc







.Lfunc_end1:
	.size	LCD_BufferGetPix, .Lfunc_end1-LCD_BufferGetPix

	.globl	LCD_BufferHLine
	.type	LCD_BufferHLine,@function
	.p2align	2
LCD_BufferHLine :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-46
	mov	r4, r1
	mov	r5, r0
	l	r0, 0x0e[fp]
	l	r1, 0x0f[fp]
	st	r5, -1[fp]
	st	r4, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	st	er0, -6[fp]
	mov	r0, 0x00
	st	r0, -7[fp]
	l	r0, -1[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	cmp	er0, er2
	bles	.LBB2_2
	b	.LBB2_1

.LBB2_1:
	l	r0, -1[fp]
	st	r0, -20[fp]
	l	r0, -3[fp]
	st	r0, -1[fp]
	l	r0, -20[fp]
	st	r0, -3[fp]
	b	.LBB2_2

.LBB2_2:
	l	r0, -3[fp]
	xor	r1, r1
	l	r2, -1[fp]
	xor	r3, r3
	sub	r0, r2
	subc	r1, r3
	add	er0, 0x01
	st	r0, -14[fp]
	l	r0, -1[fp]
	xor	r1, r1
	mov	er2, #7
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB2_3
	b	.LBB2_7

.LBB2_3:
	l	r0, -3[fp]
	xor	r1, r1
	mov	r4, #-8
	mov	r5, #-1
	and	r0, r4
	and	r1, r5
	l	r2, -1[fp]
	xor	r3, r3
	and	r2, r4
	and	r3, r5
	cmp	er0, er2
	bne	.LBB2_5
	b	.LBB2_4

.LBB2_4:
	l	r0, -14[fp]
	st	r0, -16[fp]
	l	r0, -14[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	mov	r2, r0
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB2_64
.LBB2_63:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r2, 0x0FF
	bne	.LBB2_63
.LBB2_64:
	pop	r2
	st	r0, -18[fp]
	l	r2, -1[fp]
	l	r0, -18[fp]
	xor	r1, r1
	and	r2, 0x07
	push	r2
	cmp	r2, 0x00
	beq	.LBB2_66
.LBB2_65:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB2_65
.LBB2_66:
	pop	r2
	st	r0, -18[fp]
	b	.LBB2_6

.LBB2_5:
	l	r0, -1[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #7
	and	r2, r0
	and	r3, r1
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	st	r0, -16[fp]
	l	r2, -1[fp]
	and	r2, 0x07
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB2_68
.LBB2_67:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB2_67
.LBB2_68:
	pop	r2
	st	r0, -18[fp]
	b	.LBB2_6

.LBB2_6:
	b	.LBB2_8

.LBB2_7:
	mov	r0, 0x00
	st	r0, -16[fp]
	st	r0, -18[fp]
	b	.LBB2_8

.LBB2_8:
	l	r2, -3[fp]
	mov	r0, r2
	add	er0, 0x01
	mov	er2, #7
	and	r0, r2
	and	r1, r3
	st	r0, -17[fp]
	l	r0, -17[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	mov	r2, r0
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB2_70
.LBB2_69:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r2, 0x0FF
	bne	.LBB2_69
.LBB2_70:
	pop	r2
	st	r0, -19[fp]
	b	.LBB2_9

.LBB2_9:
	l	r0, -7[fp]
	xor	r1, r1
	mov	er2, #0
	cmp	er0, er2
	bles	.LBB2_10
	b	.LBB2_62

.LBB2_10:
	l	r0, -2[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er4, er0
	mov	r6, 0x00
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	add	er0, er4
	st	er0, -24[fp]
	st	r2, -22[fp]
	l	r0, -7[fp]
	xor	r1, r1
	mov	r2, #-24
	mov	r3, #5
	bl	__imulu8lw
	mov	er4, er0
	l	er0, -24[fp]
	l	r2, -22[fp]
	mov	r6, #0
	add	er0, er4
	l	r4, -1[fp]
	xor	r5, r5
	xor	r6, r6
	mov	r8, 0x03
	push	r8
	cmp	r8, 0x00
	beq	.LBB2_72
.LBB2_71:
	srlc	r4, 0x01
	srlc	r5, 0x01
	srl	r6, 0x01
	add	r8, 0x0FF
	bne	.LBB2_71
.LBB2_72:
	pop	r8
	add	er0, er4
	st	er0, -12[fp]
	st	r2, -10[fp]
	l	r0, -14[fp]
	st	r0, -15[fp]
	l	r0, -16[fp]
	cmp	r0, 0x00
	bne	.LBB2_11
	b	.LBB2_30

.LBB2_11:
	l	er0, -12[fp]
	l	r2, -10[fp]
	l	r0, r2:[er0]
	st	r0, -13[fp]
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -28[fp]
	st	r6, -26[fp]
	mov	er2, #4
	cmp	er0, er2
	ble	.LBB2_12
	b	.LBB2_27

.LBB2_12:
	l	er0, -28[fp]
	l	r2, -26[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI2_0[er0]
	b	er0

.LBB2_13:
	l	r0, -18[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_14

.LBB2_14:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB2_16
	b	.LBB2_15

.LBB2_15:
	l	r1, -18[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB2_16

.LBB2_16:
	b	.LBB2_27

.LBB2_17:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB2_19
	b	.LBB2_18

.LBB2_18:
	l	r1, -18[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB2_20

.LBB2_19:
	l	r0, -18[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_20

.LBB2_20:
	b	.LBB2_27

.LBB2_21:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB2_23
	b	.LBB2_22

.LBB2_22:
	l	r0, -18[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_23

.LBB2_23:
	b	.LBB2_27

.LBB2_24:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB2_26
	b	.LBB2_25

.LBB2_25:
	l	r1, -18[fp]
	l	r0, -13[fp]
	xor	r0, r1
	st	r0, -13[fp]
	b	.LBB2_26

.LBB2_26:
	b	.LBB2_27

.LBB2_27:
	l	r0, -13[fp]
	st	r0, -29[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	mov	er0, #1
	mov	r2, #0
	mov	er8, er4
	mov	er10, er6
	add	er8, er0
	l	r0, -29[fp]
	st	er8, -12[fp]
	st	r10, -10[fp]
	st	r0, r6:[er4]
	l	r0, -16[fp]
	mov	r2, r0
	xor	r3, r3
	l	r0, -15[fp]
	xor	r1, r1
	sub	r0, r2
	subc	r1, r3
	st	r0, -15[fp]
	l	r0, -15[fp]
	cmp	r0, 0x00
	bne	.LBB2_29
	b	.LBB2_28

.LBB2_28:
	b	.LBB2_61

.LBB2_29:
	b	.LBB2_30

.LBB2_30:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	st	er2, -36[fp]
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	st	er2, -34[fp]
	mov	r4, #-1
	mov	r5, #0
	st	er4, -32[fp]
	cmp	er0, er2
	bne	.LBB2_31
	b	.LBB2_32

.LBB2_31:
	l	er2, -36[fp]
	l	er0, -32[fp]
	st	r0, -13[fp]
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	cmp	er0, er2
	bne	.LBB2_34
	b	.LBB2_33

.LBB2_32:
	l	er0, -34[fp]
	st	er0, -32[fp]
	b	.LBB2_31

.LBB2_33:
	l	r0, -13[fp]
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #0
	xor	r0, r2
	xor	r1, r3
	st	r0, -13[fp]
	b	.LBB2_34

.LBB2_34:
	b	.LBB2_35

.LBB2_35:
	l	r0, -15[fp]
	xor	r1, r1
	mov	er2, #8
	cmp	er0, er2
	bges	.LBB2_36
	b	.LBB2_42

.LBB2_36:
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -40[fp]
	st	r6, -38[fp]
	mov	er2, #4
	cmp	er0, er2
	bgt	.LBB2_41

.LBB2_37:
	l	er0, -40[fp]
	l	r2, -38[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI2_2[er0]
	b	er0

.LBB2_38:
	l	r0, -13[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	st	r0, r6:[er4]
	b	.LBB2_41

.LBB2_39:
	l	r1, -13[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	l	r0, r6:[er4]
	and	r0, r1
	st	r0, r6:[er4]
	b	.LBB2_41

.LBB2_40:
	l	r1, -13[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	l	r0, r6:[er4]
	xor	r0, r1
	st	r0, r6:[er4]
	b	.LBB2_41

.LBB2_41:
	l	er0, -12[fp]
	l	r2, -10[fp]
	mov	er4, #1
	mov	r6, #0
	add	er0, er4
	st	er0, -12[fp]
	st	r2, -10[fp]
	l	r0, -15[fp]
	xor	r1, r1
	mov	r2, #-8
	mov	r3, #-1
	add	er0, er2
	st	r0, -15[fp]
	b	.LBB2_35

.LBB2_42:
	l	r0, -15[fp]
	cmp	r0, 0x00
	bne	.LBB2_43
	b	.LBB2_60

.LBB2_43:
	l	er0, -12[fp]
	l	r2, -10[fp]
	l	r0, r2:[er0]
	st	r0, -13[fp]
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -44[fp]
	st	r6, -42[fp]
	mov	er2, #4
	cmp	er0, er2
	ble	.LBB2_44
	b	.LBB2_59

.LBB2_44:
	l	er0, -44[fp]
	l	r2, -42[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI2_1[er0]
	b	er0

.LBB2_45:
	l	r0, -19[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_46

.LBB2_46:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB2_48
	b	.LBB2_47

.LBB2_47:
	l	r1, -19[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB2_48

.LBB2_48:
	b	.LBB2_59

.LBB2_49:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB2_51
	b	.LBB2_50

.LBB2_50:
	l	r1, -19[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB2_52

.LBB2_51:
	l	r0, -19[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_52

.LBB2_52:
	b	.LBB2_59

.LBB2_53:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB2_55
	b	.LBB2_54

.LBB2_54:
	l	r0, -19[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB2_55

.LBB2_55:
	b	.LBB2_59

.LBB2_56:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB2_58
	b	.LBB2_57

.LBB2_57:
	l	r1, -19[fp]
	l	r0, -13[fp]
	xor	r0, r1
	st	r0, -13[fp]
	b	.LBB2_58

.LBB2_58:
	b	.LBB2_59

.LBB2_59:
	l	r0, -13[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	st	r0, r6:[er4]
	b	.LBB2_60

.LBB2_60:
	l	r0, -4[fp]
	xor	r1, r1
	srlc	r0, 0x01
	srl	r1, 0x01
	st	r0, -4[fp]
	b	.LBB2_61

.LBB2_61:
	l	r0, -7[fp]
	add	r0, 0x01
	st	r0, -7[fp]
	b	.LBB2_9

.LBB2_62:
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc











.Lfunc_end2:
	.size	LCD_BufferHLine, .Lfunc_end2-LCD_BufferHLine

	.section	.rodata,"a",@progbits
.LJTI2_0:
	.short	.LBB2_13
	.short	.LBB2_17
	.short	.LBB2_21
	.short	.LBB2_14
	.short	.LBB2_24
.LJTI2_1:
	.short	.LBB2_45
	.short	.LBB2_49
	.short	.LBB2_53
	.short	.LBB2_46
	.short	.LBB2_56
.LJTI2_2:
	.short	.LBB2_38
	.short	.LBB2_38
	.short	.LBB2_39
	.short	.LBB2_38
	.short	.LBB2_40

	.text
	.globl	LCD_BufferVLine
	.type	LCD_BufferVLine,@function
	.p2align	2
LCD_BufferVLine :
	push	lr
	push	fp
	push	xr4
	push	r8
	mov	fp, sp
	add	sp, #-26
	mov	r4, r1
	mov	r5, r0
	l	r0, 0x0c[fp]
	l	r1, 0x0d[fp]
	st	r5, -1[fp]
	st	r4, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	st	er0, -6[fp]
	mov	r0, 0x00
	st	r0, -7[fp]
	l	r0, -2[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	cmp	er0, er2
	bles	.LBB3_2
	b	.LBB3_1

.LBB3_1:
	l	r0, -2[fp]
	st	r0, -17[fp]
	l	r0, -3[fp]
	st	r0, -2[fp]
	l	r0, -17[fp]
	st	r0, -3[fp]
	b	.LBB3_2

.LBB3_2:
	l	r0, -3[fp]
	xor	r1, r1
	l	r2, -2[fp]
	xor	r3, r3
	sub	r0, r2
	subc	r1, r3
	add	er0, 0x01
	st	r0, -14[fp]
	l	r2, -1[fp]
	and	r2, 0x07
	mov	r0, #-128
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB3_27
.LBB3_26:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB3_26
.LBB3_27:
	pop	r2
	st	r0, -16[fp]
	b	.LBB3_3

.LBB3_3:
	l	r0, -7[fp]
	xor	r1, r1
	mov	er2, #0
	cmp	er0, er2
	bles	.LBB3_4
	b	.LBB3_25

.LBB3_4:
	l	r0, -2[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er4, er0
	mov	r6, 0x00
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	add	er0, er4
	st	er0, -20[fp]
	st	r2, -18[fp]
	l	r0, -7[fp]
	xor	r1, r1
	mov	r2, #-24
	mov	r3, #5
	bl	__imulu8lw
	mov	er4, er0
	l	er0, -20[fp]
	l	r2, -18[fp]
	mov	r6, #0
	add	er0, er4
	l	r4, -1[fp]
	xor	r5, r5
	xor	r6, r6
	mov	r8, 0x03
	push	r8
	cmp	r8, 0x00
	beq	.LBB3_29
.LBB3_28:
	srlc	r4, 0x01
	srlc	r5, 0x01
	srl	r6, 0x01
	add	r8, 0x0FF
	bne	.LBB3_28
.LBB3_29:
	pop	r8
	add	er0, er4
	st	er0, -12[fp]
	st	r2, -10[fp]
	l	r0, -14[fp]
	st	r0, -15[fp]
	b	.LBB3_5

.LBB3_5:
	l	r0, -15[fp]
	xor	r1, r1
	mov	er2, #1
	cmp	er0, er2
	bges	.LBB3_6
	b	.LBB3_23

.LBB3_6:
	l	er0, -12[fp]
	l	r2, -10[fp]
	l	r0, r2:[er0]
	st	r0, -13[fp]
	l	r0, 0x0fffa[fp]
	l	r1, 0x0fffb[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -24[fp]
	st	r6, -22[fp]
	mov	er2, #4
	cmp	er0, er2
	ble	.LBB3_7
	b	.LBB3_22

.LBB3_7:
	l	er0, -24[fp]
	l	r2, -22[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI3_0[er0]
	b	er0

.LBB3_8:
	l	r0, -16[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB3_9

.LBB3_9:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB3_11
	b	.LBB3_10

.LBB3_10:
	l	r1, -16[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB3_11

.LBB3_11:
	b	.LBB3_22

.LBB3_12:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB3_14
	b	.LBB3_13

.LBB3_13:
	l	r1, -16[fp]
	l	r0, -13[fp]
	or	r0, r1
	st	r0, -13[fp]
	b	.LBB3_15

.LBB3_14:
	l	r0, -16[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB3_15

.LBB3_15:
	b	.LBB3_22

.LBB3_16:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB3_18
	b	.LBB3_17

.LBB3_17:
	l	r0, -16[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -13[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -13[fp]
	b	.LBB3_18

.LBB3_18:
	b	.LBB3_22

.LBB3_19:
	l	r0, -4[fp]
	xor	r1, r1
	mov	er2, #1
	and	r0, r2
	and	r1, r3
	mov	er2, #0
	cmp	er0, er2
	beq	.LBB3_21
	b	.LBB3_20

.LBB3_20:
	l	r1, -16[fp]
	l	r0, -13[fp]
	xor	r0, r1
	st	r0, -13[fp]
	b	.LBB3_21

.LBB3_21:
	b	.LBB3_22

.LBB3_22:
	l	r0, -13[fp]
	l	er4, -12[fp]
	l	r6, -10[fp]
	st	r0, r6:[er4]
	l	er0, -12[fp]
	l	r2, -10[fp]
	mov	er4, #24
	mov	r6, #0
	add	er0, er4
	st	er0, -12[fp]
	st	r2, -10[fp]
	l	r0, -15[fp]
	add	r0, #-1
	st	r0, -15[fp]
	b	.LBB3_5

.LBB3_23:
	b	.LBB3_24

.LBB3_24:
	l	r0, -7[fp]
	add	r0, 0x01
	st	r0, -7[fp]
	b	.LBB3_3

.LBB3_25:
	l	r0, -4[fp]
	xor	r1, r1
	srlc	r0, 0x01
	srl	r1, 0x01
	st	r0, -4[fp]
	mov	sp, fp
	pop	r8
	pop	xr4
	pop	fp
	pop	pc





.Lfunc_end3:
	.size	LCD_BufferVLine, .Lfunc_end3-LCD_BufferVLine

	.section	.rodata,"a",@progbits
.LJTI3_0:
	.short	.LBB3_8
	.short	.LBB3_12
	.short	.LBB3_16
	.short	.LBB3_9
	.short	.LBB3_19

	.text
	.globl	LCD_BufferDrawLine
	.type	LCD_BufferDrawLine,@function
	.p2align	2
LCD_BufferDrawLine :
	push	lr
	push	fp
	push	er4
	mov	fp, sp
	add	sp, #-22
	mov	r4, r0
	l	r0, 8[fp]
	st	r4, -1[fp]
	st	r1, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	st	r0, -5[fp]
	l	r0, -3[fp]
	xor	r1, r1
	l	r2, -1[fp]
	xor	r3, r3
	sub	r0, r2
	subc	r1, r3
	st	er0, -10[fp]
	l	r0, -4[fp]
	xor	r1, r1
	l	r2, -2[fp]
	xor	r3, r3
	sub	r0, r2
	subc	r1, r3
	st	er0, -12[fp]
	mov	er0, #1
	st	er0, -16[fp]
	mov	er0, #0
	st	er0, -18[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	r2, #-1
	mov	r3, #-1
	cmp	er0, er2
	bgts	.LBB4_2
	b	.LBB4_1

.LBB4_1:
	l	r4, 0x0fff6[fp]
	l	r5, 0x0fff7[fp]
	mov	er0, #0
	mov	er2, er0
	sub	r2, r4
	subc	r3, r5
	st	er2, -10[fp]
	l	r2, 0x0fff4[fp]
	l	r3, 0x0fff5[fp]
	sub	r0, r2
	subc	r1, r3
	st	er0, -12[fp]
	l	r0, -1[fp]
	st	r0, -19[fp]
	l	r0, -3[fp]
	st	r0, -1[fp]
	l	r0, -19[fp]
	st	r0, -3[fp]
	l	r0, -2[fp]
	st	r0, -19[fp]
	l	r0, -4[fp]
	st	r0, -2[fp]
	l	r0, -19[fp]
	st	r0, -4[fp]
	b	.LBB4_2

.LBB4_2:
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB4_8
	b	.LBB4_3

.LBB4_3:
	l	r0, -1[fp]
	st	r0, -6[fp]
	b	.LBB4_4

.LBB4_4:
	l	r0, -6[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	cmp	er0, er2
	bgts	.LBB4_7
	b	.LBB4_5

.LBB4_5:
	l	r0, -6[fp]
	l	r1, -2[fp]
	l	r2, -5[fp]
	bl	LCD_BufferSetPix
	b	.LBB4_6

.LBB4_6:
	l	r0, -6[fp]
	add	r0, 0x01
	st	r0, -6[fp]
	b	.LBB4_4

.LBB4_7:
	b	.LBB4_30

.LBB4_8:
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB4_16
	b	.LBB4_9

.LBB4_9:
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	mov	r2, #-1
	mov	r3, #-1
	cmp	er0, er2
	bgts	.LBB4_11
	b	.LBB4_10

.LBB4_10:
	l	r0, -2[fp]
	st	r0, -19[fp]
	l	r0, -4[fp]
	st	r0, -2[fp]
	l	r0, -19[fp]
	st	r0, -4[fp]
	b	.LBB4_11

.LBB4_11:
	l	r0, -2[fp]
	st	r0, -7[fp]
	b	.LBB4_12

.LBB4_12:
	l	r0, -7[fp]
	xor	r1, r1
	l	r2, -4[fp]
	xor	r3, r3
	cmp	er0, er2
	bgts	.LBB4_15
	b	.LBB4_13

.LBB4_13:
	l	r0, -1[fp]
	l	r1, -7[fp]
	l	r2, -5[fp]
	bl	LCD_BufferSetPix
	b	.LBB4_14

.LBB4_14:
	l	r0, -7[fp]
	add	r0, 0x01
	st	r0, -7[fp]
	b	.LBB4_12

.LBB4_15:
	b	.LBB4_30

.LBB4_16:
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	mov	r2, #-1
	mov	r3, #-1
	cmp	er0, er2
	bgts	.LBB4_18
	b	.LBB4_17

.LBB4_17:
	mov	r0, #-1
	mov	r1, #-1
	st	er0, -16[fp]
	l	r2, 0x0fff4[fp]
	l	r3, 0x0fff5[fp]
	mov	er0, #0
	sub	r0, r2
	subc	r1, r3
	st	er0, -12[fp]
	b	.LBB4_18

.LBB4_18:
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	l	r2, 0x0fff6[fp]
	l	r3, 0x0fff7[fp]
	cmp	er0, er2
	bles	.LBB4_20
	b	.LBB4_19

.LBB4_19:
	mov	er0, #1
	st	er0, -18[fp]
	l	r0, -10[fp]
	st	r0, -19[fp]
	l	r0, 0x0fff4[fp]
	l	r1, 0x0fff5[fp]
	st	er0, -10[fp]
	l	r0, -19[fp]
	xor	r1, r1
	st	er0, -12[fp]
	l	r0, -1[fp]
	st	r0, -19[fp]
	l	r0, -2[fp]
	st	r0, -1[fp]
	l	r0, -19[fp]
	st	r0, -2[fp]
	l	r0, -3[fp]
	st	r0, -19[fp]
	l	r0, -4[fp]
	st	r0, -3[fp]
	l	r0, -19[fp]
	st	r0, -4[fp]
	b	.LBB4_20

.LBB4_20:
	l	r0, -1[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	cmp	er0, er2
	bles	.LBB4_22
	b	.LBB4_21

.LBB4_21:
	l	r0, -1[fp]
	st	r0, -19[fp]
	l	r0, -3[fp]
	st	r0, -1[fp]
	l	r0, -19[fp]
	st	r0, -3[fp]
	l	r0, -2[fp]
	st	r0, -19[fp]
	l	r0, -4[fp]
	st	r0, -2[fp]
	l	r0, -19[fp]
	st	r0, -4[fp]
	b	.LBB4_22

.LBB4_22:
	l	r0, -1[fp]
	st	r0, -6[fp]
	l	r0, -2[fp]
	st	r0, -7[fp]
	l	r2, 0x0fff6[fp]
	l	r3, 0x0fff7[fp]
	mov	er0, #0
	sub	r0, r2
	subc	r1, r3
	st	er0, -14[fp]
	b	.LBB4_23

.LBB4_23:
	l	r0, -6[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	cmp	er0, er2
	bles	.LBB4_24
	b	.LBB4_30

.LBB4_24:
	l	r0, 0x0ffee[fp]
	l	r1, 0x0ffef[fp]
	mov	er2, #0
	cmp	er0, er2
	bne	.LBB4_26
	b	.LBB4_25

.LBB4_25:
	l	r0, -6[fp]
	l	r1, -7[fp]
	l	r2, -5[fp]
	bl	LCD_BufferSetPix
	b	.LBB4_27

.LBB4_26:
	l	r0, -7[fp]
	l	r1, -6[fp]
	l	r2, -5[fp]
	bl	LCD_BufferSetPix
	b	.LBB4_27

.LBB4_27:
	l	r0, -6[fp]
	add	r0, 0x01
	st	r0, -6[fp]
	l	r2, 0x0fff4[fp]
	l	r3, 0x0fff5[fp]
	sllc	r3, 0x01
	sll	r2, 0x01
	l	r0, 0x0fff2[fp]
	l	r1, 0x0fff3[fp]
	add	er0, er2
	st	er0, -14[fp]
	l	r0, 0x0fff2[fp]
	l	r1, 0x0fff3[fp]
	mov	er2, #1
	cmp	er0, er2
	blts	.LBB4_29
	b	.LBB4_28

.LBB4_28:
	l	r2, 0x0fff0[fp]
	l	r3, 0x0fff1[fp]
	l	r0, -7[fp]
	xor	r1, r1
	add	er0, er2
	st	r0, -7[fp]
	l	r2, 0x0fff6[fp]
	l	r3, 0x0fff7[fp]
	sllc	r3, 0x01
	sll	r2, 0x01
	l	r0, 0x0fff2[fp]
	l	r1, 0x0fff3[fp]
	sub	r0, r2
	subc	r1, r3
	st	er0, -14[fp]
	b	.LBB4_29

.LBB4_29:
	b	.LBB4_23

.LBB4_30:
	mov	sp, fp
	pop	er4
	pop	fp
	pop	pc

.Lfunc_end4:
	.size	LCD_BufferDrawLine, .Lfunc_end4-LCD_BufferDrawLine

	.globl	LCD_BufferPutSprite
	.type	LCD_BufferPutSprite,@function
	.p2align	2
LCD_BufferPutSprite :
	push	lr
	push	fp
	push	xr8
	push	xr4
	mov	fp, sp
	add	sp, #-52
	mov	r8, r1
	mov	r9, r0
	l	r0, 0x012[fp]
	l	r1, 0x013[fp]
	l	er4, 14[fp]
	l	r6, 16[fp]
	st	r9, -1[fp]
	st	r8, -2[fp]
	st	r2, -3[fp]
	st	r3, -4[fp]
	st	er4, -8[fp]
	st	r6, -6[fp]
	st	er0, -10[fp]
	mov	r0, 0x00
	st	r0, -11[fp]
	mov	er0, #0
	st	er0, -26[fp]
	l	r0, -1[fp]
	xor	r1, r1
	mov	er2, #7
	and	r0, r2
	and	r1, r3
	st	r0, -31[fp]
	l	r0, -31[fp]
	xor	r1, r1
	l	r2, -3[fp]
	xor	r3, r3
	add	er0, er2
	mov	er2, #8
	cmp	er0, er2
	bgts	.LBB5_2
	b	.LBB5_1

.LBB5_1:
	l	r0, -3[fp]
	st	r0, -27[fp]
	l	r0, -3[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	mov	r2, r0
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_50
.LBB5_49:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r2, 0x0FF
	bne	.LBB5_49
.LBB5_50:
	pop	r2
	st	r0, -29[fp]
	l	r2, -31[fp]
	l	r0, -29[fp]
	xor	r1, r1
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_52
.LBB5_51:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB5_51
.LBB5_52:
	pop	r2
	st	r0, -29[fp]
	b	.LBB5_6

.LBB5_2:
	l	r0, -31[fp]
	cmp	r0, 0x00
	beq	.LBB5_4
	b	.LBB5_3

.LBB5_3:
	l	r0, -31[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	st	r0, -27[fp]
	l	r2, -31[fp]
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_54
.LBB5_53:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB5_53
.LBB5_54:
	pop	r2
	st	r0, -29[fp]
	b	.LBB5_5

.LBB5_4:
	mov	r0, 0x00
	st	r0, -27[fp]
	st	r0, -29[fp]
	b	.LBB5_5

.LBB5_5:
	b	.LBB5_6

.LBB5_6:
	l	r2, -1[fp]
	mov	r0, r2
	l	r4, -3[fp]
	mov	r2, r4
	add	er0, er2
	mov	er2, #7
	and	r0, r2
	and	r1, r3
	st	r0, -28[fp]
	l	r0, -28[fp]
	mov	r2, r0
	xor	r3, r3
	mov	er0, #8
	sub	r0, r2
	subc	r1, r3
	mov	r2, r0
	mov	r0, #-1
	mov	r1, #0
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_56
.LBB5_55:
	sllc	r1, 0x01
	sll	r0, 0x01
	add	r2, 0x0FF
	bne	.LBB5_55
.LBB5_56:
	pop	r2
	st	r0, -30[fp]
	b	.LBB5_7

.LBB5_7:
	l	r0, -11[fp]
	xor	r1, r1
	mov	er2, #0
	cmp	er0, er2
	bles	.LBB5_8
	b	.LBB5_48

.LBB5_8:
	l	r0, -2[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er4, er0
	mov	r6, 0x00
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	add	er0, er4
	st	er0, -34[fp]
	st	r2, -32[fp]
	l	r0, -11[fp]
	xor	r1, r1
	mov	r2, #-24
	mov	r3, #5
	bl	__imulu8lw
	mov	er4, er0
	l	er0, -34[fp]
	l	r2, -32[fp]
	mov	r6, #0
	add	er0, er4
	l	r4, -1[fp]
	xor	r5, r5
	xor	r6, r6
	mov	r8, 0x03
	push	r8
	cmp	r8, 0x00
	beq	.LBB5_58
.LBB5_57:
	srlc	r4, 0x01
	srlc	r5, 0x01
	srl	r6, 0x01
	add	r8, 0x0FF
	bne	.LBB5_57
.LBB5_58:
	pop	r8
	add	er0, er4
	st	er0, -22[fp]
	st	r2, -20[fp]
	mov	r0, 0x00
	st	r0, -13[fp]
	b	.LBB5_9

.LBB5_9:
	l	r0, -13[fp]
	xor	r1, r1
	l	r2, -4[fp]
	xor	r3, r3
	cmp	er0, er2
	blts	.LBB5_10
	b	.LBB5_46

.LBB5_10:
	l	er0, -22[fp]
	l	r2, -20[fp]
	st	er0, -38[fp]
	st	r2, -36[fp]
	l	r0, -13[fp]
	xor	r1, r1
	mov	er2, #24
	bl	__imulu8lw
	mov	er4, er0
	l	er0, -38[fp]
	l	r2, -36[fp]
	mov	er4, er4
	mov	r6, 0x00
	add	er0, er4
	st	er0, -18[fp]
	st	r2, -16[fp]
	l	r0, -3[fp]
	st	r0, -12[fp]
	l	r0, -27[fp]
	cmp	r0, 0x00
	bne	.LBB5_13
	b	.LBB5_11

.LBB5_11:
	l	r0, -27[fp]
	cmp	r0, 0x00
	beq	.LBB5_12
	b	.LBB5_23

.LBB5_12:
	l	r0, -3[fp]
	xor	r1, r1
	mov	er2, #7
	cmp	er0, er2
	bles	.LBB5_13
	b	.LBB5_23

.LBB5_13:
	l	er0, -8[fp]
	l	r2, -6[fp]
	mov	er8, #1
	mov	r10, #0
	mov	er4, er0
	mov	er6, er2
	add	er4, er8
	st	er4, -8[fp]
	st	r6, -6[fp]
	l	r0, r2:[er0]
	xor	r1, r1
	st	er0, -26[fp]
	l	er0, -18[fp]
	l	r2, -16[fp]
	l	r0, r2:[er0]
	st	r0, -23[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r2, -31[fp]
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_60
.LBB5_59:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB5_59
.LBB5_60:
	pop	r2
	st	r0, -24[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -42[fp]
	st	r6, -40[fp]
	mov	er2, #4
	cmp	er0, er2
	ble	.LBB5_14
	b	.LBB5_20

.LBB5_14:
	l	er0, -42[fp]
	l	r2, -40[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI5_0[er0]
	b	er0

.LBB5_15:
	l	r0, -24[fp]
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #0
	xor	r0, r2
	xor	r1, r3
	st	r0, -24[fp]
	b	.LBB5_16

.LBB5_16:
	l	r0, -29[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -23[fp]
	b	.LBB5_17

.LBB5_17:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -29[fp]
	xor	r1, r1
	and	r2, r0
	and	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	or	r0, r2
	or	r1, r3
	st	r0, -23[fp]
	b	.LBB5_20

.LBB5_18:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -29[fp]
	xor	r1, r1
	mov	r4, #-1
	mov	r5, #-1
	xor	r0, r4
	xor	r1, r5
	or	r2, r0
	or	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -23[fp]
	b	.LBB5_20

.LBB5_19:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -29[fp]
	xor	r1, r1
	and	r2, r0
	and	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	xor	r0, r2
	xor	r1, r3
	st	r0, -23[fp]
	b	.LBB5_20

.LBB5_20:
	l	r0, -23[fp]
	st	r0, -43[fp]
	l	er4, -18[fp]
	l	r6, -16[fp]
	mov	er0, #1
	mov	r2, #0
	mov	er8, er4
	mov	er10, er6
	add	er8, er0
	l	r0, -43[fp]
	st	er8, -18[fp]
	st	r10, -16[fp]
	st	r0, r6:[er4]
	l	r0, -27[fp]
	mov	r2, r0
	xor	r3, r3
	l	r0, -12[fp]
	xor	r1, r1
	sub	r0, r2
	subc	r1, r3
	st	r0, -12[fp]
	l	r0, -12[fp]
	cmp	r0, 0x00
	bne	.LBB5_22
	b	.LBB5_21

.LBB5_21:
	b	.LBB5_45

.LBB5_22:
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	mov	r1, r0
	mov	r0, 0x00
	st	er0, -26[fp]
	b	.LBB5_23

.LBB5_23:
	b	.LBB5_24

.LBB5_24:
	l	r0, -12[fp]
	xor	r1, r1
	mov	er2, #8
	cmp	er0, er2
	bges	.LBB5_25
	b	.LBB5_33

.LBB5_25:
	l	er0, -8[fp]
	l	r2, -6[fp]
	mov	er8, #1
	mov	r10, #0
	mov	er4, er0
	mov	er6, er2
	add	er4, er8
	st	er4, -8[fp]
	st	r6, -6[fp]
	l	r0, r2:[er0]
	mov	r2, r0
	xor	r3, r3
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	or	r0, r2
	or	r1, r3
	st	er0, -26[fp]
	l	er0, -18[fp]
	l	r2, -16[fp]
	l	r0, r2:[er0]
	st	r0, -23[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r2, -31[fp]
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_62
.LBB5_61:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB5_61
.LBB5_62:
	pop	r2
	st	r0, -24[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -46[fp]
	st	r6, -44[fp]
	mov	er2, #4
	cmp	er0, er2
	bgt	.LBB5_32

.LBB5_26:
	l	er0, -46[fp]
	l	r2, -44[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI5_2[er0]
	b	er0

.LBB5_27:
	l	r0, -24[fp]
	st	r0, -23[fp]
	b	.LBB5_32

.LBB5_28:
	l	r1, -24[fp]
	l	r0, -23[fp]
	or	r0, r1
	st	r0, -23[fp]
	b	.LBB5_32

.LBB5_29:
	l	r0, -24[fp]
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #-1
	xor	r0, r2
	xor	r1, r3
	st	r0, -23[fp]
	b	.LBB5_32

.LBB5_30:
	l	r1, -24[fp]
	l	r0, -23[fp]
	and	r0, r1
	st	r0, -23[fp]
	b	.LBB5_32

.LBB5_31:
	l	r1, -24[fp]
	l	r0, -23[fp]
	xor	r0, r1
	st	r0, -23[fp]
	b	.LBB5_32

.LBB5_32:
	l	r0, -23[fp]
	st	r0, -47[fp]
	l	er4, -18[fp]
	l	r6, -16[fp]
	mov	er0, #1
	mov	r2, #0
	mov	er8, er4
	mov	er10, er6
	add	er8, er0
	l	r0, -47[fp]
	st	er8, -18[fp]
	st	r10, -16[fp]
	st	r0, r6:[er4]
	l	r0, -12[fp]
	xor	r1, r1
	mov	r2, #-8
	mov	r3, #-1
	add	er0, er2
	st	r0, -12[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	mov	r1, r0
	mov	r0, 0x00
	st	er0, -26[fp]
	b	.LBB5_24

.LBB5_33:
	l	r0, -12[fp]
	cmp	r0, 0x00
	bne	.LBB5_34
	b	.LBB5_44

.LBB5_34:
	l	r0, -12[fp]
	xor	r1, r1
	l	r2, -28[fp]
	xor	r3, r3
	cmp	er0, er2
	bges	.LBB5_36
	b	.LBB5_35

.LBB5_35:
	l	er0, -8[fp]
	l	r2, -6[fp]
	mov	er8, #1
	mov	r10, #0
	mov	er4, er0
	mov	er6, er2
	add	er4, er8
	st	er4, -8[fp]
	st	r6, -6[fp]
	l	r0, r2:[er0]
	mov	r2, r0
	xor	r3, r3
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	or	r0, r2
	or	r1, r3
	st	er0, -26[fp]
	b	.LBB5_36

.LBB5_36:
	l	er0, -18[fp]
	l	r2, -16[fp]
	l	r0, r2:[er0]
	st	r0, -23[fp]
	l	r0, 0x0ffe6[fp]
	l	r1, 0x0ffe7[fp]
	l	r2, -31[fp]
	push	r2
	cmp	r2, 0x00
	beq	.LBB5_64
.LBB5_63:
	srlc	r0, 0x01
	srl	r1, 0x01
	add	r2, 0x0FF
	bne	.LBB5_63
.LBB5_64:
	pop	r2
	st	r0, -24[fp]
	l	r0, 0x0fff6[fp]
	l	r1, 0x0fff7[fp]
	mov	er4, er0
	mov	r6, 0x00
	st	er4, -50[fp]
	st	r6, -48[fp]
	mov	er2, #4
	cmp	er0, er2
	ble	.LBB5_37
	b	.LBB5_43

.LBB5_37:
	l	er0, -50[fp]
	l	r2, -48[fp]
	sllc	r1, 0x01
	sll	r0, 0x01
	l	er0, FAR .LJTI5_1[er0]
	b	er0

.LBB5_38:
	l	r0, -24[fp]
	xor	r1, r1
	mov	r2, #-1
	mov	r3, #0
	xor	r0, r2
	xor	r1, r3
	st	r0, -24[fp]
	b	.LBB5_39

.LBB5_39:
	l	r0, -30[fp]
	mov	r2, r0
	xor	r3, r3
	mov	r0, #-1
	mov	r1, #-1
	xor	r2, r0
	xor	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -23[fp]
	b	.LBB5_40

.LBB5_40:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -30[fp]
	xor	r1, r1
	and	r2, r0
	and	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	or	r0, r2
	or	r1, r3
	st	r0, -23[fp]
	b	.LBB5_43

.LBB5_41:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -30[fp]
	xor	r1, r1
	mov	r4, #-1
	mov	r5, #-1
	xor	r0, r4
	xor	r1, r5
	or	r2, r0
	or	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	and	r0, r2
	and	r1, r3
	st	r0, -23[fp]
	b	.LBB5_43

.LBB5_42:
	l	r0, -24[fp]
	mov	r2, r0
	l	r0, -30[fp]
	xor	r1, r1
	and	r2, r0
	and	r3, r1
	l	r0, -23[fp]
	xor	r1, r1
	xor	r0, r2
	xor	r1, r3
	st	r0, -23[fp]
	b	.LBB5_43

.LBB5_43:
	l	r0, -23[fp]
	l	er4, -18[fp]
	l	r6, -16[fp]
	st	r0, r6:[er4]
	b	.LBB5_44

.LBB5_44:
	b	.LBB5_45

.LBB5_45:
	l	r0, -13[fp]
	add	r0, 0x01
	st	r0, -13[fp]
	b	.LBB5_9

.LBB5_46:
	b	.LBB5_47

.LBB5_47:
	l	r0, -11[fp]
	add	r0, 0x01
	st	r0, -11[fp]
	b	.LBB5_7

.LBB5_48:
	mov	sp, fp
	pop	xr4
	pop	xr8
	pop	fp
	pop	pc

















.Lfunc_end5:
	.size	LCD_BufferPutSprite, .Lfunc_end5-LCD_BufferPutSprite

	.section	.rodata,"a",@progbits
.LJTI5_0:
	.short	.LBB5_16
	.short	.LBB5_15
	.short	.LBB5_18
	.short	.LBB5_17
	.short	.LBB5_19
.LJTI5_1:
	.short	.LBB5_39
	.short	.LBB5_38
	.short	.LBB5_41
	.short	.LBB5_40
	.short	.LBB5_42
.LJTI5_2:
	.short	.LBB5_27
	.short	.LBB5_29
	.short	.LBB5_30
	.short	.LBB5_28
	.short	.LBB5_31

	.text
	.globl	LCD_BufferClear
	.type	LCD_BufferClear,@function
	.p2align	2
LCD_BufferClear :
	push	lr
	mov	r0, #-24
	mov	r1, #5
	push	er0
	mov	er0, #0
	push	er0
	mov	r0, #-44
	mov	r1, #-35
	mov	r2, #0
	bl	memset_f
	add	sp, 0x04
	pop	pc

.Lfunc_end6:
	.size	LCD_BufferClear, .Lfunc_end6-LCD_BufferClear


	.ident	"clang version 1.30"

