;; Compile Options : 
;; Version Number  : Ver.1.30.0
;; File Name       : main.cpp

	type (ML620906) 
	model large, far
	$$main$main segment code 2h any
	STACKSEG 0400h
CVERSION 1.30.0

	rseg $$main$main                        ;; -- Begin function main
_main :
;; %bb.0:
	mov	fp, sp
	add	sp, #-8
	mov	er0, #0
	st	er0, -2[fp]
	st	er0, -4[fp]
	b	$$BB0_1

$$BB0_1:
	l	r0, 0fffch[fp]
	l	r1, 0fffdh[fp]
	mov	r2, #-1
	mov	r3, #7
	cmp	er0, er2
	bgt	$$BB0_4
	b	$$BB0_2

$$BB0_2:
	l	r2, 0fffch[fp]
	l	r3, 0fffdh[fp]
	mov	r0, #0
	mov	r1, #-8
	add	er0, er2
	mov	er4, er0
	mov	r6, #00h
	mov	er0, #0
	st	er0, r6:[er4]
	b	$$BB0_3

$$BB0_3:
	l	r0, 0fffch[fp]
	l	r1, 0fffdh[fp]
	add	er0, #01h
	st	er0, -4[fp]
	b	$$BB0_1

$$BB0_4:
	mov	er0, #0
	st	er0, -6[fp]
	b	$$BB0_5

$$BB0_5:
	l	r0, 0fffah[fp]
	l	r1, 0fffbh[fp]
	mov	r2, #-1
	mov	r3, #30
	cmp	er0, er2
	bgt	$$BB0_8
	b	$$BB0_6

$$BB0_6:
	l	r2, 0fffah[fp]
	l	r3, 0fffbh[fp]
	mov	r0, #0
	mov	r1, #-48
	add	er0, er2
	mov	er4, er0
	mov	r6, #00h
	mov	er0, #0
	st	er0, r6:[er4]
	b	$$BB0_7

$$BB0_7:
	l	r0, 0fffah[fp]
	l	r1, 0fffbh[fp]
	add	er0, #01h
	st	er0, -6[fp]
	b	$$BB0_5

$$BB0_8:
	b	$$BB0_9

$$BB0_9:
	mov	r0, #0
	mov	r1, #-40
	bl	_FastRender
	b	$$BB0_9

_$$end_of_main :
	bal	$


                                        ;; -- End function

	public _main

	extrn code far : _FastRender
	extrn code : $$start_up

	cseg #00h at 02h
	dw	$$start_up



	end
