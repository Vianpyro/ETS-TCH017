; Stocker la valeur initiale
DECI    valeur, d

; Afficher la premiere valeur
DECO    valeur, d
CHARO   "\n",     i

WHILE:  LDA     valeur, d
        CPA     1,      i
        BREQ    WEND

        ANDA    1, i    ; ANDA 1 = Reste du modulo par 2 est 1 en utilisant un "ET BINAIRE"

        IF:     BRNE    ELSE    ; Mise a jour valeur PAIRE
                LDA     valeur, d
                ASRA
                STA     valeur, d
                BR      ENDIF

        ELSE:   LDA     valeur, d   ; Mise a jour valeur IMPAIRE
                ASLA
                ADDA    valeur, d
                ADDA    1,      i
                STA     valeur, d


        ENDIF:  DECO    valeur, d
                CHARO   "\n", i
        
        BR      WHILE

; WHILE END
WEND: STOP
valeur: .WORD   0
.END
