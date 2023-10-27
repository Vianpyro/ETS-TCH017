; Initialiser un tableau [1, 2, 3, 4, 5] dans une variable nommee tab

        LDX     0, i

for:    LDA     iter, d         ; Charger l'iterateur
        CPA     taille, d       ; Condition de fin de boucle
        BRGT    endfor
        STA     tab, x          ; tableau[i] = i
        ADDA    1, i            ; Incrementer l'iterateur
        STA     iter, d
        ADDX    2, i            ; Passer a la prochaine valeur (+ 2 octets)
        BR      for

endfor: STOP

iter:   .WORD   1               ; Iterateur de boucle
taille: .WORD   5               ; Taille du tableau
tab:    .BLOCK  10              ; Tableau
.END
