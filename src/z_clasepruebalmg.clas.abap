CLASS z_clasepruebalmg DEFINITION
PUBLIC

  FINAL

  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
    CONSTANTS c_lmg TYPE string value 'constante de lourdes'.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS z_clasepruebalmg IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_num TYPE i VALUE 7.
    DATA lv_i TYPE i.
    DATA lv_res TYPE i.
    DATA lv_suma TYPE i VALUE 0.

    DO 10 TIMES.

      lv_i = sy-index.
      lv_res = lv_num * lv_i.
      lv_suma = lv_suma + lv_res.

      out->write( |{ lv_num } x { lv_i } = { lv_res }| ).

    ENDDO.

    out->write( '-----------------------' ).
    out->write( |Suma total: { lv_suma }| ).
    out->write( c_lmg ).

  ENDMETHOD.

ENDCLASS.
