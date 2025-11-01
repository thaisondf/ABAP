*&---------------------------------------------------------------------*
*& Report Z_QUARTOPROGRAMA_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_calc_lv_imc_24.

*CONSTANTS: peso_abaixo      TYPE p DECIMALS 2 VALUE '18.5',
*           peso_normal      TYPE p DECIMALS 2 VALUE '24.9',
*           peso_sobrepeso   TYPE p DECIMALS 2 VALUE '29.9',
*           peso_obesidadeI  TYPE p DECIMALS 2 VALUE '34.9',
*           peso_obesidadeII TYPE p DECIMALS 2 VALUE '39.9'.

DATA: lv_imc(4)            TYPE p DECIMALS 2,
      lv_classificacao(25) TYPE c.

SELECTION-SCREEN BEGIN OF BLOCK a01 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_nome(30)  TYPE c LOWER CASE,
              p_peso(4)   TYPE p DECIMALS 2,
              p_altura(3) TYPE p DECIMALS 2.
SELECTION-SCREEN END OF BLOCK a01.

IF p_peso <= 0 OR p_altura <= 0.
  MESSAGE 'Peso e altura devem ser maiores que zero!' TYPE 'W'.
ENDIF.

lv_imc = p_peso / ( p_altura * p_altura ).
*WRITE lv_imc.

IF lv_imc < '18.5'.
  lv_classificacao = 'Abaixo do peso'.
ELSEIF lv_imc <= '24.9'.
  lv_classificacao = 'Peso normal'.
ELSEIF lv_imc <= '29.9'.
  lv_classificacao = 'Sobrepeso'.
ELSEIF lv_imc <= '34.9'.
  lv_classificacao = 'Obesidade grau I'.
ELSEIF lv_imc <= '39.9'.
  lv_classificacao = 'Obesidade grau II'.
ELSE.
  lv_classificacao = 'Obesidade grau III'.
ENDIF.

*IF lv_imc < peso_abaixo.
*  lv_classificacao = ' Abaixo do peso'.
*ELSEIF lv_imc <= peso_normal.
*  lv_classificacao = ' Peso normal'.
*ELSEIF lv_imc <= peso_sobrepeso.
*  lv_classificacao = ' Sobrepeso'.
*ELSEIF lv_imc <= peso_obesidadeI.
*  lv_classificacao = ' Obesidade grau I'.
*ELSEIF lv_imc <= peso_obesidadeII.
*  lv_classificacao = ' Obesidade grau II'.
*ELSE.
*  lv_classificacao = ' Obesidade grau III'.
*ENDIF.

WRITE: |Olá, { p_nome }|, "| | São delimitadores de string template. { } podemos embutir expressões e variáveis diretamente entre chaves.
     / |Seu IMC é: { lv_imc }|,
     / |Classificação de peso: { lv_classificacao }|.

*WRITE: 'Olá,', p_nome,
*       /'Seu IMC é:', lv_imc,
*       /'Classificação de peso:', lv_classificacao.
*SKIP 10. "Utilizado para inserir linhas em branco

*MESSAGE 'Ola, ' && p_nome && '. Classificação de peso: ' && lv_classificacao TYPE 'I'.

**Abaixo do peso: AbaIxo de 18,5
**Peso normal (Eutrófico): 18,5 a 24,9
**Sobrepeso: 25,0 a 29,9
**Obesidade grau I: 30,0 a 34,9
**Obesidade grau II: 35,0 a 39,9
**Obesidade grau III: 40,0 ou mais
