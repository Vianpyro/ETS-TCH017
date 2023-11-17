; PILE = LIFO = Last In First Out

main:   CALL    affmsg
        CALL    affmsg

STOP

affmsg: STRO    msg     , d
        RET0

msg:    .ASCII  "Bonjour!\n\x00"
.END
