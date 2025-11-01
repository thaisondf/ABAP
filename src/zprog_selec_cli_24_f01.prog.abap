*&---------------------------------------------------------------------*
*& Include          Z24G_SELEC_CLI_24_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_seleciona_single
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- GS_CLIENTE
*&---------------------------------------------------------------------*
FORM f_seleciona_single  CHANGING ls_cliente TYPE ztb_clientes_24.

  SELECT SINGLE * FROM ztb_clientes_24
    INTO  ls_cliente
    WHERE id_cliente = p_id.

  IF sy-subrc IS NOT INITIAL.      " Diferente de zero – Houve algum tipo de erro
    MESSAGE 'Não existe dados a ser exibido' TYPE 'I'.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_seleciona_table
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GT_CLIENTE
*&---------------------------------------------------------------------*
FORM f_seleciona_table  TABLES lt_cliente STRUCTURE ztb_clientes_24.

  SELECT * FROM ztb_clientes_24
    INTO TABLE lt_cliente
    WHERE      id_cliente IN s_id.

  IF sy-subrc IS NOT INITIAL. "Diferente de Zero - "Houve algum tipo de erro"
    MESSAGE 'Não exite dados a ser exibido' TYPE 'I'.
  ENDIF.

ENDFORM.
