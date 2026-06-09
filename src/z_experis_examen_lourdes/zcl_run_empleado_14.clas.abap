CLASS zcl_run_empleado_14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_run_empleado_14 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Cambia este número para probar cada opción:
    " 1 = Alta de empleado
    " 2 = Modificar empleado
    " 3 = Consultar empleados
    " 4 = Consultar N registros
    DATA(lv_opcion) = 4.

    CASE lv_opcion.

      WHEN 1. "--- ALTA DE EMPLEADO ---
        DATA(lo_emp) = NEW zcl_empleado_14(
          iv_nombre          = 'Valiente'
          iv_apellido        = 'Mente'
          iv_telefono        = '608843623'
          iv_experiencia     = 2
          iv_certificaciones = 3
        ).
        DATA(lv_msg_alta) = lo_emp->alta_empleado( ).
        out->write( lv_msg_alta ).

      WHEN 2. "--- MODIFICAR EMPLEADO ---
        DATA(lo_mod) = NEW zcl_empleado_14(
          iv_nombre          = 'Luiscarlos'
          iv_apellido        = 'Guadaña'
          iv_telefono        = '692161745'
          iv_experiencia     = 3
          iv_certificaciones = 1
        ).
        DATA(lv_msg_mod) = lo_mod->modificar_empleado(
          iv_id              = 2
          iv_nombre          = 'Manuelita'
          iv_apellido        = 'Chiquitita'
          iv_telefono        = '667553777'
          iv_experiencia     = 5
          iv_certificaciones = 4
        ).
        out->write( lv_msg_mod ).

      WHEN 3. "--- CONSULTAR EMPLEADOS (0=todos, N=por ID) ---
        DATA(lo_con) = NEW zcl_empleado_14(
          iv_nombre          = 'Pepito'
          iv_apellido        = 'leches'
          iv_telefono        = '683992244'
          iv_experiencia     = 0
          iv_certificaciones = 0
        ).
        DATA(lt_result) = lo_con->consultar_empleados( iv_id = 0 ).
        LOOP AT lt_result INTO DATA(ls_emp).
          out->write( |ID: { ls_emp-id_empleado } | &&
                      |Nombre: { ls_emp-nombre } { ls_emp-apellido } | &&
                      |Tel: { ls_emp-telefono } | &&
                      |Sueldo: { ls_emp-sueldo }| ).
        ENDLOOP.

      WHEN 4. "--- CONSULTAR N REGISTROS ---
        DATA(lo_n) = NEW zcl_empleado_14(
          iv_nombre          = 'Juanma'
          iv_apellido        = 'Pineda'
          iv_telefono        = '677564733'
          iv_experiencia     = 2
          iv_certificaciones = 1
        ).
        DATA(lt_n) = lo_n->consultar_n_registros( iv_n = 3 ).
        LOOP AT lt_n INTO DATA(ls_n_emp).
          out->write( |ID: { ls_n_emp-id_empleado } | &&
                      |Nombre: { ls_n_emp-nombre } { ls_n_emp-apellido } | &&
                      |Sueldo: { ls_n_emp-sueldo }| ).
        ENDLOOP.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
