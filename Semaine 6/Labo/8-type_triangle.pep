; Verification du type d'un triangle

        DECI    d1x, d          ; Lecture de la coordonee x du premier sommet
        DECI    d1y, d          ; Lecture de la coordonee y du premier sommet
        DECI    d2x, d          ; Lecture de la coordonee x du second sommet
        DECI    d2y, d          ; Lecture de la coordonee y du second sommet
        DECI    d3x, d          ; Lecture de la coordonee x du troisieme sommet
        DECI    d3y, d          ; Lecture de la coordonee y du troisieme sommet

;
; Calcul du D12
;
calcd12:LDA     d2x, d          ; Chargement de la valeur x du second sommet
        SUBA    d1x, d          ; Soustraction de la valeur x du premier sommet a celle du second
        STA     tempx, d        ; Stockage de la valeur calculee
        LDA     d2y, d          ; Chargement de la valeur y du second sommet
        SUBA    d1y, d          ; Soustraction  de la valeur y du premier sommet a celle du second
        STA     tempy, d        ; Stockage de la valeur calculee

        ; Valeur absolue en x
        LDA     tempx, d        ; Chargement de la somme des valeurs x et comparaison a 0
        BRLT    absd12x         ; Si negatif envoi vers la fonction "abs"

        BR      clcd12y         ; Envoi vers la fonction de test de la somme des valeurs y

absd12x:NEGA                    ; Changement de signe de la valeur dans l'accumulateur (somme x)
        STA     tempx, d        ; Stockage de la valeur changee
        BR      clcd12y         ; Envoi vers la fonction de test de la somme des valeurs y

clcd12y:LDA     tempy, d        ; Chargement de la somme des valeurs y et comparaison a 0
        BRLT    absd12y         ; Si negatif envoi vers la fonction "abs"
        BR      fnclc12         ; Envoi vers la fin des tests

absd12y:NEGA                    ; Chagement de signe de la valeur dans l'accumulateur (somme y)
        STA     tempy, d        ; Stockage de la valeur changee
        BR      fnclc12         ; Envoi vers la fin des tests

; Calcul de la somme D12 et stockage dans la variable appropriee
fnclc12:LDA     tempx, d        ; Chargement somme en x
        ADDA    tempy, d        ; Ajout de la somme en y
        STA     D12, d          ; Stockage dans la variable correspondante

;
; Calcul du D23
;
calcd23:LDA     d3x, d          ; Chargement de la valeur x du troisieme sommet
        SUBA    d2x, d          ; Soustraction de la valeur x du second sommet a celle du troisieme
        STA     tempx, d        ; Stockage de la valeur calculee
        LDA     d3y, d          ; Chargement de la valeur y du troisieme sommet
        SUBA    d2y, d          ; Soustraction  de la valeur y du second sommet a celle du troisieme
        STA     tempy, d        ; Stockage de la valeur calculee

        ; Valeur absolue en x
        LDA     tempx, d        ; Chargement de la somme des valeurs x et comparaison a 0
        BRLT    absd23x         ; Si negatif envoi vers la fonction "abs"

        BR      clcd23y         ; Envoi vers la fonction de test de la somme des valeurs y

absd23x:NEGA                    ; Changement de signe de la valeur dans l'accumulateur (somme x)
        STA     tempx, d        ; Stockage de la valeur changee
        BR      clcd23y         ; Envoi vers la fonction de test de la somme des valeurs y

clcd23y:LDA     tempy, d        ; Chargement de la somme des valeurs y et comparaison a 0
        BRLT    absd23y         ; Si negatif envoi vers la fonction "abs"
        BR      fnclc23         ; Envoi vers la fin des tests

absd23y:NEGA                    ; Chagement de signe de la valeur dans l'accumulateur (somme y)
        STA     tempy, d        ; Stockage de la valeur changee
        BR      fnclc23         ; Envoi vers la fin des tests

; Calcul de la somme D23 et stockage dans la variable appropriee
fnclc23:LDA     tempx, d        ; Chargement somme en x
        ADDA    tempy, d        ; Ajout de la somme en y
        STA     D23, d          ; Stockage dans la variable correspondante

;
; Calcul du D31
;
calcd31:LDA     d1x, d          ; Chargement de la valeur x du premier sommet
        SUBA    d3x, d          ; Soustraction de la valeur x du troisieme sommet a celle du premier
        STA     tempx, d        ; Stockage de la valeur calculee
        LDA     d1y, d          ; Chargement de la valeur y du premier sommet
        SUBA    d3y, d          ; Soustraction  de la valeur y du troisieme sommet a celle du premier
        STA     tempy, d        ; Stockage de la valeur calculee

        ; Valeur absolue en x
        LDA     tempx, d        ; Chargement de la somme des valeurs x et comparaison a 0
        BRLT    absd31x         ; Si negatif envoi vers la fonction "abs"

        BR      clcd31y         ; Envoi vers la fonction de test de la somme des valeurs y

absd31x:NEGA                    ; Changement de signe de la valeur dans l'accumulateur (somme x)
        STA     tempx, d        ; Stockage de la valeur changee
        BR      clcd31y         ; Envoi vers la fonction de test de la somme des valeurs y

clcd31y:LDA     tempy, d        ; Chargement de la somme des valeurs y et comparaison a 0
        BRLT    absd31y         ; Si negatif envoi vers la fonction "abs"
        BR      fnclc31         ; Envoi vers la fin des tests

absd31y:NEGA                    ; Chagement de signe de la valeur dans l'accumulateur (somme y)
        STA     tempy, d        ; Stockage de la valeur changee
        BR      fnclc31         ; Envoi vers la fin des tests

; Calcul de la somme D31 et stockage dans la variable appropriee
fnclc31:LDA     tempx, d        ; Chargement somme en x
        ADDA    tempy, d        ; Ajout de la somme en y
        STA     D31, d          ; Stockage dans la variable correspondante

;
; Verification du nombre de cotes de meme longueur
;
test1:  LDA     D12, d          ; Chargement de la distance de Manhattan entre les sommets 1 et 2
        SUBA    D23, d          ; Soustraction par la distance de Manhattan entre les sommets 2 et 3
        BREQ    test2           ; Si egal le triangle est isocele, aller a la suite de la verification
        BR      isscal          ; Sinon aller a la verification suivante

test2:  LDA     D12, d          ; Verification du troisieme cote
        SUBA    D31, d          ; Soustraction par la distance de Manhattan entre les sommets 3 et 1
        BREQ    isequi          ; Le triangle est equilateral
        BR      isiso           ; Sinon le triangle est isocele

;
; Affichage du type de triange
;
isequi: STRO    msg_eqi, d
        BR      fin

isiso:  STRO    msg_iso, d
        BR      fin

isscal: STRO    msg_scl, d
        BR      fin

;
; Fin du programme
;
fin:    STOP

; Variables de coordonnees
d1x:    .WORD   0               ; Coordonnee x du premier sommet
d1y:    .WORD   0               ; Coordonnee y du premier sommet
d2x:    .WORD   0               ; Coordonnee x du second sommet
d2y:    .WORD   0               ; Coordonnee y du second sommet
d3x:    .WORD   0               ; Coordonnee x du troisieme sommet
d3y:    .WORD   0               ; Coordonnee y du troisieme sommet

; Variables x et y intermediaires
tempx:  .WORD   0
tempy:  .WORD   0

; Variables de stockage des distance de Manhattan entre les sommets
D12:    .WORD   0               ; Sommets 1 et 2
D23:    .WORD   0               ; Sommets 2 et 3
D31:    .WORD   0               ; Sommets 3 et 1

; Constantes d'affichage de message
msg_eqi:.ASCII  "Le triangle est equilateral.\n\x00"
msg_iso:.ASCII  "Le triangle est isocele.\n\x00"
msg_scl:.ASCII  "Le triangle est scalene.\n\x00"

.END
