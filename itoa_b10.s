;Converts a 16-bit signed integer to an ASCII string.
.globl uitoa_b10_naked

_itoa_b10::
;Input:
;   arg1 is the number to convert
;   arg2 points to where to write the ASCII string (up to 7 bytes needed).
;Output:
;   return points to the null-terminated ASCII string
;   NOTE: This isn't necessarily the same as arg2

    ld hl, #2
    add hl, sp

    ld e, (hl)
    inc hl
    ld d, (hl)           ; de <- number
    inc hl
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a              ; hl <- ascii string

    ld a, d
    add a, a
    jp nc, uitoa_b10_naked
    xor a
    sub e
    ld e, a
    sbc a, a
    sub d
    ld d, a
    inc hl  ; make space for a negative sign

    call uitoa_b10_naked
    dec hl
    ld (hl), #'-'

    ret
