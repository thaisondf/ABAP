*&---------------------------------------------------------------------*
*& Report ZPROG_QUERY_CLIENTE_2_24.
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_query_cliente_2_24.

INCLUDE zprog_query_cliente_top.
INCLUDE zprog_query_cliente_scr.
INCLUDE zprog_query_cliente_f01.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_tipo.
  PERFORM f4_help_tipo_contato.

  START-OF-SELECTION.
  PERFORM f_processa_dados.
