; Affichage de la plus grande de deux valeurs

        DECI    nb1, d          ; Lecture du premier entier
        DECI    nb2, d          ; Lecture du deuxieme entier

; if (nb1 < nb2)
if:     LDA     nb1, d
        SUBA    nb2, d
        BRLT    nb2_in          ; La valeur est sous 0 donc nb1 < nb2
        BR      nb1_in          ; La valeur est toujours positive donc nb1 > nb2

nb1_in: DECO    nb1, d
        BR      fin

nb2_in: DECO    nb2, d
        BR      fin

fin: STOP

nb1:     .WORD   0
nb2:     .WORD   0
.END
