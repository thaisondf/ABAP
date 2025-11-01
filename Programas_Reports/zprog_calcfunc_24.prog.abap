*&---------------------------------------------------------------------*
*& Report ZPROG_CALCFUNC_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_calcfunc_24.

INCLUDE ZPROG_CALCFUNC_24_top.          " Declaração de Variáveis
INCLUDE ZPROG_CALCFUNC_24_scr.          " Declaração de Tela
INCLUDE ZPROG_CALCFUNC_24_f01.          " Declaração de Subrotina/Subprogramas

START-OF-SELECTION.

  CASE p_opt.
    WHEN '+'.
      PERFORM f_soma CHANGING gv_total.
    WHEN '-'.
      PERFORM f_sub CHANGING gv_total.
    WHEN '*'.
      PERFORM f_mult CHANGING gv_total.
    WHEN '/'.

      IF p_val1 <= 0 OR p_val2 <= 0.
        MESSAGE 'Não é possível fazer divisão por zero' TYPE 'I'.
      ENDIF.

      PERFORM f_div CHANGING gv_total.

    WHEN OTHERS.
      MESSAGE 'Operação inválida!' type 'I'.
  ENDCASE.
