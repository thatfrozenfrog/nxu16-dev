        .ident "TYPE:"

        .ident "CODE:large"   
        .globl   get_keycode_fixed
        .type    get_keycode_fixed,@function



get_keycode_fixed:
    push lr
;    bl __regpushu8lw
    mov	er8, er0
    mov	r4,	#0x01
    mov	r1,	#0x01
    mov	r3,	#0x01
_get_key_loop:
    st	r1,	0xF046
    mov	r2,	#0x00
    l	r0,	0xF040
    st	r2,	0xF046
    mov	r2,	r0
    cmp	r0,	#0xFF
    beq	_$continue
    st	r1,	1[er8]
    xor	r0,	#0xFF
    st	r0,	[er8]
    bal	_$get_key_ret
_$continue:
    sll	r1,	#0x01
    add	r3,	#0x01
    cmp	r3,	#0x07
    ble	_get_key_loop
    mov	r4,	#0x00
_$get_key_ret:
    bl zero_KO
    mov	r0,	r4
    ;bl	__regpopu8lw

    pop pc


zero_KO:
    mov r2, #0x00
    st r2, 0xF046
    rt