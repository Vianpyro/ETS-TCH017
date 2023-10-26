; Comparaison de deux valeurs

        DECI    nb1, d          ; Lecture du premier entier
        DECI    nb2, d          ; Lecture du deuxieme entier

if:     LDA     nb1, d          ; Chargement de la premiere valeur

        ; Verification de l'age
        SUBA    agemin, d
        BRGE    if2
        BR      error

if2:    LDA     nb2, d          ; Chargement de la deuxieme valeur

        ; Verification du poids
        SUBA    pdsmin, d
        BRGE    succes
        BR      error

error:  STRO    erreur, d
        BR      fin

succes: STRO    sautok, d
        BR      fin

fin:    STOP

nb1:    .WORD   0
nb2:    .WORD   0
agemin: .WORD   15
pdsmin: .WORD   40
sautok: .ASCII  "Vous pouvez sauter en parachute\n\x00"
erreur: .ASCII  "Vous ne pouvez pas sauter en parachute\n\x00"
.END
