        LDA     100, i
        STA     a_ptr, n
        LDA     200, i
        STA     b_ptr, n

        DECO    a_ptr, n
        CHARO   '\n', i
        DECO    b_ptr, n
        CHARO   '\n', i

        ; temp = a
        LDA     a_ptr, n
        STA     temp, d

        ; a = b
        LDA     b_ptr, n
        STA     a_ptr, n

        ; b = temp
        LDA     temp, d
        STA     b_ptr, n

        DECO    a_ptr, n
        CHARO   '\n', i
        DECO    b_ptr, n
        CHARO   '\n', i

STOP
a_ptr:  .WORD   0x0040 
b_ptr:  .WORD   0x0042
temp:   .WORD   0
.END
