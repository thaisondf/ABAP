*&---------------------------------------------------------------------*
*& Include          ZPROG_QUERY_CLIENTE_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f4_help_tipo_contato
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f4_help_tipo_contato .

  DATA: lt_dd07v TYPE TABLE OF  dd07v,
        ls_dd07v TYPE dd07v.

  DATA: lt_return TYPE TABLE OF ddshretval,
        ls_return TYPE ddshretval.

  FREE: gt_dd07v, gs_dd07v.

  CALL FUNCTION 'DD_DOMVALUES_GET'
    EXPORTING
      domname        = 'ZDO_TIPOCLI_24'
      text           = 'X'
      langu          = sy-langu
    TABLES
      dd07v_tab      = lt_dd07v
    EXCEPTIONS
      wrong_textflag = 1
      OTHERS         = 2.

  IF sy-subrc <> 0.
    MESSAGE 'Erro ao Buscar valores do Domínio' TYPE 'I'.
  ENDIF.

  LOOP AT lt_dd07v INTO ls_dd07v.
    gs_dd07v-domvalue_l = ls_dd07v-domvalue_l.
    gs_dd07v-ddtext     = ls_dd07v-ddtext.
    APPEND gs_dd07v TO gt_dd07v.
  ENDLOOP.


  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'DOMVALUE_L'
      dynpprog        = sy-repid
      dynprofield     = 'p_tipo'
      value_org       = 'S'
    TABLES
      value_tab       = gt_dd07v
*     FIELD_TAB       =
      return_tab      = lt_return
*     DYNPFLD_MAPPING =
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.
  IF sy-subrc <> 0.
    MESSAGE 'Erro ao Buscar valores do Domínio' TYPE 'I'.
  ELSE.
    READ TABLE lt_return INTO ls_return INDEX 1.
    IF sy-subrc IS INITIAL.
      p_tipo = ls_return-fieldval.
    ENDIF.
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_processa_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_processa_dados .

  DATA: ls_clientes TYPE ztb_clientes_24,
        ls_contato  TYPE ztb_cli_ctt_24.

  ls_clientes-id_cliente = p_id.
  ls_clientes-nome       = p_nome.
  ls_clientes-endereco   = p_end.
  ls_clientes-cidade     = p_cidade.
  ls_clientes-estado     = p_estado.

  ls_contato-id_cliente  = p_id.
  ls_contato-tipo        = p_tipo.
  ls_contato-contato     = p_ctt.

  MODIFY ztb_clientes_24 FROM ls_clientes.
  IF sy-subrc IS INITIAL.
    COMMIT WORK AND WAIT.
    MESSAGE 'Sucesso ao gravar dados' TYPE 'S'.
  ENDIF.

  MODIFY ztb_cli_ctt_24 FROM ls_contato.
  IF sy-subrc IS INITIAL.
    COMMIT WORK AND WAIT.
    MESSAGE 'Sucesso ao gravar dados' TYPE 'S'.
  ENDIF.

ENDFORM.
