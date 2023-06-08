*&---------------------------------------------------------------------*
*& Report /SMASH/TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT /SMASH/TEST.
SELECT vbeln,
posnr,
matnr,
matwa,
pmatn,
charg,
matkl  FROM vbap INTO TABLE @DATA(lt_vbap) UP TO 10 ROWS.

  IF sy-subrc = 0.
    SELECT vbeln,
erdat,
erzet,
ernam FROM vbak INTO TABLE @DATA(lt_vbak) UP TO 4 ROWS.
      IF sy-subrc = 0.
        LOOP AT lt_vbak ASSIGNING FIELD-SYMBOL(<fs_vbak>).
          APPEND INITIAL LINE TO lt_vbap ASSIGNING FIELD-SYMBOL(<fs_vbap>).
          MOVE-CORRESPONDING <fs_vbak> TO <fs_vbap>.
        ENDLOOP.
      ENDIF.
    ENDIF.
