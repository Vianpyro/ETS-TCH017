; Comparaison de deux valeurs

        DECI    nb1, d          ; Lecture du premier entier
        DECI    nb2, d          ; Lecture du deuxieme entier

if:     LDA     nb1, d          ; Charement de la premiere valeur
        SUBA    nb2, d          ; nb1 - nb2
        BREQ    egal            ; nb1 == nb2
        BRLT    moins           ; nb1 < nb2
        BR      plus            ; else

egal:   STRO    msg_e, d
        BR      fin

plus:   STRO    msg_p, d
        BR      fin

moins:  STRO    msg_m, d
        BR      fin

fin:    STOP

nb1:    .WORD   0
nb2:    .WORD   0
msg_e:  .ASCII "Les deux valeurs sont egales!\n\x00"
msg_p:  .ASCII "La premiere valeur est plus grande que la deuxieme!\n\x00"
msg_m:  .ASCII "La premiere valeur est plus petite que la deuxieme!\n\x00"
.END
