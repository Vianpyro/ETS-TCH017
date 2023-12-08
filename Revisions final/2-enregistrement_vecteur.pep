BR      main

; Typedef
vx:     .EQUATE 0
vy:     .EQUATE 2
sizeof: .EQUATE 4

;
; Programme principal
;
main:   SUBSP   6       , i     ; Allouer 6 octets

        DECI    2       , s     ; Lire `vx`
        DECI    4       , s     ; Lire `vy`

        CALL    v_init

        ; Charger l'adresse du t_vect*
        LDA     0       , s

        ADDSP   6       , i     ; Liberer la memoire

STOP

z_ret:  .EQUATE 2
z_siz:  .EQUATE 4

malloc: LDA     ptr_tas , d     ; Charger l'adresse courante du tas
        STA     z_ret   , s     ; Ranger l'adresse courante pour le retour
        ADDA    z_siz   , s     ; Déplacer le pointeur du tas
        STA     ptr_tas , d     ; Mettre à jour le pointeur du tas

        RET0

b_ptr:  .EQUATE 0       ; Le pointeur retourne par malloc
b_siz:  .EQUATE 2       ; Le nombre d'octets à reserver
b_ret:  .EQUATE 6       ; La valeur de retour
b_vx:   .EQUATE 8       ; Le premier parametre
b_vy:   .EQUATE 10      ; Le deuxieme parametre

v_init: SUBSP   4       , i     ; Allouer la memoire

        ; Charger le sizeof dans l'accumulateur
        LDA     sizeof  , i
        STA     b_siz   , s

        ; Allocation dynamique pour sizeof bytes
        CALL    malloc

        ; Ici j'ai acces a t_vect*

        ; Initialisar `vx`
        LDA     b_vx    , s
        LDX     vx      , i     ; -> typedef
        STA     b_ptr   , sxf

        ; Initialisar `vy`
        LDA     b_vy    , s
        LDX     vy      , i     ; -> typedef
        STA     b_ptr   , sxf

        ; Retourner l'adresse de l'enregistrement initialise
        LDA     b_ptr   , s
        STA     b_ret   , s

        ADDSP   4       , i     ; Liberer la memoire
        RET0

c_ptr:  .EQUATE 2

v_affi: CHARO   '<',    i

        LDX     vx  , i
        DECO    c_ptr   , sxf

        CHARO   ','     , i
        CHARO   ' '     , i

        LDX     vy      , i
        DECO    c_ptr   , sxf

        CHARO   '>'     , i

.END
