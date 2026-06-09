INTERFACE zif_jugador_tenis_14
  PUBLIC .

"Métodos que CUALQUIER jugador debe tener
  METHODS sacar
    IMPORTING iv_velocidad TYPE i
    RAISING   zcx_error_tenis.

  METHODS restar
    IMPORTING iv_pelota TYPE string
    RETURNING VALUE(rv_devolucion) TYPE string.

  METHODS mostrar_ranking
    RETURNING VALUE(rv_posicion) TYPE zst_ranking.

ENDINTERFACE.
