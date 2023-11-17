
main:   SUBSP   2       , i     ; int a = 10
        LDA     10      , i
        STA     0       , s

        SUBSP   2       , i     ; int b = 20
        LDA     20      , i
        STA     0       , s

        ; Empiler la valeur de retour (reserver un espace pour le resultat du call)
        SUBSP   2       , i

        ; Adresse de retour
        CALL    somme

        DECO    0       , s     ; Afficher la valeur retournee

        ADDSP   6       , i     ; Liberer la memoire locale

STOP

somme:  LDA     6       , s     ; Charger `a` dans l'accmuluateur
        ADDA    4       , s     ; Additionner `b`
        STA     2       , s     ; Retourner
        RET0

.END
