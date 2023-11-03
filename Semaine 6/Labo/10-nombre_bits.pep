; Affichage du nombre de bits dans la representation binaire d'une valeur

        DECI    valeur  , d     ; Stockage de la valeur entree
        LDA     valeur  , d     ; Chargement de la valeur
        STA     copie   , d     ; Stockage d'une copie pour l'affichage final

while:  LDA     valeur  , d     ; Chargement de la valeur
        CPA     0       , i     ; Comparaison avec 0
        BREQ    affiche         ; Si la valeur est nulle, le programme est fini

        ; Si modulo 2 == bitsrch ajouter 1 au nombre de bits
        if:     ANDA    1       , i     ; ET binaire pour faire un modulo par 2
                CPA     bitsrch , i     ; Comparaison avec le bit recherche
                BRNE    endif           ; Si different ne pas compter
                LDA     nb_bits , d     ; Sinon charger la variable de comptage
                ADDA    1       , i     ; Y ajouter 1
                STA     nb_bits , d     ; Mettre a jour la variable de comptage

        endif:  NOP0

        ; Division par deux
        LDA     valeur  , d     ; Chargement de la valeur
        ASRA                    ; Division par deux
        STA     valeur  , d     ; Mise a jour de la variable
        BR      while           ; Retour au debut de la boucle


affiche:STRO    msg_1   , d
        DECO    nb_bits , d
        STRO    msg_2   , d
        DECO    bitsrch , i
        STRO    msg_3   , d

fin: STOP

valeur: .WORD   0
copie:  .WORD   0
bitsrch:.EQUATE 0               ; Definition du bit recherche (0 ou 1)
nb_bits:.WORD   0               ; Variable de compte du nombre de bits
msg_1:  .ASCII  "Il y'a \x00"
msg_2:  .ASCII  " bits valant '\x00"
msg_3:  .ASCII  "' dans la valeur\x00"

.END
