; Verification du type d'un triangle

        DECI    d1x, d          ; Lecture de la coordonee x du premier sommet
        DECI    d1y, d          ; Lecture de la coordonee y du premier sommet
        DECI    d2x, d          ; Lecture de la coordonee x du second sommet
        DECI    d2y, d          ; Lecture de la coordonee y du second sommet
        DECI    d3x, d          ; Lecture de la coordonee x du troisieme sommet
        DECI    d3y, d          ; Lecture de la coordonee y du troisieme sommet

; Valeur absolue du x du premier sommet
abs1x:  LDA     d1x, d          ; Chargement de la coordonnee x du premier sommet
        BRLT    chg1x           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs1x           ; Envoi vers la fonction de fin

chg1x:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs1x           ; Envoi vers la fonction de fin

ebs1x:  STA     d1x, d          ; Sauvegarde 


; Valeur absolue du y du premier sommet
abs1y:  LDA     d1y, d          ; Chargement de la coordonnee y du premier sommet
        BRLT    chg1y           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs1y           ; Envoi vers la fonction de fin

chg1y:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs1y           ; Envoi vers la fonction de fin

ebs1y:  STA     d1y, d          ; Sauvegarde 


; Valeur absolue du x du second sommet
abs2x:  LDA     d2x, d          ; Chargement de la coordonnee x du second sommet
        BRLT    chg2x           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs2x           ; Envoi vers la fonction de fin

chg2x:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs2x           ; Envoi vers la fonction de fin

ebs2x:  STA     d2x, d          ; Sauvegarde 


; Valeur absolue du y du second sommet
abs2y:  LDA     d2y, d          ; Chargement de la coordonnee y du second sommet
        BRLT    chg2y           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs2y           ; Envoi vers la fonction de fin

chg2y:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs2y           ; Envoi vers la fonction de fin

ebs2y:  STA     d2y, d          ; Sauvegarde 


; Valeur absolue du x du troisieme sommet
abs3x:  LDA     d3x, d          ; Chargement de la coordonnee x du troisieme sommet
        BRLT    chg3x           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs3x           ; Envoi vers la fonction de fin

chg3x:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs3x           ; Envoi vers la fonction de fin

ebs3x:  STA     d3x, d          ; Sauvegarde 


; Valeur absolue du y du troisieme sommet
abs3y:  LDA     d3y, d          ; Chargement de la coordonnee y du troisieme sommet
        BRLT    chg3y           ; Envoi vers la fonction d'inversion si negatif
        BR      ebs3y           ; Envoi vers la fonction de fin

chg3y:  NEGA                    ; Inversion du signe de la valeur chargee
        BR      ebs3y           ; Envoi vers la fonction de fin

ebs3y:  STA     d3y, d          ; Sauvegarde 


        DECO    d1x, d
        CHARO   '\n', i
        DECO    d1y, d
        CHARO   '\n', i
        DECO    d2x, d
        CHARO   '\n', i
        DECO    d2y, d
        CHARO   '\n', i
        DECO    d3x, d
        CHARO   '\n', i
        DECO    d3y, d
        CHARO   '\n', i

end:    STOP
d1x:    .WORD   0               ; Coordonnee x du premier sommet
d1y:    .WORD   0               ; Coordonnee y du premier sommet
d2x:    .WORD   0               ; Coordonnee x du second sommet
d2y:    .WORD   0               ; Coordonnee y du second sommet
d3x:    .WORD   0               ; Coordonnee x du troisieme sommet
d3y:    .WORD   0               ; Coordonnee y du troisieme sommet
D12:    .WORD   0               ; Distance de Manhattan entre les sommets 1 et 2
D23:    .WORD   0               ; Distance de Manhattan entre les sommets 2 et 3
D31:    .WORD   0               ; Distance de Manhattan entre les sommets 3 et 1
.END
