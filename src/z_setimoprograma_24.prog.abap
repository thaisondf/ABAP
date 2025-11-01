*&---------------------------------------------------------------------*
*& Report Z_SETIMOPROGRAMA_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_setimoprograma_24.

TYPES: BEGIN OF type_pessoas,
         nome(30)     TYPE c,
         endereco(30) TYPE c,
         cidade(30)   TYPE c,
       END OF type_pessoas.

DATA: ls_pessoas TYPE type_pessoas,
      lt_pessoas TYPE TABLE OF type_pessoas.

ls_pessoas-nome = 'Muquidésio'.
ls_pessoas-endereco = 'Rua da felicidade'.
ls_pessoas-cidade = 'Xique Xique'.

APPEND ls_pessoas TO lt_pessoas.

ls_pessoas-nome = 'Cleitinho'.
ls_pessoas-endereco = 'Rua Street'.
ls_pessoas-cidade = 'São Paulo'.

APPEND ls_pessoas TO lt_pessoas.

ls_pessoas-nome = 'Bob'.
ls_pessoas-endereco = 'Rua das pedras'.
ls_pessoas-cidade = 'Campinas.'.

APPEND ls_pessoas TO lt_pessoas.

LOOP AT lt_pessoas INTO ls_pessoas. "WHERE cidade EQ 'São Paulo'.
  WRITE: / ls_pessoas-nome,
           ls_pessoas-endereco,
           ls_pessoas-cidade.
ENDLOOP.
