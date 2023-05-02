; Converts a 16-bit unsigned integer to an ASCII hexadecimal string.
; Taken and adapted from https://map.grauw.nl/sources/external/z80bits.html#5.2

_uitoa_b16::
; Input:
;    arg1 the number to convert
;    arg2 points to where to write the ASCII string (up to 5 bytes needed).
; Output:
;    return points to the null-terminated ASCII string
;    NOTE: This isn't necessarily the same as the input

    ld hl, #2
    add hl, sp

    ld e, (hl)
    inc hl
    ld d, (hl)           ; de <- number
    inc hl
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a             ; hl <- ascii string
    push hl             ; save initial string position

    ld a, d
    call shift_and_convert
    ld a, d
    call to_char
    ld a, e
    call shift_and_convert
    ld a, e
    call to_char
    ld (hl), #0         ; make sure it is zero-terminated

    ; strip leading zeros
    pop hl
    ld a, #'0'
loop_leading_zeros:
    inc hl 
    cp (hl)
    jr z, loop_leading_zeros
    
    ; make sure that the string is non-empty!
    xor a 
    cp (hl)
    ret nz
    dec hl
    ret

shift_and_convert:
    rra
    rra
    rra
    rra

to_char:
    or #0xf0
    daa
    add a, #0xa0
    adc a, #0x40

    ld (hl), a
    inc hl

    ret
