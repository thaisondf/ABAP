*&---------------------------------------------------------------------*
*& Report ZPROG_QUERY_CLIENTE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_query_cliente.

TABLES: ztb_clientes_24.

DATA: ls_clientes TYPE ztb_clientes_24,           " Estrutura
      lt_clientes TYPE TABLE OF ztb_clientes_24.  " Tabela interna

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id     TYPE ztb_clientes_24-id_cliente.
  SELECT-OPTIONS s_id FOR ztb_clientes_24-id_cliente.
SELECTION-SCREEN END OF BLOCK a1.

* Processamento
START-OF-SELECTION.

  IF p_id IS NOT INITIAL.   "Quando p_id não está vazio
* Seleciona somente uma informação por vez.
    SELECT SINGLE * FROM ztb_clientes_24
      INTO ls_clientes WHERE id_cliente = p_id.

    IF sy-subrc IS INITIAL.      "IS INITIAL ou EQ 0.
      WRITE: / ls_clientes-nome,
             / ls_clientes-endereco,
             / ls_clientes-cidade,
             / ls_clientes-estado.
    ELSE.
      MESSAGE 'Não há cliente cadastrado na tabela!' TYPE 'I'.
    ENDIF.

  ELSE.
    IF s_id IS NOT INITIAL. "Quando o range de tela estiver preenchido
      SELECT * FROM ztb_clientes_24
        INTO TABLE lt_clientes
        WHERE id_cliente IN s_id.
      IF sy-subrc IS INITIAL.
*        READ TABLE lt_clientes INTO ls_clientes WITH KEY id_cliente = s_id-low.
*        IF sy-subrc IS INITIAL.
*          WRITE: / ls_clientes-nome,
*                 / ls_clientes-endereco,
*                 / ls_clientes-cidade,
*                 / ls_clientes-estado.
        LOOP AT lt_clientes INTO ls_clientes
          WHERE id_cliente IN s_id.

          WRITE: / ls_clientes-nome,
                 / ls_clientes-endereco,
                 / ls_clientes-cidade,
                 / ls_clientes-estado.
          SKIP.
        ENDLOOP.
      ELSE.
        MESSAGE 'Não há cliente cadastrado na tabela' TYPE 'I'.
*      ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.




*  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.
*    SELECTION-SCREEN COMMENT /1(13) comm1.
*    PARAMETERS: p_id     TYPE ztb_clientes_24-id_cliente OBLIGATORY,
*                p_nome   TYPE ztb_clientes_24-nome,
*                p_end    TYPE ztb_clientes_24-endereco,
*                p_cidade TYPE ztb_clientes_24-cidade,
*                p_estado TYPE ztb_clientes_24-estado.
*  SELECTION-SCREEN END OF BLOCK b1.
*
*INITIALIZATION.
*  comm1 = |Mandante: { sy-mandt }|.
*
*  DATA: ls_clientes TYPE ztb_clientes_24,
*        lt_clientes TYPE TABLE OF ztb_clientes_24.
*
*START-OF-SELECTION.
*
**  IF r_ins IS NOT INITIAL. "Is not Initial significa que contém dados
*  IF r_ins = 'X'.    "Opção de Inserir dados
*    ls_clientes-id_cliente = p_id.
*    ls_clientes-nome       = p_nome.
*    ls_clientes-endereco   = p_end.
*    ls_clientes-cidade     = p_cidade.
*    ls_clientes-estado     = p_estado.
*
*    INSERT ztb_clientes_24  FROM ls_clientes.     "Inserir dados na tabela transparente
*    IF sy-subrc = 0.         "Significa que a operação de inserir dados na tabela foi executada com sucesso!!!
**      WRITE: / 'Cliente Cadastrado com Sucesso!!'.
*      MESSAGE 'Cliente cadastrado com sucesso!!' TYPE 'S'.    "Tipo de Sucesso
*      COMMIT WORK AND WAIT.   "Grava os dados na tabela.
*    ELSE.
**      WRITE: 'Cliente já cadastrado'.
*      MESSAGE 'Cliente já cadatrado!!' TYPE 'W'.    "Tipo de Warning
**     MESSAGE 'Cliente já cadatrado!!' TYPE 'I'.    "Tipo de Pop-up
*    ENDIF.
*
*  ELSEIF r_upd = 'X'.        "Atualizar os dados do Cliente
*
*    ls_clientes-id_cliente = p_id.
*    ls_clientes-nome       = p_nome.
*    ls_clientes-endereco   = p_end.
*    ls_clientes-cidade     = p_cidade.
*    ls_clientes-estado     = p_estado.
*
*    UPDATE ztb_clientes_24
*    FROM ls_clientes.
*
*    IF sy-subrc = 0.         "Significa que a operação de inserir dados na tabela foi executada com sucesso!!!
**      WRITE: / 'Cliente Atualizado com Sucesso!!'.
*      MESSAGE 'Cliente atualizado com sucesso!!!' TYPE 'S'.    "Tipo de Sucesso
*      COMMIT WORK AND WAIT.   "Grava os dados na tabela.
*    ELSE.
**      WRITE: 'Cliente Não Encontrado'.
*      MESSAGE 'Cliente não encontrado!' TYPE 'W'.    "Tipo de Warning
*    ENDIF.
*
*  ELSEIF r_del = 'X'.
*
**AT SELECTION-SCREEN.
**
**  IF p_id IS INITIAL.
**    MESSAGE 'O campo ID do Cliente é obrigatório para Excluir.' TYPE 'E'.
**  ENDIF.
*
**    ls_clientes-id_cliente = p_id.
**    ls_clientes-nome       = p_nome.
**    ls_clientes-endereco   = p_end.
**    ls_clientes-cidade     = p_cidade.
**    ls_clientes-estado     = p_estado.
*
*    DELETE FROM ztb_clientes_24 WHERE id_cliente = p_id.
*    IF sy-subrc = 0.    "IS INITIAL
**      WRITE: / 'Cliente Excluído com Sucesso!'.
*      MESSAGE 'Cliente excluído com sucesso!' TYPE 'S'.  "Tipo de sucesso
*      COMMIT WORK AND WAIT.
*    ELSE.
**      WRITE: 'Cliente Não Encontrado Para Exclusão!'.
*      MESSAGE 'Cliente não encontrado!' TYPE 'W'.  "Tipo de Warning
*    ENDIF.
*  ENDIF.
