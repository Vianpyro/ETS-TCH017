BR      main

;
; Programma principal
;

x:      .WORD   15      ; Valeur pour les operations

main:   SUBSP   2       , i     ; Reservation de deux octets de memoire pour la valeur `x`

        LDA     x       , d     ; Chargement de la valeur `x`
        STA     0       , s     ; Stockage dans le stack
        DECO    x       , d     ; Affichage de la valeur avant l'operation
        CHARO   '\n'    , i     ; Ajout d'un espace pour la lisibilite
        CALL    carre           ; Appel de la fonction
        DECO    x       , d     ; Affichage de la valeur apres l'operation

        ADDSP   2       , i     ; Liberation des deux octets

STOP

a_ptr:  .EQUATE 2

carre:  LDA     0       , i
        LDX     0       , i

        a_for:  CPX     a_ptr   , sf
                BREQ    a_end

                ; Ajout de la valeur dans l'accumulateur
                ADDA    a_ptr   , sf

                ; Boucle
                ADDX    1       , i
                BR      a_for

        a_end:  STA     a_ptr   , sf    ; Stocker la valeur final

        RET0
