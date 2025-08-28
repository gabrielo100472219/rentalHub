create index ix_algoritmo_01
    on algoritmo (es_desplazamiento);
create index ix_algoritmo_02
    on algoritmo (es_desplazamiento_base);
create index ix_estado_trabajo_estado_tarea
    on estado_trabajo (id_estado_tarea);
create index ix_paralelo_comparativa_politicas_01
    on paralelo_comparativa_politicas (id_paralelo_peticion, es_diferencia);
create index ix_paralelo_comparativa_politicas_paralelo_peticion
    on paralelo_comparativa_politicas (id_paralelo_peticion);
create index ix_paralelo_comparativa_total_01
    on paralelo_comparativa_total (id_paralelo_peticion, es_diferencia);
create index ix_paralelo_comparativa_total_paralelo_peticion
    on paralelo_comparativa_total (id_paralelo_peticion);
create index ix_paralelo_peticion_estado_paralelo_peticion
    on paralelo_peticion (id_estado_paralelo_peticion);
create index ix_fase_accion_accion
    on fase_accion (id_accion);
create index ix_fase_accion_fase
    on fase_accion (id_fase);
create index ix_fase_accion_punto_ejecucion
    on fase_accion (id_punto_ejecucion);
create index ix_programacion_tipo_ambito
    on programacion (id_tipo_ambito);
create index ix_programacion_ambito_programacion
    on programacion_ambito (id_programacion);
create index ix_programacion_ambito_empresa_programacion_ambito
    on programacion_ambito_empresa (id_programacion_ambito);
create index ix_programacion_ambito_localizacion_programacion_ambito
    on programacion_ambito_localizacion (id_programacion_ambito);
create index ix_programacion_ambito_origen_programacion_ambito
    on programacion_ambito_origen (id_programacion_ambito);
create index ix_programacion_ambito_persona_programacion_ambito
    on programacion_ambito_persona (id_programacion_ambito);
create index ix_algoritmo_tipo_calculo_algoritmo
    on algoritmo_tipo_calculo (id_algoritmo);
create index ix_algoritmo_tipo_calculo_tipo_calculo
    on algoritmo_tipo_calculo (id_tipo_calculo);
create index ix_paralelo_comparativa_por_venta_01
    on paralelo_comparativa_por_venta (id_paralelo_peticion, es_diferencia);
create index ix_paralelo_comparativa_por_venta_paralelo_peticion
    on paralelo_comparativa_por_venta (id_paralelo_peticion);
create index ix_paralelo_comparativa_por_venta_tipo_calculo_relacion_comis
    on paralelo_comparativa_por_venta (id_tipo_calculo_relacion_comis);
create index ix_tipo_calculo_relacion_comis_tipo_calculo
    on tipo_calculo_relacion_comis (id_tipo_calculo);
create index ix_algoritmo_tipo_comision_algoritmo
    on algoritmo_tipo_comision (id_algoritmo);
create index ix_algoritmo_tipo_comision_tipo_comision
    on algoritmo_tipo_comision (id_tipo_comision);
create index ix_paralelo_comparativa_challenge_01
    on paralelo_comparativa_challenge (id_paralelo_peticion, es_diferencia);
create index ix_paralelo_comparativa_challenge_paralelo_peticion
    on paralelo_comparativa_challenge (id_paralelo_peticion);
create index ix_paralelo_comparativa_challenge_tipo_calculo_relacion_comis
    on paralelo_comparativa_challenge (id_tipo_calculo_relacion_comis);
create index ix_paralelo_comparativa_challenge_tipo_comision_relacion_comis
    on paralelo_comparativa_challenge (id_tipo_comision_relacion_comis);
create index ix_paralelo_comparativa_detalle_01
    on paralelo_comparativa_detalle (id_paralelo_comparativa_detalle, id_tipo_comision_relacion_comis);
create index ix_paralelo_comparativa_detalle_paralelo_peticion
    on paralelo_comparativa_detalle (id_paralelo_peticion);
create index ix_paralelo_comparativa_detalle_tipo_calculo_relacion_comis
    on paralelo_comparativa_detalle (id_tipo_calculo_relacion_comis);
create index ix_paralelo_comparativa_detalle_tipo_comision_relacion_comis
    on paralelo_comparativa_detalle (id_tipo_comision_relacion_comis);
create index ix_paralelo_comparativa_precio_hora_01
    on paralelo_comparativa_precio_hora (id_paralelo_peticion, es_diferencia);
create index ix_paralelo_comparativa_precio_hora_paralelo_peticion
    on paralelo_comparativa_precio_hora (id_paralelo_peticion);
create index ix_paralelo_comparativa_precio_hora_tipo_calculo_relacion_comis
    on paralelo_comparativa_precio_hora (id_tipo_calculo_relacion_comis);
create index ix_p_c_p_h_tipo_comision_relacion_comis
    on paralelo_comparativa_precio_hora (id_tipo_comision_relacion_comis);
create index ix_tipo_comision_relacion_comis_tipo_comision
    on tipo_comision_relacion_comis (id_tipo_comision);
create index ix_algoritmo_ajuste_tipo_politica
    on algoritmo_ajuste (id_tipo_politica);
create index ix_proceso_estado_proceso
    on proceso (id_estado_proceso);
create index ix_proceso_tipo_ambito
    on proceso (id_tipo_ambito);
create index ix_proceso_tipo_proceso
    on proceso (id_tipo_proceso);
create index ix_proceso_tipo_sistema_destino
    on proceso (id_tipo_sistema_destino);
create index ix_proceso_ambito_empresa_proceso
    on proceso_ambito_empresa (id_proceso);
create index ix_proceso_ambito_localizacion_proceso
    on proceso_ambito_localizacion (id_proceso);
create index ix_proceso_ambito_origen_proceso
    on proceso_ambito_origen (id_proceso);
create index ix_proceso_ambito_persona_proceso
    on proceso_ambito_persona (id_proceso);
create index ix_algoritmo_tipo_dato_algoritmo
    on algoritmo_tipo_dato (id_algoritmo);
create index ix_algoritmo_tipo_dato_tipo_dato
    on algoritmo_tipo_dato (id_tipo_dato);
create index ix_tipo_dato_tipo_presencia
    on tipo_dato (id_tipo_presencia);
create index ix_tipo_dato_tipo_venta
    on tipo_dato (id_tipo_venta);
create index ix_tipo_grupo_dato_tipo_dato_tipo_dato
    on tipo_grupo_dato_tipo_dato (id_tipo_dato);
create index ix_tipo_grupo_dato_tipo_dato_tipo_grupo_dato
    on tipo_grupo_dato_tipo_dato (id_tipo_grupo_dato);
create index ix_tipo_venta_concepto_tipo_venta
    on tipo_venta_concepto (id_tipo_venta);
create index ix_tipo_venta_concepto_challenge_tipo_venta
    on tipo_venta_concepto_challenge (id_tipo_venta);
create index ix_simulacion_tipo_presencia_persona_simulacion
    on simulacion (id_tipo_presencia_persona_simulacion);
create index ix_simulacion_tipo_venta_localizacion_simulacion
    on simulacion (id_tipo_venta_localizacion_simulacion);
create index ix_simulacion_condicion_condicion
    on simulacion_condicion (id_condicion);
create index ix_simulacion_condicion_simulacion
    on simulacion_condicion (id_simulacion);
create index ix_simulacion_localizacion_banda_excepcion_simulacion
    on simulacion_localizacion_banda_excepcion (id_simulacion);
create index ix_tipo_venta_relacion_comis_tipo_venta
    on tipo_venta_relacion_comis (id_tipo_venta);
create index ix_periodo_calculo_persona_01
    on periodo_calculo_persona (es_bloqueado);
create index ix_periodo_calculo_persona_02
    on periodo_calculo_persona (ccl_id_person, std_or_hr_period);
create index ix_periodo_calculo_persona_estado_periodo_calculo_persona
    on periodo_calculo_persona (id_estado);
create index ix_periodo_calculo_persona_tarea_actual
    on periodo_calculo_persona (id_tarea_actual);
create index ix_periodo_calculo_persona_tarea_ultima
    on periodo_calculo_persona (id_tarea_ultima);
create index ix_periodo_consolidar_tarea_tarea
    on periodo_consolidar_tarea (id_tarea);
create index ix_tarea_estado_tarea
    on tarea (id_estado_tarea);
create index ix_tarea_trabajo
    on tarea (id_trabajo);
create index ix_tarea_agrupacion_cadena_01
    on tarea_agrupacion_cadena (id_tarea, ccl_id_cadena);
create index ix_tarea_agrupacion_cadena_tarea
    on tarea_agrupacion_cadena (id_tarea);
create index ix_tarea_agrupacion_configuracion_tarea
    on tarea_agrupacion_configuracion (id_tarea);
create index ix_tarea_agrupacion_configuracion_tipo_venta_concepto
    on tarea_agrupacion_configuracion (id_tipo_venta_concepto);
create index ix_tarea_agrupacion_configuracion_challenge_tipo_venta_01
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tarea, ccl_id_origen, id_tipo_venta_concepto_challenge);
create index ix_tarea_agrupacion_configuracion_challenge_tipo_venta_tarea
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tarea);
create index ix_t_a_c_c_t_v_tipo_venta_concepto_challenge
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tipo_venta_concepto_challenge);
create index ix_tarea_agrupacion_presencia_tarea
    on tarea_agrupacion_presencia (id_tarea);
create index ix_tarea_agrupacion_presencia_tipo_dato
    on tarea_agrupacion_presencia (id_tipo_dato);
create index ix_tarea_agrupacion_venta_tarea
    on tarea_agrupacion_venta (id_tarea);
create index ix_tarea_agrupacion_venta_tipo_dato
    on tarea_agrupacion_venta (id_tipo_dato);
create index ix_tarea_ambito_tarea
    on tarea_ambito (id_tarea);
create index ix_tarea_ambito_global_empresa_tarea
    on tarea_ambito_global_empresa (id_tarea);
create index ix_tarea_ambito_global_fecha_tarea
    on tarea_ambito_global_fecha (id_tarea);
create index ix_tarea_ambito_global_fecha_tipo_dato
    on tarea_ambito_global_fecha (id_tipo_dato);
create index ix_tarea_ambito_global_localizacion_01
    on tarea_ambito_global_localizacion (id_tarea, std_id_work_locat);
create index ix_tarea_ambito_global_localizacion_tarea
    on tarea_ambito_global_localizacion (id_tarea);
create index ix_tarea_ambito_global_localizacion_persona_01
    on tarea_ambito_global_localizacion_persona (id_tarea, ccl_id_person, std_id_work_locat);
create index ix_tarea_ambito_global_localizacion_persona_02
    on tarea_ambito_global_localizacion_persona (id_tarea, std_id_work_locat, ccl_id_person);
create index ix_tarea_ambito_global_localizacion_persona_tarea
    on tarea_ambito_global_localizacion_persona (id_tarea);
create index ix_tarea_ambito_global_localizacion_persona_desplazamiento_01
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea, ccl_id_person, std_id_work_locat);
create index ix_tarea_ambito_global_localizacion_persona_desplazamiento_02
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea, std_id_work_locat, ccl_id_person);
create index ix_t_a_g_l_p_d_tarea
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea);
create index ix_tarea_ambito_global_localizacion_persona_presencia_01
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea, ccl_id_person, ccl_id_cod_origen);
create index ix_tarea_ambito_global_localizacion_persona_presencia_02
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea, ccl_id_cod_origen, ccl_id_person);
create index ix_tarea_ambito_global_localizacion_persona_presencia_tarea
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea);
create index ix_tarea_ambito_global_localizacion_persona_presencia_manual_01
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea, ccl_id_person, std_id_work_locat);
create index ix_tarea_ambito_global_localizacion_persona_presencia_manual_02
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea, std_id_work_locat, ccl_id_person);
create index ix_t_a_g_l_p_p_m_tarea
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea);
create index ix_tarea_ambito_global_persona_01
    on tarea_ambito_global_persona (id_tarea, ccl_id_person);
create index ix_tarea_ambito_global_persona_tarea
    on tarea_ambito_global_persona (id_tarea);
create index ix_tarea_ambito_localizacion_01
    on tarea_ambito_localizacion (id_tarea, std_id_work_locat);
create index ix_tarea_ambito_localizacion_tarea
    on tarea_ambito_localizacion (id_tarea);
create index ix_tarea_ambito_persona_01
    on tarea_ambito_persona (id_tarea, ccl_id_person);
create index ix_tarea_ambito_persona_tarea
    on tarea_ambito_persona (id_tarea);
create index ix_tarea_calculo_ajuste_comision_01
    on tarea_calculo_ajuste_comision (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha);
create index ix_tarea_calculo_ajuste_comision_tarea
    on tarea_calculo_ajuste_comision (id_tarea);
create index ix_tarea_calculo_persona_01
    on tarea_calculo_persona (id_tarea, ccl_id_person, std_or_hr_period);
create index ix_tarea_calculo_persona_estado_tarea_persona
    on tarea_calculo_persona (id_estado);
create index ix_tarea_calculo_persona_tarea
    on tarea_calculo_persona (id_tarea);
create index ix_tarea_configuracion_tarea
    on tarea_configuracion (id_tarea);
create index ix_tarea_configuracion_challenge_dias_minimos_01
    on tarea_configuracion_challenge_dias_minimos (id_tarea, ccl_id_origen);
create index ix_tarea_configuracion_challenge_dias_minimos_tarea
    on tarea_configuracion_challenge_dias_minimos (id_tarea);
create index ix_tarea_configuracion_precio_hora_01
    on tarea_configuracion_precio_hora (id_tarea, ccl_id_origen);
create index ix_tarea_configuracion_precio_hora_tarea
    on tarea_configuracion_precio_hora (id_tarea);
create index ix_tarea_fase_estado_tarea_fase
    on tarea_fase (id_estado_tarea_fase);
create index ix_tarea_fase_fase
    on tarea_fase (id_fase);
create index ix_tarea_fase_tarea
    on tarea_fase (id_tarea);
create index ix_tarea_fase_accion_accion
    on tarea_fase_accion (id_accion);
create index ix_tarea_fase_accion_estado_tarea_fase_accion
    on tarea_fase_accion (id_estado_tarea_fase_accion);
create index ix_tarea_fase_accion_punto_ejecucion
    on tarea_fase_accion (id_punto_ejecucion);
create index ix_tarea_fase_accion_tarea_fase
    on tarea_fase_accion (id_tarea_fase);
create index ix_tarea_fase_accion_dato_tarea_fase_accion
    on tarea_fase_accion_dato (id_tarea_fase_accion);
create index ix_tarea_fase_accion_dato_tipo_dato
    on tarea_fase_accion_dato (id_tipo_dato);
create index ix_tarea_fase_accion_venta_integra_tarea_fase_accion
    on tarea_fase_accion_venta_integra (id_tarea_fase_accion);
create index ix_tarea_fase_accion_venta_integra_tipo_dato
    on tarea_fase_accion_venta_integra (id_tipo_dato);
create index ix_tarea_limpieza_estado_limpieza
    on tarea_limpieza (id_estado_limpieza);
create index ix_tarea_limpieza_tarea
    on tarea_limpieza (id_tarea);
create index ix_tarea_limpieza_tipo_limpieza
    on tarea_limpieza (id_tipo_limpieza);
create index ix_tarea_localizacion_abierta_01
    on tarea_localizacion_abierta (id_tarea, ccl_id_cod_origen, fecha);
create index ix_tarea_localizacion_abierta_tarea
    on tarea_localizacion_abierta (id_tarea);
create index ix_tarea_localizacion_calcular_01
    on tarea_localizacion_calcular (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_calcular_02
    on tarea_localizacion_calcular (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_calcular_tarea
    on tarea_localizacion_calcular (id_tarea);
create index ix_tarea_localizacion_comision_historico_01
    on tarea_localizacion_comision_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_comision_historico_02
    on tarea_localizacion_comision_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_comision_historico_tarea
    on tarea_localizacion_comision_historico (id_tarea);
create index ix_tarea_localizacion_estado_tarea
    on tarea_localizacion_estado (id_tarea);
create index ix_tarea_localizacion_festivo_01
    on tarea_localizacion_festivo (id_tarea, ccl_id_cod_origen, fecha);
create index ix_tarea_localizacion_festivo_tarea
    on tarea_localizacion_festivo (id_tarea);
create index ix_tarea_localizacion_historico_01
    on tarea_localizacion_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_historico_02
    on tarea_localizacion_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_historico_tarea
    on tarea_localizacion_historico (id_tarea);
create index ix_tarea_localizacion_online_historico_01
    on tarea_localizacion_online_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_online_historico_02
    on tarea_localizacion_online_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);
create index ix_tarea_localizacion_online_historico_tarea
    on tarea_localizacion_online_historico (id_tarea);
create index ix_tarea_localizacion_persona_presencia_01
    on tarea_localizacion_persona_presencia (fecha_inicio_periodo, id_tarea, ccl_id_person, fecha, ccl_id_cod_origen);
create index ix_tarea_localizacion_persona_presencia_02
    on tarea_localizacion_persona_presencia (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha, ccl_id_person);
create index ix_tarea_localizacion_persona_presencia_tarea
    on tarea_localizacion_persona_presencia (id_tarea);
create index ix_tarea_localizacion_persona_presencia_tipo_dato
    on tarea_localizacion_persona_presencia (id_tipo_dato);
create index ix_tarea_localizacion_persona_venta_01
    on tarea_localizacion_persona_venta (fecha_inicio_periodo, id_tarea, ccl_id_person, fecha, ccl_id_cod_origen);
create index ix_tarea_localizacion_persona_venta_02
    on tarea_localizacion_persona_venta (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha, ccl_id_person);
create index ix_tarea_localizacion_persona_venta_tarea
    on tarea_localizacion_persona_venta (id_tarea);
create index ix_tarea_localizacion_persona_venta_tipo_dato
    on tarea_localizacion_persona_venta (id_tipo_dato);
create index ix_tarea_localizacion_presencia_01
    on tarea_localizacion_presencia (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha);
create index ix_tarea_localizacion_presencia_tarea
    on tarea_localizacion_presencia (id_tarea);
create index ix_tarea_localizacion_presencia_tipo_dato
    on tarea_localizacion_presencia (id_tipo_dato);
create index ix_tarea_localizacion_presupuesto_01
    on tarea_localizacion_presupuesto (id_tarea, ccl_id_cod_origen);
create index ix_tarea_localizacion_presupuesto_tarea
    on tarea_localizacion_presupuesto (id_tarea);
create index ix_tarea_localizacion_presupuesto_tipo_presupuesto
    on tarea_localizacion_presupuesto (id_tipo_presupuesto);
create index ix_tarea_localizacion_presupuesto_tipo_dato
    on tarea_localizacion_presupuesto_venta (id_tipo_dato);
create index ix_tarea_localizacion_presupuesto_venta_01
    on tarea_localizacion_presupuesto_venta (id_tarea, ccl_id_cod_origen);
create index ix_tarea_localizacion_presupuesto_venta_tarea
    on tarea_localizacion_presupuesto_venta (id_tarea);
create index ix_tarea_localizacion_presupuesto_venta_tipo_presupuesto
    on tarea_localizacion_presupuesto_venta (id_tipo_presupuesto);
create index ix_t_l_p_v_tipo_venta_concepto_challenge
    on tarea_localizacion_presupuesto_venta (id_tipo_venta_concepto_challenge);
create index ix_tarea_localizacion_venta_01
    on tarea_localizacion_venta (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha);
create index ix_tarea_localizacion_venta_tarea
    on tarea_localizacion_venta (id_tarea);
create index ix_tarea_localizacion_venta_tipo_dato
    on tarea_localizacion_venta (id_tipo_dato);
create index ix_tarea_persona_ausencia_historico_01
    on tarea_persona_ausencia_historico (id_tarea, ccl_id_person, std_or_hr_period);
create index ix_tarea_persona_ausencia_historico_tarea
    on tarea_persona_ausencia_historico (id_tarea);
create index ix_tarea_persona_ausencia_historico_tipo_ausencia
    on tarea_persona_ausencia_historico (id_tipo_ausencia);
create index ix_tarea_persona_coeficiente_01
    on tarea_persona_coeficiente (id_tarea, ccl_id_person, std_or_hr_period);
create index ix_tarea_persona_coeficiente_tarea
    on tarea_persona_coeficiente (id_tarea);
create index ix_tarea_calculo_01
    on tarea_calculo (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha, std_id_work_locat);
create index ix_tarea_calculo_02
    on tarea_calculo (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha, std_id_work_locat_pago);
create index ix_tarea_calculo_03
    on tarea_calculo (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, id_tipo_calculo,
                      id_tipo_comision, std_id_work_locat);
create index ix_tarea_calculo_algoritmo
    on tarea_calculo (id_algoritmo);
create index ix_tarea_calculo_tarea
    on tarea_calculo (id_tarea);
create index ix_tarea_calculo_tarea_localizacion_persona_presencia
    on tarea_calculo (fecha_inicio_periodo, id_tarea_localizacion_persona_presencia);
create index ix_tarea_calculo_tarea_localizacion_persona_venta
    on tarea_calculo (fecha_inicio_periodo, id_tarea_localizacion_persona_venta);
create index ix_tarea_calculo_tarea_localizacion_presencia
    on tarea_calculo (fecha_inicio_periodo, id_tarea_localizacion_presencia);
create index ix_tarea_calculo_tarea_localizacion_venta
    on tarea_calculo (fecha_inicio_periodo, id_tarea_localizacion_venta);
create index ix_tarea_calculo_tarea_persona_estructura
    on tarea_calculo (fecha_inicio_periodo, id_tarea_persona_estructura);
create index ix_t_l_p_t_p_e_tarea_localizacion_presupuesto
    on tarea_localizacion_presupuesto_tarea_persona_estructura (id_tarea_localizacion_presupuesto);
create index ix_t_l_p_t_p_e_tarea_persona_estructura
    on tarea_localizacion_presupuesto_tarea_persona_estructura (fecha_inicio_periodo, id_tarea_persona_estructura);
create index ix_tarea_persona_estructura_01
    on tarea_persona_estructura (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, icm_id_tp_calculo,
                                 icm_id_tp_comision);
create index ix_tarea_persona_estructura_02
    on tarea_persona_estructura (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period);
create index ix_tarea_persona_estructura_tarea
    on tarea_persona_estructura (id_tarea);
create index ix_tarea_persona_estructura_desplazamiento_01
    on tarea_persona_estructura_desplazamiento (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period,
                                                ordinal_estructura);
create index ix_tarea_persona_estructura_desplazamiento_tarea
    on tarea_persona_estructura_desplazamiento (id_tarea);
create index ix_t_p_e_d_tipo_opcion_calculo_efectiva
    on tarea_persona_estructura_desplazamiento (id_tipo_opcion_calculo_efectiva);
create index ix_t_p_e_d_tipo_opcion_calculo_estructura
    on tarea_persona_estructura_desplazamiento (id_tipo_opcion_calculo_estructura);
create index ix_tarea_persona_estructura_desplazamiento_real_tarea
    on tarea_persona_estructura_desplazamiento_real (id_tarea);
create index ix_tarea_calculo_ajuste_01
    on tarea_calculo_ajuste (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha);
create index ix_tarea_calculo_ajuste_algoritmo_ajuste
    on tarea_calculo_ajuste (id_algoritmo_ajuste);
create index ix_tarea_calculo_ajuste_tarea
    on tarea_calculo_ajuste (id_tarea);
create index ix_tarea_calculo_ajuste_tarea_persona_estructura_politica
    on tarea_calculo_ajuste (id_tarea_persona_estructura_politica, fecha_inicio_periodo);
create index ix_tarea_persona_estructura_politica_01
    on tarea_persona_estructura_politica (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period,
                                          id_tipo_politica);
create index ix_tarea_persona_estructura_politica_tarea
    on tarea_persona_estructura_politica (id_tarea);
create index ix_tarea_persona_estructura_politica_tipo_politica
    on tarea_persona_estructura_politica (id_tipo_politica);
create index ix_tarea_persona_externa_01
    on tarea_persona_externa (id_tarea, ccl_id_person);
create index ix_tarea_persona_externa_tarea
    on tarea_persona_externa (id_tarea);
create index ix_tarea_persona_historico_01
    on tarea_persona_historico (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period);
create index ix_tarea_persona_historico_tarea
    on tarea_persona_historico (id_tarea);
create index ix_tarea_tipo_hora_01
    on tarea_tipo_hora (id_tarea, cod_tipo_hora);
create index ix_tarea_tipo_hora_tarea
    on tarea_tipo_hora (id_tarea);
create index ix_trabajo_estado_trabajo
    on trabajo (id_estado_trabajo);
create index ix_trabajo_programacion
    on trabajo (id_programacion);
create index ix_trabajo_simulacion
    on trabajo (id_simulacion);
create index ix_trabajo_tipo_ambito
    on trabajo (id_tipo_ambito);
create index ix_trabajo_ambito_empresa_trabajo
    on trabajo_ambito_empresa (id_trabajo);
create index ix_trabajo_ambito_localizacion_trabajo
    on trabajo_ambito_localizacion (id_trabajo);
create index ix_trabajo_ambito_origen_trabajo
    on trabajo_ambito_origen (id_trabajo);
create index ix_trabajo_ambito_persona_trabajo
    on trabajo_ambito_persona (id_trabajo);