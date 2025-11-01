*&---------------------------------------------------------------------*
*& Report ZPROG_SELECIONACLI_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_selecionacli_24.

INCLUDE zprog_selec_cli_24_top.         " Declaração de variáveis
INCLUDE zprog_selec_cli_24_scr.         " Telas
INCLUDE zprog_selec_cli_24_f01.         " Subprograma/subrotinas

START-OF-SELECTION.
  IF p_id IS NOT INITIAL.   "Se o parâmetro do ID Do Cliente está preenchido.
    PERFORM f_seleciona_single CHANGING gs_cliente.
    WRITE: / gs_cliente-id_cliente,
           / gs_cliente-nome,
           / gs_cliente-endereco,
           / gs_cliente-cidade,
           / gs_cliente-estado.
  ENDIF.
  IF s_id IS NOT INITIAL.
    PERFORM f_seleciona_table  TABLES gt_cliente.

    LOOP AT gt_cliente INTO gs_cliente.
      WRITE: / gs_cliente-id_cliente,
             / gs_cliente-nome,
             / gs_cliente-endereco,
             / gs_cliente-cidade,
             / gs_cliente-estado.
      SKIP.
    ENDLOOP.
  ENDIF.
