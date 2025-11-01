*&---------------------------------------------------------------------*
*& Include          ZPROG_QUERY_CLIENTE_TOP
*&---------------------------------------------------------------------*

* Tabelas transparentes.
" Tabelas Transparente
TABLES: ztb_clientes_24,
        dd07v,
        ztb_cli_ctt_24.

TYPES: BEGIN OF ty_dd07v,
         domvalue_l TYPE dd07v-domvalue_l, " domvalue_1 >  o valor do domínio ex: "e-mail", "tel"...
         ddtext     TYPE dd07v-ddtext,     " a descrição desse valor "E-mail", "Telefone"...
       END OF ty_dd07v.

data: gt_dd07v TYPE TABLE OF ty_dd07v,    " tabela interna para obter dados do domínio
      gs_dd07v TYPE ty_dd07v.             " estrutura de trabalho, uma variável única que guarda um registro
                                          " uma linha da tabela, usamos gs_dd07v para preencher a gt_dd07v com o APPEND.
