; Faire une fonction "permuter(int* a, int* b)"

; int a = 10
; int b = 20
;
; int* a_ptr = &a
; int* b_ptr = &b
;
; swap(a_ptr, b_ptr)
; swap(&a, &b)

a:      .EQUATE 10
b:      .EQUATE 20

main:   SUBSP   2       , i     ; int a = 10
        LDA     a       , i
        STA     0       , s

        SUBSP   2       , i     ; int b = 20
        LDA     b       , i
        STA     0       , s

        MOVSPA                  ; Stocker l'adresse de b

        SUBSP   2       , i     ; int* b_ptr = &b
        STA     0       , s

        ADDA    2       , i     ; Calculer l'adresse de `a`
        SUBSP   2       , i
        STA     0       , s     ; int* a_ptr = &a

        ; Afficher avant la permutation
        DECO    6       , s     ; Afficher `a`
        CHARO   '\n'    , i
        DECO    4       , s     ; Afficher `b`
        CHARO   '\n'    , i

        CALL    swap

        DECO    6       , s     ; Afficher `a`
        CHARO   '\n'    , i
        DECO    4       , s     ; Afficher `b`
        CHARO   '\n'    , i

        ADDSP   8       , i     ; Depiler la memoire locale

STOP

a_ptr:  .EQUATE 4
b_ptr:  .EQUATE 6
temp:   .EQUATE 0

swap:   SUBSP   2       , i

        ; TAABBT : T = A, A = B, B = T
        LDA     a_ptr   , sf    ; Charger `a` dans l'accumulateur
        STA     temp    , s     ; "Ranger" `a` dans `temp`

        LDA     b_ptr   , sf    ; Charger `b` dans l'accumulateur
        STA     a_ptr   , sf    ; "Ranger" `b` dans `a`

        LDA     temp    , s     ; Charger `temp` dans l'accumulateur
        STA     b_ptr   , sf    ; "Ranger" `temp` dans `b`

        ADDSP   2       , i
        RET0

.END
