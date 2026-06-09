CLASS zcl_jugador_tenis_14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_jugador_tenis_14 .

    "Atributos visibles desde fuera
    DATA mv_nombre  TYPE string.
    DATA mv_pais    TYPE string.
    DATA mv_ranking TYPE i.

    "Constructor para crear el jugador
    METHODS constructor
      IMPORTING
        iv_nombre  TYPE string
        iv_pais    TYPE string
        iv_ranking TYPE i.

  PRIVATE SECTION.
    "Dato interno — no accesible desde fuera
    DATA mv_energia TYPE i VALUE 100.


ENDCLASS.



CLASS zcl_jugador_tenis_14 IMPLEMENTATION.

  METHOD constructor.
    mv_nombre  = iv_nombre.
    mv_pais    = iv_pais.
    mv_ranking = iv_ranking.
  ENDMETHOD.

  METHOD zif_jugador_tenis_14~restar.
    rv_devolucion = |{ mv_nombre } devuelve: { iv_pelota }|.
  ENDMETHOD.

  METHOD zif_jugador_tenis_14~mostrar_ranking.
    DATA ls_ranking TYPE zst_ranking.
    ls_ranking-posicion = 1.
    ls_ranking-puntos  = 100.
    rv_posicion = ls_ranking.
  ENDMETHOD.

  METHOD zif_jugador_tenis_14~sacar.

    IF iv_velocidad > 250.
      RAISE EXCEPTION NEW zcx_error_tenis_14( iv_motivo = 'Saque demasiado rapido, falta de pie' ).

    ELSE.
* Los metodos de la interfaz se escriben con el prefijo zif_jugador_tenis_14
      mv_energia = mv_energia - 5.
* Logica del saque a iv_velocidad km/h
    ENDIF.


  ENDMETHOD.


ENDCLASS.
