; Verification de si un caractere est une lettre ou non
        CHARI   char    , d     ; Lecture du caractere

;
; Verification 1 des majuscules - On verifie si c'est "avant A"
;
        LDBYTEA char    , d     ; Chargement du caractere dans l'accumulateur
        CPA     a_maj   , i     ; Comparaison avec 'A'
        BRLT    paschar         ; < 'A' donc pas un caractere

        ; Sinon on continue :)
        CPA     z_maj   , i     ; Comparaison avec 'Z'
        BRLE    ischar          ; <= 'Z' donc c'est une lettre!

        ; Sinon on continue :)
        CPA     a_min   , i     ; Comparaison avec 'a'
        BRLT    paschar         ; < 'a' donc pas un caractere

        ; Sinon on continue :)
        CPA     z_min   , i     ; Comparaison avec 'z'
        BRLE    ischar          ; <= 'z' donc c'est une lettre!
        
        ; Sinon ce n'est pas un caractere
        BR      paschar

paschar:CHARO   char    , d
        STRO    msg_err , d
        BR      fin

ischar: CHARO   char    , d
        STRO    msg_scs , d
        BR      fin

fin: STOP

char:   .BYTE   0x00
a_maj:  .EQUATE 0x0041
z_maj:  .EQUATE 0x005A
a_min:  .EQUATE 0x0061
z_min:  .EQUATE 0x007A
msg_err:.ASCII  " n'est pas une lettre.\n\x00"
msg_scs:.ASCII  " est une lettre.\n\x00"

.END
