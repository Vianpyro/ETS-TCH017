LDA     100, i 
STA     0x0050, d

LDA     200, i
STA     0x0052, d

LDA     300, i
STA     0x0054, d

LDA     400, i
STA     0x0056, d

LDA     500, i
STA     0x0058, d

for:    LDA     iter, d
        CPA     taille, i
        BREQ    endfor

        ; Afficher le caractere courant
        DECO    tab_prt, n
        CHARO   '\n', i

        ; Decrementer l'adresse de 2 octets
        LDA     tab_prt, d
        SUBA    2, i
        STA     tab_prt, d
        
        ; Incrementer l'iterateur
        LDA     iter, d
        ADDA    1, i
        STA     iter, d

        ; Boucler
        BR      for

endfor: STOP

tab_prt:.WORD   0x0058
iter:   .WORD   0
taille: .EQUATE 5

.END
