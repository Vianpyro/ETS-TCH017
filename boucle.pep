; Boucle qui affiche un message un certain nombre de fois
FOR:     NOP0 ; Instruction 'pas d'instruction' pour aligner des commentaires

         ; Evaluer la condition
         LDA     iter, d     ; Charge la valeur stockee a l'emplacement memoire iter dans l'accumulateur
         CPA     n, d        ; Compare la valeur stockee a l'emplacement memoire n avec la valeur dans l'accumulateur
         BREQ    ENDFOR      ; Saute a l'etiquette ENDFOR si les valeurs comparees sont �gales (si la condition de la boucle est satisfaite)

         ; Afficher une message
         STRO    msg, d      

         ; Incrementation de l'iterateur
         LDA     iter, d     ; Charge la valeur stockee a l'emplacement memoire iter
         ADDA    1, i        ; Ajoute 1
         STA     iter, d     ; Stocke la nouvelle valeur de l'iterateur a l'emplacement memoire iter

         BR FOR  ; Saute inconditionnellement a l'etiquette FOR, ce qui cree un la boucle.

ENDFOR:  STOP    ; Etiquette ENDFOR marquant la fin de la boucle, suivie de l'instruction STOP, qui arrete l'execution du programme.

iter:    .WORD 0
n:       .WORD 5
msg:     .ASCII "Ouch!\n\x00"     ; Rappel: '\x00' est un caractere nul pour marquer la fin de la chaine.
.END