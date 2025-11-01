*&---------------------------------------------------------------------*
*& Report ZPROG_SELECIONACLI_2_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_selecionacli_2_24.

INCLUDE zprog_selecionacli_2_24_top.
INCLUDE zprog_selecionacli_2_24_scr.
INCLUDE zprog_selecionacli_2_24_f01.


START-OF-SELECTION.

  PERFORM f_seleciona_cliente.
  PERFORM f_exibe_alv.
