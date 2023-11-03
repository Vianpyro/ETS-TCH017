; Programme qui cree une nouvelle valeur en renversant les bits d'une valeur
        
        DECI    valeur  , d     ; Enregistrement de la valeur entree

while:  LDA     iter    , d     ; Chargement de l'iterateur
        BREQ    affiche         ; Fin de la boucle, afficher le resultat

        ; Doubler l'inverse
        LDA     inverse , d     ; Chargement de l'inverse
        ASLA                    ; Multiplcation par 2
        STA     inverse , d     ; Mise a jour de la variable
        
        ; Si modulo 2 == 1 ajouter 1 a l'inverse
        if:     LDA     valeur  , d     ; Chargement de la valeur
                ANDA    1       , i     ; Et binaire pour faire le modulo 2
                BREQ    endif           ; Si aucun reste (0) continuer la boucle
                LDA     inverse , d     ; Sinon charger l'inverse
                ADDA    1       , i     ; Y ajouter 1
                STA     inverse , d     ; Et mettre a jour la variable

        endif:  NOP0

        ; Division par deux
        LDA     valeur  , d     ; Chargement de la valeur
        ASRA                    ; Division par deux
        STA     valeur  , d     ; Mise a jour de la variable
        
        ; Mise a jour de l'iterateur
        LDA     iter    , d
        SUBA    1       , i
        STA     iter    , d

        BR      while           ; Retour au debut de la boucle

affiche:DECO    inverse , d

fin:    STOP

valeur: .WORD   0
inverse:.WORD   0
iter:   .WORD   16

.END
