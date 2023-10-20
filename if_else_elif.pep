; Lire un entier
DECI    valeur, d

; Le charger dans l'accumulateur
LDA     valeur, d

; Comparaison avec la limite
CPA     LIMITE, i

IF:     BRGT    IFF     ; Si la valeur est superieure a la limite (BRGT)
        BREQ    ELIF    ; Si la valeur est egale a la limite (BREQ)
        BR      ELSE    ; Si la valeur est inferieure a la limite (BRLT)

IFF:    STRO    erreur, d
        BR      ENDIF

ELIF:   STRO    egale, d
        BR      ENDIF

ELSE:   STRO    succes, d

ENDIF:  STOP

valeur: .WORD   0
LIMITE: .EQUATE 100
erreur: .ASCII  "Erreur!\n\x00"
succes: .ASCII  "Success!\n\x00"
egale:  .ASCII  "Pouet!\n\x00"
.END
