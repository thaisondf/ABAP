*&---------------------------------------------------------------------*
*& Include          ZPROG_SELEC_CLI_24_TOP
*&---------------------------------------------------------------------*

TABLES: ztb_clientes_24.

DATA: gs_cliente TYPE ztb_clientes_24,            " Estrutura global (Global structure).
      gt_cliente TYPE TABLE OF ztb_clientes_24.   " Tabela interna (Global table).
