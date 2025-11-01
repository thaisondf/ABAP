*&---------------------------------------------------------------------*
*& Report Z_QUINTOPROGRAMA_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_quintoprograma_24.

DATA: lv_nome TYPE string.   "Tipo String
DATA: lv_dia TYPE d.         "Tipo para Data
DATA: lv_hoje(15) TYPE c.    "Tipo Para Caracteres
data: lv_hora type sy-uzeit. "Tipo Variável de Sistema para Hora
data: lv_manha(6) TYPE t.    "Tipo Para Horas
data: lv_valor(3) TYPE n.    "Tipo Numérico

lv_dia = sy-datum.

lv_nome = 'Muquidésio'.
lv_hoje = 'Sexta-feira'.
lv_hora = sy-uzeit.

WRITE: lv_nome.
WRITE: lv_dia.
