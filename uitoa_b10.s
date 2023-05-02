; Converts a 16-bit unsigned integer to an ASCII string.

_uitoa_b10::
; Input:
;    arg1 the number to convert
;    arg2 points to where to write the ASCII string (up to 6 bytes needed).
; Output:
;    return points to the null-terminated ASCII string
;    NOTE: This isn't necessarily the same as the input

    ld hl, #2
    add hl, sp

    ld e, (hl)
    inc hl
    ld d, (hl)
    inc hl
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a

uitoa_b10_naked::
    ex de, hl            ; de <- ascii string, hl <- number

    ; 1st digit
    ld bc, #-10000
    ld a, #'0'-1
tenthousands:
    inc a
    add hl, bc
    jr c, tenthousands
    ld (de), a
    inc de

    ; 2nd digit
    ld bc, #1000
    ld a, #'9'+1
thousands:
    dec a
    add hl, bc
    jr nc, thousands
    ld (de), a
    inc de

    ; 3rd digit
    ld bc, #-100
    ld a, #'0'-1
hundreds:
    inc a
    add hl, bc
    jr c, hundreds
    ld (de), a
    inc de

    ; 4th digit, remainder is 5th digit
    ld a, l
    ld h, #'9'+1
tens:
    dec h
    add a, #10
    jr nc, tens
    add a, #'0'
    ex de, hl
    ld (hl), d
    inc hl
    ld (hl), a
    inc hl
    ld (hl), #0            ; zero terminated

    ; strip leading zeros
    ld c, #-6
    add hl, bc
    ld a, #'0'
leading_zeros:
    inc hl
    cp (hl)
    jr z, leading_zeros

    ; make sure that the string is non-empty!
    xor a
    cp (hl)
    ret nz
    dec hl

    ret
