*&---------------------------------------------------------------------*
*& Include          ZPROG_QUERY_CLIENTE_SCR
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id     TYPE ztb_clientes_24-id_cliente,
              p_nome   TYPE ztb_clientes_24-nome,
              p_end    TYPE ztb_clientes_24-endereco,
              p_cidade TYPE ztb_clientes_24-cidade,
              p_estado TYPE ztb_clientes_24-estado.
SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_tipo  TYPE ztb_cli_ctt_24-tipo,
              p_ctt   TYPE ztb_cli_ctt_24-contato.
SELECTION-SCREEN END OF BLOCK b1.
