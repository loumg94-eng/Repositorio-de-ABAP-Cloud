CLASS zcl_empleado_14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES tt_empleados TYPE TABLE OF ztab_usuario_14 WITH EMPTY KEY.

    METHODS constructor
      IMPORTING
        iv_nombre          TYPE string
        iv_apellido        TYPE string
        iv_telefono        TYPE string
        iv_experiencia     TYPE i
        iv_certificaciones TYPE i.

    METHODS calcular_sueldo
      RETURNING VALUE(rv_sueldo) TYPE zde_sueldo_14.

    METHODS generar_id
      RETURNING VALUE(rv_id) TYPE zde_id_empleado_14.

    METHODS alta_empleado
      RETURNING VALUE(rv_mensaje) TYPE string.

    METHODS modificar_empleado
      IMPORTING
        iv_id              TYPE zde_id_empleado_14
        iv_nombre          TYPE string
        iv_apellido        TYPE string
        iv_telefono        TYPE string
        iv_experiencia     TYPE i
        iv_certificaciones TYPE i
      RETURNING VALUE(rv_mensaje) TYPE string.

    METHODS consultar_empleados
      IMPORTING
        iv_id TYPE zde_id_empleado_14
      RETURNING
        VALUE(rt_empleados) TYPE tt_empleados.

    METHODS consultar_n_registros
      IMPORTING
        iv_n TYPE i
      RETURNING
        VALUE(rt_empleados) TYPE tt_empleados.

  PRIVATE SECTION.
    DATA mv_nombre          TYPE string.
    DATA mv_apellido        TYPE string.
    DATA mv_telefono        TYPE string.
    DATA mv_experiencia     TYPE i.
    DATA mv_certificaciones TYPE i.

ENDCLASS.


CLASS zcl_empleado_14 IMPLEMENTATION.

  METHOD constructor.
    mv_nombre          = iv_nombre.
    mv_apellido        = iv_apellido.
    mv_telefono        = iv_telefono.
    mv_experiencia     = iv_experiencia.
    mv_certificaciones = iv_certificaciones.
  ENDMETHOD.

  METHOD calcular_sueldo.
    rv_sueldo = 1000 + ( mv_certificaciones * 50 ) + ( mv_experiencia * 100 ).
  ENDMETHOD.

  METHOD generar_id.
    DATA lv_max_id TYPE zde_id_empleado_14.

    SELECT SINGLE MAX( id_empleado )
      FROM ztab_usuario_14
      INTO @lv_max_id.

    IF lv_max_id IS INITIAL.
      rv_id = 1.
    ELSE.
      rv_id = lv_max_id + 1.
    ENDIF.
  ENDMETHOD.

  METHOD alta_empleado.
    DATA ls_empleado TYPE ztab_usuario_14.

    ls_empleado-id_empleado = generar_id( ).
    ls_empleado-nombre      = mv_nombre.
    ls_empleado-apellido    = mv_apellido.
    ls_empleado-telefono    = mv_telefono.
    ls_empleado-sueldo      = calcular_sueldo( ).

    INSERT ztab_usuario_14 FROM @ls_empleado.

    IF sy-subrc = 0.
      rv_mensaje = |Empleado insertado correctamente con ID: { ls_empleado-id_empleado }|.
    ELSE.
      rv_mensaje = 'Error al insertar el empleado.'.
    ENDIF.
  ENDMETHOD.

  METHOD modificar_empleado.
    SELECT SINGLE id_empleado
      FROM ztab_usuario_14
      WHERE id_empleado = @iv_id
      INTO @DATA(lv_check).

    IF sy-subrc <> 0.
      rv_mensaje = |Error: No existe ningún empleado con ID: { iv_id }|.
      RETURN.
    ENDIF.

    DATA(lv_sueldo) = 1000 + ( iv_certificaciones * 50 ) + ( iv_experiencia * 100 ).

    UPDATE ztab_usuario_14
      SET nombre   = @iv_nombre,
          apellido = @iv_apellido,
          telefono = @iv_telefono,
          sueldo   = @lv_sueldo
      WHERE id_empleado = @iv_id.

    IF sy-subrc = 0.
      rv_mensaje = |Empleado con ID { iv_id } modificado correctamente.|.
    ELSE.
      rv_mensaje = |Error al modificar el empleado con ID: { iv_id }|.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_empleados.
    IF iv_id = 0.
      SELECT *
        FROM ztab_usuario_14
        INTO TABLE @rt_empleados.
    ELSE.
      SELECT *
        FROM ztab_usuario_14
        WHERE id_empleado = @iv_id
        INTO TABLE @rt_empleados.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_n_registros.
    SELECT *
      FROM ztab_usuario_14
      ORDER BY id_empleado ASCENDING
      INTO TABLE @rt_empleados
      UP TO @iv_n ROWS.
  ENDMETHOD.

ENDCLASS.
