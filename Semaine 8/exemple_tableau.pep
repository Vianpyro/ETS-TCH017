; Exemple de programme de tableau

        ; Initialisation index
        LDX     0

main:   NOP0

        ; Stocker 100 dans la premiere case
        LDA     100     , i     ; Charger 100 dans l'accumulateur
        STA     tab     , x     ; Stocker dans la case du tableau
        ADDX    2       , i     ; Saut de 2 car chaque "case" vaut 2 octets (ajout de 2 au registre)

        ; Stocker 200 dans la deuxieme case
        LDA     200     , i
        STA     tab     , x
        ADDX    2       , i

        ; Stocker 300 dans la troisieme case
        LDA     300     , i
        STA     tab     , x
        ADDX    2       , i

        ; Stocker 400 dans la quatrieme case
        LDA     400     , i
        STA     tab     , x
        ADDX    2       , i

        ; Stocker 500 dans la derniere case
        LDA     500     , i
        STA     tab     , x
        ADDX    2       , i

        ; Adressage indirect
        LDA     tab     , i     ; L'adresse du tableau est une constante
        ADDA    8       , i
        STA     adrs    , d     ; Stocker l'adresse

        LDA     666     , i
        STA     adrs    , n

STOP
tab:    .BLOCK  10              ; Reservation d'un espace de 10 octets (5 "cases")
adrs:   .WORD   0
.END
