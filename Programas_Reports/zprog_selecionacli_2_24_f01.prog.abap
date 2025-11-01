*&---------------------------------------------------------------------*
*& Include          ZPROG_SELECIONACLI_2_24_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_seleciona_cliente
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_seleciona_cliente .

  DATA: ls_clientes TYPE zst_clientes_24.

  SELECT SINGLE *
    FROM ztb_clientes_24
    INTO gs_clientes
    WHERE id_cliente = p_id.

  IF sy-subrc IS NOT INITIAL.
    MESSAGE 'Cliente não encontrado!' TYPE 'I'.
  ELSE.
    MOVE-CORRESPONDING gs_clientes TO ls_clientes.
    ls_clientes-tipo = '1'.
    ls_clientes-contato = '9999999'.
    APPEND ls_clientes TO gt_clientes.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_exibe_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_exibe_alv .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      i_structure_name   = 'ZST_CLIENTES_24'
      i_save             = 'A'
    TABLES
      t_outtab           = gt_clientes
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
    MESSAGE 'Erro ao exibir o relatório' TYPE 'I'.
  ENDIF.

ENDFORM.
