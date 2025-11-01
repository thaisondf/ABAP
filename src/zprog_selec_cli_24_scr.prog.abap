*&---------------------------------------------------------------------*
*& Include          ZPROG_SELEC_CLI_24_SCR
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS:     p_id     TYPE ztb_clientes_24-id_cliente.
  SELECT-OPTIONS  s_id     FOR ztb_clientes_24-id_cliente.
SELECTION-SCREEN END OF BLOCK a1.
