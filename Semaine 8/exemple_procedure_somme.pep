; Empiler les parametres locaux/effectifs
a:      .EQUATE 10
b:      .EQUATE 20

main:   SUBSP   2       , i
        LDA     20      , i
        STA     0       , s

        SUBSP   2       , i
        LDA     10      , i
        STA     0       , s

        ; Empiler l'adresse de retour
        CALL    somme

        ; Depiler la memoire locale
        ADDSP   4       , i

STOP

; Variable locales de somme
a_:     .EQUATE 4
b_:     .EQUATE 6
c:      .EQUATE 0

somme:  SUBSP   2       , i     ; Empiler variable locale c = a + b
        LDA     a_      , s     ; Charger dans l'accumulateur
        ADDA    b_      , s     ; Additionner b
        STA     c       , s     ; Ranger c
        DECO    c       , s     ; Afficher c
        ADDSP   2       , i     ; Depiler la memoire locale
        RET0

.END
