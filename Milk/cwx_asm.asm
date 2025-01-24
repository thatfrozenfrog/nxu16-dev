
        .ident "TYPE:"

        .ident "CODE:large"   
        .globl render_ddd4
        .type render_ddd4,@function
        .globl sprite8
        .type sprite8,@function

render_ddd4:
    push lr
    push xr4
    push qr8
    st r0, 0xD180
    st r1, 0xD181
    push er0
    mov r2, #0x00
    mov r3, #0xf8
    mov r0, #0x40

.l_012:
    pop ea
    l xr4, [EA+]
    l qr8, [EA+]
    push ea

    lea [er2]
    st xr4, [ea+]
    st qr8, [ea+]
    add er2, #0x0C

    pop ea
    l xr4, [EA+]
    l qr8, [EA+]
    push ea

    lea [er2]
    st xr4, [ea+]
    st qr8, [ea+]

    add er2, #0x14
    add r0, #-1
    bne .l_012

    pop er0
    pop qr8
    pop xr4
    pop pc



; void sprite8(u8 x, u8 y, const u8 mode, u8 seg, u16 addr)
; follows CCU8 calling convention, safe to export as C function
; R0 - x
; R1 - y
; R2 - mode (only 2 LSb matters: 0-3 = or, xor, set, inverse)
; R3 - sprite segment
; [SP].w - sprite address

; constants:
LCDBUF = 0xF820
BUF_W = (192/8)  ; ceiling(LCD width / 8)
SPRITE_H = 8  ; 0 means 256-pixel high

; register allocation:
; R0: LCD buffer
; R1: sprite data
; R2: mode
; R3: mask
; XR4: (unmodified)
; R8: segment
; R9: loop counter
; R10: shift counter
; R11: (unused)
; ER12/BP: (buffer) base pointer
; ER14/FP: sprite shifter

sprite8:
  push lr
  push qr8
  mov fp, sp
  l bp, +0x0C[fp]
  lea [bp]  ; sprite pointer in EA
  mov r12, #BYTE1 LCDBUF
  mov r13, #BYTE2 LCDBUF
  mov r14, BUF_W
  ;mul er14, r1
  .word 0xFE14 ; mul er14, r1
  add bp, fp  ; BP = BASE + BUF_W * y
  mov r10, r0  ; backup x for shift counter
  srl r0, 3  ; x/8
  add r12, r0
  addc r13, 0x00  ; base pointer done
  and r10, 0x07  ; shift counter done
  mov r8, r3  ; segment done
  mov r3, 0xff
  srl r3, r10
  xor r3, 0xff  ; left data mask (1 bit = preserved buffer data)
  mov r9, SPRITE_H
.loop:
  //l r15, r8:[ea+]  ; read sprite
  l r15, [ea+]
  mov r14, 0x00
  srlc r14, r10
  srl r15, r10  ; shift sprite
  l r0, [bp]
  mov r1, r15
  bl putByte
  st r0, [bp]  ; first byte done
  mov r10, r10
  beq .skip  ; skip if aligned
  l r0, [bp+1]
  mov r1, r14
  bl putByte
  st r0, [bp+1]
.back:
  add bp, BUF_W
  add r9, 0xff
  bne .loop
  pop qr8
  pop pc
.skip:
  xor r3, 0xff  ; restore mask
  bal .back

; u8 putByte(u8 data, u8 sprite, const u8 mode, u8 mask)
; follows CCU8 calling convention, but not recommended to call this
putByte:
  tb r2, 1
  beq .nomask
  and r0, r3  ; else mask data
  xor r3, 0xff  ; prepare the sprite mask
  tb r2, 0
  beq .noinv
  xor r1, 0xff  ; invert sprite data
  and r1, r3

.noinv:
.or:
  or r0, r1
  rt
.nomask:
  tb r2, 0
  beq .or
  xor r0, r1
  rt