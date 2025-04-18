	type (ML620906) 
	model large, far
; Copy a screenful of data from ER0 to VRAM
; Uses SP as source pointer (Thanks telecomadm1145)
; In:
;    ER0 - src
; Out: None
; Destroys:
;    EA, ER2
; Notes:
;    Written for CWI (the size is hard-coded to be 192/8*64)
;    This code spends 2140 +15 +9 = 2164 cycles to finish.
;    Interrupts are disabled during execution.
_FastRender:
    push    qr8        ; 4
    push    er4        ; 1
    mov    r2,    #20h    ; 1
    mov    r3,    #0F8h    ; 1
    lea    [er2]        ; 1

    mov    er4,    sp    ; 1    ; backup SP
    mov    r3,    psw    ; 1    ; backup PSW
    di            ; 3
    mov    sp,    er0    ; 1    ; source loaded to SP

    mov    r2,    #63    ; 1    ; row counter

; Each iteration: 4*7+2+1+3=34 cycles
; Total: 63*34-2 = 2140 cycles
_loop:
    pop    qr8        ; 4
    st    qr8,    [ea+]    ; 4
    pop    qr8        ; 4+1
    st    qr8,    [ea+]    ; 4
    pop    qr8        ; 4+1
    st    qr8,    [ea+]    ; 4
    st    qr8,    [ea+]    ; 4    ; 8-byte padding

    add    r2,    #0FFh    ; 1
    bc    nz,    _loop    ; 3(taken)/1(fall)

    mov    psw,    r3    ; 1    ; restore PSW (0)
    mov    sp,    er4    ; 1    ; restore SP (1)

    pop    er4        ; 1    ; (2)
    pop    qr8        ; 4
    rt            ; 2

    public   _FastRender
