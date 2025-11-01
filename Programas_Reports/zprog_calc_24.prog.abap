*&---------------------------------------------------------------------*
*& Report ZPROG_CALC_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_calc_24.

INCLUDE zprog_calc_24_top.     " Include para declaração de Variáveis
INCLUDE zprog_calc_24_scr.     " Include para declaração de Telas
INCLUDE zprog_calc_24_f01.     " Include para declaração de Subrotinas/Subprograma

START-OF-SELECTION.

  CASE p_op.
    WHEN '+'.
      PERFORM f_soma  USING p_val1
                            p_val2
                            p_op
                      CHANGING gv_total.

      WRITE: |{ p_val1 } + { p_val2 } = { gv_total }|.
    WHEN '-'.
      PERFORM f_sub  USING p_val1
                           p_val2
                           p_op
                      CHANGING gv_total.

      WRITE: |{ p_val1 } - { p_val2 } = { gv_total }|.
    WHEN '*'.
      PERFORM f_mult  USING p_val1
                             p_val2
                             p_op
                      CHANGING gv_total.

      WRITE: |{ p_val1 } x { p_val2 } = { gv_total }|.
    WHEN '/'.

      IF p_val1 <= 0 OR p_val2 <= 0.
        MESSAGE 'Não é possível fazer divisão por zero!' TYPE 'I'.
        STOP.
      ENDIF.

      PERFORM f_div  USING p_val1
                           p_val2
                           p_op
                      CHANGING gv_total.

      WRITE: |{ p_val1 } ÷ { p_val2 } = { gv_total }|.
    WHEN OTHERS.
      MESSAGE 'Selecione uma operação válida!' TYPE 'I'.
  ENDCASE.
