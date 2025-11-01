*&---------------------------------------------------------------------*
*& Report Z_SEXTOPROGRAMA_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_sextoprograma_24.

*Types
TYPES: BEGIN OF types_valor,
         valor1(3) TYPE n,
         valor2(3) TYPE n,
         valor3(3) TYPE n,
       END OF types_valor.

DATA: lv_valor    TYPE types_valor-valor3,
      ls_valor    TYPE types_valor,          "Estrutura (vetor)
      lt_valor    TYPE TABLE OF types_valor,  "Tabela interna (matriz)
      lv_contador TYPE i.

*DO 5 TIMES.
*  lv_valor += 1.
*  WRITE / lv_valor.
*ENDDO.

DO 5 TIMES.
  WRITE: / 'Repetição de número: ', sy-index.
ENDDO.

*DO lv_valor TIMES.
*  ls_valor-valor1 = 10.
*  ls_valor-valor2 = 20.
*  ls_valor-valor3 = 30.
*  APPEND ls_valor TO lt_valor.
*ENDDO.
*
*FREE ls_valor.    "Limpa a variável, estrutura e tabela interna.
*CLEAR ls_valor.

WAIT UP TO 1 SECONDS.

WHILE lv_contador <= 5.
  WRITE: / 'Contador: ', lv_contador.
  lv_contador += 1.
ENDWHILE.

LOOP AT lt_valor INTO ls_valor.
  WRITE: / ls_valor-valor1,
         / ls_valor-valor2,
         / ls_valor-valor3.
ENDLOOP.
