; Affichage des nombres pairs entre 0 et une limite donnee

        DECI    limite  , d     ; Sauvegarde de la limite
        DECO    0       , i     ; Affichage du 0 (sans espace avant)

for:    LDA     iter    , d     ; Chargement de l'iterateur
        CPA     limite  , d     ; Comparaison avec la limite
        BRGT    endfor          ; Si la limite est depassee aller a la fin

        ; Affichage des valeurs paires
        if:     ANDA    1       , i     ; ET binaire pour verifier la parite
                BRNE    endif
                CHARO   ' '     , i
                DECO    iter    , d

        endif:  NOP0

        LDA     iter    , d
        ADDA    1       , i     ; Ajout de 1 a l'iterateur
        STA     iter    , d     ; Sauvegarde de la nouvelle valeur de l'iterateur

        BR      for

endfor: CHARO   '.'     , i
        STOP

iter:   .WORD   1
limite: .WORD   0

.END
