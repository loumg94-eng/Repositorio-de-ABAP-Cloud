CLASS zcl_miprimeraclaselmg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_miprimeraclaselmg IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*   data lv_id type i.
*   lv_id = 1.
*   data lv_var1 type /dmo/airport.
*
* CONSTANTS lc_const1 type i value 10.
*
*out->write( lv_id ).
*out->write( lc_const1 ).
*
*
 data lv_nombre type string value 'lourdes'.

 if lv_nombre = 'lourdes'.
 out->write(  'hola lourdes' ).
 else.
 out->write( 'tu no eres lourdes' ).

 endif.

 out->write(  'termina el programa' ).


  ENDMETHOD.

ENDCLASS.

