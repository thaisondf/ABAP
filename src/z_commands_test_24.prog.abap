*&---------------------------------------------------------------------*
*& Report Z_COMMANDS_TEST_24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_COMMANDS_TEST_24.

"╔════════════════════════════════════════════════════════════════════════════╗"
"║                            GLOBAL VARIABLES                                ║"
"╚════════════════════════════════════════════════════════════════════════════╝"
  DATA: text_title TYPE string.

"╔════════════════════════════════════════════════════════════════════════════╗"
"║                              GLOBAL TABLES                                 ║"
"╚════════════════════════════════════════════════════════════════════════════╝"
  TABLES: mara.  "Tabela de materiais

"Imagine que cada evento é como um momento específico em uma festa:

"╔════════════════════════════════════════════════════════════════════════════╗"
"║                            SELECTION-SCREEN                                ║"
"╚════════════════════════════════════════════════════════════════════════════╝"

"Tela de seleção - Como o convite da festa
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
    SELECT-OPTIONS: s_matnr FOR mara-matnr.  "Filtro de materiais
  SELECTION-SCREEN END OF BLOCK b1.

"1. INITIALIZATION - Como preparar a festa antes dos convidados chegarem
  INITIALIZATION.
    text_title = 'Filtros do Relatório'.
  "Aqui preparamos tudo que precisa estar pronto antes da tela aparecer

"2. AT SELECTION-SCREEN - Como receber os convidados e verificar os convites
  AT SELECTION-SCREEN.
    IF s_matnr[] IS INITIAL.
      MESSAGE 'Por favor, informe ao menos um material' TYPE 'E'.
    ENDIF.

"╔════════════════════════════════════════════════════════════════════════════╗"
"║                            START-OF-SELECTION                              ║"
"╚════════════════════════════════════════════════════════════════════════════╝"

"3. START-OF-SELECTION - Como o início oficial da festa
  START-OF-SELECTION.
  "Cabeçalho do relatório
    WRITE: / 'RELATÓRIO DE MATERIAIS' COLOR 7.
    ULINE.

"4. TOP-OF-PAGE - Como começar uma nova página no álbum de fotos
  TOP-OF-PAGE.
    WRITE: / sy-datum COLOR 1,  "Data atual
         50 sy-uzeit COLOR 2. "Hora atual
    ULINE.

"5. END-OF-PAGE - Como terminar uma página do álbum
  END-OF-PAGE.
    WRITE: / 'Página', sy-pagno COLOR 3.  "Número da página
    ULINE.

"6. END-OF-SELECTION - Como encerrar a festa
  END-OF-SELECTION.
    SKIP 2.
    WRITE: / 'Relatório concluído!' COLOR 7.
