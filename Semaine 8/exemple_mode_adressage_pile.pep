; Exemples sur les modes d'adressage sur la pile (slide 7)

        ; Tasser le pointeur de pile vers 0xFBCE
        SUBSP   1       , i

        ; Mettre 20 @ 0xFBCA
        LDA     20      , i
        STA     0xFBCA  , d

        ; Stocker 10 en qqpart
        LDA     10      , i
        STA     0x0100  , d

        ; Stocker l'adresse qui contient 10 @ 0xFBCE
        LDA     0x0100  , i
        STA     -1      , sx

        ; Stocker 30, 40, 50 en qqpart
        LDA     30      , i
        STA     0x0120  , d
        LDA     40      , i
        STA     0x0122  , d
        LDA     50      , i
        STA     0x0124  , d

        ; Stocker l'dresse de 30, 40, 50 @ 0xFBC8
        LDA     0x0120  , i
        STA     -6      , s

        ; Stocker 60 en haut de la pile
        LDA     60      , i
        STA     -16     , sx

        DECO    -4      , s
        CHARO   10      , i
        DECO    -1      , sf
        CHARO   10      , i
        LDX     4       , i
        DECO    -6      , sxf
        CHARO   10      , i
        LDX     -6      , i
        DECO    -10     , sx

STOP
.END
