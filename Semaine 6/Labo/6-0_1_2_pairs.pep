; Comptage de combien de deux valeurs sont paires

        DECI    num1    , d     ; Chargement de la premiere valeur
        DECI    num2    , d     ; Chargement de la deuxieme valeur

;
; Verification de la parite
;
        LDA     num1    , d     ; Chargement de la premiere valeur dans l'accumulateur
        ANDA    1       , i     ; ET Binaire avec 1
        STA     pair1   , d     ; Stockage du resultat dans la variable prevue pour
        
        LDA     num2    , d     ; Chargement de la deuxieme valeur dans l'accumulateur
        ANDA    1       , i     ; ET Binaire avec 1
        STA     pair2   , d     ; Stockage du resultat dans la variable prevue pour

;
; Comparaison entre les deux nombres
;
if:     LDA     pair1   , d     ; Chargement de la partie du nombre 1
        CPA     pair2   , d     ; Comparaison avec la partie du nombre 2
        BRNE    un_pair         ; pair1 != pair2 donc l'un est pair l'autre non

        ; Sinon on determine si les deux sont pairs ou impairs
        LDA     pair1   , d     ; Comparaison a 0
        BREQ    dx_pair         ; Si c'est le cas les deux sont pairs
        BR      zr_pair         ; Sinon ils sont impaires

;
; Affichage des messages
;
zr_pair:STRO    msg_0pr , d
        BR      fin

un_pair:STRO    msg_1pr , d
        BR      fin

dx_pair:STRO    msg_2pr , d
        BR      fin

fin: STOP

num1:   .WORD   0
num2:   .WORD   0

pair1:  .WORD   0
pair2:  .WORD   0

msg_0pr:.ASCII  "Les deux nombres sont impairs.\n\x00"
msg_1pr:.ASCII  "Un nombre est pair l'autre est impair.\n\x00"
msg_2pr:.ASCII  "Les deux nombres sont pairs.\n\x00"

.END
