
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

