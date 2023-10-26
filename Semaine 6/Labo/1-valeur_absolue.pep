        DECI    nb, d           ; Lecture d'un entier

; if (nb < 0)
if:     LDA     nb, d           ; Chargement dans l'accumulateur (c'est la meme chose que de le comparer a 0).
        BRLT    succes          ; Branch-out quand la valeur est negative.

        BR      fin             ; Skip l'action quand la valeur est positive.


succes: NEGA                    ; Transmformation de la valeur negative
        STA     nb, d
        BR      fin


fin:    DECO    nb, d           ; Affichage du resultat
        STOP

nb:     .WORD   0
.END
