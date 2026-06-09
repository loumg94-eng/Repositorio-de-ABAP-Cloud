CLASS zcx_error_tenis_14 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA mv_motivo TYPE string READ-ONLY.

    METHODS constructor
      IMPORTING
        iv_motivo TYPE string OPTIONAL
        previous  LIKE previous OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_error_tenis_14 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    mv_motivo = iv_motivo.
  ENDMETHOD.
ENDCLASS.
