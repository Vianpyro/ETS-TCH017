; Affichage du quadrant d'un point

        DECI    pos_x   , d
        DECI    pos_y   , d

; Calculs
        LDA     pos_x   , d     ; Chargement de la coordonnee x et comparaison avec 0
        BRLT    quadyxn         ; x est negatif -> quadrant 2 ou 3
        BR      quadyxp         ; x est positif -> quadrant 1 ou 4

quadyxn:LDA     pos_y   , d     ; Chargement de la coordonnee y et comparaison avec 0
        BRLT    qdrt3
        BR      qdrt2

quadyxp:LDA     pos_y   , d     ; Chargement de la coordonnee y et comparaison avec 0
        BRLT    qdrt4
        BR      qdrt1

qdrt1:  LDA     1       , i     ; Chargement de la valeur du quadrant
        BR      fin

qdrt2:  LDA     2       , i     ; Chargement de la valeur du quadrant
        BR      fin

qdrt3:  LDA     3       , i     ; Chargement de la valeur du quadrant
        BR      fin

qdrt4:  LDA     4       , i     ; Chargement de la valeur du quadrant
        BR      fin

fin:    STA     quadrt  , d     ; Sauvegarde dans la variable prevue

        ; Affichage final
        STRO    msg1    , d
        DECO    pos_x   , d
        STRO    msg2    , d
        DECO    pos_y   , d
        STRO    msg3    , d
        DECO    quadrt  , d     ; Affichage du quadrant
        CHARO   msg4    , d
        STOP

; Variables
pos_x:  .WORD   0
pos_y:  .WORD   0
quadrt: .WORD   0
msg1:   .ASCII  "Le point (\x00"
msg2:   .ASCII  ", \x00"
msg3:   .ASCII  ") est dans le quadrant \x00"
msg4:   .ASCII  ".\n\x00"

.END
