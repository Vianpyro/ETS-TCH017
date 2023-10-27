LDA     myster, d

WHILE:  DECI    choix, d
        CPA     choix, d

        BREQ    SUCC
        BR      FAIL

SUCC:   STRO    msgsuc, d
        BR      WEND

FAIL:   STRO    msgfal, d
        BR      WHILE

; WHILE END
WEND:   STOP

msgsuc: .ASCII  "Felicitations!\n\x00"
msgfal: .ASCII  "Reessayez.\n\x00"
choix:  .WORD   0
myster: .WORD   17
.END
