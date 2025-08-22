create table accion
(id_accion                integer             not null
        constraint pk_accion
            primary key,
    nombre                   varchar(128) not null,
    descripcion              varchar(255) not null,
    reaccion_peso            integer,
    es_reaccion_esperar      numeric(1)          not null,
    es_reaccion_reintento    numeric(1)          not null,
    reaccion_reintento_max   integer,
    reaccion_reintento_delay integer);

comment on table accion is 'Tabla con los tipos de acciones de comprobación de datos:
motivosDesplazamientoV1, condicionesHistoricoV1, fechasV1, presenciasV1...';

comment on column accion.id_accion is 'Identificador de la acción';

comment on column accion.nombre is 'Nombre de la acción motivosDesplazamientoV1
condicionesHistoricoV1,
fechasV1...';

comment on column accion.descripcion is 'Descripción de la acción';

comment on column accion.reaccion_peso is 'Peso, define el peso de una acción sobre otras';

comment on column accion.es_reaccion_esperar is 'Flag que indica si hay que usar delay';

comment on column accion.es_reaccion_reintento is 'Flag que indica si hay que reintentar';

comment on column accion.reaccion_reintento_max is 'Numero maximo de reintentos';

comment on column accion.reaccion_reintento_delay is 'Delay en los reintentos';

grant delete, insert, select, update on table accion to rcompensacion_comision;

grant select on table accion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table accion to rmantenimiento_compensacion_comision;

grant select on table accion to rcompensacion_comision_meta4;

grant select on table accion to rservicios_sil_sistema_informacional;

grant select on table accion to rreporting_sil_sistema_informacional;

grant insert, select, update on table accion to rmantenimiento_income;

create table accion_ambito
(id_accion            integer                                      not null,
    ccl_id_origen        varchar(24)                   not null,
    std_id_leg_ent       varchar(24)                   not null,
    es_activo            numeric(1)         default 0.0               not null,
    usuario_alta         varchar(40) default ''                not null,
    fecha_alta           timestamp(6)       default current_timestamp not null,
    usuario_modificacion varchar(40),
    fecha_modificacion   timestamp(6),
    usuario_baja         varchar(40),
    fecha_baja           timestamp(6),
    comentario           varchar(255),
    constraint pk_accion_ambito
        primary key (id_accion, ccl_id_origen, std_id_leg_ent));

comment on table accion_ambito is 'Ámbito de las acciones';

comment on column accion_ambito.id_accion is 'Identificador de la acción';

comment on column accion_ambito.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronización';

comment on column accion_ambito.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column accion_ambito.comentario is 'Comentario sobre el ámbito de las acciones';

grant delete, insert, select, update on table accion_ambito to rcompensacion_comision;

grant select on table accion_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table accion_ambito to rmantenimiento_compensacion_comision;

grant select on table accion_ambito to rcompensacion_comision_meta4;

grant select on table accion_ambito to rservicios_sil_sistema_informacional;

grant select on table accion_ambito to rreporting_sil_sistema_informacional;

grant insert, select, update on table accion_ambito to rmantenimiento_income;

create table algoritmo
(id_algoritmo           integer                not null
        constraint pk_algoritmo
            primary key,
    es_activo              numeric(1)             not null,
    nombre                 varchar(128)    not null,
    es_desplazamiento      numeric(1) default 0.0 not null,
    es_desplazamiento_base numeric(1) default 0   not null);

comment on table algoritmo is 'Tabla con los tipos de algoritmos de de la app y su estado activo o no, globalTiendaPorcentajeV1
globalTiendaPorcentajeDiariaV1
globalTiendaTopesV1
globalTiendaManualV1
globalTiendaAjusteManualV1...';

comment on column algoritmo.id_algoritmo is 'Identificador del Algoritmo';

comment on column algoritmo.es_activo is 'Estado del algoritmo';

comment on column algoritmo.nombre is 'Nombre del algoritmo globalTiendaPorcentajeDiariaV1
globalTiendaTopesV1
globalTiendaManualV1';

comment on column algoritmo.es_desplazamiento is 'Indica que el algoritmo se aplica sobre la tienda destino del desplazamiento';

comment on column algoritmo.es_desplazamiento_base is 'Indica que el algoritmo se aplica sobre la tienda de la posición del desplazamiento.';

create index ix_algoritmo_01
    on algoritmo (es_desplazamiento);

create index ix_algoritmo_02
    on algoritmo (es_desplazamiento_base);

grant delete, insert, select, update on table algoritmo to rcompensacion_comision;

grant select on table algoritmo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table algoritmo to rmantenimiento_compensacion_comision;

grant select on table algoritmo to rcompensacion_comision_meta4;

grant select on table algoritmo to rservicios_sil_sistema_informacional;

grant select on table algoritmo to rreporting_sil_sistema_informacional;

grant insert, select, update on table algoritmo to rmantenimiento_income;

create table clase_persona_sil_ambito
(id_clase_persona_sil_ambito bigint generated always as identity (start with 1)
        constraint pk_clase_persona_sil_ambito
            primary key,
    ccl_id_origen               varchar(24) not null,
    std_id_leg_ent              varchar(24) not null,
    clase                       integer                    not null,
    estado                      integer);

comment on table clase_persona_sil_ambito is 'Tabla donde se almacenan para la validación personasSilV1 las clases y estados correspondientes para cada país/empresa';

comment on column clase_persona_sil_ambito.id_clase_persona_sil_ambito is 'Identificador de la clase estado';

comment on column clase_persona_sil_ambito.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column clase_persona_sil_ambito.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column clase_persona_sil_ambito.clase is 'Clase SIL';

comment on column clase_persona_sil_ambito.estado is 'Estado SIL';

grant delete, insert, select, update on table clase_persona_sil_ambito to rcompensacion_comision;

grant select on table clase_persona_sil_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table clase_persona_sil_ambito to rmantenimiento_compensacion_comision;

grant select on table clase_persona_sil_ambito to rcompensacion_comision_meta4;

grant insert, select, update on table clase_persona_sil_ambito to rmantenimiento_income;

create table condicion
(id_condicion       bigint generated always as identity (cache 100)
        constraint pk_condicion
            primary key,
    icm_id_tp_calculo  varchar(24)            not null,
    icm_id_tp_comision varchar(24)            not null,
    icm_valor          numeric(23,8)                        not null,
    icm_ord_tope       integer                               not null,
    es_dia_lunes       numeric(1)                default 1   not null,
    es_dia_martes      numeric(1)                default 1   not null,
    es_dia_miercoles   numeric(1)                default 1   not null,
    es_dia_jueves      numeric(1)                default 1   not null,
    es_dia_viernes     numeric(1)                default 1   not null,
    es_dia_sabado      numeric(1)                default 1   not null,
    es_dia_domingo     numeric(1)                default 1   not null,
    es_festivo         numeric(1)                default 0.0 not null,
    ccl_id_seccion     varchar(2) default ''  not null);

comment on table condicion is 'Tabla con las condiciones utilizadas en las simulaciones';

comment on column condicion.id_condicion is 'Identificador de la condicion';

comment on column condicion.icm_id_tp_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

comment on column condicion.icm_id_tp_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestra de tipos de comisión InCome';

comment on column condicion.icm_valor is 'Vlaor asociado  a al estructura puede ser un porcentaje o importe, M4ICM_TABLA_VALORES';

comment on column condicion.icm_ord_tope is 'Iindica el numero de tramos de la esctructura en la aplicacion, viene de la tabla meta4 de InCome M4ICM_TABLA_VALORES';

comment on column condicion.es_dia_lunes is 'Indica si aplica en lunes';

comment on column condicion.es_dia_martes is 'Indica si aplica el martes';

comment on column condicion.es_dia_miercoles is 'Indica si aplica el miercoles';

comment on column condicion.es_dia_jueves is 'Indica si aplica el jueves';

comment on column condicion.es_dia_viernes is 'Indica si aplica el viernes';

comment on column condicion.es_dia_sabado is 'Indica si aplica el sabado';

comment on column condicion.es_dia_domingo is 'Indica si aplica el domingo';

comment on column condicion.es_festivo is 'Flag que indica si el cálculo debe hacerse en días festivos';

comment on column condicion.ccl_id_seccion is 'Identifcador de la seccion a la que afecta ';

grant delete, insert, select, update on table condicion to rcompensacion_comision;

grant select on table condicion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table condicion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table condicion to rcompensacion_comision_meta4;

grant insert, select, update on table condicion to rmantenimiento_income;

create table configuracion_aplicacion_baja_it
(std_id_leg_ent     varchar(24) not null,
    ccl_id_origen      varchar(24) not null,
    std_id_sub_geo_div varchar(8)  not null,
    icm_id_tp_calculo  varchar(24) not null,
    icm_id_tp_comision varchar(24) not null,
    constraint pk_configuracion_aplicacion_baja_it
        primary key (std_id_leg_ent, ccl_id_origen, std_id_sub_geo_div, icm_id_tp_calculo, icm_id_tp_comision));

comment on table configuracion_aplicacion_baja_it is 'Tabla con la configuración de aplicación de la jornada laboral por país y minutos.';

comment on column configuracion_aplicacion_baja_it.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column configuracion_aplicacion_baja_it.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column configuracion_aplicacion_baja_it.std_id_sub_geo_div is 'Id de provincia, tabla STD_SUB_GEO_DIV Maestro de provincias';

comment on column configuracion_aplicacion_baja_it.icm_id_tp_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

comment on column configuracion_aplicacion_baja_it.icm_id_tp_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestra de tipos de comisión InCome';

grant delete, insert, select, update on table configuracion_aplicacion_baja_it to rcompensacion_comision;

grant select on table configuracion_aplicacion_baja_it to rmonitorizacion_compensacion_comision;

grant select on table configuracion_aplicacion_baja_it to rcompensacion_comision_meta4;

create table configuracion_jornada_laboral
(ccl_id_origen varchar(24) not null
        constraint pk_configuracion_jornada_laboral
            primary key,
    minutos       integer                    not null);

comment on column configuracion_jornada_laboral.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column configuracion_jornada_laboral.minutos is 'Configuracion por país de la jornada laboral de los empleados';

grant delete, insert, select, update on table configuracion_jornada_laboral to rcompensacion_comision;

grant select on table configuracion_jornada_laboral to rmonitorizacion_compensacion_comision;

grant select on table configuracion_jornada_laboral to rcompensacion_comision_meta4;

create table estado_limpieza
(id_estado_limpieza integer             not null
        constraint pk_estado_limpieza
            primary key,
    nombre             varchar(128) not null);

comment on table estado_limpieza is 'Tablas con los estados de limpieza';

comment on column estado_limpieza.id_estado_limpieza is 'Identificador del estado de la limpieza';

comment on column estado_limpieza.nombre is 'Nombre del estado de limpieza';

grant delete, insert, select, update on table estado_limpieza to rcompensacion_comision;

grant select on table estado_limpieza to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_limpieza to rmantenimiento_compensacion_comision;

grant select on table estado_limpieza to rcompensacion_comision_meta4;

grant select on table estado_limpieza to rservicios_sil_sistema_informacional;

grant select on table estado_limpieza to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_limpieza to rmantenimiento_income;

create table estado_paralelo_peticion
(id_estado_paralelo_peticion bigint             not null
        constraint pk_estado_paralelo_peticion
            primary key,
    nombre                      varchar(30) not null);

comment on table estado_paralelo_peticion is 'Tabla con los estados de un paralelo de cálculo.';

comment on column estado_paralelo_peticion.id_estado_paralelo_peticion is 'Identificador autogenerado';

comment on column estado_paralelo_peticion.nombre is 'Nombre del estado.';

grant delete, insert, select, update on table estado_paralelo_peticion to rcompensacion_comision;

grant select on table estado_paralelo_peticion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_paralelo_peticion to rmantenimiento_compensacion_comision;

grant select on table estado_paralelo_peticion to rcompensacion_comision_meta4;

grant select on table estado_paralelo_peticion to rservicios_sil_sistema_informacional;

grant select on table estado_paralelo_peticion to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_paralelo_peticion to rmantenimiento_income;

create table estado_periodo_calculo_persona
(id_estado_periodo_calculo_persona integer             not null
        constraint pk_estado_periodo_calculo_persona
            primary key,
    nombre                            varchar(128) not null,
    peso                              integer             not null);

comment on table estado_periodo_calculo_persona is 'Maestro de estados del empleado:
1	SIN CALCULAR	100
2	CALCULADO	300
3	CONFIRMADO	400
4	CALCULADO_ERROR	200
5	EXPORTADO	500
6	RECUPERADO	600
7	PAGADO	700';

comment on column estado_periodo_calculo_persona.id_estado_periodo_calculo_persona is 'Identificador de la tabla';

comment on column estado_periodo_calculo_persona.nombre is 'Descripción';

comment on column estado_periodo_calculo_persona.peso is 'Peso, defien el peso de un estado sobre otros';

grant select on table estado_periodo_calculo_persona to rreporting_services_rrhh;

grant delete, insert, select, update on table estado_periodo_calculo_persona to rcompensacion_comision;

grant select on table estado_periodo_calculo_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_periodo_calculo_persona to rmantenimiento_compensacion_comision;

grant select on table estado_periodo_calculo_persona to rcompensacion_comision_meta4;

grant select on table estado_periodo_calculo_persona to rservicios_sil_sistema_informacional;

grant select on table estado_periodo_calculo_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_periodo_calculo_persona to rmantenimiento_income;

create table estado_proceso
(id_estado_proceso integer             not null
        constraint pk_estado_proceso
            primary key,
    nombre            varchar(128) not null);

comment on table estado_proceso is 'Tabla con los posibles estados de un proceso';

comment on column estado_proceso.id_estado_proceso is 'Identificador del estado del proceso';

comment on column estado_proceso.nombre is 'Descripción del estado del proceso';

grant delete, insert, select, update on table estado_proceso to rcompensacion_comision;

grant select on table estado_proceso to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_proceso to rmantenimiento_compensacion_comision;

grant select on table estado_proceso to rcompensacion_comision_meta4;

grant insert, select, update on table estado_proceso to rmantenimiento_income;

create table estado_tarea
(id_estado_tarea integer             not null
        constraint pk_estado_tarea
            primary key,
    nombre          varchar(128) not null,
    peso            integer default 0);

comment on table estado_tarea is 'Tablas con los estados de las tareas del cáluclo PENDIENTE-EN_CURSO-FINALIZADO-SIN_ERRORES-FINALIZADO_CON_ERRORES-ERROR';

comment on column estado_tarea.id_estado_tarea is 'Identificador del estado de la tarea del cálculo';

comment on column estado_tarea.nombre is 'Descripoción del estado';

comment on column estado_tarea.peso is 'Peso, define el peso de un estado sobre otros';

grant select on table estado_tarea to rreporting_services_rrhh;

grant delete, insert, select, update on table estado_tarea to rcompensacion_comision;

grant select on table estado_tarea to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_tarea to rmantenimiento_compensacion_comision;

grant select on table estado_tarea to rcompensacion_comision_meta4;

grant select on table estado_tarea to rservicios_sil_sistema_informacional;

grant select on table estado_tarea to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_tarea to rmantenimiento_income;

create table estado_tarea_fase
(id_estado_tarea_fase integer             not null
        constraint pk_estado_tarea_fase
            primary key,
    nombre               varchar(128) not null,
    peso                 integer);

comment on table estado_tarea_fase is 'Tabla con estados fase por tarea';

comment on column estado_tarea_fase.id_estado_tarea_fase is 'Identificador del estado de tarea fase';

comment on column estado_tarea_fase.nombre is 'Nombre de la tarea fase';

comment on column estado_tarea_fase.peso is 'Peso, define el peso de una tarea fase sobre otras';

grant delete, insert, select, update on table estado_tarea_fase to rcompensacion_comision;

grant select on table estado_tarea_fase to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_tarea_fase to rmantenimiento_compensacion_comision;

grant select on table estado_tarea_fase to rcompensacion_comision_meta4;

grant select on table estado_tarea_fase to rservicios_sil_sistema_informacional;

grant select on table estado_tarea_fase to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_tarea_fase to rmantenimiento_income;

create table estado_tarea_fase_accion
(id_estado_tarea_fase_accion integer             not null
        constraint pk_estado_tarea_fase_accion
            primary key,
    nombre                      varchar(128) not null,
    peso                        integer);

comment on table estado_tarea_fase_accion is 'Tabla con estados tarea fase acción';

comment on column estado_tarea_fase_accion.id_estado_tarea_fase_accion is 'Identificador del estado tarea fase';

comment on column estado_tarea_fase_accion.nombre is 'Nombre del estado tarea fase accion';

comment on column estado_tarea_fase_accion.peso is 'Peso, define el peso de una tarea fase acción sobre otras';

grant select on table estado_tarea_fase_accion to rreporting_services_rrhh;

grant delete, insert, select, update on table estado_tarea_fase_accion to rcompensacion_comision;

grant select on table estado_tarea_fase_accion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_tarea_fase_accion to rmantenimiento_compensacion_comision;

grant select on table estado_tarea_fase_accion to rcompensacion_comision_meta4;

grant select on table estado_tarea_fase_accion to rservicios_sil_sistema_informacional;

grant select on table estado_tarea_fase_accion to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_tarea_fase_accion to rmantenimiento_income;

create table estado_tarea_persona
(id_estado_tarea_persona integer             not null
        constraint pk_estado_tarea_persona
            primary key,
    nombre                  varchar(128) not null,
    peso                    integer default 0);

comment on table estado_tarea_persona is 'Tabla con el estado del cálculo para una empleado PENDIENTE OK-KO';

comment on column estado_tarea_persona.id_estado_tarea_persona is 'Identificador de la tabla';

comment on column estado_tarea_persona.nombre is 'Nombre del estao OK-KO';

comment on column estado_tarea_persona.peso is 'Peso, define el peso de un estado sobre otros';

grant delete, insert, select, update on table estado_tarea_persona to rcompensacion_comision;

grant select on table estado_tarea_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_tarea_persona to rmantenimiento_compensacion_comision;

grant select on table estado_tarea_persona to rcompensacion_comision_meta4;

grant select on table estado_tarea_persona to rservicios_sil_sistema_informacional;

grant select on table estado_tarea_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_tarea_persona to rmantenimiento_income;

create table estado_trabajo
(id_estado_trabajo integer             not null
        constraint pk_estado_trabajo
            primary key,
    nombre            varchar(128) not null,
    peso              integer default 0,
    id_estado_tarea   integer             not null
        constraint fk_estado_trabajo_estado_tarea
            references estado_tarea);

comment on table estado_trabajo is 'Tabla con los estados de los trabajos del cáluclo PENDIENTE-EN_CURSO-OK-KO';

comment on column estado_trabajo.id_estado_trabajo is 'Identificador del estado del trabajo de cálculo';

comment on column estado_trabajo.nombre is 'Descripoción del estado';

comment on column estado_trabajo.peso is 'Peso, define el peso de un estado sobre otros';

comment on column estado_trabajo.id_estado_tarea is 'Identificador del estado de tarea correspondiente con el estado de trabajo';

create index ix_estado_trabajo_estado_tarea
    on estado_trabajo (id_estado_tarea);

grant delete, insert, select, update on table estado_trabajo to rcompensacion_comision;

grant select on table estado_trabajo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table estado_trabajo to rmantenimiento_compensacion_comision;

grant select on table estado_trabajo to rcompensacion_comision_meta4;

grant select on table estado_trabajo to rservicios_sil_sistema_informacional;

grant select on table estado_trabajo to rreporting_sil_sistema_informacional;

grant insert, select, update on table estado_trabajo to rmantenimiento_income;

create table fase
(id_fase integer             not null
        constraint pk_fase
            primary key,
    nombre  varchar(128) not null,
    peso    integer);

comment on table fase is 'Fases de ejecución de comprobaciones:
Recolectar, Validar recolección, Procesar, Calcular, Regularizar Challenge, Regularizar, Ajustar';

comment on column fase.id_fase is 'Identificador de la fase';

comment on column fase.nombre is 'Nombre de la fase: Recolectar, Validar recolección, Procesar, Calcular
Regularizar Challenge, Regularizar, Ajustar';

comment on column fase.peso is 'Peso, define el peso de una fase sobre otras';

grant delete, insert, select, update on table fase to rcompensacion_comision;

grant select on table fase to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table fase to rmantenimiento_compensacion_comision;

grant select on table fase to rcompensacion_comision_meta4;

grant select on table fase to rservicios_sil_sistema_informacional;

grant select on table fase to rreporting_sil_sistema_informacional;

grant insert, select, update on table fase to rmantenimiento_income;

create table localizacion_ficticia_historico
(ccl_id_origen     varchar(24) not null,
    std_id_leg_ent    varchar(24) not null,
    ccl_id_cod_origen varchar(24) not null,
    fecha_inicio      date                       not null,
    fecha_fin         date                       not null,
    ccl_id_cadena     varchar(12) not null,
    std_id_work_locat varchar(24) not null,
    std_id_country    varchar(4)  not null,
    constraint pk_localizacion_ficticia_historico
        primary key (ccl_id_origen, std_id_leg_ent, ccl_id_cod_origen, fecha_inicio));

comment on table localizacion_ficticia_historico is 'Tabla con los históricos de localizaciones fisticias de SIL';

comment on column localizacion_ficticia_historico.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column localizacion_ficticia_historico.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column localizacion_ficticia_historico.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column localizacion_ficticia_historico.fecha_inicio is 'Fecha inicio';

comment on column localizacion_ficticia_historico.fecha_fin is 'Fecha fin';

comment on column localizacion_ficticia_historico.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column localizacion_ficticia_historico.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column localizacion_ficticia_historico.std_id_country is 'Id de país, tabla STD_COUNTRY Maestro de páises';

grant select on table localizacion_ficticia_historico to rmonitorizacion_data_quality;

grant select on table localizacion_ficticia_historico to raplicacion_data_quality;

grant delete, insert, select, update on table localizacion_ficticia_historico to rcompensacion_comision;

grant select on table localizacion_ficticia_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table localizacion_ficticia_historico to rmantenimiento_compensacion_comision;

grant select on table localizacion_ficticia_historico to rcompensacion_comision_meta4;

grant select on table localizacion_ficticia_historico to rservicios_sil_sistema_informacional;

grant select on table localizacion_ficticia_historico to rreporting_sil_sistema_informacional;

grant insert, select, update on table localizacion_ficticia_historico to rmantenimiento_income;

create table mail_ambito
(ccl_id_origen  varchar(24) not null,
    std_id_leg_ent varchar(24) not null,
    mail           varchar(255)        not null,
    es_activo      numeric(1),
    constraint mail_ambito_pk
        primary key (mail, ccl_id_origen, std_id_leg_ent));

comment on table mail_ambito is 'Tabla que almacena las direcciones de correo segun origen y empresa a las que reenviar los fallos en las validaciones';

comment on column mail_ambito.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronizaci��n';

comment on column mail_ambito.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column mail_ambito.mail is 'Direccion de correo asociada';

comment on column mail_ambito.es_activo is 'Campo utilizado para activar/desactivar';

grant delete, insert, select, update on table mail_ambito to rcompensacion_comision;

grant select on table mail_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table mail_ambito to rmantenimiento_compensacion_comision;

grant select on table mail_ambito to rcompensacion_comision_meta4;

grant insert, select, update on table mail_ambito to rmantenimiento_income;

create table mail_entorno
(entorno   varchar(8) not null
        constraint mail_entorno_pk
            primary key,
    es_activo numeric(1)        not null);

comment on table mail_entorno is 'Tabla que almacena los entornos en los que estará activo el envío de mails con fallos en las validaciones';

grant delete, insert, select, update on table mail_entorno to rcompensacion_comision;

grant select on table mail_entorno to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table mail_entorno to rmantenimiento_compensacion_comision;

grant select on table mail_entorno to rcompensacion_comision_meta4;

grant insert, select, update on table mail_entorno to rmantenimiento_income;

create table paralelo_peticion
(id_paralelo_peticion          bigint generated always as identity (start with 1)
        constraint pk_paralelo_peticion
            primary key,
    id_estado_paralelo_peticion   bigint                     not null
        constraint fk_paralelo_peticion_estado_paralelo_peticion
            references estado_paralelo_peticion,
    id_organization               varchar(24) not null,
    ccl_id_origen                 varchar(24) not null,
    std_id_leg_ent                varchar(24) not null,
    icm_id_periodo                bigint                     not null,
    fecha_hora_inicio_periodo     timestamp(6)               not null,
    fecha_hora_fin_periodo        timestamp(6)               not null,
    porcentaje_tolerancia_total   numeric(10,4)             not null,
    porcentaje_tolerancia_detalle numeric(10,4)             not null,
    fecha_alta                    timestamp(6)               not null,
    usuario_alta                  varchar(40)         not null,
    fecha_hora_inicio             timestamp(6),
    fecha_hora_fin                timestamp(6));

comment on table paralelo_peticion is 'Solicitudes de comparativas del paralelo de cálculo COMIS - INCOME.';

comment on column paralelo_peticion.id_paralelo_peticion is 'Identificador autogenerado de la tabla';

comment on column paralelo_peticion.id_estado_paralelo_peticion is 'Identificador del estado del paralelo de cálculo.';

comment on column paralelo_peticion.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION,Maestro de organizaciones';

comment on column paralelo_peticion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column paralelo_peticion.std_id_leg_ent is '''Id empresa STD_LEG_ENT Maestro de empresas';

comment on column paralelo_peticion.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column paralelo_peticion.fecha_hora_inicio_periodo is 'Fecha de inicio del período para el cual se realiza el paralelo de cálculo.';

comment on column paralelo_peticion.fecha_hora_fin_periodo is 'Fecha de fin del período para el cual se realiza el paralelo de cálculo.';

comment on column paralelo_peticion.porcentaje_tolerancia_total is 'Porcentaje a aplicar sobre los totales del paralelo de cálculo, que indica qué porcentaje de diferencia sobre los cálculos de los dos sistemas no se consideran error.';

comment on column paralelo_peticion.porcentaje_tolerancia_detalle is 'Porcentaje a aplicar sobre los detalles del paralelo de cálculo, que indica qué porcentaje de diferencia sobre los cálculos de los dos sistemas no se consideran error.';

comment on column paralelo_peticion.fecha_alta is 'Campo Auditoria Fecha de solicitud del paralelo de cálculo.';

comment on column paralelo_peticion.usuario_alta is 'Campo de Auditoria Usuario que solicita el paralelo de cálculo (Usuario de alta del paralelo de calculo).';

comment on column paralelo_peticion.fecha_hora_inicio is 'Fecha de inicio de ejecución del paralelo de cálculo.';

comment on column paralelo_peticion.fecha_hora_fin is 'Fecha de fin de ejecución del parapelo de cálculo.';

create table paralelo_comparativa_politicas
(id_paralelo_comparativa_politicas   bigint generated always as identity (cache 100)
        constraint pk_paralelo_comparativa_politicas
            primary key,
    id_paralelo_peticion                bigint                     not null
        constraint fk_paralelo_comparativa_politicas_paralelo_peticion
            references paralelo_peticion,
    fecha_calculo                       date                       not null,
    ccl_id_person                       varchar(24) not null,
    importe_comision_sin_baja_it_comis  numeric(23,8),
    importe_comision_sin_baja_it_income numeric(23,8),
    importe_comision_con_baja_it_comis  numeric(23,8),
    importe_comision_con_baja_it_income numeric(23,8),
    es_baja_it_comis                    numeric(1),
    es_baja_it_income                   numeric(1),
    porcentaje_ajuste_baja_it_comis     numeric(10,4),
    porcentaje_ajuste_baja_it_income    numeric(10,4),
    importe_baja_it_comis               numeric(23,8),
    importe_baja_it_income              numeric(23,8),
    es_carencia_income                  numeric(1),
    es_diferencia                       numeric(1)                 not null);

comment on table paralelo_comparativa_politicas is 'Resultados de las comparativas del paralelo de cálculo con y sin políticas.';

comment on column paralelo_comparativa_politicas.id_paralelo_comparativa_politicas is 'Identificador autogenerado de la tabla.';

comment on column paralelo_comparativa_politicas.id_paralelo_peticion is 'Identificador del paralelo de cálculo.';

comment on column paralelo_comparativa_politicas.fecha_calculo is 'Fecha dentro del período de cálculo.';

comment on column paralelo_comparativa_politicas.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column paralelo_comparativa_politicas.importe_comision_sin_baja_it_comis is 'Importe total de la comisión sin tener en cuenta el ajuste por baja IT';

comment on column paralelo_comparativa_politicas.importe_comision_sin_baja_it_income is 'Importe de la comisión calculada sin tener en cuenta la política de baja IT';

comment on column paralelo_comparativa_politicas.importe_comision_con_baja_it_comis is 'Importe total de la comisión teniendo en cuenta el ajuste por baja IT';

comment on column paralelo_comparativa_politicas.importe_comision_con_baja_it_income is 'Importe de la comisión calculada teniendo en cuenta la política de baja IT';

comment on column paralelo_comparativa_politicas.es_baja_it_comis is 'Indicador de si aplica baja IT al empleado en COMIS. Valores posibles:
- 0: No aplica baja IT
- 1: Aplica baja IT
- NULL: No existe el registro en COMIS';

comment on column paralelo_comparativa_politicas.es_baja_it_income is 'Indicador de si aplica baja IT al empleado en INCOME. Valores posibles:
- 0: No aplica baja IT
- 1: Aplica baja IT
- NULL: No existe el registro en INCOME';

comment on column paralelo_comparativa_politicas.porcentaje_ajuste_baja_it_comis is 'Porcentaje que se reduce a un empleado por baja IT';

comment on column paralelo_comparativa_politicas.porcentaje_ajuste_baja_it_income is 'Porcentaje que se reduce a un empleado por baja IT';

comment on column paralelo_comparativa_politicas.importe_baja_it_comis is 'Importe que se reduce a un empleado por baja IT';

comment on column paralelo_comparativa_politicas.importe_baja_it_income is 'Importe que se reduce a un empleado por baja IT';

comment on column paralelo_comparativa_politicas.es_carencia_income is 'Indicador de si aplica carencia en INCOME. Valores posibles:
- 0: No aplica carencia
- 1: Aplica carencia
- NULL: No existe el registro en INCOME';

comment on column paralelo_comparativa_politicas.es_diferencia is 'Indicador de si la tupla presenta o no diferencias de importes';

create index ix_paralelo_comparativa_politicas_01
    on paralelo_comparativa_politicas (id_paralelo_peticion, es_diferencia);

create index ix_paralelo_comparativa_politicas_paralelo_peticion
    on paralelo_comparativa_politicas (id_paralelo_peticion);

grant delete, insert, select, update on table paralelo_comparativa_politicas to rcompensacion_comision;

grant select on table paralelo_comparativa_politicas to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_politicas to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_politicas to rcompensacion_comision_meta4;

grant select on table paralelo_comparativa_politicas to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_politicas to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_politicas to rmantenimiento_income;

create table paralelo_comparativa_total
(id_paralelo_comparativa_total bigint generated always as identity (start with 1 cache 100)
        constraint pk_paralelo_comparativa_total
            primary key,
    id_paralelo_peticion          bigint                     not null
        constraint fk_paralelo_comparativa_total_paralelo_peticion
            references paralelo_peticion,
    ccl_id_person                 varchar(24) not null,
    importe_comis                 numeric(23,8),
    importe_income                numeric(23,8),
    importe_diferencia            numeric(23,8),
    es_diferencia                 numeric(1)                 not null);

comment on table paralelo_comparativa_total is 'Resultados totalizados de las comparativas del paralelo de cálculo.';

comment on column paralelo_comparativa_total.id_paralelo_comparativa_total is 'Identificador autogenerado de la tabla.';

comment on column paralelo_comparativa_total.id_paralelo_peticion is 'Identificador del paralelo de cálculo.';

comment on column paralelo_comparativa_total.ccl_id_person is 'Id. Local, viene de STD_HR_PERIO, no hay tabla maestra de este campo';

comment on column paralelo_comparativa_total.importe_comis is 'Importe de comisión calculado en COMIS';

comment on column paralelo_comparativa_total.importe_income is 'Importe de comisión calculado en INCOME';

comment on column paralelo_comparativa_total.importe_diferencia is 'Diferencia de importe INCOME / COMIS';

comment on column paralelo_comparativa_total.es_diferencia is 'Indicador de si la tupla presenta o no diferencias de importes.';

create index ix_paralelo_comparativa_total_01
    on paralelo_comparativa_total (id_paralelo_peticion, es_diferencia);

create index ix_paralelo_comparativa_total_paralelo_peticion
    on paralelo_comparativa_total (id_paralelo_peticion);

grant delete, insert, select, update on table paralelo_comparativa_total to rcompensacion_comision;

grant select on table paralelo_comparativa_total to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_total to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_total to rcompensacion_comision_meta4;

grant select on table paralelo_comparativa_total to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_total to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_total to rmantenimiento_income;

create index ix_paralelo_peticion_estado_paralelo_peticion
    on paralelo_peticion (id_estado_paralelo_peticion);

grant delete, insert, select, update on table paralelo_peticion to rcompensacion_comision;

grant select on table paralelo_peticion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_peticion to rmantenimiento_compensacion_comision;

grant select on table paralelo_peticion to rcompensacion_comision_meta4;

grant select on table paralelo_peticion to rservicios_sil_sistema_informacional;

grant select on table paralelo_peticion to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_peticion to rmantenimiento_income;

create table periodo_localizacion
(std_id_leg_ent    varchar(24) not null,
    std_id_work_locat varchar(24) not null,
    ccl_id_origen     varchar(24) not null,
    icm_id_periodo    bigint                     not null,
    constraint pk_periodo_localizacion
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, std_id_work_locat));

comment on table periodo_localizacion is 'Tabla con las localizaciones afectadas en cada periodo calculado';

comment on column periodo_localizacion.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column periodo_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column periodo_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column periodo_localizacion.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

grant delete, insert, select, update on table periodo_localizacion to rcompensacion_comision;

grant select on table periodo_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table periodo_localizacion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table periodo_localizacion to rcompensacion_comision_meta4;

grant select on table periodo_localizacion to rservicios_sil_sistema_informacional;

grant select on table periodo_localizacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table periodo_localizacion to rmantenimiento_income;

create table periodo_localizacion_persona
(std_id_leg_ent    varchar(24) not null,
    std_id_work_locat varchar(24) not null,
    ccl_id_origen     varchar(24) not null,
    icm_id_periodo    bigint                     not null,
    ccl_id_person     varchar(24) not null,
    constraint pk_periodo_localizacion_persona
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, ccl_id_person, std_id_work_locat));

comment on table periodo_localizacion_persona is 'Agrupación de empleado calculado periodo fecha localizado';

comment on column periodo_localizacion_persona.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column periodo_localizacion_persona.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column periodo_localizacion_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column periodo_localizacion_persona.icm_id_periodo is 'id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column periodo_localizacion_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIO, no hay tabla maestra de este campo';

grant delete, insert, select, update on table periodo_localizacion_persona to rcompensacion_comision;

grant select on table periodo_localizacion_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table periodo_localizacion_persona to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table periodo_localizacion_persona to rcompensacion_comision_meta4;

grant select on table periodo_localizacion_persona to retl_rrhh;

grant select on table periodo_localizacion_persona to rservicios_sil_sistema_informacional;

grant select on table periodo_localizacion_persona to rreporting_sil_sistema_informacional;

grant select on table periodo_localizacion_persona to rbrecha_salarial;

grant select on table periodo_localizacion_persona to rmonitorizacion_brecha_salarial;

grant insert, select, update on table periodo_localizacion_persona to rmantenimiento_income;

grant select on table periodo_localizacion_persona to rmantenimiento_brechasala;

create table periodo_persona
(std_id_leg_ent varchar(24) not null,
    ccl_id_origen  varchar(24) not null,
    icm_id_periodo bigint                     not null,
    ccl_id_person  varchar(24) not null,
    constraint pk_periodo_persona
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, ccl_id_person));

comment on table periodo_persona is 'Tabla con las personas afectadas en cada periodo.';

comment on column periodo_persona.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column periodo_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column periodo_persona.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column periodo_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIO, no hay tabla maestra de este campo';

grant delete, insert, select, update on table periodo_persona to rcompensacion_comision;

grant select on table periodo_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table periodo_persona to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table periodo_persona to rcompensacion_comision_meta4;

grant select on table periodo_persona to rservicios_sil_sistema_informacional;

grant select on table periodo_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table periodo_persona to rmantenimiento_income;

create table punto_ejecucion
(id_punto_ejecucion integer             not null
        constraint pk_punto_ejecucion
            primary key,
    nombre             varchar(128) not null);

comment on table punto_ejecucion is 'Puntos de ejecución de las diferentes acciones de comprobación:
Antes, Durante, Despues, Error';

comment on column punto_ejecucion.id_punto_ejecucion is 'Identificador del punto de ejecución';

comment on column punto_ejecucion.nombre is 'Nombre del punto de ejecución: Antes, Durante, Despues, Error';

create table fase_accion
(id_fase            integer not null
        constraint fk_fase_accion_fase
            references fase,
    id_accion          integer not null
        constraint fk_fase_accion_accion
            references accion,
    id_punto_ejecucion integer not null
        constraint fk_fase_accion_punto_ejecucion
            references punto_ejecucion,
    peso               integer,
    constraint pk_fase_accion
        primary key (id_fase, id_accion));

comment on table fase_accion is 'Relación entre fases y acciones';

comment on column fase_accion.id_fase is 'Identificador de la fase';

comment on column fase_accion.id_accion is 'Identificador de la acción';

comment on column fase_accion.id_punto_ejecucion is 'Identificador del punto de ejecución';

comment on column fase_accion.peso is 'Peso, define el peso de una fase acción sobre otras';

create index ix_fase_accion_accion
    on fase_accion (id_accion);

create index ix_fase_accion_fase
    on fase_accion (id_fase);

create index ix_fase_accion_punto_ejecucion
    on fase_accion (id_punto_ejecucion);

grant delete, insert, select, update on table fase_accion to rcompensacion_comision;

grant select on table fase_accion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table fase_accion to rmantenimiento_compensacion_comision;

grant select on table fase_accion to rcompensacion_comision_meta4;

grant select on table fase_accion to rservicios_sil_sistema_informacional;

grant select on table fase_accion to rreporting_sil_sistema_informacional;

grant insert, select, update on table fase_accion to rmantenimiento_income;

grant delete, insert, select, update on table punto_ejecucion to rcompensacion_comision;

grant select on table punto_ejecucion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table punto_ejecucion to rmantenimiento_compensacion_comision;

grant select on table punto_ejecucion to rcompensacion_comision_meta4;

grant select on table punto_ejecucion to rservicios_sil_sistema_informacional;

grant select on table punto_ejecucion to rreporting_sil_sistema_informacional;

grant insert, select, update on table punto_ejecucion to rmantenimiento_income;

create table regla_empleado_externo_meta4
(ccl_id_origen   varchar(24) not null,
    id_organization varchar(24) not null,
    std_id_leg_ent  varchar(24) not null,
    puesto          integer                    not null,
    es_activo       numeric(1)                 not null,
    std_id_hr_type  varchar(24) not null,
    constraint pk_regla_empleado_externo_meta4
        primary key (ccl_id_origen, std_id_leg_ent, puesto, std_id_hr_type));

comment on table regla_empleado_externo_meta4 is 'Tabla que almacena el conjunto de reglas para los externos recuperados de Meta4 por origen';

comment on column regla_empleado_externo_meta4.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column regla_empleado_externo_meta4.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION,Maestro de organizaciones';

comment on column regla_empleado_externo_meta4.std_id_leg_ent is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column regla_empleado_externo_meta4.puesto is 'Id puesto';

comment on column regla_empleado_externo_meta4.es_activo is 'Campo para la activación/desactivación';

comment on column regla_empleado_externo_meta4.std_id_hr_type is 'Id. Tipo de empleado, STD_HR_PERIOD';

grant delete, insert, select, update on table regla_empleado_externo_meta4 to rcompensacion_comision;

grant select on table regla_empleado_externo_meta4 to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table regla_empleado_externo_meta4 to rmantenimiento_compensacion_comision;

grant select on table regla_empleado_externo_meta4 to rcompensacion_comision_meta4;

create table regla_validacion_excedidos
(ccl_id_origen   varchar(24) not null,
    std_id_leg_ent  varchar(24) not null,
    id_tipo_calculo varchar(12) not null,
    importe         numeric(23)                not null,
    constraint pk_regla_validacion_excedidos
        primary key (ccl_id_origen, std_id_leg_ent, id_tipo_calculo));

grant delete, insert, select, update on table regla_validacion_excedidos to rcompensacion_comision;

grant select on table regla_validacion_excedidos to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table regla_validacion_excedidos to rcompensacion_comision_meta4;

create table tipo_ambito
(id_tipo_ambito integer             not null
        constraint pk_tipo_ambito
            primary key,
    nombre         varchar(128) not null);

comment on table tipo_ambito is 'Tabla con los tipos de ambito de SOCIEDAD -ORIGEN -EMPRESA -LOCALIZACION -PERSONA';

comment on column tipo_ambito.id_tipo_ambito is 'Indentificador del tipo de ambito';

comment on column tipo_ambito.nombre is 'Descripción del tipo de ambito';

create table programacion
(id_programacion                bigint generated always as identity (cache 100)
        constraint pk_programacion
            primary key,
    id_tipo_ambito                 integer            not null
        constraint fk_programacion_tipo_ambito
            references tipo_ambito,
    es_activo                      numeric(1)         not null,
    fecha_hora_creacion            timestamp(6)       not null,
    fecha_hora_siguiente_ejecucion timestamp(6)       not null,
    fecha_hora_ultima_ejecucion    timestamp(6),
    hora_programacion              time without time zone               not null,
    programacion_huso              varchar(12) not null,
    nombre_usuario                 varchar(32) not null);

comment on table programacion is 'Tabla con las programaciones de cálculo';

comment on column programacion.id_programacion is 'Identificador de la programacion';

comment on column programacion.id_tipo_ambito is 'Indentificador del tipo de ambito';

comment on column programacion.es_activo is 'Indica si la programación esta activa';

comment on column programacion.fecha_hora_creacion is 'Fecha de creación';

comment on column programacion.fecha_hora_siguiente_ejecucion is 'Fecha de la siguinte ejecución programada';

comment on column programacion.fecha_hora_ultima_ejecucion is 'Fecha hora de la ultima ejecución programada';

comment on column programacion.hora_programacion is 'hora de la programación';

comment on column programacion.programacion_huso is 'Huso horario de la programacion';

comment on column programacion.nombre_usuario is 'Identificador del usuario que lanza el trabajo';

create index ix_programacion_tipo_ambito
    on programacion (id_tipo_ambito);

grant delete, insert, select, update on table programacion to rcompensacion_comision;

grant select on table programacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion to rcompensacion_comision_meta4;

grant select on table programacion to rservicios_sil_sistema_informacional;

grant select on table programacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion to rmantenimiento_income;

create table programacion_ambito
(id_programacion_ambito bigint generated always as identity (cache 100)
        constraint pk_programacion_ambito
            primary key,
    id_programacion        bigint                     not null
        constraint fk_programacion_ambito_programacion
            references programacion,
    id_organization        varchar(24) not null);

comment on table programacion_ambito is 'Tabla con la relación de programaciones  Sociedad';

comment on column programacion_ambito.id_programacion_ambito is 'Identificador de la tabla ambito Sociedad';

comment on column programacion_ambito.id_programacion is 'Identificador de la programacion';

comment on column programacion_ambito.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION,Maestro de organizaciones';

create index ix_programacion_ambito_programacion
    on programacion_ambito (id_programacion);

grant delete, insert, select, update on table programacion_ambito to rcompensacion_comision;

grant select on table programacion_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito to rcompensacion_comision_meta4;

grant select on table programacion_ambito to rservicios_sil_sistema_informacional;

grant select on table programacion_ambito to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion_ambito to rmantenimiento_income;

create table programacion_ambito_empresa
(id_programacion_ambito_empresa bigint generated always as identity (cache 100)
        constraint pk_programacion_ambito_empresa
            primary key,
    id_programacion_ambito         bigint                     not null
        constraint fk_programacion_ambito_empresa_programacion_ambito
            references programacion_ambito,
    std_id_leg_ent                 varchar(24) not null);

comment on table programacion_ambito_empresa is 'Tabla conla la relacion de programaciones empresa';

comment on column programacion_ambito_empresa.id_programacion_ambito_empresa is 'Identificador de la de la tabla ambito empresa';

comment on column programacion_ambito_empresa.id_programacion_ambito is 'Identificador de del ambito';

comment on column programacion_ambito_empresa.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

create index ix_programacion_ambito_empresa_programacion_ambito
    on programacion_ambito_empresa (id_programacion_ambito);

grant delete, insert, select, update on table programacion_ambito_empresa to rcompensacion_comision;

grant select on table programacion_ambito_empresa to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_empresa to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_empresa to rcompensacion_comision_meta4;

grant select on table programacion_ambito_empresa to rservicios_sil_sistema_informacional;

grant select on table programacion_ambito_empresa to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion_ambito_empresa to rmantenimiento_income;

create table programacion_ambito_localizacion
(id_programacion_ambito_localizacion bigint generated always as identity (cache 100)
        constraint pk_programacion_ambito_localizacion
            primary key,
    id_programacion_ambito              bigint                     not null
        constraint fk_programacion_ambito_localizacion_programacion_ambito
            references programacion_ambito,
    std_id_leg_ent                      varchar(24) not null,
    std_id_work_locat                   varchar(24) not null,
    ccl_id_origen                       varchar(24) not null);

comment on table programacion_ambito_localizacion is 'Tabla conla la relacion de programaciones localizacion';

comment on column programacion_ambito_localizacion.id_programacion_ambito_localizacion is 'Indentificador de la tabla';

comment on column programacion_ambito_localizacion.id_programacion_ambito is 'Identificador del ambito';

comment on column programacion_ambito_localizacion.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column programacion_ambito_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column programacion_ambito_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_programacion_ambito_localizacion_programacion_ambito
    on programacion_ambito_localizacion (id_programacion_ambito);

grant delete, insert, select, update on table programacion_ambito_localizacion to rcompensacion_comision;

grant select on table programacion_ambito_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_localizacion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_localizacion to rcompensacion_comision_meta4;

grant select on table programacion_ambito_localizacion to rservicios_sil_sistema_informacional;

grant select on table programacion_ambito_localizacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion_ambito_localizacion to rmantenimiento_income;

create table programacion_ambito_origen
(id_programacion_ambito_origen bigint generated always as identity (cache 100)
        constraint pk_programacion_ambito_origen
            primary key,
    id_programacion_ambito        bigint                     not null
        constraint fk_programacion_ambito_origen_programacion_ambito
            references programacion_ambito,
    ccl_id_origen                 varchar(24) not null);

comment on table programacion_ambito_origen is 'Tabla con la relacion de programaciones origen';

comment on column programacion_ambito_origen.id_programacion_ambito_origen is 'Identificador de la tabla';

comment on column programacion_ambito_origen.id_programacion_ambito is 'Identificador del ambito';

comment on column programacion_ambito_origen.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_programacion_ambito_origen_programacion_ambito
    on programacion_ambito_origen (id_programacion_ambito);

grant delete, insert, select, update on table programacion_ambito_origen to rcompensacion_comision;

grant select on table programacion_ambito_origen to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_origen to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_origen to rcompensacion_comision_meta4;

grant select on table programacion_ambito_origen to rservicios_sil_sistema_informacional;

grant select on table programacion_ambito_origen to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion_ambito_origen to rmantenimiento_income;

create table programacion_ambito_persona
(id_programacion_ambito_persona bigint generated always as identity (cache 100)
        constraint pk_programacion_ambito_persona
            primary key,
    id_programacion_ambito         bigint                     not null
        constraint fk_programacion_ambito_persona_programacion_ambito
            references programacion_ambito,
    std_id_leg_ent                 varchar(24) not null,
    ccl_id_origen                  varchar(24) not null,
    ccl_id_person                  varchar(24) not null,
    std_or_hr_period               varchar(24) not null);

comment on table programacion_ambito_persona is 'Tabla conla la relacion de programaciones empleado';

comment on column programacion_ambito_persona.id_programacion_ambito_persona is 'Identificador de la tabla';

comment on column programacion_ambito_persona.id_programacion_ambito is 'Identificador del ambito';

comment on column programacion_ambito_persona.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column programacion_ambito_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column programacion_ambito_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column programacion_ambito_persona.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_programacion_ambito_persona_programacion_ambito
    on programacion_ambito_persona (id_programacion_ambito);

grant delete, insert, select, update on table programacion_ambito_persona to rcompensacion_comision;

grant select on table programacion_ambito_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_persona to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table programacion_ambito_persona to rcompensacion_comision_meta4;

grant select on table programacion_ambito_persona to rservicios_sil_sistema_informacional;

grant select on table programacion_ambito_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table programacion_ambito_persona to rmantenimiento_income;

grant delete, insert, select, update on table tipo_ambito to rcompensacion_comision;

grant select on table tipo_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_ambito to rmantenimiento_compensacion_comision;

grant select on table tipo_ambito to rcompensacion_comision_meta4;

grant select on table tipo_ambito to rservicios_sil_sistema_informacional;

grant select on table tipo_ambito to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_ambito to rmantenimiento_income;

create table tipo_ausencia
(id_tipo_ausencia integer             not null
        constraint pk_tipo_ausencia
            primary key,
    nombre           varchar(128) not null,
    icm_tp_absence   integer             not null);

comment on table tipo_ausencia is 'Tabla con los tipos de ausencia:
-BAJA IT
-VACACIONES';

comment on column tipo_ausencia.id_tipo_ausencia is 'Indentificador del tipo de ambito';

comment on column tipo_ausencia.nombre is 'Descripción del tipo de ambito';

comment on column tipo_ausencia.icm_tp_absence is 'Identificador de la tabla Meta4  M4ICM_MAP_POLIT_ABSENCES';

grant delete, insert, select, update on table tipo_ausencia to rcompensacion_comision;

grant select on table tipo_ausencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_ausencia to rmantenimiento_compensacion_comision;

grant select on table tipo_ausencia to rcompensacion_comision_meta4;

grant select on table tipo_ausencia to rservicios_sil_sistema_informacional;

grant select on table tipo_ausencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_ausencia to rmantenimiento_income;

create table tipo_calculo
(id_tipo_calculo varchar(12) not null
        constraint pk_tipo_calculo
            primary key,
    nombre          varchar(128)        not null);

comment on table tipo_calculo is 'Tabla con los tipos de calculo NINGUNO,,GLOBAL_TIENDA,GLOBAL_SECCION,DIRECTO_SOBRE_VENTA,DIRECTO_SOBRE_VENTA_CON_PRESENCIA,DIRECTO_SOBRE_VENTA_CON_REDUCCION_DE_JORNADA
... Representacion del maestro de meta4 para InCome M4ICM_X_TP_CALCULO';

comment on column tipo_calculo.id_tipo_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

comment on column tipo_calculo.nombre is 'Descripcion del tipo de  cálculo';

create table algoritmo_tipo_calculo
(id_algoritmo    integer                    not null
        constraint fk_algoritmo_tipo_calculo_algoritmo
            references algoritmo,
    id_tipo_calculo varchar(12) not null
        constraint fk_algoritmo_tipo_calculo_tipo_calculo
            references tipo_calculo,
    constraint pk_algoritmo_tipo_calculo
        primary key (id_algoritmo, id_tipo_calculo));

comment on table algoritmo_tipo_calculo is 'Tabla con La relacion entre los agoritmos y los tipos de cálculo';

comment on column algoritmo_tipo_calculo.id_algoritmo is 'Identificador del Algoritmo';

comment on column algoritmo_tipo_calculo.id_tipo_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

create index ix_algoritmo_tipo_calculo_algoritmo
    on algoritmo_tipo_calculo (id_algoritmo);

create index ix_algoritmo_tipo_calculo_tipo_calculo
    on algoritmo_tipo_calculo (id_tipo_calculo);

grant delete, insert, select, update on table algoritmo_tipo_calculo to rcompensacion_comision;

grant select on table algoritmo_tipo_calculo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table algoritmo_tipo_calculo to rmantenimiento_compensacion_comision;

grant select on table algoritmo_tipo_calculo to rcompensacion_comision_meta4;

grant select on table algoritmo_tipo_calculo to rservicios_sil_sistema_informacional;

grant select on table algoritmo_tipo_calculo to rreporting_sil_sistema_informacional;

grant insert, select, update on table algoritmo_tipo_calculo to rmantenimiento_income;

grant delete, insert, select, update on table tipo_calculo to rcompensacion_comision;

grant select on table tipo_calculo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_calculo to rmantenimiento_compensacion_comision;

grant select on table tipo_calculo to rcompensacion_comision_meta4;

grant select on table tipo_calculo to rservicios_sil_sistema_informacional;

grant select on table tipo_calculo to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_calculo to rmantenimiento_income;

create table tipo_calculo_relacion_comis
(id_tipo_calculo_relacion_comis bigint                     not null
        constraint pk_tipo_calculo_relacion_comis
            primary key,
    id_tipo_calculo                varchar(12) not null
        constraint fk_tipo_calculo_relacion_comis_tipo_calculo
            references tipo_calculo,
    cod_tipo_calculo_comis         bigint                     not null);

comment on table tipo_calculo_relacion_comis is 'Relacion entre los tipos de cálculo INCOME y los tipos de cálculo COMIS';

comment on column tipo_calculo_relacion_comis.id_tipo_calculo_relacion_comis is 'Identificador autogenerado de la tabla';

comment on column tipo_calculo_relacion_comis.id_tipo_calculo is 'Identificador del tipo de calculo INCOME';

comment on column tipo_calculo_relacion_comis.cod_tipo_calculo_comis is 'Identificador del tipo de calculo COMIS. El origen del dato es COMIS, no existe un maestro con esta información.';

create table paralelo_comparativa_por_venta
(id_paralelo_comparativa_por_venta                  bigint generated always as identity (cache 100)
        constraint pk_paralelo_comparativa_por_venta
            primary key,
    id_paralelo_peticion                               bigint                     not null
        constraint fk_paralelo_comparativa_por_venta_paralelo_peticion
            references paralelo_peticion,
    id_tipo_calculo_relacion_comis                     bigint                     not null
        constraint fk_paralelo_comparativa_por_venta_tipo_calculo_relacion_comis
            references tipo_calculo_relacion_comis,
    fecha_calculo                                      date                       not null,
    ccl_id_person                                      varchar(24) not null,
    cod_tienda_calculo_comis                           varchar(24),
    cod_tienda_calculo_income                          varchar(24),
    cod_seccion_comis                                  varchar(2),
    cod_seccion_income                                 varchar(2),
    porcentaje_comis                                   numeric(10,4),
    porcentaje_income                                  numeric(10,4),
    cod_tipo_hora_comis                                bigint,
    cod_tipo_hora_income                               bigint,
    cod_tienda_presencias_comis                        varchar(24),
    cod_tienda_presencias_income                       varchar(24),
    cod_seccion_presencias_comis                       varchar(2),
    cod_seccion_presencias_income                      varchar(2),
    horas_presencia_empleado_comis                     bigint,
    horas_presencia_empleado_income                    bigint,
    horas_presencia_tienda_empleado_comis              bigint,
    horas_presencia_tienda_empleado_income             bigint,
    importe_venta_comis                                numeric(23,8),
    importe_venta_income                               numeric(23,8),
    importe_devoluciones_comis                         numeric(23,8),
    importe_devoluciones_income                        numeric(23,8),
    importe_venta_individual_comis                     numeric(23,8),
    importe_venta_individual_income                    numeric(23,8),
    importe_devoluciones_individuales_comis            numeric(23,8),
    importe_devoluciones_individuales_income           numeric(23,8),
    importe_venta_vendedor_0_comis                     numeric(23,8),
    importe_venta_vendedor_0_income                    numeric(23,8),
    importe_devoluciones_vendedor_0_comis              numeric(23,8),
    importe_devoluciones_vendedor_0_income             numeric(23,8),
    importe_reparto_devoluciones_vendedor_0_comis      numeric(23,8),
    importe_reparto_devoluciones_vendedor_0_income     numeric(23,8),
    importe_venta_individual_online_comis              numeric(23,8),
    importe_venta_individual_online_income             numeric(23,8),
    importe_devoluciones_individuales_online_comis     numeric(23,8),
    importe_devoluciones_individuales_online_income    numeric(23,8),
    importe_total_comision_venta_comis                 numeric(23,8),
    importe_total_comision_venta_income                numeric(23,8),
    importe_total_comision_devoluciones_comis          numeric(23,8),
    importe_total_comision_devoluciones_income         numeric(23,8),
    importe_total_venta_vendedores_comis               numeric(23,8),
    importe_total_venta_vendedores_income              numeric(23,8),
    importe_total_devoluciones_vendedores_con_0_comis  numeric(23,8),
    importe_total_devoluciones_vendedores_con_0_income numeric(23,8),
    porcentaje_venta_vendedor_comis                    numeric(10,4),
    porcentaje_venta_vendedor_income                   numeric(10,4),
    porcentaje_devolucion_vendedor_comis               numeric(10,4),
    porcentaje_devolucion_vendedor_income              numeric(10,4),
    es_diferencia                                      numeric(1)                 not null);

comment on table paralelo_comparativa_por_venta is 'Resultados de las comparativas del paralelo de cálculo para los cálculos por venta y por venta individual.';

create index ix_paralelo_comparativa_por_venta_01
    on paralelo_comparativa_por_venta (id_paralelo_peticion, es_diferencia);

create index ix_paralelo_comparativa_por_venta_paralelo_peticion
    on paralelo_comparativa_por_venta (id_paralelo_peticion);

create index ix_paralelo_comparativa_por_venta_tipo_calculo_relacion_comis
    on paralelo_comparativa_por_venta (id_tipo_calculo_relacion_comis);

grant delete, insert, select, update on table paralelo_comparativa_por_venta to rcompensacion_comision;

grant select on table paralelo_comparativa_por_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_por_venta to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_por_venta to rcompensacion_comision_meta4;

grant select on table paralelo_comparativa_por_venta to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_por_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_por_venta to rmantenimiento_income;

create index ix_tipo_calculo_relacion_comis_tipo_calculo
    on tipo_calculo_relacion_comis (id_tipo_calculo);

grant delete, insert, select, update on table tipo_calculo_relacion_comis to rcompensacion_comision;

grant select on table tipo_calculo_relacion_comis to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_calculo_relacion_comis to rmantenimiento_compensacion_comision;

grant select on table tipo_calculo_relacion_comis to rcompensacion_comision_meta4;

grant select on table tipo_calculo_relacion_comis to retl_rrhh;

grant select on table tipo_calculo_relacion_comis to rservicios_sil_sistema_informacional;

grant select on table tipo_calculo_relacion_comis to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_calculo_relacion_comis to rmantenimiento_income;

create table tipo_comision
(id_tipo_comision varchar(12) not null
        constraint pk_tipo_comision
            primary key,
    nombre           varchar(128)        not null);

comment on table tipo_comision is 'Taba con los tipo de comisión -COMISION-RESALTA_FUNCION-RESALTA_PERSONAL-RESALTA_TIENDA-INCENTIVO-COMISION_POR_TOPES-MANUAL-COMISION_DIARIA-PRIMA. Representacion del maestro de meta4 para InCome M4ICM_X_TP_COMISION';

comment on column tipo_comision.id_tipo_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestro de tipos de comisión InCome';

comment on column tipo_comision.nombre is 'Descripcion del tipo de comisión';

create table algoritmo_tipo_comision
(id_algoritmo     integer                    not null
        constraint fk_algoritmo_tipo_comision_algoritmo
            references algoritmo,
    id_tipo_comision varchar(12) not null
        constraint fk_algoritmo_tipo_comision_tipo_comision
            references tipo_comision,
    constraint pk_algoritmo_tipo_comision
        primary key (id_algoritmo, id_tipo_comision));

comment on table algoritmo_tipo_comision is 'Tabla con La relacion entre los agoritmos y los tipos de comisión';

comment on column algoritmo_tipo_comision.id_algoritmo is 'Identificador de los tipos algoritmo';

comment on column algoritmo_tipo_comision.id_tipo_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestro de tipos de comisión InCome';

create index ix_algoritmo_tipo_comision_algoritmo
    on algoritmo_tipo_comision (id_algoritmo);

create index ix_algoritmo_tipo_comision_tipo_comision
    on algoritmo_tipo_comision (id_tipo_comision);

grant delete, insert, select, update on table algoritmo_tipo_comision to rcompensacion_comision;

grant select on table algoritmo_tipo_comision to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table algoritmo_tipo_comision to rmantenimiento_compensacion_comision;

grant select on table algoritmo_tipo_comision to rcompensacion_comision_meta4;

grant select on table algoritmo_tipo_comision to rservicios_sil_sistema_informacional;

grant select on table algoritmo_tipo_comision to rreporting_sil_sistema_informacional;

grant insert, select, update on table algoritmo_tipo_comision to rmantenimiento_income;

grant delete, insert, select, update on table tipo_comision to rcompensacion_comision;

grant select on table tipo_comision to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_comision to rmantenimiento_compensacion_comision;

grant select on table tipo_comision to rcompensacion_comision_meta4;

grant select on table tipo_comision to rservicios_sil_sistema_informacional;

grant select on table tipo_comision to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_comision to rmantenimiento_income;

create table tipo_comision_relacion_comis
(id_tipo_comision_relacion_comis bigint                     not null
        constraint pk_tipo_comision_relacion_comis
            primary key,
    id_tipo_comision                varchar(12) not null
        constraint fk_tipo_comision_relacion_comis_tipo_comision
            references tipo_comision,
    cod_tipo_comision_comis         bigint                     not null);

comment on table tipo_comision_relacion_comis is 'Relacion entre los tipos de comision INCOME y los tipo de porcentaje COMIS';

comment on column tipo_comision_relacion_comis.id_tipo_comision_relacion_comis is 'Identificador autogenerado de la tabla';

comment on column tipo_comision_relacion_comis.id_tipo_comision is 'Identificador del tipo de comision INCOME';

comment on column tipo_comision_relacion_comis.cod_tipo_comision_comis is 'Identificador del tipo de comision COMIS. El origen del dato es COMIS, no existe un maestro con esta información.';

create table paralelo_comparativa_challenge
(id_paralelo_comparativa_challenge            bigint generated always as identity (cache 100)
        constraint pk_paralelo_comparativa_challenge
            primary key,
    id_paralelo_peticion                         bigint                     not null
        constraint fk_paralelo_comparativa_challenge_paralelo_peticion
            references paralelo_peticion,
    id_tipo_calculo_relacion_comis               bigint                     not null
        constraint fk_paralelo_comparativa_challenge_tipo_calculo_relacion_comis
            references tipo_calculo_relacion_comis,
    id_tipo_comision_relacion_comis              bigint                     not null
        constraint fk_paralelo_comparativa_challenge_tipo_comision_relacion_comis
            references tipo_comision_relacion_comis,
    fecha_calculo                                date                       not null,
    ccl_id_person                                varchar(24) not null,
    cod_tienda_calculo_comis                     varchar(24),
    cod_tienda_calculo_income                    varchar(24),
    importe_comision_comis                       numeric(23,8),
    importe_comision_income                      numeric(23,8),
    importe_comision_diferencia                  numeric(23,8),
    id_criterio_comis                            varchar(2),
    id_criterio_income                           varchar(2),
    banda_comis                                  integer,
    banda_income                                 integer,
    importe_banda_comis                          numeric(23,8),
    importe_banda_income                         numeric(23,8),
    importe_banda_diferencia                     numeric(23,8),
    objetivo_presupuesto_sin_iva_comis           numeric(23,8),
    objetivo_presupuesto_sin_iva_income          numeric(23,8),
    objetivo_presupuesto_sin_iva_diferencia      numeric(23,8),
    objetivo_presupuesto_con_iva_comis           numeric(23,8),
    objetivo_presupuesto_con_iva_income          numeric(23,8),
    objetivo_presupuesto_con_iva_diferencia      numeric(23,8),
    cod_tipo_hora_comis                          bigint,
    cod_tipo_hora_income                         bigint,
    cod_tienda_presencias_comis                  varchar(24),
    cod_tienda_presencias_income                 varchar(24),
    cod_seccion_presencias_comis                 varchar(2),
    cod_seccion_presencias_income                varchar(2),
    horas_presencia_empleado_comis               bigint,
    horas_presencia_empleado_income              bigint,
    importe_venta_fisica_sin_iva_comis           numeric(23,8),
    importe_venta_fisica_sin_iva_income          numeric(23,8),
    importe_venta_fisica_sin_iva_diferencia      numeric(23,8),
    importe_venta_fisica_con_iva_comis           numeric(23,8),
    importe_venta_fisica_con_iva_income          numeric(23,8),
    importe_venta_fisica_con_iva_diferencia      numeric(23,8),
    importe_venta_online_ipod_sin_iva_comis      numeric(23,8),
    importe_venta_online_ipod_sin_iva_income     numeric(23,8),
    importe_venta_online_ipod_sin_iva_diferencia numeric(23,8),
    importe_venta_online_ipod_con_iva_comis      numeric(23,8),
    importe_venta_online_ipod_con_iva_income     numeric(23,8),
    importe_venta_online_ipod_con_iva_diferencia numeric(23,8),
    importe_venta_total_sin_iva_comis            numeric(23,8),
    importe_venta_total_sin_iva_income           numeric(23,8),
    importe_venta_total_sin_iva_diferencia       numeric(23,8),
    importe_venta_total_con_iva_comis            numeric(23,8),
    importe_venta_total_con_iva_income           numeric(23,8),
    importe_venta_total_con_iva_diferencia       numeric(23,8),
    es_diferencia                                numeric(1)                 not null,
    cod_opcion_calculo_comis                     integer,
    cod_opcion_calculo_income                    integer);

comment on table paralelo_comparativa_challenge is 'Resultados de las comparativas del paralelo de cálculo para los cálculos challenge (precio/hora e importe).';

comment on column paralelo_comparativa_challenge.id_paralelo_comparativa_challenge is 'Identificador autogenerado de la tabla.';

comment on column paralelo_comparativa_challenge.id_paralelo_peticion is 'Identificador del paralelo de cálculo.';

comment on column paralelo_comparativa_challenge.id_tipo_calculo_relacion_comis is 'Identificador del tipo de calculo';

comment on column paralelo_comparativa_challenge.id_tipo_comision_relacion_comis is 'Identificador del tipo de comision';

comment on column paralelo_comparativa_challenge.fecha_calculo is 'Fecha dentro del período de cálculo.';

comment on column paralelo_comparativa_challenge.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column paralelo_comparativa_challenge.cod_tienda_calculo_comis is 'Tienda de cálculo COMIS, bbdd SQL Server, tabla PeriodosPresupuestos, campo Tienda';

comment on column paralelo_comparativa_challenge.cod_tienda_calculo_income is 'Tienda de cálculo para el empleado en INCOME';

comment on column paralelo_comparativa_challenge.importe_comision_comis is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por criterio (para el tipo de comisión, tipo de cálculo y tipo de hora)';

comment on column paralelo_comparativa_challenge.importe_comision_income is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por criterio (para el tipo de comisión, tipo de cálculo y tipo de hora)';

comment on column paralelo_comparativa_challenge.importe_comision_diferencia is 'Diferencia entre los importes sin IVA de la comisión calculada para COMIS e INCOME para el empleado en la tienda de cálculo por criterio';

comment on column paralelo_comparativa_challenge.id_criterio_comis is 'Identificador del criterio con el que se realiza el cálculo en COMIS (1: señora, 2: caballero, 3: niño, 4: tienda)';

comment on column paralelo_comparativa_challenge.id_criterio_income is 'Identificador del criterio con el que se realiza el cálculo en INCOME (1: señora, 2: caballero, 3: niño, 4: tienda)';

comment on column paralelo_comparativa_challenge.banda_comis is 'Banda con la que se realiza el cálculo COMIS';

comment on column paralelo_comparativa_challenge.banda_income is 'Banda con la que se realiza el cálculo INCOME';

comment on column paralelo_comparativa_challenge.importe_banda_comis is 'Precio/hora o importe para el criterio anterior con el que se realiza el cálculo en COMIS';

comment on column paralelo_comparativa_challenge.importe_banda_income is 'Precio/hora o importe para el criterio anterior con el que se realiza el cálculo en INCOME';

comment on column paralelo_comparativa_challenge.importe_banda_diferencia is 'Diferencia de precio/hora o importe para el criterio con el que se realiza el cálculo entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_sin_iva_comis is 'Objetivo presupuesto banda alcanzada para el criterio en COMIS (sin IVA)';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_sin_iva_income is 'Objetivo presupuesto banda alcanzada para el criterio en INCOME (sin IVA)';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_sin_iva_diferencia is 'Diferencia entre los objetivos presupuesto banda alcanzada de COMIS e INCOME (sin IVA)';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_con_iva_comis is 'Objetivo presupuesto banda alcanzada para el criterio en COMIS (con IVA)';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_con_iva_income is 'Objetivo presupuesto banda alcanzada para el criterio en INCOME (con IVA)';

comment on column paralelo_comparativa_challenge.objetivo_presupuesto_con_iva_diferencia is 'Diferencia entre los objetivos presupuesto banda alcanzada de COMIS e INCOME (con IVA)';

comment on column paralelo_comparativa_challenge.cod_tipo_hora_comis is 'Tipo de hora de presencia del empleado en COMIS';

comment on column paralelo_comparativa_challenge.cod_tipo_hora_income is 'Tipo de hora de presencia del empleado en INCOME';

comment on column paralelo_comparativa_challenge.cod_tienda_presencias_comis is 'Tienda en la que el empleado ha tenido presencias en COMIS';

comment on column paralelo_comparativa_challenge.cod_tienda_presencias_income is 'Tienda en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_challenge.cod_seccion_presencias_comis is 'Sección en la que el empleado ha tenido presencias en COMIS';

comment on column paralelo_comparativa_challenge.cod_seccion_presencias_income is 'Sección en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_challenge.horas_presencia_empleado_comis is 'Horas de presencia del empleado en COMIS';

comment on column paralelo_comparativa_challenge.horas_presencia_empleado_income is 'Horas de presencia del empleado en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_sin_iva_comis is 'Valor de la venta física sin impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_sin_iva_income is 'Valor de la venta física sin impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_sin_iva_diferencia is 'Diferencia de los valores de venta física sin impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_con_iva_comis is 'Valor de la venta física con impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_con_iva_income is 'Valor de la venta física con impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_fisica_con_iva_diferencia is 'Diferencia de los valores de venta física con impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_sin_iva_comis is 'Valor de la venta iPod sin impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_sin_iva_income is 'Valor de la venta iPod sin impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_sin_iva_diferencia is 'Diferencia entre los valores de venta iPod sin impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_con_iva_comis is 'Valor de la venta iPod con impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_con_iva_income is 'Valor de la venta iPod con impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_online_ipod_con_iva_diferencia is 'Diferencia de los valores de venta iPod con impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_total_sin_iva_comis is 'Valor de la venta total sin impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_total_sin_iva_income is 'Valor de la venta total sin impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_total_sin_iva_diferencia is 'Diferencia de los valores de venta total sin impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_total_con_iva_comis is 'Valor de la venta total con impuestos para el criterio de la tienda en COMIS';

comment on column paralelo_comparativa_challenge.importe_venta_total_con_iva_income is 'Valor de la venta total con impuestos para el criterio de la tienda en INCOME';

comment on column paralelo_comparativa_challenge.importe_venta_total_con_iva_diferencia is 'Diferencia de los valores de venta total sin impuestos para el criterio de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_challenge.es_diferencia is 'Indicador de si la tupla presenta o no diferencias de importes.';

comment on column paralelo_comparativa_challenge.cod_opcion_calculo_comis is 'Opción de cálculo en caso de desplazamiento en COMIS';

comment on column paralelo_comparativa_challenge.cod_opcion_calculo_income is 'Opción de cálculo en caso de desplazamiento en INCOME';

create index ix_paralelo_comparativa_challenge_01
    on paralelo_comparativa_challenge (id_paralelo_peticion, es_diferencia);

create index ix_paralelo_comparativa_challenge_paralelo_peticion
    on paralelo_comparativa_challenge (id_paralelo_peticion);

create index ix_paralelo_comparativa_challenge_tipo_calculo_relacion_comis
    on paralelo_comparativa_challenge (id_tipo_calculo_relacion_comis);

create index ix_paralelo_comparativa_challenge_tipo_comision_relacion_comis
    on paralelo_comparativa_challenge (id_tipo_comision_relacion_comis);

grant delete, insert, select, update on table paralelo_comparativa_challenge to rcompensacion_comision;

grant select on table paralelo_comparativa_challenge to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_challenge to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_challenge to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_challenge to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_challenge to rmantenimiento_income;

create table paralelo_comparativa_detalle
(id_paralelo_comparativa_detalle                                 bigint generated always as identity (start with 1 cache 100)
        constraint pk_paralelo_comparativa_detalle
            primary key,
    id_paralelo_peticion                                            bigint                     not null
        constraint fk_paralelo_comparativa_detalle_paralelo_peticion
            references paralelo_peticion,
    id_tipo_calculo_relacion_comis                                  bigint                     not null
        constraint fk_paralelo_comparativa_detalle_tipo_calculo_relacion_comis
            references tipo_calculo_relacion_comis,
    id_tipo_comision_relacion_comis                                 bigint                     not null
        constraint fk_paralelo_comparativa_detalle_tipo_comision_relacion_comis
            references tipo_comision_relacion_comis,
    fecha_calculo                                                   date                       not null,
    ccl_id_person                                                   varchar(24) not null,
    cod_tienda_calculo_comis                                        varchar(24) not null,
    cod_tienda_calculo_income                                       varchar(24) not null,
    cod_seccion_comis                                               varchar(2)  not null,
    cod_seccion_income                                              varchar(2)  not null,
    importe_comision_comis                                          numeric(23,8),
    importe_comision_income                                         numeric(23,8),
    importe_comision_diferencia                                     numeric(23,8),
    porcentaje_comis                                                numeric(10,4),
    porcentaje_income                                               numeric(10,4),
    cod_tipo_hora_comis                                             bigint,
    cod_tipo_hora_income                                            bigint,
    cod_tienda_presencias_comis                                     varchar(24),
    cod_tienda_presencias_income                                    varchar(24),
    cod_seccion_presencias_comis                                    varchar(2),
    cod_seccion_presencias_income                                   varchar(2),
    horas_presencia_empleado_comis                                  bigint,
    horas_presencia_empleado_income                                 bigint,
    horas_presencia_tienda_empleado_comis                           bigint,
    horas_presencia_tienda_empleado_income                          bigint,
    importe_comision_venta_fisica_comis                             numeric(23,8),
    importe_comision_venta_fisica_income                            numeric(23,8),
    importe_comision_venta_fisica_diferencia                        numeric(23,8),
    importe_venta_fisica_sin_iva_comis                              numeric(23,8),
    importe_venta_fisica_sin_iva_income                             numeric(23,8),
    importe_venta_fisica_sin_iva_diferencia                         numeric(23,8),
    importe_venta_fisica_con_iva_comis                              numeric(23,8),
    importe_venta_fisica_con_iva_income                             numeric(23,8),
    importe_venta_fisica_con_iva_diferencia                         numeric(23,8),
    importe_comision_venta_online_ipod_comis                        numeric(23,8),
    importe_comision_venta_online_ipod_income                       numeric(23,8),
    importe_comision_venta_online_ipod_diferencia                   numeric(23,8),
    importe_venta_online_ipod_sin_iva_comis                         numeric(23,8),
    importe_venta_online_ipod_sin_iva_income                        numeric(23,8),
    importe_venta_online_ipod_sin_iva_diferencia                    numeric(23,8),
    importe_venta_online_ipod_con_iva_comis                         numeric(23,8),
    importe_venta_online_ipod_con_iva_income                        numeric(23,8),
    importe_venta_online_ipod_con_iva_diferencia                    numeric(23,8),
    importe_comision_venta_online_sint_comis                        numeric(23,8),
    importe_comision_venta_online_sint_income                       numeric(23,8),
    importe_comision_venta_online_sint_diferencia                   numeric(23,8),
    importe_venta_online_sint_sin_iva_comis                         numeric(23,8),
    importe_venta_online_sint_sin_iva_income                        numeric(23,8),
    importe_venta_online_sint_sin_iva_diferencia                    numeric(23,8),
    importe_venta_online_sint_con_iva_comis                         numeric(23,8),
    importe_venta_online_sint_con_iva_income                        numeric(23,8),
    importe_venta_online_sint_con_iva_diferencia                    numeric(23,8),
    importe_comision_venta_online_entrega_tienda_sin_iva_comis      numeric(23,8),
    importe_comision_venta_online_entrega_tienda_sin_iva_income     numeric(23,8),
    importe_comision_venta_online_entrega_tienda_sin_iva_diferencia numeric(23,8),
    importe_venta_online_entrega_tienda_sin_iva_comis               numeric(23,8),
    importe_venta_online_entrega_tienda_sin_iva_income              numeric(23,8),
    importe_venta_online_entrega_tienda_sin_iva_diferencia          numeric(23,8),
    importe_venta_online_entrega_tienda_con_iva_comis               numeric(23,8),
    importe_venta_online_entrega_tienda_con_iva_income              numeric(23,8),
    importe_venta_online_entrega_tienda_con_iva_diferencia          numeric(23,8),
    importe_comision_venta_online_entrega_domicilio_comis           numeric(23,8),
    importe_comision_venta_online_entrega_domicilio_income          numeric(23,8),
    importe_comision_venta_online_entrega_domicilio_diferencia      numeric(23,8),
    importe_venta_online_entrega_domicilio_sin_iva_comis            numeric(23,8),
    importe_venta_online_entrega_domicilio_sin_iva_income           numeric(23,8),
    importe_venta_online_entrega_domicilio_sin_iva_diferencia       numeric(23,8),
    importe_venta_online_entrega_domicilio_con_iva_comis            numeric(23,8),
    importe_venta_online_entrega_domicilio_con_iva_income           numeric(23,8),
    importe_venta_online_entrega_domicilio_con_iva_diferencia       numeric(23,8),
    es_diferencia                                                   numeric(1)                 not null,
    cod_opcion_calculo_comis                                        integer,
    cod_opcion_calculo_income                                       integer);

comment on table paralelo_comparativa_detalle is 'Resultados detallados de las comparativas del paralelo de cálculo.';

comment on column paralelo_comparativa_detalle.id_paralelo_comparativa_detalle is 'Identificador autogenerado de la tabla.';

comment on column paralelo_comparativa_detalle.id_paralelo_peticion is 'Identificador del paralelo de cálculo.';

comment on column paralelo_comparativa_detalle.id_tipo_calculo_relacion_comis is 'Identificador del tipo de calculo';

comment on column paralelo_comparativa_detalle.id_tipo_comision_relacion_comis is 'Identificador del tipo de comision';

comment on column paralelo_comparativa_detalle.fecha_calculo is 'Fecha dentro del período de cálculo.';

comment on column paralelo_comparativa_detalle.ccl_id_person is 'Id. Local, viene de STD_HR_PERIO, no hay tabla maestra de este campo';

comment on column paralelo_comparativa_detalle.cod_tienda_calculo_comis is 'Tienda de cálculo COMIS,  Bbdd sqlServer, tabla ComisionDetalle, campo Tienda';

comment on column paralelo_comparativa_detalle.cod_tienda_calculo_income is 'Tienda de cállculo para el empleado en INCOME';

comment on column paralelo_comparativa_detalle.cod_seccion_comis is 'Seccion de cálculo COMIS';

comment on column paralelo_comparativa_detalle.cod_seccion_income is 'Sección del cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_comis is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por sección (sumando el importe por temporada y producto) para el tipo de comisión, tipo de cálculo y tipo de hora';

comment on column paralelo_comparativa_detalle.importe_comision_income is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por sección (para el tipo de comisión, tipo de cálculo y tipo de hora)';

comment on column paralelo_comparativa_detalle.importe_comision_diferencia is 'Diferencia entre los importes sin IVA de la comisión calculada para COMIS e INCOME para el empleado en la tienda de cálculo por sección';

comment on column paralelo_comparativa_detalle.porcentaje_comis is 'Porcentaje utilizado para el cálculo de la comisión del empleado en la tienda de cálculo y sección.';

comment on column paralelo_comparativa_detalle.porcentaje_income is 'Porcentaje utilizado para el cálculo de la comisión del empleado en la tienda de cálculo y sección.';

comment on column paralelo_comparativa_detalle.cod_tipo_hora_comis is 'Tipo de hora con el que se ha hecho el cálculo de la comisión para el importe calculado en COMIS.';

comment on column paralelo_comparativa_detalle.cod_tipo_hora_income is 'Tipo de hora con el que se ha hecho el cálculo de la comisión para el importe calculado en INCOME';

comment on column paralelo_comparativa_detalle.cod_tienda_presencias_comis is 'Tienda en la que el empleado ha tenido presencias en COMIS.';

comment on column paralelo_comparativa_detalle.cod_tienda_presencias_income is 'Tienda en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_detalle.cod_seccion_presencias_comis is 'Sección en la que el empleado ha tenido presencias en COMIS.';

comment on column paralelo_comparativa_detalle.cod_seccion_presencias_income is 'Sección en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_detalle.horas_presencia_empleado_comis is 'Horas de presencia del empleado en COMIS del tipo de hora.';

comment on column paralelo_comparativa_detalle.horas_presencia_empleado_income is 'Horas de presencia del empleado en INCOME del tipo de hora';

comment on column paralelo_comparativa_detalle.horas_presencia_tienda_empleado_comis is 'Horas totales de la tienda/sección en COMIS con las que se ha realizado el cálculo de la comisión.';

comment on column paralelo_comparativa_detalle.horas_presencia_tienda_empleado_income is 'Horas totales de la tienda/sección en INCOME con las que se ha realizado el cálculo de la comisión';

comment on column paralelo_comparativa_detalle.importe_comision_venta_fisica_comis is 'Importe de la comisión calculada por la venta física de la tienda en COMIS';

comment on column paralelo_comparativa_detalle.importe_comision_venta_fisica_income is 'Importe de la comisión calculada por la venta física de la tienda en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_fisica_diferencia is 'Diferencia de los importes de la comisión calculada por la venta física de la tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_sin_iva_comis is 'Importe de la venta física sin IVA de la tienda de cálculo del emplead en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_sin_iva_income is 'Importe de la venta física sin IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_sin_iva_diferencia is 'Diferencia de importes de la venta física sin IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_con_iva_comis is 'Importe de la venta física con IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_con_iva_income is 'Importe de la venta física con IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_fisica_con_iva_diferencia is 'Diferencia de importes de la venta física con IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_ipod_comis is 'Importe de la comisión calculada por la venta online iPod en COMIS';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_ipod_income is 'Importe de la comisión calculada por la venta online iPod en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_ipod_diferencia is 'Diferencia de importes de la comisión calculada por la venta online iPod entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_sin_iva_comis is 'Importe de la venta online iPod sin IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_sin_iva_income is 'Importe de la venta online iPod sin IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_sin_iva_diferencia is 'Diferencia de importes de la venta online iPod sin IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_con_iva_comis is 'Importe de la venta online iPod con IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_con_iva_income is 'Importe de la venta online iPod con IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_ipod_con_iva_diferencia is 'Diferencia de importes de la venta online iPod con IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_sint_comis is 'Importe de la comisión calculada por la venta online SINT en COMIS';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_sint_income is 'Importe de la comisión calculada por la venta online SINT en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_sint_diferencia is 'Diferencia de importes de la comisión calculada por la venta online SINT entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_sin_iva_comis is 'Importe de la venta online SINT sin IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_sin_iva_income is 'Importe de la venta online SINT sin IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_sin_iva_diferencia is 'Diferencias de mportes de la venta online SINT sin IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_con_iva_comis is 'Importe de la venta online SINT con IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_con_iva_income is 'Importe de la venta online SINT con IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_sint_con_iva_diferencia is 'Diferencia de importes de la venta online SINT con IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_tienda_sin_iva_comis is 'Importe de la comisión calculada por la venta online entrega en tienda en COMIS';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_tienda_sin_iva_income is 'Importe de la comisión calculada por la venta online entrega en tienda en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_tienda_sin_iva_diferencia is 'Diferencia de importes de la comisión calculada por la venta online entrega en tienda entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_sin_iva_comis is 'Importe de la venta online entrega en tienda sin IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_sin_iva_income is 'Importe de la venta online entrega en tienda sin IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_sin_iva_diferencia is 'Diferencia de importes de la venta online entrega en tienda sin IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_con_iva_comis is 'Importe de la venta online entrega en tienda con IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_con_iva_income is 'Importe de la venta online entrega en tienda con IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_tienda_con_iva_diferencia is 'Diferencia de importes de la venta online entrega en tienda con IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_domicilio_comis is 'Importe de la comisión por la venta online entrega domicilio en COMIS';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_domicilio_income is 'Importe de la comisión por la venta online entrega domicilio en INCOME';

comment on column paralelo_comparativa_detalle.importe_comision_venta_online_entrega_domicilio_diferencia is 'Diferencia de importes de la comisión por la venta online entrega domicilio entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_sin_iva_comis is 'Importe de la venta online entrega en domicilio sin IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_sin_iva_income is 'Importe de la venta online entrega en domicilio sin IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_sin_iva_diferencia is 'Diferencia de importes de la venta online entrega en domicilio sin IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_con_iva_comis is 'Importe de la venta online entrega en domicilio con IVA de la tienda de cálculo del empleado en COMIS';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_con_iva_income is 'Importe de la venta online entrega en domicilio con IVA de la tienda de cálculo del empleado en INCOME';

comment on column paralelo_comparativa_detalle.importe_venta_online_entrega_domicilio_con_iva_diferencia is 'Diferencia de importes de la venta online entrega en domicilio con IVA de la tienda de cálculo del empleado entre COMIS e INCOME';

comment on column paralelo_comparativa_detalle.es_diferencia is 'Indicador de si la tupla presenta o no diferencias de importes.';

comment on column paralelo_comparativa_detalle.cod_opcion_calculo_comis is 'Opción de cálculo en caso de desplazamiento en COMIS.';

comment on column paralelo_comparativa_detalle.cod_opcion_calculo_income is 'Opción de cálculo en caso de desplazamiento en INCOME.';

create index ix_paralelo_comparativa_detalle_01
    on paralelo_comparativa_detalle (id_paralelo_comparativa_detalle, id_tipo_comision_relacion_comis);

create index ix_paralelo_comparativa_detalle_paralelo_peticion
    on paralelo_comparativa_detalle (id_paralelo_peticion);

create index ix_paralelo_comparativa_detalle_tipo_calculo_relacion_comis
    on paralelo_comparativa_detalle (id_tipo_calculo_relacion_comis);

create index ix_paralelo_comparativa_detalle_tipo_comision_relacion_comis
    on paralelo_comparativa_detalle (id_tipo_comision_relacion_comis);

grant delete, insert, select, update on table paralelo_comparativa_detalle to rcompensacion_comision;

grant select on table paralelo_comparativa_detalle to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_detalle to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_detalle to rcompensacion_comision_meta4;

grant select on table paralelo_comparativa_detalle to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_detalle to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_detalle to rmantenimiento_income;

create table paralelo_comparativa_precio_hora
(id_paralelo_comparativa_precio_hora bigint generated always as identity (cache 100)
        constraint pk_paralelo_comparativa_precio_hora
            primary key,
    id_paralelo_peticion                bigint                     not null
        constraint fk_paralelo_comparativa_precio_hora_paralelo_peticion
            references paralelo_peticion,
    id_tipo_calculo_relacion_comis      bigint                     not null
        constraint fk_paralelo_comparativa_precio_hora_tipo_calculo_relacion_comis
            references tipo_calculo_relacion_comis,
    id_tipo_comision_relacion_comis     bigint                     not null
        constraint fk_p_c_p_h_tipo_comision_relacion_comis
            references tipo_comision_relacion_comis,
    fecha_calculo                       date                       not null,
    ccl_id_person                       varchar(24) not null,
    cod_tienda_calculo_comis            varchar(24),
    cod_tienda_calculo_income           varchar(24),
    importe_comision_comis              numeric(23,8),
    importe_comision_income             numeric(23,8),
    importe_comision_diferencia         numeric(23,8),
    importe_precio_hora_comis           numeric(23,8),
    importe_precio_hora_income          numeric(23,8),
    importe_precio_hora_diferencia      numeric(23,8),
    cod_tipo_hora_comis                 bigint,
    cod_tipo_hora_income                bigint,
    cod_tienda_presencias_comis         varchar(24),
    cod_tienda_presencias_income        varchar(24),
    cod_seccion_presencias_comis        varchar(2),
    cod_seccion_presencias_income       varchar(2),
    horas_presencia_empleado_comis      bigint,
    horas_presencia_empleado_income     bigint,
    es_diferencia                       numeric(1)                 not null,
    cod_opcion_calculo_comis            integer,
    cod_opcion_calculo_income           integer);

comment on table paralelo_comparativa_precio_hora is 'Resultados de las comparativas del paralelo de cálculo para los cálculos precio/hora.';

comment on column paralelo_comparativa_precio_hora.id_paralelo_comparativa_precio_hora is 'Identificador autogenerado de la tabla.';

comment on column paralelo_comparativa_precio_hora.id_paralelo_peticion is 'Identificador del paralelo de cálculo.';

comment on column paralelo_comparativa_precio_hora.id_tipo_calculo_relacion_comis is 'Identificador del tipo de calculo';

comment on column paralelo_comparativa_precio_hora.id_tipo_comision_relacion_comis is 'Identificador del tipo de comision';

comment on column paralelo_comparativa_precio_hora.fecha_calculo is 'Fecha dentro del período de cálculo.';

comment on column paralelo_comparativa_precio_hora.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column paralelo_comparativa_precio_hora.cod_tienda_calculo_comis is 'Tienda de cálculo COMIS, bbdd SQL Server, tabla ComisionDetallePrecioHora, campo Tienda';

comment on column paralelo_comparativa_precio_hora.cod_tienda_calculo_income is 'Tienda de cálculo para el empleado en INCOME';

comment on column paralelo_comparativa_precio_hora.importe_comision_comis is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por sección para el tipo de comisión, tipo de cálculo y tipo de hora';

comment on column paralelo_comparativa_precio_hora.importe_comision_income is 'Importe sin IVA de la comisión calculada para el empleado en la tienda de cálculo por sección para el tipo de comisión, tipo de cálculo y tipo de hora';

comment on column paralelo_comparativa_precio_hora.importe_comision_diferencia is 'Diferencia entre los importes sin IVA de la comisión calculada para COMIS e INCOME para el empleado en la tienda de cálculo por sección';

comment on column paralelo_comparativa_precio_hora.importe_precio_hora_comis is 'Precio/hora con el que se realiza el cálculo en COMIS';

comment on column paralelo_comparativa_precio_hora.importe_precio_hora_income is 'Precio/hora con el que se realiza el cálculo en INCOME';

comment on column paralelo_comparativa_precio_hora.importe_precio_hora_diferencia is 'Diferencia de precio/hora con el que se realiza el cálculo entre COMIS e INCOME';

comment on column paralelo_comparativa_precio_hora.cod_tipo_hora_comis is 'Tipo de hora de presencia del empleado en COMIS';

comment on column paralelo_comparativa_precio_hora.cod_tipo_hora_income is 'Tipo de hora de presencia del empleado en INCOME';

comment on column paralelo_comparativa_precio_hora.cod_tienda_presencias_comis is 'Tienda en la que el empleado ha tenido presencias en COMIS';

comment on column paralelo_comparativa_precio_hora.cod_tienda_presencias_income is 'Tienda en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_precio_hora.cod_seccion_presencias_comis is 'Sección en la que el empleado ha tenido presencias en COMIS';

comment on column paralelo_comparativa_precio_hora.cod_seccion_presencias_income is 'Sección en la que el empleado ha tenido presencias en INCOME';

comment on column paralelo_comparativa_precio_hora.horas_presencia_empleado_comis is 'Horas de presencia del empleado en COMIS';

comment on column paralelo_comparativa_precio_hora.horas_presencia_empleado_income is 'Horas de presencia del empleado en INCOME';

comment on column paralelo_comparativa_precio_hora.es_diferencia is 'Indicador de si la tupla presenta o no diferencias de importes.';

comment on column paralelo_comparativa_precio_hora.cod_opcion_calculo_comis is 'Opción de cálculo en caso de desplazamiento en COMIS';

comment on column paralelo_comparativa_precio_hora.cod_opcion_calculo_income is 'Opción de cálculo en caso de desplazamiento en INCOME';

create index ix_paralelo_comparativa_precio_hora_01
    on paralelo_comparativa_precio_hora (id_paralelo_peticion, es_diferencia);

create index ix_paralelo_comparativa_precio_hora_paralelo_peticion
    on paralelo_comparativa_precio_hora (id_paralelo_peticion);

create index ix_paralelo_comparativa_precio_hora_tipo_calculo_relacion_comis
    on paralelo_comparativa_precio_hora (id_tipo_calculo_relacion_comis);

create index ix_p_c_p_h_tipo_comision_relacion_comis
    on paralelo_comparativa_precio_hora (id_tipo_comision_relacion_comis);

grant delete, insert, select, update on table paralelo_comparativa_precio_hora to rcompensacion_comision;

grant select on table paralelo_comparativa_precio_hora to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table paralelo_comparativa_precio_hora to rmantenimiento_compensacion_comision;

grant select on table paralelo_comparativa_precio_hora to rservicios_sil_sistema_informacional;

grant select on table paralelo_comparativa_precio_hora to rreporting_sil_sistema_informacional;

grant insert, select, update on table paralelo_comparativa_precio_hora to rmantenimiento_income;

create index ix_tipo_comision_relacion_comis_tipo_comision
    on tipo_comision_relacion_comis (id_tipo_comision);

grant delete, insert, select, update on table tipo_comision_relacion_comis to rcompensacion_comision;

grant select on table tipo_comision_relacion_comis to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_comision_relacion_comis to rmantenimiento_compensacion_comision;

grant select on table tipo_comision_relacion_comis to rcompensacion_comision_meta4;

grant select on table tipo_comision_relacion_comis to retl_rrhh;

grant select on table tipo_comision_relacion_comis to rservicios_sil_sistema_informacional;

grant select on table tipo_comision_relacion_comis to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_comision_relacion_comis to rmantenimiento_income;

create table tipo_grupo_dato
(id_tipo_grupo_dato integer             not null
        constraint pk_tipo_grupo_dato
            primary key,
    nombre             varchar(128) not null,
    descripcion        varchar(255) not null);

comment on table tipo_grupo_dato is 'Tipos de agrupación de datos: Detalle presencias, Detalle presencias sección';

comment on column tipo_grupo_dato.id_tipo_grupo_dato is 'Identificador de la tabla';

comment on column tipo_grupo_dato.nombre is 'Nombre agrupacón, ejemplo: PRESENCIA_LOCALIZACION_PERSONA_TIPO_HORA, PRESENCIA_LOCALIZACION_SECCION_PERSONA_TIPO_HORA';

comment on column tipo_grupo_dato.descripcion is 'Descripción, por ejemlpo: Detalle presencias, Detalle presencias seccion';

grant delete, insert, select, update on table tipo_grupo_dato to rcompensacion_comision;

grant select on table tipo_grupo_dato to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_grupo_dato to rmantenimiento_compensacion_comision;

grant select on table tipo_grupo_dato to rcompensacion_comision_meta4;

grant select on table tipo_grupo_dato to rservicios_sil_sistema_informacional;

grant select on table tipo_grupo_dato to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_grupo_dato to rmantenimiento_income;

create table tipo_limpieza
(id_tipo_limpieza integer             not null
        constraint pk_tipo_limpieza
            primary key,
    nombre           varchar(128) not null,
    descripcion      varchar(255) not null);

comment on table tipo_limpieza is 'Tipos de limpieza: Completa, Parcial';

comment on column tipo_limpieza.id_tipo_limpieza is 'Identificador del tipo de limpieza';

comment on column tipo_limpieza.nombre is 'Nombre del tipo de limpieza: Completa, Parcial';

comment on column tipo_limpieza.descripcion is 'Descripción del tipo de limpieza';

grant delete, insert, select, update on table tipo_limpieza to rcompensacion_comision;

grant select on table tipo_limpieza to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_limpieza to rmantenimiento_compensacion_comision;

grant select on table tipo_limpieza to rcompensacion_comision_meta4;

grant select on table tipo_limpieza to rservicios_sil_sistema_informacional;

grant select on table tipo_limpieza to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_limpieza to rmantenimiento_income;

create table tipo_opcion_calculo
(id_tipo_opcion_calculo integer                    not null
        constraint pk_tipo_opcion_calculo
            primary key,
    icm_id_tp_op_calc      varchar(24) not null,
    nombre                 varchar(128)        not null);

comment on table tipo_opcion_calculo is 'Tipos de opcion  ORIGEN, DESTINO, MEJOR OPCION';

comment on column tipo_opcion_calculo.id_tipo_opcion_calculo is 'Identificador de la tabla';

comment on column tipo_opcion_calculo.icm_id_tp_op_calc is 'Identificaor del tipo de opcion en el modelo de Meta4, Tabla Meta4 del modelo InCome M4ICM_X_TP_OPC_CALC';

comment on column tipo_opcion_calculo.nombre is 'Nombre descriptivo del tipo de opcion,  MEJOR OPCION, ORIGEN';

grant delete, insert, select, update on table tipo_opcion_calculo to rcompensacion_comision;

grant select on table tipo_opcion_calculo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_opcion_calculo to rmantenimiento_compensacion_comision;

grant select on table tipo_opcion_calculo to rcompensacion_comision_meta4;

grant select on table tipo_opcion_calculo to rservicios_sil_sistema_informacional;

grant select on table tipo_opcion_calculo to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_opcion_calculo to rmantenimiento_income;

create table tipo_politica
(id_tipo_politica    integer                    not null
        constraint pk_tipo_politica
            primary key,
    icm_id_tp_politicas varchar(24) not null,
    nombre              varchar(128)        not null,
    peso                integer                    not null);

comment on table tipo_politica is 'Tabla con los tipos de politcas:
HORAS FIJAS
EXCLUIDO DENOMINADOR
CARENCIA
ANTIGUEDAD
BAJA IT
VACACIONES
MINIMO GARANTIZADO
MAXIMO GARANTIZADO';

comment on column tipo_politica.id_tipo_politica is 'Identificador de la tabla';

comment on column tipo_politica.icm_id_tp_politicas is 'Identificador de la tabla Meta4  ICM_X_TP_POLITICAS';

comment on column tipo_politica.nombre is 'Nombre descriptivo del tipo de politica, EXCLUIDO DENOMINADOR, CARENCIA,...';

comment on column tipo_politica.peso is 'Peso, define el peso de una política sobre otras';

create table algoritmo_ajuste
(id_algoritmo_ajuste integer             not null
        constraint pk_algoritmo_ajuste
            primary key,
    id_tipo_politica    integer             not null
        constraint fk_algoritmo_ajuste_tipo_politica
            references tipo_politica,
    es_activo           numeric(1)          not null,
    peso                integer default 0   not null,
    nombre              varchar(128) not null);

comment on table algoritmo_ajuste is 'Tabla con algoritmos de ajuste manual y su estado activo o no:
-CARENCIA
-ANTIGÜEDAD
-BAJA
-VACACIONES
-MÍNIMO GARANTIZADO
-MÁXIMO GARANTIZADO';

comment on column algoritmo_ajuste.id_algoritmo_ajuste is 'Identificador del Algoritmo';

comment on column algoritmo_ajuste.id_tipo_politica is 'Identificador de la tabla';

comment on column algoritmo_ajuste.es_activo is 'Estado del algoritmo';

comment on column algoritmo_ajuste.peso is 'Peso, define el peso de un estado sobre otros';

comment on column algoritmo_ajuste.nombre is 'Nombre del algoritmo globalTiendaPorcentajeDiariaV1
globalTiendaTopesV1
globalTiendaManualV1';

create index ix_algoritmo_ajuste_tipo_politica
    on algoritmo_ajuste (id_tipo_politica);

grant delete, insert, select, update on table algoritmo_ajuste to rcompensacion_comision;

grant select on table algoritmo_ajuste to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table algoritmo_ajuste to rmantenimiento_compensacion_comision;

grant select on table algoritmo_ajuste to rcompensacion_comision_meta4;

grant select on table algoritmo_ajuste to rservicios_sil_sistema_informacional;

grant select on table algoritmo_ajuste to rreporting_sil_sistema_informacional;

grant insert, select, update on table algoritmo_ajuste to rmantenimiento_income;

grant delete, insert, select, update on table tipo_politica to rcompensacion_comision;

grant select on table tipo_politica to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_politica to rmantenimiento_compensacion_comision;

grant select on table tipo_politica to rcompensacion_comision_meta4;

grant select on table tipo_politica to rservicios_sil_sistema_informacional;

grant select on table tipo_politica to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_politica to rmantenimiento_income;

create table tipo_presencia
(id_tipo_presencia integer             not null
        constraint pk_tipo_presencia
            primary key,
    nombre            varchar(128) not null,
    descripcion       varchar(255) not null,
    peso              integer             not null);

comment on table tipo_presencia is 'Tipos de presencia: REAL, HORAS_FIJAS, MANUAL';

comment on column tipo_presencia.id_tipo_presencia is 'Identificador de la tabla';

comment on column tipo_presencia.nombre is 'Nombre';

comment on column tipo_presencia.descripcion is 'Descripcion larga';

comment on column tipo_presencia.peso is 'Peso';

grant delete, insert, select, update on table tipo_presencia to rcompensacion_comision;

grant select on table tipo_presencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_presencia to rmantenimiento_compensacion_comision;

grant select on table tipo_presencia to rcompensacion_comision_meta4;

grant select on table tipo_presencia to rservicios_sil_sistema_informacional;

grant select on table tipo_presencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_presencia to rmantenimiento_income;

create table tipo_presencia_localizacion_simulacion
(id_tipo_presencia_localizacion_simulacion integer             not null
        constraint pk_tipo_presencia_localizacion_simulacion
            primary key,
    nombre                                    varchar(128) not null,
    descripcion                               varchar(255) not null,
    peso                                      integer             not null);

comment on table tipo_presencia_localizacion_simulacion is 'Tipos de presencia por localizacion utilizadas en la simulacion: Real, Último cálculo, Introducida manualmente';

comment on column tipo_presencia_localizacion_simulacion.id_tipo_presencia_localizacion_simulacion is 'Identificador de la tabla';

comment on column tipo_presencia_localizacion_simulacion.nombre is 'Nombre';

comment on column tipo_presencia_localizacion_simulacion.descripcion is 'Descripcion larga';

comment on column tipo_presencia_localizacion_simulacion.peso is 'Peso ';

grant delete, insert, select, update on table tipo_presencia_localizacion_simulacion to rcompensacion_comision;

grant select on table tipo_presencia_localizacion_simulacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_presencia_localizacion_simulacion to rmantenimiento_compensacion_comision;

grant select on table tipo_presencia_localizacion_simulacion to rcompensacion_comision_meta4;

create table tipo_presencia_persona_simulacion
(id_tipo_presencia_persona_simulacion integer             not null
        constraint pk_tipo_presencia_persona_simulacion
            primary key,
    nombre                               varchar(128) not null,
    descripcion                          varchar(255) not null,
    peso                                 integer             not null);

comment on table tipo_presencia_persona_simulacion is 'Tipos de presencia por persona utilizadas en la simulacion: Real, Último cálculo, Introducida manualmente';

comment on column tipo_presencia_persona_simulacion.id_tipo_presencia_persona_simulacion is 'Identificador de la tabla';

comment on column tipo_presencia_persona_simulacion.nombre is 'Nombre';

comment on column tipo_presencia_persona_simulacion.descripcion is 'Descripcion larga';

comment on column tipo_presencia_persona_simulacion.peso is 'Peso ';

grant delete, insert, select, update on table tipo_presencia_persona_simulacion to rcompensacion_comision;

grant select on table tipo_presencia_persona_simulacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_presencia_persona_simulacion to rmantenimiento_compensacion_comision;

grant select on table tipo_presencia_persona_simulacion to rcompensacion_comision_meta4;

create table tipo_presupuesto
(id_tipo_presupuesto   integer                    not null
        constraint pk_tipo_presupuesto
            primary key,
    icm_id_tp_presupuesto varchar(12) not null,
    nombre                varchar(128)        not null,
    descripcion           varchar(255)        not null);

comment on table tipo_presupuesto is 'Tabla con los tipos de presupuestos
- Mensual
- Bimensual
- Trimestral
- Cuatrimestral
- Semestral
- Anual
- Abierto';

comment on column tipo_presupuesto.id_tipo_presupuesto is 'Identificador del tipo de presupuesto';

comment on column tipo_presupuesto.icm_id_tp_presupuesto is 'Identificador del tipo de presupuesto, M4ICM_X_TP_PRESUPUESTOS, Tabla maestro de tipos de presupuesto InCome';

comment on column tipo_presupuesto.nombre is 'Nombre del tipo de presupuesto';

comment on column tipo_presupuesto.descripcion is 'Descripción del tipo de presupuesto';

grant select on table tipo_presupuesto to rreporting_services_rrhh;

grant select on table tipo_presupuesto to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tipo_presupuesto to rcompensacion_comision;

grant select on table tipo_presupuesto to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_presupuesto to rmantenimiento_compensacion_comision;

grant select on table tipo_presupuesto to rcompensacion_comision_meta4;

grant select on table tipo_presupuesto to retl_rrhh;

grant select on table tipo_presupuesto to rservicios_sil_sistema_informacional;

grant select on table tipo_presupuesto to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_presupuesto to rmantenimiento_income;

create table tipo_proceso
(id_tipo_proceso integer             not null
        constraint pk_tipo_proceso
            primary key,
    nombre          varchar(128) not null);

comment on table tipo_proceso is 'Tabla con los diferentes tipos de procesos';

comment on column tipo_proceso.id_tipo_proceso is 'Identificador de los tipos posibles de un proceso';

comment on column tipo_proceso.nombre is 'Descripcion del tipo de proceso';

grant delete, insert, select, update on table tipo_proceso to rcompensacion_comision;

grant select on table tipo_proceso to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_proceso to rmantenimiento_compensacion_comision;

grant select on table tipo_proceso to rcompensacion_comision_meta4;

grant insert, select, update on table tipo_proceso to rmantenimiento_income;

create table tipo_sistema_destino
(id_tipo_sistema_destino integer                    not null
        constraint pk_tipo_sistema_destino
            primary key,
    icm_id_tp_sistema       varchar(24) not null,
    nombre                  varchar(128)        not null);

comment on table tipo_sistema_destino is 'Tabla con los posibles sistemas destino de un proceso';

comment on column tipo_sistema_destino.id_tipo_sistema_destino is 'Indentificador del tipo de sistema destino';

comment on column tipo_sistema_destino.icm_id_tp_sistema is 'Id. tipo sistema, M4ICM_X_TP_SISTEMA, Maestro de tipos de sistema';

comment on column tipo_sistema_destino.nombre is 'Descripción del tipo de sistema destino';

create table proceso
(id_proceso                bigint generated always as identity (start with 1)
        constraint pk_proceso
            primary key,
    id_estado_proceso         integer                    not null
        constraint fk_proceso_estado_proceso
            references estado_proceso,
    id_organization           varchar(24) not null,
    icm_id_periodo            bigint                     not null,
    id_tipo_ambito            integer                    not null
        constraint fk_proceso_tipo_ambito
            references tipo_ambito,
    id_tipo_proceso           integer                    not null
        constraint fk_proceso_tipo_proceso
            references tipo_proceso,
    id_tipo_sistema_destino   integer                    not null
        constraint fk_proceso_tipo_sistema_destino
            references tipo_sistema_destino,
    fecha_hora_creacion       timestamp(6)               not null,
    fecha_hora_inicio_proceso timestamp(6),
    fecha_hora_fin_proceso    timestamp(6),
    fecha_inicio_periodo      date                       not null,
    fecha_fin_periodo         date                       not null,
    nombre_usuario            varchar(32)         not null);

comment on table proceso is 'Tabla con todos los procesos';

comment on column proceso.id_proceso is 'Identificador del proceso';

comment on column proceso.id_estado_proceso is 'Identificador del estado del proceso';

comment on column proceso.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION, Maestro de organizaciones';

comment on column proceso.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column proceso.id_tipo_ambito is 'Indentificador del tipo de ambito';

comment on column proceso.id_tipo_proceso is 'Identificador del tipo de proceso';

comment on column proceso.id_tipo_sistema_destino is 'Indentificador del tipo de sistema destino';

comment on column proceso.fecha_hora_creacion is 'Fecha hora de creación';

comment on column proceso.fecha_hora_inicio_proceso is 'Fecha hora incio proceso';

comment on column proceso.fecha_hora_fin_proceso is 'Fecha hora fin proceso';

comment on column proceso.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column proceso.fecha_fin_periodo is 'Fecha fin periodo';

comment on column proceso.nombre_usuario is 'Identificador del usuario que lanza el proceso';

create index ix_proceso_estado_proceso
    on proceso (id_estado_proceso);

create index ix_proceso_tipo_ambito
    on proceso (id_tipo_ambito);

create index ix_proceso_tipo_proceso
    on proceso (id_tipo_proceso);

create index ix_proceso_tipo_sistema_destino
    on proceso (id_tipo_sistema_destino);

grant delete, insert, select, update on table proceso to rcompensacion_comision;

grant select on table proceso to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table proceso to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table proceso to rcompensacion_comision_meta4;

grant insert, select, update on table proceso to rmantenimiento_income;

create table proceso_ambito_empresa
(id_proceso_ambito_empresa bigint generated always as identity (start with 1)
        constraint pk_proceso_ambito_empresa
            primary key,
    id_proceso                bigint                     not null
        constraint fk_proceso_ambito_empresa_proceso
            references proceso,
    ccl_id_origen             varchar(24) not null,
    std_id_leg_ent            varchar(24) not null);

comment on table proceso_ambito_empresa is 'Tabla con los procesos ejecutados por ambito empresa';

comment on column proceso_ambito_empresa.id_proceso_ambito_empresa is 'Identificador de la tabla';

comment on column proceso_ambito_empresa.id_proceso is 'Identificador del proceso';

comment on column proceso_ambito_empresa.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column proceso_ambito_empresa.std_id_leg_ent is 'Id. Empresa, STD_LEG_ENT, Maestro de empresas';

create index ix_proceso_ambito_empresa_proceso
    on proceso_ambito_empresa (id_proceso);

grant delete, insert, select, update on table proceso_ambito_empresa to rcompensacion_comision;

grant select on table proceso_ambito_empresa to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_empresa to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_empresa to rcompensacion_comision_meta4;

grant insert, select, update on table proceso_ambito_empresa to rmantenimiento_income;

create table proceso_ambito_localizacion
(id_proceso_ambito_localizacion bigint generated always as identity (start with 1)
        constraint pk_proceso_ambito_localizacion
            primary key,
    id_proceso                     bigint                     not null
        constraint fk_proceso_ambito_localizacion_proceso
            references proceso,
    ccl_id_origen                  varchar(24) not null,
    std_id_leg_ent                 varchar(24) not null,
    std_id_work_locat              varchar(24) not null);

comment on table proceso_ambito_localizacion is 'Tabla con los procesos ejecutados por ambito tienda';

comment on column proceso_ambito_localizacion.id_proceso_ambito_localizacion is 'Identificador de la tabla';

comment on column proceso_ambito_localizacion.id_proceso is 'Identificador del proceso';

comment on column proceso_ambito_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column proceso_ambito_localizacion.std_id_leg_ent is 'Id. Empresa, STD_LEG_ENT, Maestro de empresas';

comment on column proceso_ambito_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

create index ix_proceso_ambito_localizacion_proceso
    on proceso_ambito_localizacion (id_proceso);

grant delete, insert, select, update on table proceso_ambito_localizacion to rcompensacion_comision;

grant select on table proceso_ambito_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_localizacion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_localizacion to rcompensacion_comision_meta4;

grant insert, select, update on table proceso_ambito_localizacion to rmantenimiento_income;

create table proceso_ambito_origen
(id_proceso_ambito_origen bigint generated always as identity (start with 1)
        constraint pk_proceso_ambito_origen
            primary key,
    id_proceso               bigint                     not null
        constraint fk_proceso_ambito_origen_proceso
            references proceso,
    ccl_id_origen            varchar(24) not null);

comment on table proceso_ambito_origen is 'Tabla con los procesos ejecutados por ambito origen';

comment on column proceso_ambito_origen.id_proceso_ambito_origen is 'Identificador de la tabla';

comment on column proceso_ambito_origen.id_proceso is 'Identificador del proceso';

comment on column proceso_ambito_origen.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

create index ix_proceso_ambito_origen_proceso
    on proceso_ambito_origen (id_proceso);

grant delete, insert, select, update on table proceso_ambito_origen to rcompensacion_comision;

grant select on table proceso_ambito_origen to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_origen to rmantenimiento_compensacion_comision;

grant select on table proceso_ambito_origen to rcompensacion_comision_meta4;

grant insert, select, update on table proceso_ambito_origen to rmantenimiento_income;

create table proceso_ambito_persona
(id_proceso_ambito_persona bigint generated always as identity (start with 1)
        constraint pk_proceso_ambito_persona
            primary key,
    id_proceso                bigint                     not null
        constraint fk_proceso_ambito_persona_proceso
            references proceso,
    ccl_id_origen             varchar(24) not null,
    std_id_leg_ent            varchar(24) not null,
    ccl_id_person             varchar(24) not null,
    std_or_hr_period          varchar(24) not null);

comment on table proceso_ambito_persona is 'Tabla con los procesos ejecutados por ambito persona';

comment on column proceso_ambito_persona.id_proceso_ambito_persona is 'Identificador de la tabla';

comment on column proceso_ambito_persona.id_proceso is 'Identificador del proceso';

comment on column proceso_ambito_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column proceso_ambito_persona.std_id_leg_ent is 'Id. Empresa, STD_LEG_ENT, Maestro de empresas';

comment on column proceso_ambito_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column proceso_ambito_persona.std_or_hr_period is 'Ordinal del periodo, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_proceso_ambito_persona_proceso
    on proceso_ambito_persona (id_proceso);

grant delete, insert, select, update on table proceso_ambito_persona to rcompensacion_comision;

grant select on table proceso_ambito_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_persona to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table proceso_ambito_persona to rcompensacion_comision_meta4;

grant insert, select, update on table proceso_ambito_persona to rmantenimiento_income;

grant delete, insert, select, update on table tipo_sistema_destino to rcompensacion_comision;

grant select on table tipo_sistema_destino to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_sistema_destino to rmantenimiento_compensacion_comision;

grant select on table tipo_sistema_destino to rcompensacion_comision_meta4;

grant insert, select, update on table tipo_sistema_destino to rmantenimiento_income;

create table tipo_unidad_tiempo
(id_tipo_unidad_tiempo integer                    not null
        constraint pk_tipo_unidad_tiempo
            primary key,
    icm_id_unidad_tiempo  varchar(24) not null,
    nombre                varchar(128)        not null);

comment on table tipo_unidad_tiempo is 'Tabla con los tipos de ambito de unidades de tiempo
-NINGUNO
-AÑOS
-MESES
-SEMANAS
-DÍAS
-HORAS
-MINUTOS';

comment on column tipo_unidad_tiempo.id_tipo_unidad_tiempo is 'Identificador de la tabla';

comment on column tipo_unidad_tiempo.icm_id_unidad_tiempo is 'Identificador de la tabla Meta4  ICM_X_TP_UNIDAD_TIEMPO';

comment on column tipo_unidad_tiempo.nombre is 'Nombre descriptivo del tipo de politica, EXCLUIDO DENOMINADOR, CARENCIA,...';

grant delete, insert, select, update on table tipo_unidad_tiempo to rcompensacion_comision;

grant select on table tipo_unidad_tiempo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_unidad_tiempo to rmantenimiento_compensacion_comision;

grant select on table tipo_unidad_tiempo to rcompensacion_comision_meta4;

grant select on table tipo_unidad_tiempo to rservicios_sil_sistema_informacional;

grant select on table tipo_unidad_tiempo to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_unidad_tiempo to rmantenimiento_income;

create table tipo_venta
(id_tipo_venta integer             not null
        constraint pk_tipo_venta
            primary key,
    nombre        varchar(128) not null,
    descripcion   varchar(255) not null,
    es_online     numeric(1)          not null,
    peso          integer             not null);

comment on table tipo_venta is 'Tipos de venta FISICA, ONLINE_IPOD, ONLINE_SINT, ONLINE_ENTREGA_TIENDA, â€¦';

comment on column tipo_venta.id_tipo_venta is 'Identificador de la tabla';

comment on column tipo_venta.nombre is 'Nombre';

comment on column tipo_venta.descripcion is 'Descripción larga';

comment on column tipo_venta.es_online is 'Flag indicador de si es una venta online';

comment on column tipo_venta.peso is 'Peso, prioridad';

create table tipo_dato
(id_tipo_dato      integer             not null
        constraint pk_tipo_dato
            primary key,
    id_tipo_presencia integer
        constraint fk_tipo_dato_tipo_presencia
            references tipo_presencia,
    id_tipo_venta     integer
        constraint fk_tipo_dato_tipo_venta
            references tipo_venta,
    es_procesado      numeric(1)          not null,
    nombre            varchar(128) not null,
    descripcion       varchar(255) not null);

comment on table tipo_dato is 'Tabla con los posiles tipos de datos recuperados. Ejemplo IMPORTE_VENTA_FISICA_LOCALIZACION-IMPORTE_VENTA_FISICA_LOCALIZACION_SECCION...';

comment on column tipo_dato.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tipo_dato.id_tipo_presencia is 'Identificador de la tabla';

comment on column tipo_dato.id_tipo_venta is 'Identificador de la tabla';

comment on column tipo_dato.es_procesado is 'Flag indicador de si se puede procesar en el calculo';

comment on column tipo_dato.nombre is 'Nombre';

comment on column tipo_dato.descripcion is 'Desripción del tipo de dato';

create table algoritmo_tipo_dato
(id_algoritmo integer not null
        constraint fk_algoritmo_tipo_dato_algoritmo
            references algoritmo,
    id_tipo_dato integer not null
        constraint fk_algoritmo_tipo_dato_tipo_dato
            references tipo_dato,
    constraint pk_algoritmo_tipo_dato
        primary key (id_algoritmo, id_tipo_dato));

comment on table algoritmo_tipo_dato is 'Tabla con La relacion entre los agoritmos y los tipos de dato';

comment on column algoritmo_tipo_dato.id_algoritmo is 'Identificador de los tipos algoritmo';

comment on column algoritmo_tipo_dato.id_tipo_dato is 'Identificadode del tipo de dato';

create index ix_algoritmo_tipo_dato_algoritmo
    on algoritmo_tipo_dato (id_algoritmo);

create index ix_algoritmo_tipo_dato_tipo_dato
    on algoritmo_tipo_dato (id_tipo_dato);

grant delete, insert, select, update on table algoritmo_tipo_dato to rcompensacion_comision;

grant select on table algoritmo_tipo_dato to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table algoritmo_tipo_dato to rmantenimiento_compensacion_comision;

grant select on table algoritmo_tipo_dato to rcompensacion_comision_meta4;

grant select on table algoritmo_tipo_dato to rservicios_sil_sistema_informacional;

grant select on table algoritmo_tipo_dato to rreporting_sil_sistema_informacional;

grant insert, select, update on table algoritmo_tipo_dato to rmantenimiento_income;

create index ix_tipo_dato_tipo_presencia
    on tipo_dato (id_tipo_presencia);

create index ix_tipo_dato_tipo_venta
    on tipo_dato (id_tipo_venta);

grant select on table tipo_dato to rreporting_services_rrhh;

grant select on table tipo_dato to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tipo_dato to rcompensacion_comision;

grant select on table tipo_dato to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_dato to rmantenimiento_compensacion_comision;

grant select on table tipo_dato to rcompensacion_comision_meta4;

grant select on table tipo_dato to retl_rrhh;

grant select on table tipo_dato to rservicios_sil_sistema_informacional;

grant select on table tipo_dato to rreporting_sil_sistema_informacional;

grant select on table tipo_dato to rbrecha_salarial;

grant select on table tipo_dato to rmantenimiento_brecha_salarial;

grant select on table tipo_dato to rmonitorizacion_brecha_salarial;

grant insert, select, update on table tipo_dato to rmantenimiento_income;

grant select on table tipo_dato to rmantenimiento_brechasala;

create table tipo_grupo_dato_tipo_dato
(id_tipo_grupo_dato integer not null
        constraint fk_tipo_grupo_dato_tipo_dato_tipo_grupo_dato
            references tipo_grupo_dato,
    id_tipo_dato       integer not null
        constraint fk_tipo_grupo_dato_tipo_dato_tipo_dato
            references tipo_dato,
    constraint pk_tipo_grupo_dato_tipo_dato
        primary key (id_tipo_grupo_dato, id_tipo_dato));

comment on table tipo_grupo_dato_tipo_dato is 'Relación entre el tipo de dato y el tipo de agrupación';

comment on column tipo_grupo_dato_tipo_dato.id_tipo_grupo_dato is 'Identificador de la tabla';

comment on column tipo_grupo_dato_tipo_dato.id_tipo_dato is 'Identificadode del tipo de dato';

create index ix_tipo_grupo_dato_tipo_dato_tipo_dato
    on tipo_grupo_dato_tipo_dato (id_tipo_dato);

create index ix_tipo_grupo_dato_tipo_dato_tipo_grupo_dato
    on tipo_grupo_dato_tipo_dato (id_tipo_grupo_dato);

grant select on table tipo_grupo_dato_tipo_dato to rreporting_services_rrhh;

grant delete, insert, select, update on table tipo_grupo_dato_tipo_dato to rcompensacion_comision;

grant select on table tipo_grupo_dato_tipo_dato to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_grupo_dato_tipo_dato to rmantenimiento_compensacion_comision;

grant select on table tipo_grupo_dato_tipo_dato to rcompensacion_comision_meta4;

grant select on table tipo_grupo_dato_tipo_dato to retl_rrhh;

grant select on table tipo_grupo_dato_tipo_dato to rservicios_sil_sistema_informacional;

grant select on table tipo_grupo_dato_tipo_dato to rreporting_sil_sistema_informacional;

grant select on table tipo_grupo_dato_tipo_dato to rbrecha_salarial;

grant select on table tipo_grupo_dato_tipo_dato to rmantenimiento_brecha_salarial;

grant select on table tipo_grupo_dato_tipo_dato to rmonitorizacion_brecha_salarial;

grant insert, select, update on table tipo_grupo_dato_tipo_dato to rmantenimiento_income;

grant select on table tipo_grupo_dato_tipo_dato to rmantenimiento_brechasala;

grant delete, insert, select, update on table tipo_venta to rcompensacion_comision;

grant select on table tipo_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_venta to rmantenimiento_compensacion_comision;

grant select on table tipo_venta to rcompensacion_comision_meta4;

grant select on table tipo_venta to rservicios_sil_sistema_informacional;

grant select on table tipo_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_venta to rmantenimiento_income;

create table tipo_venta_concepto
(id_tipo_venta_concepto integer                    not null
        constraint pk_tipo_venta_concepto
            primary key,
    id_tipo_venta          integer                    not null
        constraint fk_tipo_venta_concepto_tipo_venta
            references tipo_venta,
    icm_id_concepto_venta  varchar(12) not null,
    nombre                 varchar(128)        not null,
    descripcion            varchar(255)        not null);

comment on table tipo_venta_concepto is '1	01	Venta online ipod	2
2	02	Venta online SINT	3
3	03	Venta online entrega tienda	4
4	04	Venta online entrega domicilio (por venta)	5
5	05	Venta online entrega domicilio (por presencia)	5';

comment on column tipo_venta_concepto.id_tipo_venta_concepto is 'Identificador de la tabla';

comment on column tipo_venta_concepto.id_tipo_venta is 'Identificador de la tabla';

comment on column tipo_venta_concepto.icm_id_concepto_venta is 'Codigo, hace referncia al codigo con el que el modelo de Meta4 identifica el  concepto de la venta.Tabla M4ICM_X_CONCEPTOS_VENTA_ONLINE. Campo ICM_ID_CONCEPTO_VENTA.';

comment on column tipo_venta_concepto.nombre is 'Nombre del concepto';

comment on column tipo_venta_concepto.descripcion is 'Descripcion de la concepto';

create index ix_tipo_venta_concepto_tipo_venta
    on tipo_venta_concepto (id_tipo_venta);

grant delete, insert, select, update on table tipo_venta_concepto to rcompensacion_comision;

grant select on table tipo_venta_concepto to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_venta_concepto to rmantenimiento_compensacion_comision;

grant select on table tipo_venta_concepto to rcompensacion_comision_meta4;

grant select on table tipo_venta_concepto to rservicios_sil_sistema_informacional;

grant select on table tipo_venta_concepto to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_venta_concepto to rmantenimiento_income;

create table tipo_venta_concepto_challenge
(id_tipo_venta_concepto_challenge integer                    not null
        constraint pk_tipo_venta_concepto_challenge
            primary key,
    id_tipo_venta                    integer                    not null
        constraint fk_tipo_venta_concepto_challenge_tipo_venta
            references tipo_venta,
    icm_id_concepto_venta            varchar(12) not null,
    nombre                           varchar(128)        not null,
    descripcion                      varchar(255)        not null);

comment on table tipo_venta_concepto_challenge is 'Tabla maestra con los conceptos de venta (Meta4) relacionados con Challenge (Presupuestos)';

comment on column tipo_venta_concepto_challenge.id_tipo_venta_concepto_challenge is 'Identificador del tipo de venta challenge';

comment on column tipo_venta_concepto_challenge.id_tipo_venta is 'Identificador de la tabla';

comment on column tipo_venta_concepto_challenge.icm_id_concepto_venta is 'Codigo, hace referncia al codigo con el que el modelo de Meta4 identifica el  concepto de la venta.Tabla M4ICM_X_CONCEPTOS_VENTA. Campo ICM_ID_CONCEPTO_VENTA.';

comment on column tipo_venta_concepto_challenge.nombre is 'Nombre del concepto';

comment on column tipo_venta_concepto_challenge.descripcion is 'Descripcion del concepto';

create index ix_tipo_venta_concepto_challenge_tipo_venta
    on tipo_venta_concepto_challenge (id_tipo_venta);

grant select on table tipo_venta_concepto_challenge to rreporting_services_rrhh;

grant select on table tipo_venta_concepto_challenge to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tipo_venta_concepto_challenge to rcompensacion_comision;

grant select on table tipo_venta_concepto_challenge to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_venta_concepto_challenge to rmantenimiento_compensacion_comision;

grant select on table tipo_venta_concepto_challenge to rcompensacion_comision_meta4;

grant select on table tipo_venta_concepto_challenge to retl_rrhh;

grant select on table tipo_venta_concepto_challenge to rservicios_sil_sistema_informacional;

grant select on table tipo_venta_concepto_challenge to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_venta_concepto_challenge to rmantenimiento_income;

create table tipo_venta_localizacion_simulacion
(id_tipo_venta_localizacion_simulacion integer             not null
        constraint pk_tipo_venta_localizacion_simulacion
            primary key,
    nombre                                varchar(128) not null,
    descripcion                           varchar(255) not null,
    peso                                  integer             not null);

comment on table tipo_venta_localizacion_simulacion is 'Tipos de venta por tienda utilizada en la simulacion: Real, Último cálculo, Introducida manualmente';

comment on column tipo_venta_localizacion_simulacion.id_tipo_venta_localizacion_simulacion is 'Identificador de la tabla';

comment on column tipo_venta_localizacion_simulacion.nombre is 'Nombre';

comment on column tipo_venta_localizacion_simulacion.descripcion is 'Descripcion larga';

comment on column tipo_venta_localizacion_simulacion.peso is 'Peso ';

create table simulacion
(id_simulacion                             bigint generated always as identity (cache 100)
        constraint pk_simulacion
            primary key,
    std_id_leg_ent                            varchar(24) not null,
    ccl_id_origen                             varchar(24) not null,
    ccl_id_cadena                             varchar(12) not null,
    ccl_id_person                             varchar(24) not null,
    std_or_hr_period                          varchar(24) not null,
    std_id_hr                                 varchar(9)  not null,
    icm_id_periodo                            bigint                     not null,
    fecha_inicio                              date                       not null,
    fecha_fin                                 date                       not null,
    ccl_id_cod_origen                         varchar(24) not null,
    std_id_work_locat                         varchar(24) not null,
    fecha_hora_creacion                       timestamp(6)               not null,
    id_tipo_presencia_localizacion_simulacion integer default 1          not null
        constraint fk_simulacion_tipo_presencia_localizacion_simulacion
            references tipo_presencia_localizacion_simulacion,
    id_tipo_presencia_persona_simulacion      integer default 1          not null
        constraint fk_simulacion_tipo_presencia_persona_simulacion
            references tipo_presencia_persona_simulacion,
    id_tipo_venta_localizacion_simulacion     integer default 1          not null
        constraint fk_simulacion_tipo_venta_localizacion_simulacion
            references tipo_venta_localizacion_simulacion);

comment on table simulacion is 'Tabla con los datos de cada simulacion';

comment on column simulacion.id_simulacion is 'Identificador de la simulación';

comment on column simulacion.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column simulacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column simulacion.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column simulacion.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column simulacion.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column simulacion.std_id_hr is 'Id. universal del empleado, STD_HR_PERIOD, tabla de maestros de periodos';

comment on column simulacion.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column simulacion.fecha_inicio is 'Fecha inicio vigor estructura';

comment on column simulacion.fecha_fin is 'Fecha fin vigor estructura';

comment on column simulacion.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column simulacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column simulacion.fecha_hora_creacion is 'Fecha hora de creación';

comment on column simulacion.id_tipo_presencia_localizacion_simulacion is 'Identificador de tipos de presencia por localizacion utilizadas en la simulacion';

comment on column simulacion.id_tipo_presencia_persona_simulacion is 'Identificador de tipos de presencia por persona utilizadas en la simulacion';

comment on column simulacion.id_tipo_venta_localizacion_simulacion is 'Identificador de tipos de venta por tienda utilizada en la simulacion';

create index ix_simulacion_tipo_presencia_persona_simulacion
    on simulacion (id_tipo_presencia_persona_simulacion);

create index ix_simulacion_tipo_venta_localizacion_simulacion
    on simulacion (id_tipo_venta_localizacion_simulacion);

grant delete, insert, select, update on table simulacion to rcompensacion_comision;

grant select on table simulacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table simulacion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table simulacion to rcompensacion_comision_meta4;

grant insert, select, update on table simulacion to rmantenimiento_income;

create table simulacion_condicion
(id_simulacion bigint
        constraint fk_simulacion_condicion_simulacion
            references simulacion,
    id_condicion  bigint
        constraint fk_simulacion_condicion_condicion
            references condicion);

comment on table simulacion_condicion is 'Tabla con la relación entre condiciones y simulación';

comment on column simulacion_condicion.id_simulacion is 'Identificador de la simulación';

comment on column simulacion_condicion.id_condicion is 'Identificador de la condicion';

create index ix_simulacion_condicion_condicion
    on simulacion_condicion (id_condicion);

create index ix_simulacion_condicion_simulacion
    on simulacion_condicion (id_simulacion);

grant delete, insert, select, update on table simulacion_condicion to rcompensacion_comision;

grant select on table simulacion_condicion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table simulacion_condicion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table simulacion_condicion to rcompensacion_comision_meta4;

grant insert, select, update on table simulacion_condicion to rmantenimiento_income;

create table simulacion_localizacion_banda_excepcion
(id_simulacion_localizacion_banda_excepcion bigint generated always as identity (start with 1)
        constraint pk_simulacion_localizacion_banda_excepcion
            primary key,
    id_simulacion                              bigint                     not null
        constraint fk_simulacion_localizacion_banda_excepcion_simulacion
            references simulacion,
    ccl_id_cod_origen                          varchar(24) not null,
    banda                                      integer                    not null,
    ccl_id_seccion                             varchar(2));

comment on table simulacion_localizacion_banda_excepcion is 'Tabla para almacenar las excepciones de banda para las tiendas de la simulacion';

comment on column simulacion_localizacion_banda_excepcion.id_simulacion_localizacion_banda_excepcion is 'Identificador de la tabla';

comment on column simulacion_localizacion_banda_excepcion.id_simulacion is 'Identificador de la simulación';

comment on column simulacion_localizacion_banda_excepcion.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column simulacion_localizacion_banda_excepcion.banda is 'Banda con la que se realiza el cálculo ';

comment on column simulacion_localizacion_banda_excepcion.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

create index ix_simulacion_localizacion_banda_excepcion_simulacion
    on simulacion_localizacion_banda_excepcion (id_simulacion);

grant delete, insert, select, update on table simulacion_localizacion_banda_excepcion to rcompensacion_comision;

grant select on table simulacion_localizacion_banda_excepcion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table simulacion_localizacion_banda_excepcion to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table simulacion_localizacion_banda_excepcion to rcompensacion_comision_meta4;

grant delete, insert, select, update on table tipo_venta_localizacion_simulacion to rcompensacion_comision;

grant select on table tipo_venta_localizacion_simulacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_venta_localizacion_simulacion to rmantenimiento_compensacion_comision;

grant select on table tipo_venta_localizacion_simulacion to rcompensacion_comision_meta4;

create table tipo_venta_relacion_comis
(id_tipo_venta_relacion_comis bigint generated always as identity (start with 1)
        constraint pk_tipo_venta_relacion_comis
            primary key,
    id_tipo_venta                bigint             not null
        constraint fk_tipo_venta_relacion_comis_tipo_venta
            references tipo_venta,
    cod_tipo_venta_comis         varchar(40) not null);

comment on table tipo_venta_relacion_comis is 'Relacion entre los tipos de venta INCOME y los tipo de porcentaje COMIS';

comment on column tipo_venta_relacion_comis.id_tipo_venta_relacion_comis is 'Identificador autogenerado de la tabla';

comment on column tipo_venta_relacion_comis.id_tipo_venta is 'Identificador del tipo de venta INCOME';

comment on column tipo_venta_relacion_comis.cod_tipo_venta_comis is 'Columna asociada al tipo de venta COMIS';

create index ix_tipo_venta_relacion_comis_tipo_venta
    on tipo_venta_relacion_comis (id_tipo_venta);

grant delete, insert, select, update on table tipo_venta_relacion_comis to rcompensacion_comision;

grant select on table tipo_venta_relacion_comis to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tipo_venta_relacion_comis to rmantenimiento_compensacion_comision;

grant select on table tipo_venta_relacion_comis to rcompensacion_comision_meta4;

grant select on table tipo_venta_relacion_comis to rservicios_sil_sistema_informacional;

grant select on table tipo_venta_relacion_comis to rreporting_sil_sistema_informacional;

grant insert, select, update on table tipo_venta_relacion_comis to rmantenimiento_income;

create table trabajo
(id_trabajo                bigint generated always as identity (cache 100)
        constraint pk_trabajo
            primary key,
    id_programacion           bigint
        constraint fk_trabajo_programacion
            references programacion,
    id_tipo_ambito            integer                    not null
        constraint fk_trabajo_tipo_ambito
            references tipo_ambito,
    icm_id_periodo            bigint                     not null,
    id_organization           varchar(24) not null,
    nombre_usuario            varchar(32)         not null,
    fecha_hora_creacion       timestamp(6)               not null,
    fecha_inicio_periodo      date                       not null,
    fecha_fin_periodo         date                       not null,
    id_estado_trabajo         integer                    not null
        constraint fk_trabajo_estado_trabajo
            references estado_trabajo,
    fecha_hora_inicio_trabajo timestamp(6),
    fecha_hora_fin_trabajo    timestamp(6),
    id_simulacion             bigint
        constraint fk_trabajo_simulacion
            references simulacion);

comment on table trabajo is 'Tabla con los trabajaos de cálculo';

comment on column trabajo.id_trabajo is 'Indetificador del trabajo';

comment on column trabajo.id_programacion is 'Identificador de la programación';

comment on column trabajo.id_tipo_ambito is 'Indentificador del tipo de ambito';

comment on column trabajo.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column trabajo.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION,Maestro de organizaciones';

comment on column trabajo.nombre_usuario is 'Identificador del usuario que lanza el trabajo';

comment on column trabajo.fecha_hora_creacion is 'Fecha hora de creación';

comment on column trabajo.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column trabajo.fecha_fin_periodo is 'Fecha fin periodo';

comment on column trabajo.id_estado_trabajo is 'Identificador del estado del trabajo de cálculo';

comment on column trabajo.fecha_hora_inicio_trabajo is 'Fecha hora incio trabajo';

comment on column trabajo.fecha_hora_fin_trabajo is 'Fecha hora fin trabajo';

comment on column trabajo.id_simulacion is 'Identificador de la simulación';

create table tarea
(id_tarea                bigint generated always as identity (cache 100)
        constraint pk_tarea
            primary key,
    id_estado_tarea         integer                    not null
        constraint fk_tarea_estado_tarea
            references estado_tarea,
    id_trabajo              bigint                     not null
        constraint fk_tarea_trabajo
            references trabajo,
    fecha_hora_creacion     timestamp(6)               not null,
    fecha_hora_inicio_tarea timestamp(6),
    fecha_hora_fin_tarea    timestamp(6),
    std_id_leg_ent          varchar(24) not null,
    id_organization         varchar(24) not null,
    fecha_inicio_periodo    date                       not null,
    fecha_fin_periodo       date                       not null);

comment on table tarea is 'Tabla con la tares de cada que desecadena cada trabajo';

comment on column tarea.id_tarea is 'Identificador de la tarea';

comment on column tarea.id_estado_tarea is 'Identificador del estado de la tarea del cálculo';

comment on column tarea.id_trabajo is 'Indetificador del trabajo';

comment on column tarea.fecha_hora_creacion is 'Fecha hora de creación';

comment on column tarea.fecha_hora_inicio_tarea is 'Fecha hora incio tarea';

comment on column tarea.fecha_hora_fin_tarea is 'Fecha hora fin tarea';

comment on column tarea.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea.id_organization is 'Id. organización/sociedad, M4RCH_ORGANIZATION,Maestro de organizaciones';

comment on column tarea.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea.fecha_fin_periodo is 'Fecha fin periodo';

create table periodo_calculo_persona
(std_id_leg_ent           varchar(24) not null,
    ccl_id_origen            varchar(24) not null,
    icm_id_periodo           bigint                     not null,
    ccl_id_person            varchar(24) not null,
    std_or_hr_period         varchar(24) not null,
    id_estado                integer                    not null
        constraint fk_periodo_calculo_persona_estado_periodo_calculo_persona
            references estado_periodo_calculo_persona,
    id_tarea_actual          bigint                     not null
        constraint fk_periodo_calculo_persona_tarea_actual
            references tarea,
    id_tarea_ultima          bigint                     not null
        constraint fk_periodo_calculo_persona_tarea_ultima
            references tarea,
    es_bloqueado             numeric(1)                 not null,
    fecha_hora_actualizacion timestamp(6)               not null,
    fecha_hora_creacion      timestamp(6)               not null,
    constraint pk_periodo_calculo_persona
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, ccl_id_person, std_or_hr_period));

comment on table periodo_calculo_persona is 'Tabla con la consolidación de personas y cálculo por periodo. Mantiene tanto un bloqueo por registro, como una relación de cálculo asociado a cada persona por cada periodo.';

comment on column periodo_calculo_persona.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column periodo_calculo_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column periodo_calculo_persona.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column periodo_calculo_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column periodo_calculo_persona.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column periodo_calculo_persona.id_estado is 'Identificador de la tabla';

comment on column periodo_calculo_persona.id_tarea_actual is 'identificcador de la tarea';

comment on column periodo_calculo_persona.id_tarea_ultima is 'Identificador de la Ãºltima tarea';

comment on column periodo_calculo_persona.es_bloqueado is 'Indica si esta bloqueado para el pago';

comment on column periodo_calculo_persona.fecha_hora_actualizacion is 'Fecha de actualizació';

comment on column periodo_calculo_persona.fecha_hora_creacion is 'Fecha de creación';

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

grant select on table periodo_calculo_persona to rreporting_services_rrhh;

grant select on table periodo_calculo_persona to rmonitorizacion_rrhh;

grant delete, insert, select, update on table periodo_calculo_persona to rcompensacion_comision;

grant select on table periodo_calculo_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table periodo_calculo_persona to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table periodo_calculo_persona to rcompensacion_comision_meta4;

grant select on table periodo_calculo_persona to retl_rrhh;

grant select on table periodo_calculo_persona to rservicios_sil_sistema_informacional;

grant select on table periodo_calculo_persona to rreporting_sil_sistema_informacional;

grant select on table periodo_calculo_persona to rbrecha_salarial;

grant select on table periodo_calculo_persona to rmantenimiento_brecha_salarial;

grant select on table periodo_calculo_persona to rmonitorizacion_brecha_salarial;

grant delete, insert, select, update on table periodo_calculo_persona to rmantenimiento_income;

grant select on table periodo_calculo_persona to rmantenimiento_brechasala;

create table periodo_calculo_persona_reexport
(std_id_leg_ent           varchar(24) not null,
    ccl_id_origen            varchar(24) not null,
    icm_id_periodo           bigint                     not null,
    ccl_id_person            varchar(24) not null,
    std_or_hr_period         varchar(24) not null,
    id_tarea                 bigint                     not null
        constraint fk_periodo_calculo_persona_reexport_tarea
            references tarea,
    fecha_hora_actualizacion timestamp(10) not null,
    constraint pk_periodo_calculo_persona_reexport
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, ccl_id_person, std_or_hr_period, id_tarea));

grant delete, insert, select, update on table periodo_calculo_persona_reexport to rcompensacion_comision;

grant select on table periodo_calculo_persona_reexport to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table periodo_calculo_persona_reexport to rcompensacion_comision_meta4;

create table periodo_consolidar_tarea
(icm_id_periodo      bigint                     not null,
    ccl_id_origen       varchar(24) not null,
    std_id_leg_ent      varchar(24) not null,
    id_tarea            bigint                     not null
        constraint fk_periodo_consolidar_tarea
            references tarea,
    fecha_hora_creacion timestamp(6)               not null,
    constraint pk_periodo_consolidar
        primary key (icm_id_periodo, ccl_id_origen, std_id_leg_ent, id_tarea));

comment on table periodo_consolidar_tarea is 'Tabla que mantiene el listado de ámbitos pendientes de consolidar por tarea. Se elimina cada registro una vez terminado el proceso de consolidación.';

comment on column periodo_consolidar_tarea.icm_id_periodo is 'Id. Periodo, M4ICM_PERIODOS, Maestro de Periodos';

comment on column periodo_consolidar_tarea.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronización';

comment on column periodo_consolidar_tarea.std_id_leg_ent is 'Id empresa, STD_LEG_ENT, Maestro de empresas';

comment on column periodo_consolidar_tarea.id_tarea is 'identificador de la tarea ';

comment on column periodo_consolidar_tarea.fecha_hora_creacion is 'Fecha de creación';

create index ix_periodo_consolidar_tarea_tarea
    on periodo_consolidar_tarea (id_tarea);

grant delete, insert, select, update on table periodo_consolidar_tarea to rcompensacion_comision;

grant select on table periodo_consolidar_tarea to rmonitorizacion_compensacion_comision;

grant insert, select, update on table periodo_consolidar_tarea to rmantenimiento_income;

create index ix_tarea_estado_tarea
    on tarea (id_estado_tarea);

create index ix_tarea_trabajo
    on tarea (id_trabajo);

grant select on table tarea to rreporting_services_rrhh;

grant select on table tarea to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea to rcompensacion_comision;

grant select on table tarea to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea to rmantenimiento_compensacion_comision;

grant select on table tarea to rcompensacion_comision_meta4;

grant select on table tarea to retl_rrhh;

grant select on table tarea to rservicios_sil_sistema_informacional;

grant select on table tarea to rreporting_sil_sistema_informacional;

grant select on table tarea to rbrecha_salarial;

grant select on table tarea to rmantenimiento_brecha_salarial;

grant select on table tarea to rmonitorizacion_brecha_salarial;

grant insert, select, update on table tarea to rmantenimiento_income;

grant select on table tarea to rmantenimiento_brechasala;

create table tarea_agrupacion_cadena
(id_tarea_agrupacion_cadena bigint generated always as identity (cache 100)
        constraint pk_tarea_agrupacion_cadena
            primary key,
    id_tarea                   bigint                     not null
        constraint fk_tarea_agrupacion_cadena_tarea
            references tarea,
    icm_id_agrupacion_online   bigint                     not null,
    ccl_id_cadena              varchar(24) not null,
    ccl_id_origen              varchar(24) not null,
    es_multiple                numeric(1)                 not null);

comment on table tarea_agrupacion_cadena is 'Tabla de agrupaciones de cadena para la venta online';

comment on column tarea_agrupacion_cadena.id_tarea_agrupacion_cadena is 'Tabala con la agrupacion de tareas cadena';

comment on column tarea_agrupacion_cadena.id_tarea is 'Identificador de la tarea';

comment on column tarea_agrupacion_cadena.icm_id_agrupacion_online is 'Id. agrupacion, M4ICM_X_AGRUPACION_ONLINE, Tabla de configuración para la venta online';

comment on column tarea_agrupacion_cadena.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_agrupacion_cadena.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_agrupacion_cadena.es_multiple is 'Indicador de es una multiple';

create index ix_tarea_agrupacion_cadena_01
    on tarea_agrupacion_cadena (id_tarea, ccl_id_cadena);

create index ix_tarea_agrupacion_cadena_tarea
    on tarea_agrupacion_cadena (id_tarea);

grant select on table tarea_agrupacion_cadena to rreporting_services_rrhh;

grant select on table tarea_agrupacion_cadena to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_agrupacion_cadena to rcompensacion_comision;

grant select on table tarea_agrupacion_cadena to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_agrupacion_cadena to rmantenimiento_compensacion_comision;

grant select on table tarea_agrupacion_cadena to rcompensacion_comision_meta4;

grant select on table tarea_agrupacion_cadena to retl_rrhh;

grant select on table tarea_agrupacion_cadena to rservicios_sil_sistema_informacional;

grant select on table tarea_agrupacion_cadena to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_agrupacion_cadena to rmantenimiento_income;

create table tarea_agrupacion_configuracion
(id_tarea_agrupacion_configuracion bigint generated always as identity (cache 100)
        constraint pk_tarea_agrupacion_configuracion
            primary key,
    id_tarea                          bigint                     not null
        constraint fk_tarea_agrupacion_configuracion_tarea
            references tarea,
    id_tipo_venta_concepto            integer                    not null
        constraint fk_tarea_agrupacion_configuracion_tipo_venta_concepto
            references tipo_venta_concepto,
    fecha_fin                         date                       not null,
    fecha_inicio                      date                       not null,
    icm_id_agrupacion_online          bigint                     not null,
    ccl_id_origen                     varchar(24) not null,
    porcentaje_inclusion              numeric(23,8)             not null);

comment on table tarea_agrupacion_configuracion is 'Tabla de agrupaciones configuración para la venta online';

comment on column tarea_agrupacion_configuracion.id_tarea_agrupacion_configuracion is 'Identificador de la tabla';

comment on column tarea_agrupacion_configuracion.id_tarea is 'Identificador de la tarea';

comment on column tarea_agrupacion_configuracion.id_tipo_venta_concepto is 'Identificador de la tabla';

comment on column tarea_agrupacion_configuracion.fecha_fin is 'Fecha de Incio';

comment on column tarea_agrupacion_configuracion.fecha_inicio is 'Fecha Fin';

comment on column tarea_agrupacion_configuracion.icm_id_agrupacion_online is 'Id. agrupacion, M4ICM_X_AGRUPACION_ONLINE, Tabla de configuración para la venta online';

comment on column tarea_agrupacion_configuracion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_agrupacion_configuracion.porcentaje_inclusion is 'Porcentaje que aplica para la venta online';

create index ix_tarea_agrupacion_configuracion_tarea
    on tarea_agrupacion_configuracion (id_tarea);

create index ix_tarea_agrupacion_configuracion_tipo_venta_concepto
    on tarea_agrupacion_configuracion (id_tipo_venta_concepto);

grant select on table tarea_agrupacion_configuracion to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_agrupacion_configuracion to rcompensacion_comision;

grant select on table tarea_agrupacion_configuracion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_agrupacion_configuracion to rmantenimiento_compensacion_comision;

grant select on table tarea_agrupacion_configuracion to rcompensacion_comision_meta4;

grant select on table tarea_agrupacion_configuracion to rservicios_sil_sistema_informacional;

grant select on table tarea_agrupacion_configuracion to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_agrupacion_configuracion to rmantenimiento_income;

create table tarea_agrupacion_configuracion_challenge_tipo_venta
(id_tarea_agrupacion_configuracion_challenge_tipo_venta bigint generated always as identity (cache 100)
        constraint pk_tarea_agrupacion_configuracion_challenge_tipo_venta
            primary key,
    id_tarea                                               bigint                     not null
        constraint fk_tarea_agrupacion_configuracion_challenge_tipo_venta_tarea
            references tarea,
    icm_id_agrupacion_online                               bigint                     not null,
    id_tipo_venta_concepto_challenge                       integer                    not null
        constraint fk_t_a_c_c_t_v_tipo_venta_concepto_challenge
            references tipo_venta_concepto_challenge,
    fecha_inicio                                           date                       not null,
    fecha_fin                                              date                       not null,
    ccl_id_origen                                          varchar(24) not null);

comment on table tarea_agrupacion_configuracion_challenge_tipo_venta is 'Tabla de agrupaciones configuración para el challenge';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.id_tarea_agrupacion_configuracion_challenge_tipo_venta is 'Id de la configuración.';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.id_tarea is 'Identificador de la tarea';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.icm_id_agrupacion_online is 'Id. agrupacion, M4ICM_X_AGRUPACION_ONLINE, Tabla de configuración para la venta online';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.id_tipo_venta_concepto_challenge is 'Identificador del tipo de venta challenge';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.fecha_inicio is 'Fecha inicio vigor presupuesto';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.fecha_fin is 'Fecha fin vigor presupuesto';

comment on column tarea_agrupacion_configuracion_challenge_tipo_venta.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_tarea_agrupacion_configuracion_challenge_tipo_venta_01
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tarea, ccl_id_origen, id_tipo_venta_concepto_challenge);

create index ix_tarea_agrupacion_configuracion_challenge_tipo_venta_tarea
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tarea);

create index ix_t_a_c_c_t_v_tipo_venta_concepto_challenge
    on tarea_agrupacion_configuracion_challenge_tipo_venta (id_tipo_venta_concepto_challenge);

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rreporting_services_rrhh;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_agrupacion_configuracion_challenge_tipo_venta to rcompensacion_comision;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_agrupacion_configuracion_challenge_tipo_venta to rmantenimiento_compensacion_comision;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rcompensacion_comision_meta4;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to retl_rrhh;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rservicios_sil_sistema_informacional;

grant select on table tarea_agrupacion_configuracion_challenge_tipo_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_agrupacion_configuracion_challenge_tipo_venta to rmantenimiento_income;

create table tarea_agrupacion_presencia
(id_tarea_agrupacion_presencia bigint generated always as identity (cache 100)
        constraint pk_tarea_agrupacion_presencia
            primary key,
    id_tarea                      bigint                                not null
        constraint fk_tarea_agrupacion_presencia_tarea
            references tarea,
    id_tipo_dato                  integer                               not null
        constraint fk_tarea_agrupacion_presencia_tipo_dato
            references tipo_dato,
    es_activo                     numeric(1)                            not null,
    fecha                         date                                  not null,
    icm_id_agrupacion_online      bigint                                not null,
    ccl_id_seccion                varchar(2)             not null,
    minutos                       integer                               not null,
    ccl_id_origen                 varchar(24) default '' not null);

comment on table tarea_agrupacion_presencia is 'Tabla de agrupaciones por presencia en minutos para la venta online';

comment on column tarea_agrupacion_presencia.id_tarea_agrupacion_presencia is 'Identificador de la tabla';

comment on column tarea_agrupacion_presencia.id_tarea is 'Identificador de la tarea';

comment on column tarea_agrupacion_presencia.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_agrupacion_presencia.es_activo is 'Indicador de si esta activo';

comment on column tarea_agrupacion_presencia.fecha is 'Fecha de la presecia';

comment on column tarea_agrupacion_presencia.icm_id_agrupacion_online is 'Id. agrupacion, M4ICM_X_AGRUPACION_ONLINE, Tabla de configuración para la venta online';

comment on column tarea_agrupacion_presencia.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_agrupacion_presencia.minutos is 'Tiempo en minutos de presencia de un empleado';

comment on column tarea_agrupacion_presencia.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

create index ix_tarea_agrupacion_presencia_tarea
    on tarea_agrupacion_presencia (id_tarea);

create index ix_tarea_agrupacion_presencia_tipo_dato
    on tarea_agrupacion_presencia (id_tipo_dato);

grant delete, insert, select, update on table tarea_agrupacion_presencia to rcompensacion_comision;

grant select on table tarea_agrupacion_presencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_agrupacion_presencia to rmantenimiento_compensacion_comision;

grant select on table tarea_agrupacion_presencia to rcompensacion_comision_meta4;

grant select on table tarea_agrupacion_presencia to rservicios_sil_sistema_informacional;

grant select on table tarea_agrupacion_presencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_agrupacion_presencia to rmantenimiento_income;

create table tarea_agrupacion_venta
(id_tarea_agrupacion_venta bigint generated always as identity (cache 100)
        constraint pk_tarea_agrupacion_venta
            primary key,
    id_tarea                  bigint                                not null
        constraint fk_tarea_agrupacion_venta_tarea
            references tarea,
    id_tipo_dato              integer                               not null
        constraint fk_tarea_agrupacion_venta_tipo_dato
            references tipo_dato,
    es_activo                 numeric(1)                            not null,
    fecha                     date                                  not null,
    icm_id_agrupacion_online  bigint                                not null,
    ccl_id_seccion            varchar(2)             not null,
    importe_sin_impuestos     numeric(23,8)                        not null,
    importe_con_impuestos     numeric(23,8)                        not null,
    ccl_id_origen             varchar(24) default '' not null);

comment on table tarea_agrupacion_venta is 'Tabla de agrupaciones por importe de venta para la venta online';

comment on column tarea_agrupacion_venta.id_tarea_agrupacion_venta is 'Identificador de la tabla';

comment on column tarea_agrupacion_venta.id_tarea is 'Identificador de la tarea';

comment on column tarea_agrupacion_venta.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_agrupacion_venta.es_activo is 'Indicador de si esta activo';

comment on column tarea_agrupacion_venta.fecha is 'Fecha de la venta';

comment on column tarea_agrupacion_venta.icm_id_agrupacion_online is 'Id. agrupacion, M4ICM_X_AGRUPACION_ONLINE, Tabla de configuración para la venta online';

comment on column tarea_agrupacion_venta.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_agrupacion_venta.importe_sin_impuestos is 'Importe sin impuesto';

comment on column tarea_agrupacion_venta.importe_con_impuestos is 'Importe con impuesto';

comment on column tarea_agrupacion_venta.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

create index ix_tarea_agrupacion_venta_tarea
    on tarea_agrupacion_venta (id_tarea);

create index ix_tarea_agrupacion_venta_tipo_dato
    on tarea_agrupacion_venta (id_tipo_dato);

grant delete, insert, select, update on table tarea_agrupacion_venta to rcompensacion_comision;

grant select on table tarea_agrupacion_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_agrupacion_venta to rmantenimiento_compensacion_comision;

grant select on table tarea_agrupacion_venta to rcompensacion_comision_meta4;

grant select on table tarea_agrupacion_venta to rservicios_sil_sistema_informacional;

grant select on table tarea_agrupacion_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_agrupacion_venta to rmantenimiento_income;

create table tarea_ambito
(id_tarea_ambito bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito
            primary key,
    id_tarea        bigint                     not null
        constraint fk_tarea_ambito_tarea
            references tarea,
    ccl_id_origen   varchar(24) not null);

comment on table tarea_ambito is 'Tabla de ralacion entre el ambito y las tareas de del trabajo';

comment on column tarea_ambito.id_tarea_ambito is 'Identificador de la tarea ambito';

comment on column tarea_ambito.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_tarea_ambito_tarea
    on tarea_ambito (id_tarea);

grant select on table tarea_ambito to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_ambito to rcompensacion_comision;

grant select on table tarea_ambito to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito to rcompensacion_comision_meta4;

grant select on table tarea_ambito to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito to rmantenimiento_income;

create table tarea_ambito_global_empresa
(id_tarea_ambito_global_empresa bigint generated always as identity (start with 1)
        constraint pk_tarea_ambito_global_empresa
            primary key,
    id_tarea                       bigint                     not null
        constraint fk_tarea_ambito_global_empresa_tarea
            references tarea,
    ccl_id_origen                  varchar(24) not null,
    std_id_leg_ent                 varchar(24) not null);

comment on table tarea_ambito_global_empresa is 'Tabla con la agrupación de tareas agrupadas por empresa y origen';

comment on column tarea_ambito_global_empresa.id_tarea_ambito_global_empresa is 'Identificador de la tabla';

comment on column tarea_ambito_global_empresa.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_empresa.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronización';

comment on column tarea_ambito_global_empresa.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

create index ix_tarea_ambito_global_empresa_tarea
    on tarea_ambito_global_empresa (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_empresa to rcompensacion_comision;

grant select on table tarea_ambito_global_empresa to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_empresa to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_empresa to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_empresa to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_empresa to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_empresa to rmantenimiento_income;

create table tarea_ambito_global_fecha
(id_tarea_ambito_global_fecha bigint generated always as identity (start with 1)
        constraint pk_tarea_ambito_global_fecha
            primary key,
    id_tarea                     bigint  not null
        constraint fk_tarea_ambito_global_fecha_tarea
            references tarea,
    fecha_inicio                 date    not null,
    fecha_fin                    date    not null,
    id_tipo_dato                 integer not null
        constraint fk_tarea_ambito_global_fecha_tipo_dato
            references tipo_dato);

comment on table tarea_ambito_global_fecha is 'Tabla con la agrupación de tareas agrupadas por fecha';

comment on column tarea_ambito_global_fecha.id_tarea_ambito_global_fecha is 'Identificador de la tabla';

comment on column tarea_ambito_global_fecha.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_fecha.fecha_inicio is 'Fecha inicio periodo de recoleccion de datos';

comment on column tarea_ambito_global_fecha.fecha_fin is 'Fecha fin periodo de recoleccion de datos';

comment on column tarea_ambito_global_fecha.id_tipo_dato is 'Identificadode del tipo de dato';

create index ix_tarea_ambito_global_fecha_tarea
    on tarea_ambito_global_fecha (id_tarea);

create index ix_tarea_ambito_global_fecha_tipo_dato
    on tarea_ambito_global_fecha (id_tipo_dato);

grant delete, insert, select, update on table tarea_ambito_global_fecha to rcompensacion_comision;

grant select on table tarea_ambito_global_fecha to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_fecha to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_fecha to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_fecha to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_fecha to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_fecha to rmantenimiento_income;

create table tarea_ambito_global_localizacion
(id_tarea_ambito_global_localizacion bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_localizacion
            primary key,
    id_tarea                            bigint                     not null
        constraint fk_tarea_ambito_global_localizacion_tarea
            references tarea,
    std_id_leg_ent                      varchar(24) not null,
    std_id_work_locat                   varchar(24) not null,
    ccl_id_origen                       varchar(24) not null);

comment on table tarea_ambito_global_localizacion is 'Tabla con la agrupación de tareas agrupadas por empresa, localización y origen';

comment on column tarea_ambito_global_localizacion.id_tarea_ambito_global_localizacion is 'Identificador de la tabla';

comment on column tarea_ambito_global_localizacion.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_localizacion.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_ambito_global_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_tarea_ambito_global_localizacion_01
    on tarea_ambito_global_localizacion (id_tarea, std_id_work_locat);

create index ix_tarea_ambito_global_localizacion_tarea
    on tarea_ambito_global_localizacion (id_tarea);

grant select on table tarea_ambito_global_localizacion to rreporting_services_rrhh;

grant select on table tarea_ambito_global_localizacion to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_ambito_global_localizacion to rcompensacion_comision;

grant select on table tarea_ambito_global_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_localizacion to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_localizacion to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_localizacion to retl_rrhh;

grant select on table tarea_ambito_global_localizacion to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_localizacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_localizacion to rmantenimiento_income;

create table tarea_ambito_global_localizacion_persona
(id_tarea_ambito_global_localizacion_persona bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_localizacion_persona
            primary key,
    id_tarea                                    bigint                     not null
        constraint fk_tarea_ambito_global_localizacion_persona_tarea
            references tarea,
    std_id_leg_ent                              varchar(24) not null,
    std_id_work_locat                           varchar(24) not null,
    ccl_id_origen                               varchar(24) not null,
    ccl_id_person                               varchar(24) not null);

comment on table tarea_ambito_global_localizacion_persona is 'Tabla con la agrupación de tareas agrupadas por empresa, localización, origen y empleado';

comment on column tarea_ambito_global_localizacion_persona.id_tarea_ambito_global_localizacion_persona is 'Identificador de la tabla';

comment on column tarea_ambito_global_localizacion_persona.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_localizacion_persona.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_localizacion_persona.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_ambito_global_localizacion_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_global_localizacion_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_global_localizacion_persona_01
    on tarea_ambito_global_localizacion_persona (id_tarea, ccl_id_person, std_id_work_locat);

create index ix_tarea_ambito_global_localizacion_persona_02
    on tarea_ambito_global_localizacion_persona (id_tarea, std_id_work_locat, ccl_id_person);

create index ix_tarea_ambito_global_localizacion_persona_tarea
    on tarea_ambito_global_localizacion_persona (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona to rcompensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_localizacion_persona to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_localizacion_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_localizacion_persona to rmantenimiento_income;

create table tarea_ambito_global_localizacion_persona_desplazamiento
(id_tarea_ambito_global_localizacion_persona_desplazamiento bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_localizacion_persona_desplazamiento
            primary key,
    id_tarea                                                   bigint                     not null
        constraint fk_t_a_g_l_p_d_tarea
            references tarea,
    std_id_leg_ent                                             varchar(24) not null,
    std_id_work_locat                                          varchar(24) not null,
    ccl_id_origen                                              varchar(24) not null,
    ccl_id_person                                              varchar(24) not null);

comment on table tarea_ambito_global_localizacion_persona_desplazamiento is 'Tabla con la agrupacion de empleados con estructuras que tienen desplazamientos';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.id_tarea_ambito_global_localizacion_persona_desplazamiento is 'Identificador de la tabla';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_global_localizacion_persona_desplazamiento.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_global_localizacion_persona_desplazamiento_01
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea, ccl_id_person, std_id_work_locat);

create index ix_tarea_ambito_global_localizacion_persona_desplazamiento_02
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea, std_id_work_locat, ccl_id_person);

create index ix_t_a_g_l_p_d_tarea
    on tarea_ambito_global_localizacion_persona_desplazamiento (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_desplazamiento to rcompensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_desplazamiento to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_desplazamiento to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_desplazamiento to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_localizacion_persona_desplazamiento to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_localizacion_persona_desplazamiento to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_localizacion_persona_desplazamiento to rmantenimiento_income;

create table tarea_ambito_global_localizacion_persona_presencia
(id_tarea_ambito_global_localizacion_persona_presencia bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_localizacion_persona_presencia
            primary key,
    id_tarea                                              bigint                     not null
        constraint fk_tarea_ambito_global_localizacion_persona_presencia_tarea
            references tarea,
    std_id_leg_ent                                        varchar(24) not null,
    ccl_id_cod_origen                                     varchar(24) not null,
    ccl_id_origen                                         varchar(24) not null,
    ccl_id_person                                         varchar(24) not null);

comment on table tarea_ambito_global_localizacion_persona_presencia is 'Tabla con la agrupación de tareas con presencias de PTR, agrupadas por empesa, localización, origen y empleado';

comment on column tarea_ambito_global_localizacion_persona_presencia.id_tarea_ambito_global_localizacion_persona_presencia is 'Identificador de la tabla';

comment on column tarea_ambito_global_localizacion_persona_presencia.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_localizacion_persona_presencia.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_localizacion_persona_presencia.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo'' ;';

comment on column tarea_ambito_global_localizacion_persona_presencia.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_global_localizacion_persona_presencia.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_global_localizacion_persona_presencia_01
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea, ccl_id_person, ccl_id_cod_origen);

create index ix_tarea_ambito_global_localizacion_persona_presencia_02
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea, ccl_id_cod_origen, ccl_id_person);

create index ix_tarea_ambito_global_localizacion_persona_presencia_tarea
    on tarea_ambito_global_localizacion_persona_presencia (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_presencia to rcompensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_presencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_presencia to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_presencia to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_localizacion_persona_presencia to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_localizacion_persona_presencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_localizacion_persona_presencia to rmantenimiento_income;

create table tarea_ambito_global_localizacion_persona_presencia_manual
(id_tarea_ambito_global_localizacion_persona_presencia_manual bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_localizacion_persona_presencia_manual
            primary key,
    id_tarea                                                     bigint                     not null
        constraint fk_t_a_g_l_p_p_m_tarea
            references tarea,
    std_id_leg_ent                                               varchar(24) not null,
    std_id_work_locat                                            varchar(24) not null,
    ccl_id_origen                                                varchar(24) not null,
    ccl_id_person                                                varchar(24) not null);

comment on table tarea_ambito_global_localizacion_persona_presencia_manual is 'Tabla con la agrupación de tareas con presencia Manual (Meta4) agrupadas por empresa, localización, origen y empleado';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.id_tarea_ambito_global_localizacion_persona_presencia_manual is 'Identificador de la tabla';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_global_localizacion_persona_presencia_manual.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_global_localizacion_persona_presencia_manual_01
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea, ccl_id_person, std_id_work_locat);

create index ix_tarea_ambito_global_localizacion_persona_presencia_manual_02
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea, std_id_work_locat, ccl_id_person);

create index ix_t_a_g_l_p_p_m_tarea
    on tarea_ambito_global_localizacion_persona_presencia_manual (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_presencia_manual to rcompensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_presencia_manual to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_localizacion_persona_presencia_manual to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_localizacion_persona_presencia_manual to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_localizacion_persona_presencia_manual to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_localizacion_persona_presencia_manual to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_localizacion_persona_presencia_manual to rmantenimiento_income;

create table tarea_ambito_global_persona
(id_tarea_ambito_global_persona bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_global_persona
            primary key,
    id_tarea                       bigint                     not null
        constraint fk_tarea_ambito_global_persona_tarea
            references tarea,
    std_id_leg_ent                 varchar(24) not null,
    ccl_id_origen                  varchar(24) not null,
    ccl_id_person                  varchar(24) not null);

comment on table tarea_ambito_global_persona is 'Tabla con la agrupación de tareas agrupadas por empresa, origen y empleado';

comment on column tarea_ambito_global_persona.id_tarea_ambito_global_persona is 'Identificador de la tabla';

comment on column tarea_ambito_global_persona.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_global_persona.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_ambito_global_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_global_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_global_persona_01
    on tarea_ambito_global_persona (id_tarea, ccl_id_person);

create index ix_tarea_ambito_global_persona_tarea
    on tarea_ambito_global_persona (id_tarea);

grant delete, insert, select, update on table tarea_ambito_global_persona to rcompensacion_comision;

grant select on table tarea_ambito_global_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_global_persona to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_global_persona to rcompensacion_comision_meta4;

grant select on table tarea_ambito_global_persona to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_global_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_global_persona to rmantenimiento_income;

create table tarea_ambito_localizacion
(id_tarea_ambito_localizacion bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_localizacion
            primary key,
    id_tarea                     bigint                     not null
        constraint fk_tarea_ambito_localizacion_tarea
            references tarea,
    std_id_work_locat            varchar(24) not null,
    ccl_id_origen                varchar(24) not null);

comment on table tarea_ambito_localizacion is 'Tabla de ralacion entre el ambito, las tareas de del trabajo y su localizacion';

comment on column tarea_ambito_localizacion.id_tarea_ambito_localizacion is 'Identificador de la tabla';

comment on column tarea_ambito_localizacion.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_ambito_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_tarea_ambito_localizacion_01
    on tarea_ambito_localizacion (id_tarea, std_id_work_locat);

create index ix_tarea_ambito_localizacion_tarea
    on tarea_ambito_localizacion (id_tarea);

grant delete, insert, select, update on table tarea_ambito_localizacion to rcompensacion_comision;

grant select on table tarea_ambito_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_localizacion to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_localizacion to rcompensacion_comision_meta4;

grant select on table tarea_ambito_localizacion to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_localizacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_localizacion to rmantenimiento_income;

create table tarea_ambito_persona
(id_tarea_ambito_persona bigint generated always as identity (cache 100)
        constraint pk_tarea_ambito_persona
            primary key,
    id_tarea                bigint                     not null
        constraint fk_tarea_ambito_persona_tarea
            references tarea,
    ccl_id_origen           varchar(24) not null,
    ccl_id_person           varchar(24) not null,
    std_or_hr_period        varchar(24) not null);

comment on table tarea_ambito_persona is 'Tabla de ralacion entre el ambito, las tareas y empleados';

comment on column tarea_ambito_persona.id_tarea_ambito_persona is 'Identificador de la tabla';

comment on column tarea_ambito_persona.id_tarea is 'Identificador de la tarea';

comment on column tarea_ambito_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_ambito_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_ambito_persona.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_ambito_persona_01
    on tarea_ambito_persona (id_tarea, ccl_id_person);

create index ix_tarea_ambito_persona_tarea
    on tarea_ambito_persona (id_tarea);

grant delete, insert, select, update on table tarea_ambito_persona to rcompensacion_comision;

grant select on table tarea_ambito_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_ambito_persona to rmantenimiento_compensacion_comision;

grant select on table tarea_ambito_persona to rcompensacion_comision_meta4;

grant select on table tarea_ambito_persona to rservicios_sil_sistema_informacional;

grant select on table tarea_ambito_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_ambito_persona to rmantenimiento_income;

create table tarea_calculo_ajuste_comision
(id_tarea_calculo_ajuste_comision bigint generated always as identity (start with 1),
    fecha_inicio_periodo             date                       not null,
    id_tarea                         bigint                     not null
        constraint fk_tarea_calculo_ajuste_comision_tarea
            references tarea,
    ccl_id_person                    varchar(24) not null,
    std_or_hr_period                 varchar(24) not null,
    importe                          numeric(23,8)             not null,
    id_tipo_comision                 varchar(12) not null,
    fecha                            date                       not null,
    constraint pk_tarea_calculo_ajuste_comision
        primary key (id_tarea_calculo_ajuste_comision, fecha_inicio_periodo));

comment on table tarea_calculo_ajuste_comision is 'Resultado del cálculo para algoritmos de ajuste manual prorrateado por tipo de comisión.';

comment on column tarea_calculo_ajuste_comision.id_tarea_calculo_ajuste_comision is 'Identificador de la tabla';

comment on column tarea_calculo_ajuste_comision.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_calculo_ajuste_comision.id_tarea is 'Identificador de la tarea';

comment on column tarea_calculo_ajuste_comision.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo_ajuste_comision.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo_ajuste_comision.importe is 'Importe';

comment on column tarea_calculo_ajuste_comision.id_tipo_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestro de tipos de comisión InCome';

comment on column tarea_calculo_ajuste_comision.fecha is 'Fecha correspondiente al día del  periodo para el que se cálculo y existe importe';

create index ix_tarea_calculo_ajuste_comision_01
    on tarea_calculo_ajuste_comision (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha);

create index ix_tarea_calculo_ajuste_comision_tarea
    on tarea_calculo_ajuste_comision (id_tarea);

grant select on table tarea_calculo_ajuste_comision to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_calculo_ajuste_comision to rcompensacion_comision;

grant select on table tarea_calculo_ajuste_comision to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_calculo_ajuste_comision to rmantenimiento_compensacion_comision;

grant select on table tarea_calculo_ajuste_comision to rcompensacion_comision_meta4;

grant select on table tarea_calculo_ajuste_comision to rservicios_sil_sistema_informacional;

grant select on table tarea_calculo_ajuste_comision to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_calculo_ajuste_comision to rmantenimiento_income;

create table tarea_calculo_persona
(id_tarea_calculo_persona bigint generated always as identity (cache 100)
        constraint pk_tarea_calculo_persona
            primary key,
    id_estado                integer                    not null
        constraint fk_tarea_calculo_persona_estado_tarea_persona
            references estado_tarea_persona,
    id_tarea                 bigint                     not null
        constraint fk_tarea_calculo_persona_tarea
            references tarea,
    ccl_id_origen            varchar(24) not null,
    ccl_id_person            varchar(24) not null,
    std_or_hr_period         varchar(24) not null);

comment on table tarea_calculo_persona is 'Tabla con el estado de los empleados afectadas por cada tarea.';

comment on column tarea_calculo_persona.id_tarea_calculo_persona is 'Identificador de la tabla';

comment on column tarea_calculo_persona.id_estado is 'Identificador de la tabla';

comment on column tarea_calculo_persona.id_tarea is 'Identificador de la tarea';

comment on column tarea_calculo_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_calculo_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo_persona.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_tarea_calculo_persona_01
    on tarea_calculo_persona (id_tarea, ccl_id_person, std_or_hr_period);

create index ix_tarea_calculo_persona_estado_tarea_persona
    on tarea_calculo_persona (id_estado);

create index ix_tarea_calculo_persona_tarea
    on tarea_calculo_persona (id_tarea);

grant delete, insert, select, update on table tarea_calculo_persona to rcompensacion_comision;

grant select on table tarea_calculo_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_calculo_persona to rmantenimiento_compensacion_comision;

grant select on table tarea_calculo_persona to rcompensacion_comision_meta4;

grant select on table tarea_calculo_persona to rservicios_sil_sistema_informacional;

grant select on table tarea_calculo_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_calculo_persona to rmantenimiento_income;

create table tarea_configuracion
(id_tarea_configuracion   bigint generated always as identity (cache 100)
        constraint pk_tarea_configuracion
            primary key,
    id_tarea                 bigint
        constraint fk_tarea_configuracion_tarea
            references tarea,
    ccl_id_origen            varchar(24) not null,
    fecha_fin                date                       not null,
    fecha_inicio             date                       not null,
    icm_ck_venta_impuestos   numeric(1)                 not null,
    cod_tipo_hora            integer,
    icm_ck_inc_iva_eval_ptpo numeric(1)                 not null,
    icm_ck_red_jornada       numeric(1) default 0       not null);

comment on table tarea_configuracion is 'Tabla con la configuración de cálculo de los orígenes.';

comment on column tarea_configuracion.id_tarea_configuracion is 'Identificador de la tabla';

comment on column tarea_configuracion.id_tarea is 'Identificador de la tarea';

comment on column tarea_configuracion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column tarea_configuracion.fecha_fin is 'Fecha de Incio';

comment on column tarea_configuracion.fecha_inicio is 'Fecha Fin';

comment on column tarea_configuracion.icm_ck_venta_impuestos is 'Check de venta con/sin impuestos, M4ICM_CONF_PARAMETROS_SOC.ICM_CK_VENTA_IMPUESTOS';

comment on column tarea_configuracion.cod_tipo_hora is 'Este dato está compuesto por los datos obtenidos de dos orígenes distintos, por un lado el tipo de hora que se obtiene de PTR (Obtenido de los SILes por país)
y por el otro el que se obtiene de Meta4 (PeopleNet), M4ICM_X_TP_HORA (ICM_ID_TP_HORA).';

comment on column tarea_configuracion.icm_ck_inc_iva_eval_ptpo is 'Check de evaluacion de presupuestos con/sin iva, M4ICM_CONF_CHALLENGE.ICM_CK_INC_IVA_EVAL_PTPO';

comment on column tarea_configuracion.icm_ck_red_jornada is 'Check que indica si se aplica reducción de jornada, M4ICM_CONF_PARAMETROS_SOC.ICM_CK_RED_JORNADA';

create index ix_tarea_configuracion_tarea
    on tarea_configuracion (id_tarea);

grant select on table tarea_configuracion to rreporting_services_rrhh;

grant select on table tarea_configuracion to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_configuracion to rcompensacion_comision;

grant select on table tarea_configuracion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_configuracion to rmantenimiento_compensacion_comision;

grant select on table tarea_configuracion to rcompensacion_comision_meta4;

grant select on table tarea_configuracion to retl_rrhh;

grant select on table tarea_configuracion to rservicios_sil_sistema_informacional;

grant select on table tarea_configuracion to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_configuracion to rmantenimiento_income;

create table tarea_configuracion_challenge_dias_minimos
(id_tarea_configuracion_challenge_dias_minimos bigint generated always as identity (cache 100)
        constraint pk_tarea_configuracion_challenge_dias_minimos
            primary key,
    id_tarea                                      bigint                     not null
        constraint fk_tarea_configuracion_challenge_dias_minimos_tarea
            references tarea,
    icm_id_tp_calculo                             varchar(24) not null,
    icm_min_num_days                              integer                    not null,
    fecha_inicio                                  date                       not null,
    fecha_fin                                     date                       not null,
    ccl_id_origen                                 varchar(24) not null);

comment on table tarea_configuracion_challenge_dias_minimos is 'Tabla con la configuración de los días mínimos del challenge.';

comment on column tarea_configuracion_challenge_dias_minimos.id_tarea_configuracion_challenge_dias_minimos is 'Identificador de la configuración.';

comment on column tarea_configuracion_challenge_dias_minimos.id_tarea is 'Identificador de la tarea';

comment on column tarea_configuracion_challenge_dias_minimos.icm_id_tp_calculo is 'Id del tipo de cálculo, hace referncia al codigo con el que el modelo de Meta4 identifica el tipo de cálculo.Tabla M4ICM_X_TP_CALCULO. Campo ICM_ID_TP_CALCULO.';

comment on column tarea_configuracion_challenge_dias_minimos.icm_min_num_days is 'Número mínimo de días para aplicar un presupuesto, viene de la tabla meta4 de InCome M4ICM_CONF_CHALLENGE_DAYS';

comment on column tarea_configuracion_challenge_dias_minimos.fecha_inicio is 'Fecha inicio vigor de la configuración.';

comment on column tarea_configuracion_challenge_dias_minimos.fecha_fin is 'Fecha fin vigor de la configuración.';

comment on column tarea_configuracion_challenge_dias_minimos.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

create index ix_tarea_configuracion_challenge_dias_minimos_01
    on tarea_configuracion_challenge_dias_minimos (id_tarea, ccl_id_origen);

create index ix_tarea_configuracion_challenge_dias_minimos_tarea
    on tarea_configuracion_challenge_dias_minimos (id_tarea);

grant delete, insert, select, update on table tarea_configuracion_challenge_dias_minimos to rcompensacion_comision;

grant select on table tarea_configuracion_challenge_dias_minimos to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_configuracion_challenge_dias_minimos to rmantenimiento_compensacion_comision;

grant select on table tarea_configuracion_challenge_dias_minimos to rcompensacion_comision_meta4;

grant select on table tarea_configuracion_challenge_dias_minimos to rservicios_sil_sistema_informacional;

grant select on table tarea_configuracion_challenge_dias_minimos to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_configuracion_challenge_dias_minimos to rmantenimiento_income;

create table tarea_configuracion_precio_hora
(id_tarea_configuracion_precio_hora bigint generated always as identity (cache 100)
        constraint pk_tarea_configuracion_precio_hora
            primary key,
    id_tarea                           bigint                     not null
        constraint fk_tarea_configuracion_precio_hora_tarea
            references tarea,
    icm_ck_tp_hora_comis               numeric(1)                 not null,
    icm_ck_tp_hora_inc_ptpo            numeric(1)                 not null,
    fecha_inicio                       date                       not null,
    fecha_fin                          date                       not null,
    ccl_id_origen                      varchar(24) not null);

comment on table tarea_configuracion_precio_hora is 'Tabla con la configuración del challenge precio/hora.';

comment on column tarea_configuracion_precio_hora.id_tarea_configuracion_precio_hora is 'Identificador de la configuración.';

comment on column tarea_configuracion_precio_hora.id_tarea is 'Identificador de la tarea';

comment on column tarea_configuracion_precio_hora.icm_ck_tp_hora_comis is 'Check de comisionable, viene de la tabla meta4 de InCome M4ICM_CONF_PRECIOHORA';

comment on column tarea_configuracion_precio_hora.icm_ck_tp_hora_inc_ptpo is 'Check de incluído presupuesto, viene de la tabla meta4 de InCome M4ICM_CONF_PRECIOHORA';

comment on column tarea_configuracion_precio_hora.fecha_inicio is 'Fecha inicio vigor de la configuración.';

comment on column tarea_configuracion_precio_hora.fecha_fin is 'Fecha fin vigor de la configuración.';

comment on column tarea_configuracion_precio_hora.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

create index ix_tarea_configuracion_precio_hora_01
    on tarea_configuracion_precio_hora (id_tarea, ccl_id_origen);

create index ix_tarea_configuracion_precio_hora_tarea
    on tarea_configuracion_precio_hora (id_tarea);

grant delete, insert, select, update on table tarea_configuracion_precio_hora to rcompensacion_comision;

grant select on table tarea_configuracion_precio_hora to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_configuracion_precio_hora to rmantenimiento_compensacion_comision;

grant select on table tarea_configuracion_precio_hora to rcompensacion_comision_meta4;

grant select on table tarea_configuracion_precio_hora to retl_rrhh;

grant select on table tarea_configuracion_precio_hora to rservicios_sil_sistema_informacional;

grant select on table tarea_configuracion_precio_hora to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_configuracion_precio_hora to rmantenimiento_income;

create table tarea_fase
(id_tarea_fase        bigint generated always as identity (cache 100)
        constraint pk_tarea_fase
            primary key,
    id_tarea             bigint       not null
        constraint fk_tarea_fase_tarea
            references tarea,
    id_fase              integer      not null
        constraint fk_tarea_fase_fase
            references fase,
    id_estado_tarea_fase integer      not null
        constraint fk_tarea_fase_estado_tarea_fase
            references estado_tarea_fase,
    fecha_hora_creacion  timestamp(6) not null,
    fecha_hora_inicio    timestamp(6),
    fecha_hora_fin       timestamp(6),
    es_activo            numeric(1)   not null);

comment on table tarea_fase is 'Procesamiento de fases por tarea';

comment on column tarea_fase.id_tarea_fase is 'Identificador de la tarea fase';

comment on column tarea_fase.id_tarea is 'Identificador de la tarea';

comment on column tarea_fase.id_fase is 'Identificador de la fase';

comment on column tarea_fase.id_estado_tarea_fase is 'Identificador del estado de tarea fase';

comment on column tarea_fase.fecha_hora_creacion is 'Fecha y hora de creación';

comment on column tarea_fase.fecha_hora_inicio is 'Fecha en la que se empieza a procesar la fase';

comment on column tarea_fase.fecha_hora_fin is 'Fecha en la que se termina de procesar la fase';

comment on column tarea_fase.es_activo is 'Flag que indica si la tarea fase está activa';

create index ix_tarea_fase_estado_tarea_fase
    on tarea_fase (id_estado_tarea_fase);

create index ix_tarea_fase_fase
    on tarea_fase (id_fase);

create index ix_tarea_fase_tarea
    on tarea_fase (id_tarea);

grant select on table tarea_fase to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_fase to rcompensacion_comision;

grant select on table tarea_fase to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_fase to rmantenimiento_compensacion_comision;

grant select on table tarea_fase to rcompensacion_comision_meta4;

grant select on table tarea_fase to rservicios_sil_sistema_informacional;

grant select on table tarea_fase to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_fase to rmantenimiento_income;

create table tarea_fase_accion
(id_tarea_fase_accion        bigint generated always as identity (cache 100)
        constraint pk_tarea_fase_accion
            primary key,
    id_tarea_fase               bigint       not null
        constraint fk_tarea_fase_accion_tarea_fase
            references tarea_fase,
    id_accion                   integer      not null
        constraint fk_tarea_fase_accion_accion
            references accion,
    id_punto_ejecucion          integer      not null
        constraint fk_tarea_fase_accion_punto_ejecucion
            references punto_ejecucion,
    id_estado_tarea_fase_accion integer      not null
        constraint fk_tarea_fase_accion_estado_tarea_fase_accion
            references estado_tarea_fase_accion,
    fecha_hora_creacion         timestamp(6) not null,
    fecha_hora_inicio           timestamp(6),
    fecha_hora_fin              timestamp(6),
    es_activo                   numeric(1)   not null);

comment on table tarea_fase_accion is 'Procesamiento de acciones por fase y tarea';

comment on column tarea_fase_accion.id_tarea_fase_accion is 'Identificador de la tarea fase acción';

comment on column tarea_fase_accion.id_tarea_fase is 'Identificador de la tarea fase';

comment on column tarea_fase_accion.id_accion is 'Identificador de la acción';

comment on column tarea_fase_accion.id_punto_ejecucion is 'Identificador del punto de ejecución';

comment on column tarea_fase_accion.id_estado_tarea_fase_accion is 'Identificador del estado tarea fase';

comment on column tarea_fase_accion.fecha_hora_creacion is 'Fecha y hora de creación';

comment on column tarea_fase_accion.fecha_hora_inicio is 'Fecha en la que se empieza a procesar la fase';

comment on column tarea_fase_accion.fecha_hora_fin is 'Fecha en la que se termina de procesar la fase';

comment on column tarea_fase_accion.es_activo is 'Flag que indica si la tarea fase está activa';

create index ix_tarea_fase_accion_accion
    on tarea_fase_accion (id_accion);

create index ix_tarea_fase_accion_estado_tarea_fase_accion
    on tarea_fase_accion (id_estado_tarea_fase_accion);

create index ix_tarea_fase_accion_punto_ejecucion
    on tarea_fase_accion (id_punto_ejecucion);

create index ix_tarea_fase_accion_tarea_fase
    on tarea_fase_accion (id_tarea_fase);

grant select on table tarea_fase_accion to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_fase_accion to rcompensacion_comision;

grant select on table tarea_fase_accion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_fase_accion to rmantenimiento_compensacion_comision;

grant select on table tarea_fase_accion to rcompensacion_comision_meta4;

grant select on table tarea_fase_accion to rservicios_sil_sistema_informacional;

grant select on table tarea_fase_accion to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_fase_accion to rmantenimiento_income;

create table tarea_fase_accion_dato
(id_tarea_fase_accion bigint              not null
        constraint fk_tarea_fase_accion_dato_tarea_fase_accion
            references tarea_fase_accion,
    id_tipo_dato         integer             not null
        constraint fk_tarea_fase_accion_dato_tipo_dato
            references tipo_dato,
    dato                 varchar(255) not null,
    constraint pk_tarea_fase_accion_dato
        primary key (id_tarea_fase_accion, dato, id_tipo_dato));

comment on table tarea_fase_accion_dato is 'Tabla con los fallos de las validaciones por Tarea/Accion';

comment on column tarea_fase_accion_dato.id_tarea_fase_accion is 'Identificador de la tarea fase acción';

comment on column tarea_fase_accion_dato.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_fase_accion_dato.dato is 'Un string con lista de ids,o motivos en formato string';

create index ix_tarea_fase_accion_dato_tarea_fase_accion
    on tarea_fase_accion_dato (id_tarea_fase_accion);

create index ix_tarea_fase_accion_dato_tipo_dato
    on tarea_fase_accion_dato (id_tipo_dato);

grant delete, insert, select, update on table tarea_fase_accion_dato to rcompensacion_comision;

grant select on table tarea_fase_accion_dato to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_fase_accion_dato to rmantenimiento_compensacion_comision;

grant select on table tarea_fase_accion_dato to rcompensacion_comision_meta4;

grant insert, select, update on table tarea_fase_accion_dato to rmantenimiento_income;

create table tarea_fase_accion_venta_integra
(id_tarea_fase_accion bigint              not null
        constraint fk_tarea_fase_accion_venta_integra_tarea_fase_accion
            references tarea_fase_accion,
    id_tipo_dato         integer             not null
        constraint fk_tarea_fase_accion_venta_integra_tipo_dato
            references tipo_dato,
    tienda               varchar(255) not null,
    fecha_desintegridad  date                not null,
    constraint pk_tarea_fase_accion_venta_integra
        primary key (id_tarea_fase_accion, tienda, id_tipo_dato, fecha_desintegridad));

comment on table tarea_fase_accion_venta_integra is 'Tabla con los datos de desitegridad de la venta para calculo ';

comment on column tarea_fase_accion_venta_integra.id_tarea_fase_accion is 'Identificador de la tarea fase acci��n';

comment on column tarea_fase_accion_venta_integra.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_fase_accion_venta_integra.tienda is 'Id de la tienda afectada';

comment on column tarea_fase_accion_venta_integra.fecha_desintegridad is 'Fecha desintegridad';

create index ix_tarea_fase_accion_venta_integra_tarea_fase_accion
    on tarea_fase_accion_venta_integra (id_tarea_fase_accion);

create index ix_tarea_fase_accion_venta_integra_tipo_dato
    on tarea_fase_accion_venta_integra (id_tipo_dato);

grant delete, insert, select, update on table tarea_fase_accion_venta_integra to rcompensacion_comision;

grant select on table tarea_fase_accion_venta_integra to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_fase_accion_venta_integra to rmantenimiento_compensacion_comision;

grant select on table tarea_fase_accion_venta_integra to rcompensacion_comision_meta4;

grant insert, select, update on table tarea_fase_accion_venta_integra to rmantenimiento_income;

create table tarea_limpieza
(id_tarea            bigint                        not null
        constraint fk_tarea_limpieza_tarea
            references tarea,
    fecha_hora_creacion timestamp(6)                  not null,
    nombre_usuario      varchar(32) default '' not null,
    id_tarea_limpieza   bigint generated always as identity (cache 100)
        constraint pk_tarea_limpieza
            primary key,
    id_estado_limpieza  integer                       not null
        constraint fk_tarea_limpieza_estado_limpieza
            references estado_limpieza,
    id_tipo_limpieza    integer                       not null
        constraint fk_tarea_limpieza_tipo_limpieza
            references tipo_limpieza,
    fecha_hora_inicio   timestamp(6),
    fecha_hora_fin      timestamp(6));

comment on table tarea_limpieza is 'Tabla con los identificadores de tareas que se han limpiado de la base de datos';

comment on column tarea_limpieza.id_tarea is 'Identificador de la tarea';

comment on column tarea_limpieza.fecha_hora_creacion is 'Fecha y hora de la limpieza';

comment on column tarea_limpieza.nombre_usuario is 'Identificador del usuario que lanza la limpieza';

comment on column tarea_limpieza.id_tarea_limpieza is 'Identificador de la limpieza';

comment on column tarea_limpieza.id_estado_limpieza is 'Identificador del estado de la limpieza';

comment on column tarea_limpieza.id_tipo_limpieza is 'Identificador del tipo de limpieza';

comment on column tarea_limpieza.fecha_hora_inicio is 'Fecha en la que se inició la limpieza';

comment on column tarea_limpieza.fecha_hora_fin is 'Fecha en la que se finalizó la limpieza';

create index ix_tarea_limpieza_estado_limpieza
    on tarea_limpieza (id_estado_limpieza);

create index ix_tarea_limpieza_tarea
    on tarea_limpieza (id_tarea);

create index ix_tarea_limpieza_tipo_limpieza
    on tarea_limpieza (id_tipo_limpieza);

grant delete, insert, select, update on table tarea_limpieza to rcompensacion_comision;

grant select on table tarea_limpieza to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_limpieza to rmantenimiento_compensacion_comision;

grant select on table tarea_limpieza to rcompensacion_comision_meta4;

grant select on table tarea_limpieza to rservicios_sil_sistema_informacional;

grant select on table tarea_limpieza to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_limpieza to rmantenimiento_income;

create table tarea_localizacion_abierta
(id_tarea_localizacion_abierta bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_abierta
            primary key,
    id_tarea                      bigint                     not null
        constraint fk_tarea_localizacion_abierta_tarea
            references tarea,
    ccl_id_cod_origen             varchar(24) not null,
    es_abierto                    numeric(1)                 not null,
    fecha                         date                       not null,
    ccl_id_seccion                varchar(2)  not null);

comment on table tarea_localizacion_abierta is 'Tabla con las localizaciones abiertas';

comment on column tarea_localizacion_abierta.id_tarea_localizacion_abierta is 'Identificador  de la tabla';

comment on column tarea_localizacion_abierta.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_abierta.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_abierta.es_abierto is 'Flag indica si estado dela localizacion es abierto o no';

comment on column tarea_localizacion_abierta.fecha is 'Fecha de cuando esta abierta la localizacion';

comment on column tarea_localizacion_abierta.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

create index ix_tarea_localizacion_abierta_01
    on tarea_localizacion_abierta (id_tarea, ccl_id_cod_origen, fecha);

create index ix_tarea_localizacion_abierta_tarea
    on tarea_localizacion_abierta (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_abierta to rcompensacion_comision;

grant select on table tarea_localizacion_abierta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_abierta to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_abierta to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_abierta to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_abierta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_abierta to rmantenimiento_income;

create table tarea_localizacion_calcular
(id_tarea_localizacion_calcular bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_calcular
            primary key,
    id_tarea                       bigint                     not null
        constraint fk_tarea_localizacion_calcular_tarea
            references tarea,
    ccl_id_cod_origen              varchar(24) not null,
    std_id_work_locat              varchar(24) not null,
    es_calcula                     numeric(1)                 not null,
    fecha_inicio                   date                       not null,
    fecha_fin                      date                       not null);

comment on table tarea_localizacion_calcular is 'Tabla con el flag calcula asociado a cada localziacion';

comment on column tarea_localizacion_calcular.id_tarea_localizacion_calcular is 'Identificador de la tabla';

comment on column tarea_localizacion_calcular.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_calcular.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_calcular.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_calcular.es_calcula is 'Falg inidicadr si se tiene en cuenta esa localizacion para calcular';

comment on column tarea_localizacion_calcular.fecha_inicio is 'Fecha hora  inicio de la tarea';

comment on column tarea_localizacion_calcular.fecha_fin is 'Fecha hora fin de la tarea';

create index ix_tarea_localizacion_calcular_01
    on tarea_localizacion_calcular (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_calcular_02
    on tarea_localizacion_calcular (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_calcular_tarea
    on tarea_localizacion_calcular (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_calcular to rcompensacion_comision;

grant select on table tarea_localizacion_calcular to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_calcular to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_calcular to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_calcular to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_calcular to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_calcular to rmantenimiento_income;

create table tarea_localizacion_comision_historico
(id_tarea_localizacion_comision_historico bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_comision_historico
            primary key,
    id_tarea                                 bigint                     not null
        constraint fk_tarea_localizacion_comision_historico_tarea
            references tarea,
    ccl_id_cod_origen                        varchar(24) not null,
    std_id_work_locat                        varchar(24) not null,
    es_comisionable                          numeric(1)                 not null,
    fecha_inicio                             date                       not null,
    fecha_fin                                date                       not null);

comment on table tarea_localizacion_comision_historico is 'Tabla con el histórico de tiendas comisionables';

comment on column tarea_localizacion_comision_historico.id_tarea_localizacion_comision_historico is 'Identificador de la tabla';

comment on column tarea_localizacion_comision_historico.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_comision_historico.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_comision_historico.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_comision_historico.es_comisionable is 'Flag  que indica si la tienda es comisionable';

comment on column tarea_localizacion_comision_historico.fecha_inicio is 'Fecha fin  de histórico de tiendas comisionables';

comment on column tarea_localizacion_comision_historico.fecha_fin is 'Fecha incio de hostórico de tiendas comisionables';

create index ix_tarea_localizacion_comision_historico_01
    on tarea_localizacion_comision_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_comision_historico_02
    on tarea_localizacion_comision_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_comision_historico_tarea
    on tarea_localizacion_comision_historico (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_comision_historico to rcompensacion_comision;

grant select on table tarea_localizacion_comision_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_comision_historico to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_comision_historico to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_comision_historico to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_comision_historico to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_comision_historico to rmantenimiento_income;

create table tarea_localizacion_estado
(id_tarea_localizacion_estado bigint generated always as identity (start with 1)
        constraint pk_tarea_localizacion_estado
            primary key,
    id_tarea                     bigint                     not null
        constraint fk_tarea_localizacion_estado_tarea
            references tarea,
    icm_id_estado                varchar(12) not null,
    std_id_leg_ent               varchar(24) not null,
    ccl_id_origen                varchar(24) not null,
    ccl_id_seccion               varchar(2)  not null,
    std_id_work_locat            varchar(24) not null,
    fecha_inicio                 date                       not null,
    fecha_fin                    date                       not null,
    icm_num_dias                 integer);

comment on table tarea_localizacion_estado is 'Tabla con las modificaciones manuales del estado de las tiendas';

comment on column tarea_localizacion_estado.icm_id_estado is 'Estado de la tienda meta4';

comment on column tarea_localizacion_estado.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_estado.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_localizacion_estado.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_estado.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_estado.fecha_inicio is 'Fecha inicio';

comment on column tarea_localizacion_estado.fecha_fin is 'Fecha fin';

comment on column tarea_localizacion_estado.icm_num_dias is 'Iindica el numero de dias entre los que ha de repartirse el cálculo challenge.';

create index ix_tarea_localizacion_estado_tarea
    on tarea_localizacion_estado (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_estado to rcompensacion_comision;

grant select on table tarea_localizacion_estado to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_estado to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_estado to rcompensacion_comision_meta4;

grant insert, select, update on table tarea_localizacion_estado to rmantenimiento_income;

create table tarea_localizacion_festivo
(id_tarea_localizacion_festivo bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_festivo
            primary key,
    id_tarea                      bigint                     not null
        constraint fk_tarea_localizacion_festivo_tarea
            references tarea,
    ccl_id_cod_origen             varchar(24) not null,
    fecha                         date                       not null);

comment on table tarea_localizacion_festivo is 'Tabla con los festivos de cada localizacion';

comment on column tarea_localizacion_festivo.id_tarea_localizacion_festivo is 'Identificador de la tabla';

comment on column tarea_localizacion_festivo.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_festivo.ccl_id_cod_origen is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_festivo.fecha is 'Fecha del dia festivo';

create index ix_tarea_localizacion_festivo_01
    on tarea_localizacion_festivo (id_tarea, ccl_id_cod_origen, fecha);

create index ix_tarea_localizacion_festivo_tarea
    on tarea_localizacion_festivo (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_festivo to rcompensacion_comision;

grant select on table tarea_localizacion_festivo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_festivo to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_festivo to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_festivo to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_festivo to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_festivo to rmantenimiento_income;

create table tarea_localizacion_historico
(id_tarea_localizacion_historico bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_historico
            primary key,
    id_tarea                        bigint                     not null
        constraint fk_tarea_localizacion_historico_tarea
            references tarea,
    ccl_id_cadena                   varchar(12) not null,
    std_id_leg_ent                  varchar(24) not null,
    ccl_id_cod_origen               varchar(24) not null,
    std_id_work_locat               varchar(24) not null,
    std_id_country                  varchar(4)  not null,
    ccl_id_origen                   varchar(24) not null,
    fecha_inicio                    date                       not null,
    fecha_fin                       date                       not null,
    std_id_sub_geo_div              varchar(8));

comment on table tarea_localizacion_historico is 'Tabla con los históricos de empleado (posición, sección, etc)';

comment on column tarea_localizacion_historico.id_tarea_localizacion_historico is 'Identificador de la tabla';

comment on column tarea_localizacion_historico.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_historico.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_historico.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_historico.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_historico.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_historico.std_id_country is 'Id de país, tabla STD_COUNTRY Maestro de páises';

comment on column tarea_localizacion_historico.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_localizacion_historico.fecha_inicio is 'Feca fin';

comment on column tarea_localizacion_historico.fecha_fin is 'Fecha inicio';

comment on column tarea_localizacion_historico.std_id_sub_geo_div is 'Id de provincia, tabla STD_SUB_GEO_DIV Maestro de provincias';

create index ix_tarea_localizacion_historico_01
    on tarea_localizacion_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_historico_02
    on tarea_localizacion_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_historico_tarea
    on tarea_localizacion_historico (id_tarea);

grant select on table tarea_localizacion_historico to rreporting_services_rrhh;

grant select on table tarea_localizacion_historico to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_localizacion_historico to rcompensacion_comision;

grant select on table tarea_localizacion_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_historico to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_historico to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_historico to retl_rrhh;

grant select on table tarea_localizacion_historico to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_historico to rreporting_sil_sistema_informacional;

grant select on table tarea_localizacion_historico to rbrecha_salarial;

grant select on table tarea_localizacion_historico to rmantenimiento_brecha_salarial;

grant select on table tarea_localizacion_historico to rmonitorizacion_brecha_salarial;

grant insert, select, update on table tarea_localizacion_historico to rmantenimiento_income;

grant select on table tarea_localizacion_historico to rmantenimiento_brechasala;

create table tarea_localizacion_jornada
(id_tarea_localizacion_jornada bigint generated always as identity (start with 1)
        constraint pk_tarea_localizacion_jornada
            primary key,
    ccl_id_cod_origen             varchar(24) not null,
    fecha                         date                       not null,
    id_tipo_dato                  integer                    not null
        constraint fk_tarea_localizacion_jornada_tipo_dato
            references tipo_dato,
    id_tarea                      bigint                     not null
        constraint fk_tarea_localizacion_jornada_tarea
            references tarea,
    ccl_id_seccion                varchar(2)  not null,
    ccl_id_cadena                 varchar(12) not null,
    es_activo                     numeric(1)                 not null,
    minutos                       numeric(23,8)             not null);

comment on table tarea_localizacion_jornada is 'Tabla con la relación de localizaciones por tarea segun su jornada.';

comment on column tarea_localizacion_jornada.id_tarea_localizacion_jornada is 'Identificador de la tabla';

comment on column tarea_localizacion_jornada.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_jornada.fecha is 'Fecha de la jornada';

comment on column tarea_localizacion_jornada.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_jornada.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_jornada.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_jornada.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_jornada.es_activo is 'Flag indicador de sI esta activo';

comment on column tarea_localizacion_jornada.minutos is 'Tiempo en minutos de la jornada';

grant delete, insert, select, update on table tarea_localizacion_jornada to rcompensacion_comision;

grant select on table tarea_localizacion_jornada to rmonitorizacion_compensacion_comision;

grant select on table tarea_localizacion_jornada to rcompensacion_comision_meta4;

create table tarea_localizacion_online_historico
(id_tarea_localizacion_online_historico bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_online_historico
            primary key,
    id_tarea                               bigint                     not null
        constraint fk_tarea_localizacion_online_historico_tarea
            references tarea,
    ccl_id_cadena                          varchar(24) not null,
    std_id_leg_ent                         varchar(24) not null,
    ccl_id_cod_origen                      varchar(24) not null,
    std_id_work_locat                      varchar(24) not null,
    ccl_id_origen                          numeric(3)                 not null,
    fecha_inicio                           date                       not null,
    fecha_fin                              date                       not null);

comment on table tarea_localizacion_online_historico is 'Tabla con las tiendas online por cadena y origen';

comment on column tarea_localizacion_online_historico.id_tarea_localizacion_online_historico is 'Identificador de la tabla';

comment on column tarea_localizacion_online_historico.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_online_historico.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_online_historico.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_online_historico.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_online_historico.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_online_historico.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_localizacion_online_historico.fecha_inicio is 'Fecha Inicio';

comment on column tarea_localizacion_online_historico.fecha_fin is 'Fecha Fin';

create index ix_tarea_localizacion_online_historico_01
    on tarea_localizacion_online_historico (id_tarea, ccl_id_cod_origen, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_online_historico_02
    on tarea_localizacion_online_historico (id_tarea, std_id_work_locat, fecha_inicio, fecha_fin);

create index ix_tarea_localizacion_online_historico_tarea
    on tarea_localizacion_online_historico (id_tarea);

grant delete, insert, select, update on table tarea_localizacion_online_historico to rcompensacion_comision;

grant select on table tarea_localizacion_online_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_online_historico to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_online_historico to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_online_historico to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_online_historico to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_online_historico to rmantenimiento_income;

create table tarea_localizacion_persona_jornada
(id_tarea_localizacion_persona_jornada bigint generated always as identity (start with 1)
        constraint pk_tarea_localizacion_persona_jornada
            primary key,
    ccl_id_cod_origen                     varchar(24) not null,
    fecha                                 date                       not null,
    id_tipo_dato                          integer                    not null
        constraint fk_tarea_localizacion_persona_jornada_tipo_dato
            references tipo_dato,
    id_tarea                              bigint                     not null
        constraint fk_tarea_localizacion_persona_jornada_tarea
            references tarea,
    std_id_leg_ent                        varchar(24) not null,
    ccl_id_origen                         varchar(24) not null,
    ccl_id_person                         varchar(24) not null,
    ccl_id_seccion                        varchar(2)  not null,
    ccl_id_cadena                         varchar(12) not null,
    es_activo                             numeric(1)                 not null,
    minutos                               numeric(23,8)             not null);

comment on table tarea_localizacion_persona_jornada is 'Tabla con la relación de personas con localizaciones por tarea segun su jornada.';

comment on column tarea_localizacion_persona_jornada.id_tarea_localizacion_persona_jornada is 'Identificador de la tabla';

comment on column tarea_localizacion_persona_jornada.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_persona_jornada.fecha is 'Fecha de la jornada';

comment on column tarea_localizacion_persona_jornada.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_persona_jornada.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_persona_jornada.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_persona_jornada.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_localizacion_persona_jornada.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_localizacion_persona_jornada.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_persona_jornada.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_persona_jornada.es_activo is 'Flag indicador de sI esta activo';

comment on column tarea_localizacion_persona_jornada.minutos is 'Tiempo en minutos de la jornada';

grant delete, insert, select, update on table tarea_localizacion_persona_jornada to rcompensacion_comision;

grant select on table tarea_localizacion_persona_jornada to rmonitorizacion_compensacion_comision;

grant select on table tarea_localizacion_persona_jornada to rcompensacion_comision_meta4;

create table tarea_localizacion_persona_presencia
(id_tarea_localizacion_persona_presencia bigint generated always as identity (cache 100),
    fecha                                   date                       not null,
    id_tipo_dato                            integer                    not null
        constraint fk_tarea_localizacion_persona_presencia_tipo_dato
            references tipo_dato,
    id_tarea                                bigint                     not null
        constraint fk_tarea_localizacion_persona_presencia_tarea
            references tarea,
    std_id_leg_ent                          varchar(24) not null,
    ccl_id_cod_origen                       varchar(24) not null,
    ccl_id_origen                           varchar(24) not null,
    ccl_id_person                           varchar(24) not null,
    ccl_id_seccion                          varchar(2)  not null,
    ccl_id_cadena                           varchar(12) not null,
    es_activo                               numeric(1)                 not null,
    minutos                                 integer                    not null,
    fecha_inicio_periodo                    date                       not null,
    cod_tipo_hora                           integer                    not null,
    constraint pk_tarea_localizacion_persona_presencia
        primary key (fecha_inicio_periodo, id_tarea_localizacion_persona_presencia));

comment on table tarea_localizacion_persona_presencia is 'Tabla con la relación de personas con localizaciones por tarea segÃºn sus presencias.';

comment on column tarea_localizacion_persona_presencia.id_tarea_localizacion_persona_presencia is 'Identificador de la tabla';

comment on column tarea_localizacion_persona_presencia.fecha is 'Fecha de la presencia';

comment on column tarea_localizacion_persona_presencia.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_persona_presencia.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_persona_presencia.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_persona_presencia.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_persona_presencia.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_localizacion_persona_presencia.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_localizacion_persona_presencia.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_persona_presencia.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_persona_presencia.es_activo is 'Flag indicador de sI esta activo';

comment on column tarea_localizacion_persona_presencia.minutos is 'Tiempo en minutos de la presencia';

comment on column tarea_localizacion_persona_presencia.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_localizacion_persona_presencia.cod_tipo_hora is 'Este dato está compuesto por los datos obtenidos de dos orígenes distintos, por un lado el tipo de hora que se obtiene de PTR (Obtenido de los SILes por país)
y por el otro el que se obtiene de Meta4 (PeopleNet), M4ICM_X_TP_HORA (ICM_ID_TP_HORA).';

create index ix_tarea_localizacion_persona_presencia_01
    on tarea_localizacion_persona_presencia (fecha_inicio_periodo, id_tarea, ccl_id_person, fecha, ccl_id_cod_origen);

create index ix_tarea_localizacion_persona_presencia_02
    on tarea_localizacion_persona_presencia (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha, ccl_id_person);

create index ix_tarea_localizacion_persona_presencia_tarea
    on tarea_localizacion_persona_presencia (id_tarea);

create index ix_tarea_localizacion_persona_presencia_tipo_dato
    on tarea_localizacion_persona_presencia (id_tipo_dato);

grant select on table tarea_localizacion_persona_presencia to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_localizacion_persona_presencia to rcompensacion_comision;

grant select on table tarea_localizacion_persona_presencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_persona_presencia to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_persona_presencia to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_persona_presencia to retl_rrhh;

grant select on table tarea_localizacion_persona_presencia to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_persona_presencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_persona_presencia to rmantenimiento_income;

create table tarea_localizacion_persona_venta
(id_tarea_localizacion_persona_venta bigint generated always as identity (cache 100),
    fecha                               date                       not null,
    id_tarea                            bigint                     not null
        constraint fk_tarea_localizacion_persona_venta_tarea
            references tarea,
    id_tipo_dato                        integer                    not null
        constraint fk_tarea_localizacion_persona_venta_tipo_dato
            references tipo_dato,
    ccl_id_cod_origen                   varchar(24) not null,
    ccl_id_person                       varchar(24) not null,
    importe_sin_impuestos               numeric(23,8)             not null,
    importe_con_impuestos               numeric(23,8)             not null,
    fecha_inicio_periodo                date                       not null,
    ccl_id_cadena                       varchar(24) not null,
    ccl_id_seccion                      varchar(24) not null,
    es_activo                           numeric(1)                 not null,
    constraint pk_tarea_localizacion_persona_venta
        primary key (fecha_inicio_periodo, id_tarea_localizacion_persona_venta));

comment on table tarea_localizacion_persona_venta is 'Tabla con el importe de venta agrupado por empleado y localización';

comment on column tarea_localizacion_persona_venta.id_tarea_localizacion_persona_venta is 'Identificador de la tabla';

comment on column tarea_localizacion_persona_venta.fecha is 'Fecha de la venta';

comment on column tarea_localizacion_persona_venta.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_persona_venta.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_persona_venta.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_persona_venta.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_localizacion_persona_venta.importe_sin_impuestos is 'Importe sin impuestos';

comment on column tarea_localizacion_persona_venta.importe_con_impuestos is 'Importe con impuestos';

comment on column tarea_localizacion_persona_venta.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_localizacion_persona_venta.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_persona_venta.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_persona_venta.es_activo is 'Indicador de si esta activo';

create index ix_tarea_localizacion_persona_venta_01
    on tarea_localizacion_persona_venta (fecha_inicio_periodo, id_tarea, ccl_id_person, fecha, ccl_id_cod_origen);

create index ix_tarea_localizacion_persona_venta_02
    on tarea_localizacion_persona_venta (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha, ccl_id_person);

create index ix_tarea_localizacion_persona_venta_tarea
    on tarea_localizacion_persona_venta (id_tarea);

create index ix_tarea_localizacion_persona_venta_tipo_dato
    on tarea_localizacion_persona_venta (id_tipo_dato);

grant select on table tarea_localizacion_persona_venta to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_localizacion_persona_venta to rcompensacion_comision;

grant select on table tarea_localizacion_persona_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_persona_venta to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_persona_venta to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_persona_venta to retl_rrhh;

grant select on table tarea_localizacion_persona_venta to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_persona_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_persona_venta to rmantenimiento_income;

create table tarea_localizacion_presencia
(id_tarea_localizacion_presencia bigint generated always as identity (cache 100),
    fecha                           date                       not null,
    id_tarea                        bigint                     not null
        constraint fk_tarea_localizacion_presencia_tarea
            references tarea,
    id_tipo_dato                    integer                    not null
        constraint fk_tarea_localizacion_presencia_tipo_dato
            references tipo_dato,
    ccl_id_cod_origen               varchar(24) not null,
    ccl_id_seccion                  varchar(2)  not null,
    ccl_id_cadena                   varchar(12) not null,
    es_activo                       numeric(1)                 not null,
    minutos                         integer                    not null,
    fecha_inicio_periodo            date                       not null,
    constraint pk_tarea_localizacion_presencia
        primary key (fecha_inicio_periodo, id_tarea_localizacion_presencia));

comment on table tarea_localizacion_presencia is 'Tabla con los minutos de presencia agrupado por empleado y localización';

comment on column tarea_localizacion_presencia.id_tarea_localizacion_presencia is 'Identificador de la tabla';

comment on column tarea_localizacion_presencia.fecha is 'Fecha de la presecnia';

comment on column tarea_localizacion_presencia.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_presencia.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_presencia.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_presencia.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_presencia.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_presencia.es_activo is 'Indicador de si esta activo';

comment on column tarea_localizacion_presencia.minutos is 'Tiempo en minutos totales de presencia de la tienda';

comment on column tarea_localizacion_presencia.fecha_inicio_periodo is 'Fecha inicio periodo';

create index ix_tarea_localizacion_presencia_01
    on tarea_localizacion_presencia (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha);

create index ix_tarea_localizacion_presencia_tarea
    on tarea_localizacion_presencia (id_tarea);

create index ix_tarea_localizacion_presencia_tipo_dato
    on tarea_localizacion_presencia (id_tipo_dato);

grant select on table tarea_localizacion_presencia to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_localizacion_presencia to rcompensacion_comision;

grant select on table tarea_localizacion_presencia to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_presencia to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_presencia to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_presencia to retl_rrhh;

grant select on table tarea_localizacion_presencia to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_presencia to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_presencia to rmantenimiento_income;

create table tarea_localizacion_presupuesto
(id_tarea_localizacion_presupuesto bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_presupuesto
            primary key,
    id_tarea                          bigint                     not null
        constraint fk_tarea_localizacion_presupuesto_tarea
            references tarea,
    ccl_id_origen                     varchar(24) not null,
    std_id_leg_ent                    varchar(24) not null,
    ccl_id_cod_origen                 varchar(24) not null,
    std_id_work_locat                 varchar(24) not null,
    ccl_id_seccion                    varchar(2)  not null,
    fecha_inicio                      date                       not null,
    fecha_fin                         date                       not null,
    importe_sin_impuestos             numeric(23,8)             not null,
    importe_con_impuestos             numeric(23,8)             not null,
    icm_banda                         integer                    not null,
    icm_ordinal                       varchar(12) not null,
    icm_ck_excepcion                  numeric(1)                 not null,
    id_tipo_presupuesto               integer                    not null
        constraint fk_tarea_localizacion_presupuesto_tipo_presupuesto
            references tipo_presupuesto,
    es_activo                         numeric(1)                 not null);

comment on table tarea_localizacion_presupuesto is 'Tabla con las bandas de presupuestos para localizaciones del cálculo challenge.';

comment on column tarea_localizacion_presupuesto.id_tarea_localizacion_presupuesto is 'Identificador del presupuesto';

comment on column tarea_localizacion_presupuesto.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_presupuesto.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column tarea_localizacion_presupuesto.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_localizacion_presupuesto.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_presupuesto.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_localizacion_presupuesto.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_presupuesto.fecha_inicio is 'Fecha inicio vigor presupuesto';

comment on column tarea_localizacion_presupuesto.fecha_fin is 'Fecha fin vigor presupuesto';

comment on column tarea_localizacion_presupuesto.importe_sin_impuestos is 'Importe sin impuestos de la banda de presupuestos';

comment on column tarea_localizacion_presupuesto.importe_con_impuestos is 'Importe con impuestos de la banda de presupuestos';

comment on column tarea_localizacion_presupuesto.icm_banda is 'Número de banda del presupuesto, viene de la tabla meta4 de InCome M4ICM_PRESUPUESTOS';

comment on column tarea_localizacion_presupuesto.icm_ordinal is 'Ordinal del presupuesto, viene de la tabla meta4 de InCome M4ICM_PRESUPUESTOS';

comment on column tarea_localizacion_presupuesto.icm_ck_excepcion is 'Check de banda de excepción, viene de la tabla meta4 de InCome M4ICM_PRESUPUESTOS';

comment on column tarea_localizacion_presupuesto.id_tipo_presupuesto is 'Identificador del tipo de presupuesto';

comment on column tarea_localizacion_presupuesto.es_activo is 'Indicador de si esta activo';

create index ix_tarea_localizacion_presupuesto_01
    on tarea_localizacion_presupuesto (id_tarea, ccl_id_cod_origen);

create index ix_tarea_localizacion_presupuesto_tarea
    on tarea_localizacion_presupuesto (id_tarea);

create index ix_tarea_localizacion_presupuesto_tipo_presupuesto
    on tarea_localizacion_presupuesto (id_tipo_presupuesto);

grant select on table tarea_localizacion_presupuesto to rreporting_services_rrhh;

grant select on table tarea_localizacion_presupuesto to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_localizacion_presupuesto to rcompensacion_comision;

grant select on table tarea_localizacion_presupuesto to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_presupuesto to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_presupuesto to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_presupuesto to retl_rrhh;

grant select on table tarea_localizacion_presupuesto to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_presupuesto to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_presupuesto to rmantenimiento_income;

create table tarea_localizacion_presupuesto_venta
(id_tarea_localizacion_presupuesto_venta bigint generated always as identity (cache 100)
        constraint pk_tarea_localizacion_presupuesto_venta
            primary key,
    id_tarea                                bigint                     not null
        constraint fk_tarea_localizacion_presupuesto_venta_tarea
            references tarea,
    ccl_id_cadena                           varchar(12) not null,
    ccl_id_cod_origen                       varchar(24) not null,
    ccl_id_seccion                          varchar(2)  not null,
    icm_ordinal                             varchar(12) not null,
    importe_sin_impuestos                   numeric(23,8)             not null,
    importe_con_impuestos                   numeric(23,8)             not null,
    id_tipo_presupuesto                     integer                    not null
        constraint fk_tarea_localizacion_presupuesto_venta_tipo_presupuesto
            references tipo_presupuesto,
    id_tipo_venta_concepto_challenge        integer
        constraint fk_t_l_p_v_tipo_venta_concepto_challenge
            references tipo_venta_concepto_challenge,
    ccl_id_origen                           varchar(24) not null,
    es_activo                               numeric(1)                 not null,
    id_tipo_dato                            integer                    not null
        constraint fk_tarea_localizacion_presupuesto_venta_tipo_dato
            references tipo_dato,
    fecha_fin                               date                       not null,
    fecha_inicio                            date                       not null);

comment on table tarea_localizacion_presupuesto_venta is 'Tabla con las ventas de una localización durante el período de un presupuesto';

comment on column tarea_localizacion_presupuesto_venta.id_tarea_localizacion_presupuesto_venta is 'Id de la tabla';

comment on column tarea_localizacion_presupuesto_venta.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_presupuesto_venta.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_presupuesto_venta.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_presupuesto_venta.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_presupuesto_venta.icm_ordinal is 'Ordinal del presupuesto, viene de la tabla meta4 de InCome M4ICM_PRESUPUESTOS';

comment on column tarea_localizacion_presupuesto_venta.importe_sin_impuestos is 'Importe de las ventas sin impuestos de la localización durante el período del presupuesto.';

comment on column tarea_localizacion_presupuesto_venta.importe_con_impuestos is 'Importe de las ventas con impuestos de la localización durante el período del presupuesto.';

comment on column tarea_localizacion_presupuesto_venta.id_tipo_presupuesto is 'Identificador del tipo de presupuesto';

comment on column tarea_localizacion_presupuesto_venta.id_tipo_venta_concepto_challenge is 'Identificador del tipo de venta challenge';

comment on column tarea_localizacion_presupuesto_venta.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orígenes de sincronización';

comment on column tarea_localizacion_presupuesto_venta.es_activo is 'Indicador de si esta activo';

comment on column tarea_localizacion_presupuesto_venta.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_presupuesto_venta.fecha_fin is 'Fecha fin vigor presupuesto';

comment on column tarea_localizacion_presupuesto_venta.fecha_inicio is 'Fecha inicio vigor presupuesto';

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

grant select on table tarea_localizacion_presupuesto_venta to rreporting_services_rrhh;

grant select on table tarea_localizacion_presupuesto_venta to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_localizacion_presupuesto_venta to rcompensacion_comision;

grant select on table tarea_localizacion_presupuesto_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_presupuesto_venta to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_presupuesto_venta to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_presupuesto_venta to retl_rrhh;

grant select on table tarea_localizacion_presupuesto_venta to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_presupuesto_venta to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_presupuesto_venta to rmantenimiento_income;

create table tarea_localizacion_venta
(id_tarea_localizacion_venta bigint generated always as identity (cache 100),
    fecha                       date                       not null,
    id_tarea                    bigint                     not null
        constraint fk_tarea_localizacion_venta_tarea
            references tarea,
    id_tipo_dato                integer                    not null
        constraint fk_tarea_localizacion_venta_tipo_dato
            references tipo_dato,
    ccl_id_cadena               varchar(24) not null,
    ccl_id_cod_origen           varchar(24) not null,
    ccl_id_seccion              varchar(2)  not null,
    es_activo                   numeric(1)                 not null,
    importe_sin_impuestos       numeric(23,8)             not null,
    importe_con_impuestos       numeric(23,8)             not null,
    fecha_inicio_periodo        date                       not null,
    constraint pk_tarea_localizacion_venta
        primary key (fecha_inicio_periodo, id_tarea_localizacion_venta));

comment on table tarea_localizacion_venta is 'Tabla con el importe de venta agrupado por localización';

comment on column tarea_localizacion_venta.id_tarea_localizacion_venta is 'Identificador de la tabla';

comment on column tarea_localizacion_venta.fecha is 'Fecha de la venta';

comment on column tarea_localizacion_venta.id_tarea is 'Identificador de la tarea';

comment on column tarea_localizacion_venta.id_tipo_dato is 'Identificadode del tipo de dato';

comment on column tarea_localizacion_venta.ccl_id_cadena is 'Id. Cadena, M4CCL_AUX_CADENA, Maestro de cadenas';

comment on column tarea_localizacion_venta.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_localizacion_venta.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_localizacion_venta.es_activo is 'Indicador de si esta activo';

comment on column tarea_localizacion_venta.importe_sin_impuestos is 'Importe sin impuestos por seccion';

comment on column tarea_localizacion_venta.importe_con_impuestos is 'Importe con impuestos por seccion';

comment on column tarea_localizacion_venta.fecha_inicio_periodo is 'Fecha inicio periodo';

create index ix_tarea_localizacion_venta_01
    on tarea_localizacion_venta (fecha_inicio_periodo, id_tarea, ccl_id_cod_origen, fecha);

create index ix_tarea_localizacion_venta_tarea
    on tarea_localizacion_venta (id_tarea);

create index ix_tarea_localizacion_venta_tipo_dato
    on tarea_localizacion_venta (id_tipo_dato);

grant select on table tarea_localizacion_venta to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_localizacion_venta to rcompensacion_comision;

grant select on table tarea_localizacion_venta to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_venta to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_venta to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_venta to retl_rrhh;

grant select on table tarea_localizacion_venta to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_venta to rreporting_sil_sistema_informacional;

grant select on table tarea_localizacion_venta to rbrecha_salarial;

grant select on table tarea_localizacion_venta to rmantenimiento_brecha_salarial;

grant select on table tarea_localizacion_venta to rmonitorizacion_brecha_salarial;

grant insert, select, update on table tarea_localizacion_venta to rmantenimiento_income;

grant select on table tarea_localizacion_venta to rmantenimiento_brechasala;

create table tarea_persona_ausencia_historico
(id_tarea_persona_ausencia_historico bigint generated always as identity (cache 100)
        constraint pk_tarea_persona_ausencia_historico
            primary key,
    id_tarea                            bigint                     not null
        constraint fk_tarea_persona_ausencia_historico_tarea
            references tarea,
    id_tipo_ausencia                    integer                    not null
        constraint fk_tarea_persona_ausencia_historico_tipo_ausencia
            references tipo_ausencia,
    ccl_id_origen                       varchar(24) not null,
    ccl_id_person                       varchar(24) not null,
    std_or_hr_period                    varchar(24) not null,
    fecha_inicio                        date                       not null,
    fecha_fin                           date                       not null);

comment on table tarea_persona_ausencia_historico is 'Tabla con los históricos de ausencias de empleados (tipo de ausencia, fechas, etc)';

comment on column tarea_persona_ausencia_historico.id_tarea_persona_ausencia_historico is 'Identificador de la tabla';

comment on column tarea_persona_ausencia_historico.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_ausencia_historico.id_tipo_ausencia is 'Indentificador del tipo de ausencia';

comment on column tarea_persona_ausencia_historico.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_persona_ausencia_historico.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_ausencia_historico.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_ausencia_historico.fecha_inicio is 'Feca fin';

comment on column tarea_persona_ausencia_historico.fecha_fin is 'Fecha inicio';

create index ix_tarea_persona_ausencia_historico_01
    on tarea_persona_ausencia_historico (id_tarea, ccl_id_person, std_or_hr_period);

create index ix_tarea_persona_ausencia_historico_tarea
    on tarea_persona_ausencia_historico (id_tarea);

create index ix_tarea_persona_ausencia_historico_tipo_ausencia
    on tarea_persona_ausencia_historico (id_tipo_ausencia);

grant delete, insert, select, update on table tarea_persona_ausencia_historico to rcompensacion_comision;

grant select on table tarea_persona_ausencia_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_ausencia_historico to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_ausencia_historico to rcompensacion_comision_meta4;

grant select on table tarea_persona_ausencia_historico to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_ausencia_historico to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_ausencia_historico to rmantenimiento_income;

create table tarea_persona_coeficiente
(id_tarea_persona_coeficiente bigint generated always as identity (cache 100)
        constraint pk_tarea_persona_coeficiente
            primary key,
    id_tarea                     bigint                     not null
        constraint fk_tarea_persona_coeficiente_tarea
            references tarea,
    std_id_hr                    varchar(9)  not null,
    ccl_id_person                varchar(24) not null,
    std_or_hr_period             varchar(24) not null,
    coeficiente                  numeric(23,8)             not null,
    fecha_inicio_completa        date                       not null,
    fecha_fin_completa           date                       not null,
    fecha_inicio_parcial         date                       not null,
    fecha_fin_parcial            date                       not null);

comment on table tarea_persona_coeficiente is 'Tabla con el coeficiente de reducción de jornada por persona';

comment on column tarea_persona_coeficiente.id_tarea_persona_coeficiente is 'Identificador de la tabla';

comment on column tarea_persona_coeficiente.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_coeficiente.std_id_hr is 'Id. universal del empleado, STD_HR_PERIOD, tabla de Maestros de Periodos, mete4';

comment on column tarea_persona_coeficiente.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_coeficiente.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_coeficiente.coeficiente is 'Coeficiente de reducción';

comment on column tarea_persona_coeficiente.fecha_inicio_completa is 'Fecha Inicio Completa';

comment on column tarea_persona_coeficiente.fecha_fin_completa is 'Fecha Fin Completa';

comment on column tarea_persona_coeficiente.fecha_inicio_parcial is 'Fecha Inicio Parcial';

comment on column tarea_persona_coeficiente.fecha_fin_parcial is 'Fecha Fin Parcial';

create index ix_tarea_persona_coeficiente_01
    on tarea_persona_coeficiente (id_tarea, ccl_id_person, std_or_hr_period);

create index ix_tarea_persona_coeficiente_tarea
    on tarea_persona_coeficiente (id_tarea);

grant delete, insert, select, update on table tarea_persona_coeficiente to rcompensacion_comision;

grant select on table tarea_persona_coeficiente to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_coeficiente to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_coeficiente to rcompensacion_comision_meta4;

grant select on table tarea_persona_coeficiente to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_coeficiente to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_coeficiente to rmantenimiento_income;

create table tarea_persona_estructura
(id_tarea_persona_estructura bigint generated always as identity (cache 100),
    id_tarea                    bigint                     not null
        constraint fk_tarea_persona_estructura_tarea
            references tarea,
    icm_id_estr_comision        bigint                     not null,
    ccl_id_origen               varchar(24) not null,
    std_id_hr                   varchar(9)  not null,
    ccl_id_person               varchar(24) not null,
    ccl_id_seccion_efectiva     varchar(2)  not null,
    ccl_id_seccion_estructura   varchar(2)  not null,
    icm_id_tp_calculo           varchar(24) not null,
    icm_id_tp_comision          varchar(24) not null,
    std_or_hr_period            varchar(24) not null,
    fecha_inicio                date                       not null,
    fecha_fin                   date                       not null,
    icm_valor                   numeric(23,8)             not null,
    es_desplazamiento           numeric(1) default 0       not null,
    es_desplazamiento_base      numeric(1) default 0       not null,
    ordinal_estructura          integer,
    es_activo                   numeric(1)                 not null,
    es_dia_lunes                numeric(1) default 1       not null,
    es_dia_martes               numeric(1) default 1       not null,
    es_dia_miercoles            numeric(1) default 1       not null,
    es_dia_jueves               numeric(1) default 1       not null,
    es_dia_viernes              numeric(1) default 1       not null,
    es_dia_sabado               numeric(1) default 1       not null,
    es_dia_domingo              numeric(1) default 1       not null,
    icm_id_estr_comision_base   bigint                     not null,
    icm_id_estr_comision_padre  bigint                     not null,
    icm_id_tp_estructura        varchar(24)         not null,
    icm_ord_tope                integer                    not null,
    fecha_inicio_periodo        date                       not null,
    icm_grupo_manual            varchar(24),
    es_festivo                  numeric(1)                 not null,
    constraint pk_tarea_persona_estructura
        primary key (fecha_inicio_periodo, id_tarea_persona_estructura));

comment on table tarea_persona_estructura is 'Tabla con el detalle de la estructura de comisión por cada empleado';

comment on column tarea_persona_estructura.id_tarea_persona_estructura is 'Identificador de la tabla';

comment on column tarea_persona_estructura.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_estructura.icm_id_estr_comision is 'Id. Estructura, M4ICM_ESTR_COMISION, tabla maestrao de estructuras InCome';

comment on column tarea_persona_estructura.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_persona_estructura.std_id_hr is 'Id. universal del empleado, STD_HR_PERIOD, tabla de maestros de periodos';

comment on column tarea_persona_estructura.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura.ccl_id_seccion_efectiva is 'Identifcador de la seccion a la que afecta, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_persona_estructura.ccl_id_seccion_estructura is 'Identificador de la sección que viene de la estructura,  M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_persona_estructura.icm_id_tp_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

comment on column tarea_persona_estructura.icm_id_tp_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestra de tipos de comisión InCome';

comment on column tarea_persona_estructura.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura.fecha_inicio is 'Fecha inicio vigor estructura';

comment on column tarea_persona_estructura.fecha_fin is 'Fecha fin vigor estructura';

comment on column tarea_persona_estructura.icm_valor is 'Vlaor asociado  a al estructura puede ser un porcentaje o importe, M4ICM_TABLA_VALORES';

comment on column tarea_persona_estructura.es_desplazamiento is 'Indica que la estructuras tiene estructuras de desplazamiento, si esto esta a true deberías de tener estructuras de desplazamientos en la tabla TAREA_PERSONA_ESTRUCTURA_DESPLAZAMIENTO y estaria informado el campo ORDINAL_ESTRUCTURA';

comment on column tarea_persona_estructura.es_desplazamiento_base is 'Indica que es la estructura base que aplica a un desplazamiento';

comment on column tarea_persona_estructura.ordinal_estructura is '​Es el identificador con el que se relaciona la estructura base con la estructura de desplazamiento';

comment on column tarea_persona_estructura.es_activo is 'Indica si la estructura esta activa';

comment on column tarea_persona_estructura.es_dia_lunes is 'Indica si aplica e lunes';

comment on column tarea_persona_estructura.es_dia_martes is 'Indica si aplica el martes';

comment on column tarea_persona_estructura.es_dia_miercoles is 'Indica si aplica el miercoles';

comment on column tarea_persona_estructura.es_dia_jueves is 'Indica si aplica el jueves';

comment on column tarea_persona_estructura.es_dia_viernes is 'Indica si aplica el viernes';

comment on column tarea_persona_estructura.es_dia_sabado is 'Indica si aplica el sabado';

comment on column tarea_persona_estructura.es_dia_domingo is 'Indica si aplica el domingo';

comment on column tarea_persona_estructura.icm_id_estr_comision_base is 'Identificador de la estructura base, en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura.icm_id_estr_comision_padre is 'Identificador de la estructura padre, en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura.icm_id_tp_estructura is 'Identificador del tipo de esctructura viene de la tabla de InCome Meta4 M4ICM_ESTRUCTURAS';

comment on column tarea_persona_estructura.icm_ord_tope is 'Iindica el numero de tramos de la esctructura en la aplicacion, viene de la tabla meta4 de InCome M4ICM_TABLA_VALORES';

comment on column tarea_persona_estructura.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_persona_estructura.icm_grupo_manual is 'Grupo de importe manual para ajustes';

comment on column tarea_persona_estructura.es_festivo is 'Flag que indica si el cálculo debe hacerse en días festivos';

create table tarea_calculo
(id_tarea_calculo                        bigint generated always as identity (cache 100),
    id_tarea                                bigint                     not null
        constraint fk_tarea_calculo_tarea
            references tarea,
    id_algoritmo                            integer                    not null
        constraint fk_tarea_calculo_algoritmo
            references algoritmo,
    id_tarea_localizacion_persona_presencia bigint,
    id_tarea_localizacion_persona_venta     bigint,
    id_tarea_localizacion_presencia         bigint,
    id_tarea_localizacion_venta             bigint,
    id_tarea_persona_estructura             bigint                     not null,
    fecha                                   date                       not null,
    std_id_work_locat_pago                  varchar(24) not null,
    ccl_id_person                           varchar(24) not null,
    std_or_hr_period                        varchar(24) not null,
    importe                                 numeric(23,8)             not null,
    fecha_inicio_periodo                    date                       not null,
    std_id_work_locat                       varchar(24) not null,
    es_manual                               numeric(1)                 not null,
    id_tipo_calculo                         varchar(12) not null,
    id_tipo_comision                        varchar(12) not null,
    constraint pk_tarea_calculo
        primary key (fecha_inicio_periodo, id_tarea_calculo),
    constraint fk_tarea_calculo_tarea_localizacion_persona_presencia
        foreign key (fecha_inicio_periodo, id_tarea_localizacion_persona_presencia) references tarea_localizacion_persona_presencia,
    constraint fk_tarea_calculo_tarea_localizacion_persona_venta
        foreign key (fecha_inicio_periodo, id_tarea_localizacion_persona_venta) references tarea_localizacion_persona_venta,
    constraint fk_tarea_calculo_tarea_localizacion_presencia
        foreign key (fecha_inicio_periodo, id_tarea_localizacion_presencia) references tarea_localizacion_presencia,
    constraint fk_tarea_calculo_tarea_localizacion_venta
        foreign key (fecha_inicio_periodo, id_tarea_localizacion_venta) references tarea_localizacion_venta,
    constraint fk_tarea_calculo_tarea_persona_estructura
        foreign key (fecha_inicio_periodo, id_tarea_persona_estructura) references tarea_persona_estructura);

comment on table tarea_calculo is 'Tabla con el resultado del cálculo';

comment on column tarea_calculo.id_tarea_calculo is 'Identificador de la tabla';

comment on column tarea_calculo.id_tarea is 'Identificador de la tarea';

comment on column tarea_calculo.id_algoritmo is 'Identificador de los tipos algoritmo';

comment on column tarea_calculo.id_tarea_localizacion_persona_presencia is 'Identificdor de la tabla con el detalle de los minutos de presencia agrupado por empleado y localización';

comment on column tarea_calculo.id_tarea_localizacion_persona_venta is 'Identificador de la tabla con el detalle del importe de venta agrupado por empleado y localización';

comment on column tarea_calculo.id_tarea_localizacion_presencia is 'Identificador de la tabla con el detalle deI los minutos de presencia agrupado por localización';

comment on column tarea_calculo.id_tarea_localizacion_venta is 'Identificador de la tabla con el detalle del  importe de venta agrupado por localización';

comment on column tarea_calculo.id_tarea_persona_estructura is 'Identificador de la tabla con el detalla le de la estructura de comisión por cada empleado';

comment on column tarea_calculo.fecha is 'Fecha correspondiente al día del  periodo para el que se cálculo y existe importe';

comment on column tarea_calculo.std_id_work_locat_pago is 'Id. Lugar de trabajo donde se efectúa el pago, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_calculo.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo.importe is 'Importe (con o sin impuestos dependiendo del país)';

comment on column tarea_calculo.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_calculo.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_calculo.es_manual is 'Indica si el cálculo es parte de un tipo manual';

comment on column tarea_calculo.id_tipo_calculo is 'Id. tipo cálculo, M4ICM_X_TP_CALCULO, Tabla maestro de tipos de claculo InCome';

comment on column tarea_calculo.id_tipo_comision is 'Id. tipo comisión, M4ICM_X_TP_COMISION, Tabla maestro de tipos de comisión InCome';

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

grant select on table tarea_calculo to rreporting_services_rrhh;

grant select on table tarea_calculo to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_calculo to rcompensacion_comision;

grant select on table tarea_calculo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_calculo to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table tarea_calculo to rcompensacion_comision_meta4;

grant select on table tarea_calculo to retl_rrhh;

grant select on table tarea_calculo to rservicios_sil_sistema_informacional;

grant select on table tarea_calculo to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_calculo to rmantenimiento_income;

create table tarea_localizacion_presupuesto_tarea_persona_estructura
(id_tarea_localizacion_presupuesto bigint not null
        constraint fk_t_l_p_t_p_e_tarea_localizacion_presupuesto
            references tarea_localizacion_presupuesto,
    fecha_inicio_periodo              date   not null,
    id_tarea_persona_estructura       bigint not null,
    constraint pk_tarea_localizacion_presupuesto_tarea_persona_estructura
        primary key (id_tarea_localizacion_presupuesto, fecha_inicio_periodo, id_tarea_persona_estructura),
    constraint fk_t_l_p_t_p_e_tarea_persona_estructura
        foreign key (fecha_inicio_periodo, id_tarea_persona_estructura) references tarea_persona_estructura);

comment on table tarea_localizacion_presupuesto_tarea_persona_estructura is 'Relación entre TAREA_LOCALIZACION_PRESUPUESTO y TAREA_PERSONA_ESTRUCTURA';

comment on column tarea_localizacion_presupuesto_tarea_persona_estructura.id_tarea_localizacion_presupuesto is 'Identificador del presupuesto';

comment on column tarea_localizacion_presupuesto_tarea_persona_estructura.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_localizacion_presupuesto_tarea_persona_estructura.id_tarea_persona_estructura is 'Identificador de la estructura';

create index ix_t_l_p_t_p_e_tarea_localizacion_presupuesto
    on tarea_localizacion_presupuesto_tarea_persona_estructura (id_tarea_localizacion_presupuesto);

create index ix_t_l_p_t_p_e_tarea_persona_estructura
    on tarea_localizacion_presupuesto_tarea_persona_estructura (fecha_inicio_periodo, id_tarea_persona_estructura);

grant delete, insert, select, update on table tarea_localizacion_presupuesto_tarea_persona_estructura to rcompensacion_comision;

grant select on table tarea_localizacion_presupuesto_tarea_persona_estructura to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_localizacion_presupuesto_tarea_persona_estructura to rmantenimiento_compensacion_comision;

grant select on table tarea_localizacion_presupuesto_tarea_persona_estructura to rcompensacion_comision_meta4;

grant select on table tarea_localizacion_presupuesto_tarea_persona_estructura to rservicios_sil_sistema_informacional;

grant select on table tarea_localizacion_presupuesto_tarea_persona_estructura to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_localizacion_presupuesto_tarea_persona_estructura to rmantenimiento_income;

create index ix_tarea_persona_estructura_01
    on tarea_persona_estructura (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, icm_id_tp_calculo,
                                 icm_id_tp_comision);

create index ix_tarea_persona_estructura_02
    on tarea_persona_estructura (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period);

create index ix_tarea_persona_estructura_tarea
    on tarea_persona_estructura (id_tarea);

grant select on table tarea_persona_estructura to rreporting_services_rrhh;

grant select on table tarea_persona_estructura to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_persona_estructura to rcompensacion_comision;

grant select on table tarea_persona_estructura to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_estructura to rmantenimiento_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_estructura to rcompensacion_comision_meta4;

grant select on table tarea_persona_estructura to retl_rrhh;

grant select on table tarea_persona_estructura to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_estructura to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_estructura to rmantenimiento_income;

create table tarea_persona_estructura_desplazamiento
(id_tarea_persona_estructura_desplazamiento bigint generated always as identity (cache 100),
    id_tarea                                   bigint                     not null
        constraint fk_tarea_persona_estructura_desplazamiento_tarea
            references tarea,
    id_tipo_opcion_calculo_efectiva            integer                    not null
        constraint fk_t_p_e_d_tipo_opcion_calculo_efectiva
            references tipo_opcion_calculo,
    id_tipo_opcion_calculo_estructura          integer                    not null
        constraint fk_t_p_e_d_tipo_opcion_calculo_estructura
            references tipo_opcion_calculo,
    ccl_id_cod_origen_destino                  varchar(24) not null,
    ccl_id_puesto_destino                      varchar(24) not null,
    ccl_id_seccion_destino                     varchar(24) not null,
    icm_id_estr_comision                       bigint                     not null,
    icm_id_tp_req_comision                     varchar(24) not null,
    std_id_work_locat_destino                  varchar(24) not null,
    fecha_inicio                               date                       not null,
    fecha_fin                                  date                       not null,
    es_horas_origen                            numeric(1)                 not null,
    es_horas_destino                           numeric(1)                 not null,
    ordinal_estructura                         integer                    not null,
    es_activo                                  numeric(1)                 not null,
    ccl_id_origen                              varchar(48)         not null,
    ccl_id_person                              varchar(48)         not null,
    icm_id_estr_comision_base                  bigint                     not null,
    icm_id_estr_comision_padre                 bigint                     not null,
    icm_id_estructura_ambito                   bigint                     not null,
    std_id_hr                                  varchar(18)         not null,
    std_or_hr_period                           varchar(48)         not null,
    fecha_inicio_periodo                       date                       not null,
    es_incluir_total_condiciones               numeric(1) default 0.0     not null,
    constraint pk_tarea_persona_estructura_desplazamiento
        primary key (fecha_inicio_periodo, id_tarea_persona_estructura_desplazamiento));

comment on table tarea_persona_estructura_desplazamiento is 'Tabla con el detalle de la estructura de comisión con desplazamiento por empleado y seccion';

comment on column tarea_persona_estructura_desplazamiento.id_tarea_persona_estructura_desplazamiento is 'Identificador de la tabla';

comment on column tarea_persona_estructura_desplazamiento.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_estructura_desplazamiento.id_tipo_opcion_calculo_efectiva is 'Identificador del tipo de opcion de cálculo de la estructura que afecta';

comment on column tarea_persona_estructura_desplazamiento.id_tipo_opcion_calculo_estructura is 'Identificador del tipo de opcion de cálculo de la estructura';

comment on column tarea_persona_estructura_desplazamiento.ccl_id_cod_origen_destino is 'Id Código en Origen de la tienda destino, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo de Meta4';

comment on column tarea_persona_estructura_desplazamiento.ccl_id_puesto_destino is 'Id de puesto, el campo vieien informado de la tabla ICM_ESTRE_DESPLAZAMIENTO, hace referencia al campo maestro  STD_ID_JOB_CODE, de la tabla Meta4  STD_JOB.';

comment on column tarea_persona_estructura_desplazamiento.ccl_id_seccion_destino is 'Id. la sesccion del empleado en su destino, Identifcador de la seccion a la que afecta. Id en  M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_persona_estructura_desplazamiento.icm_id_estr_comision is 'Identificador de la estructura en el modleo de InCome de Meta4, Tabla meta4  M4ICM_ESTR_COMISION';

comment on column tarea_persona_estructura_desplazamiento.icm_id_tp_req_comision is 'Identificaodr de la tabla Meta de Income M4ICM_X_TP_REQ_COMISION, tabla de condiciones de comisión que aplican durante un desplazamiento, viene informado de la tabla ICM_X_TP_REQ_COMISION';

comment on column tarea_persona_estructura_desplazamiento.std_id_work_locat_destino is 'Id de localizacion, el campo vieien informado de la tabla ICM_ESTRE_DESPLAZAMIENTO, hace referencia al campo maestro  STD_ID_WORK_LOCATION, de la tabla Meta4  STD_WORK_LOCALTION,';

comment on column tarea_persona_estructura_desplazamiento.fecha_inicio is 'Fecha inicio de aplicación de la estructura';

comment on column tarea_persona_estructura_desplazamiento.fecha_fin is 'Fecha de fin de  aplicación de la estructura';

comment on column tarea_persona_estructura_desplazamiento.es_horas_origen is 'Flag que indica si aplican las horas de la tienda de origen';

comment on column tarea_persona_estructura_desplazamiento.es_horas_destino is 'Flag que indica si aplican las horas de la teinda destino';

comment on column tarea_persona_estructura_desplazamiento.ordinal_estructura is '​​Es el identificador con el que se relaciona la estructura base con la estructura de desplazamiento.';

comment on column tarea_persona_estructura_desplazamiento.es_activo is 'Indica si la estructura de desplazamiento esta activa';

comment on column tarea_persona_estructura_desplazamiento.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronización';

comment on column tarea_persona_estructura_desplazamiento.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura_desplazamiento.icm_id_estr_comision_base is 'Identificador de la estructura base en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento.icm_id_estr_comision_padre is 'Identificador de la estructur padre en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento.icm_id_estructura_ambito is 'Identificador de la estructura por ambito, en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento.std_id_hr is 'Identificador Universal del empeado en Meta4 tabla maestra STD_HR';

comment on column tarea_persona_estructura_desplazamiento.std_or_hr_period is 'Ordinal del periodo, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura_desplazamiento.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_persona_estructura_desplazamiento.es_incluir_total_condiciones is 'Flag que indica si se aplica a todas las condiciones o sólo a la comisión base';

create index ix_tarea_persona_estructura_desplazamiento_01
    on tarea_persona_estructura_desplazamiento (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period,
                                                ordinal_estructura);

create index ix_tarea_persona_estructura_desplazamiento_tarea
    on tarea_persona_estructura_desplazamiento (id_tarea);

create index ix_t_p_e_d_tipo_opcion_calculo_efectiva
    on tarea_persona_estructura_desplazamiento (id_tipo_opcion_calculo_efectiva);

create index ix_t_p_e_d_tipo_opcion_calculo_estructura
    on tarea_persona_estructura_desplazamiento (id_tipo_opcion_calculo_estructura);

grant select on table tarea_persona_estructura_desplazamiento to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_persona_estructura_desplazamiento to rcompensacion_comision;

grant select on table tarea_persona_estructura_desplazamiento to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_estructura_desplazamiento to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_estructura_desplazamiento to rcompensacion_comision_meta4;

grant select on table tarea_persona_estructura_desplazamiento to retl_rrhh;

grant select on table tarea_persona_estructura_desplazamiento to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_estructura_desplazamiento to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_estructura_desplazamiento to rmantenimiento_income;

create table tarea_persona_estructura_desplazamiento_real
(id_tarea_persona_estructura_desplazamiento_real bigint generated always as identity (start with 1),
    id_tarea                                        bigint                     not null
        constraint fk_tarea_persona_estructura_desplazamiento_real_tarea
            references tarea,
    icm_id_estructura_ambito                        bigint                     not null,
    icm_id_estr_comision                            bigint                     not null,
    icm_id_estr_comision_padre                      bigint                     not null,
    icm_id_estr_comision_base                       bigint                     not null,
    fecha_inicio                                    date                       not null,
    fecha_fin                                       date                       not null,
    std_id_hr                                       varchar(9)  not null,
    std_or_hr_period                                varchar(24) not null,
    ccl_id_origen                                   varchar(24) not null,
    fecha_inicio_periodo                            date                       not null,
    constraint pk_tarea_persona_estructura_desplazamiento_real
        primary key (fecha_inicio_periodo, id_tarea_persona_estructura_desplazamiento_real));

comment on table tarea_persona_estructura_desplazamiento_real is 'Tabla con el detalle de las fechas la estructura de comisión con desplazamiento por empleado y seccion';

comment on column tarea_persona_estructura_desplazamiento_real.id_tarea_persona_estructura_desplazamiento_real is 'Identificador de la tabla';

comment on column tarea_persona_estructura_desplazamiento_real.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_estructura_desplazamiento_real.icm_id_estructura_ambito is 'Identificador de la estructura por ambito, en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento_real.icm_id_estr_comision is 'Identificador de la estructura en el modleo de InCome de Meta4, Tabla meta4  M4ICM_ESTR_COMISION';

comment on column tarea_persona_estructura_desplazamiento_real.icm_id_estr_comision_padre is 'Identificador de la estructur padre en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento_real.icm_id_estr_comision_base is 'Identificador de la estructura base en el modleo de InCome de Meta4, Tabla meta4 M4ICM_ESTRUCTURAS_DESPL';

comment on column tarea_persona_estructura_desplazamiento_real.fecha_inicio is 'Fecha inicio real de aplicación de la estructura de desplazamiento';

comment on column tarea_persona_estructura_desplazamiento_real.fecha_fin is 'Fecha fin real de aplicación de la estructura de desplazamiento';

comment on column tarea_persona_estructura_desplazamiento_real.std_id_hr is 'Identificador Universal del empeado en Meta4 tabla maestra STD_HR';

comment on column tarea_persona_estructura_desplazamiento_real.std_or_hr_period is 'Ordinal del periodo, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura_desplazamiento_real.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de origenes de sincronización';

comment on column tarea_persona_estructura_desplazamiento_real.fecha_inicio_periodo is 'Fecha inicio periodo';

create index ix_tarea_persona_estructura_desplazamiento_real_tarea
    on tarea_persona_estructura_desplazamiento_real (id_tarea);

grant delete, insert, select, update on table tarea_persona_estructura_desplazamiento_real to rcompensacion_comision;

grant select on table tarea_persona_estructura_desplazamiento_real to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_estructura_desplazamiento_real to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_estructura_desplazamiento_real to rcompensacion_comision_meta4;

grant select on table tarea_persona_estructura_desplazamiento_real to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_estructura_desplazamiento_real to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_estructura_desplazamiento_real to rmantenimiento_income;

create table tarea_persona_estructura_politica
(id_tarea_persona_estructura_politica bigint generated always as identity (cache 100),
    id_tarea                             bigint                     not null
        constraint fk_tarea_persona_estructura_politica_tarea
            references tarea,
    id_tipo_politica                     integer                    not null
        constraint fk_tarea_persona_estructura_politica_tipo_politica
            references tipo_politica,
    ccl_id_origen                        varchar(24) not null,
    ccl_id_person                        varchar(24) not null,
    icm_id_estr_politicas                bigint                     not null,
    std_id_hr                            varchar(24) not null,
    std_or_hr_period                     varchar(24) not null,
    fecha_inicio                         date                       not null,
    fecha_fin                            date                       not null,
    es_excluido_denominador              numeric(1)                 not null,
    icm_num_unidades                     integer                    not null,
    icm_tramo                            integer                    not null,
    icm_porcentaje                       numeric(23,8)             not null,
    fecha_inicio_periodo                 date                       not null,
    icm_id_motivo_baja                   integer                    not null,
    icm_importe                          numeric(23,8)             not null,
    icm_num_horas                        integer                    not null,
    icm_num_meses_calc_media             integer                    not null,
    id_tipo_unidad_tiempo                integer                    not null,
    constraint pk_tarea_persona_estructura_politica
        primary key (fecha_inicio_periodo, id_tarea_persona_estructura_politica));

comment on table tarea_persona_estructura_politica is 'Tabla con estructuras de tipo política';

comment on column tarea_persona_estructura_politica.id_tarea_persona_estructura_politica is 'Identificador de la tabla';

comment on column tarea_persona_estructura_politica.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_estructura_politica.id_tipo_politica is 'Identificador del tipo de politica';

comment on column tarea_persona_estructura_politica.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_persona_estructura_politica.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura_politica.icm_id_estr_politicas is 'Id de estrctura de politicas, este campo viene informado del tabla Meta4  ICM_ID_ESTR_POLITICAS';

comment on column tarea_persona_estructura_politica.std_id_hr is 'Id. universal del empleado, STD_HR_PERIOD, tabla de maestros de periodos';

comment on column tarea_persona_estructura_politica.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_estructura_politica.fecha_inicio is 'Fecha inicio de aplicación de la estructura';

comment on column tarea_persona_estructura_politica.fecha_fin is 'Fecha de fin de aplicación de la estructura';

comment on column tarea_persona_estructura_politica.es_excluido_denominador is 'Indicador de denominador';

comment on column tarea_persona_estructura_politica.icm_num_unidades is 'Indica el numero de unidades para esa estructura origen en tabla InCome de meta4  M4ICM_TABLA_PORC_POLITICAS';

comment on column tarea_persona_estructura_politica.icm_tramo is 'Iindica el numero de tramos de la esctructura  en la aplicacion origen en tabla InCome de meta4  M4ICM_TABLA_PORC_POLITICAS';

comment on column tarea_persona_estructura_politica.icm_porcentaje is 'Porcentaje de la estructura de desplazamiento origen en tabla InCome de meta4  M4ICM_TABLA_PORC_POLITICAS';

comment on column tarea_persona_estructura_politica.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_persona_estructura_politica.icm_id_motivo_baja is 'Id de motivo de baja, este campo viene informado del tabla Meta4  ICM_X_MOTIVOS__BAJA';

comment on column tarea_persona_estructura_politica.icm_importe is 'Importe, viene informado del tabla Meta4  ICM_ESTR_POLIT_MIN';

comment on column tarea_persona_estructura_politica.icm_num_horas is 'Número de horas, viene informado del tabla Meta4  ICM_ESTR_POLITICAS';

comment on column tarea_persona_estructura_politica.icm_num_meses_calc_media is 'Número de meses, viene informado del tabla Meta4  ICM_ESTR_POLIT_MIN';

comment on column tarea_persona_estructura_politica.id_tipo_unidad_tiempo is 'Identificador de la tabla';

create table tarea_calculo_ajuste
(id_tarea_calculo_ajuste              bigint generated always as identity (start with 1),
    fecha_inicio_periodo                 date                       not null,
    id_tarea                             bigint                     not null
        constraint fk_tarea_calculo_ajuste_tarea
            references tarea,
    id_tarea_persona_estructura_politica bigint                     not null,
    ccl_id_person                        varchar(24) not null,
    std_or_hr_period                     varchar(24) not null,
    importe                              numeric(23,8)             not null,
    fecha                                date                       not null,
    id_algoritmo_ajuste                  integer                    not null
        constraint fk_tarea_calculo_ajuste_algoritmo_ajuste
            references algoritmo_ajuste,
    constraint pk_tarea_calculo_ajuste
        primary key (fecha_inicio_periodo, id_tarea_calculo_ajuste),
    constraint fk_tarea_calculo_ajuste_tarea_persona_estructura_politica
        foreign key (fecha_inicio_periodo, id_tarea_persona_estructura_politica) references tarea_persona_estructura_politica);

comment on table tarea_calculo_ajuste is 'Resultado del cálculo para algoritmos de ajuste manual.';

comment on column tarea_calculo_ajuste.id_tarea_calculo_ajuste is 'Identificador de la tabla';

comment on column tarea_calculo_ajuste.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_calculo_ajuste.id_tarea is 'Identificador de la tarea';

comment on column tarea_calculo_ajuste.id_tarea_persona_estructura_politica is 'Identificador de la tabla';

comment on column tarea_calculo_ajuste.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo_ajuste.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_calculo_ajuste.importe is 'Importe';

comment on column tarea_calculo_ajuste.fecha is 'Fecha correspondiente al día del  periodo para el que se cálculo y existe importe';

create index ix_tarea_calculo_ajuste_01
    on tarea_calculo_ajuste (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period, fecha);

create index ix_tarea_calculo_ajuste_algoritmo_ajuste
    on tarea_calculo_ajuste (id_algoritmo_ajuste);

create index ix_tarea_calculo_ajuste_tarea
    on tarea_calculo_ajuste (id_tarea);

create index ix_tarea_calculo_ajuste_tarea_persona_estructura_politica
    on tarea_calculo_ajuste (id_tarea_persona_estructura_politica, fecha_inicio_periodo);

grant select on table tarea_calculo_ajuste to rreporting_services_rrhh;

grant select on table tarea_calculo_ajuste to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_calculo_ajuste to rcompensacion_comision;

grant select on table tarea_calculo_ajuste to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_calculo_ajuste to rmantenimiento_compensacion_comision;

grant select on table tarea_calculo_ajuste to rcompensacion_comision_meta4;

grant select on table tarea_calculo_ajuste to retl_rrhh;

grant select on table tarea_calculo_ajuste to rservicios_sil_sistema_informacional;

grant select on table tarea_calculo_ajuste to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_calculo_ajuste to rmantenimiento_income;

create index ix_tarea_persona_estructura_politica_01
    on tarea_persona_estructura_politica (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period,
                                          id_tipo_politica);

create index ix_tarea_persona_estructura_politica_tarea
    on tarea_persona_estructura_politica (id_tarea);

create index ix_tarea_persona_estructura_politica_tipo_politica
    on tarea_persona_estructura_politica (id_tipo_politica);

grant select on table tarea_persona_estructura_politica to rreporting_services_rrhh;

grant select on table tarea_persona_estructura_politica to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_persona_estructura_politica to rcompensacion_comision;

grant select on table tarea_persona_estructura_politica to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_estructura_politica to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_estructura_politica to rcompensacion_comision_meta4;

grant select on table tarea_persona_estructura_politica to retl_rrhh;

grant select on table tarea_persona_estructura_politica to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_estructura_politica to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_estructura_politica to rmantenimiento_income;

create table tarea_persona_externa
(id_tarea_persona_externa bigint generated always as identity
        constraint pk_tarea_persona_externa
            primary key,
    id_tarea                 bigint                     not null
        constraint fk_tarea_persona_externa_tarea
            references tarea,
    ccl_id_person            varchar(24) not null,
    fecha_inicio             date                       not null,
    fecha_fin                date                       not null);

comment on table tarea_persona_externa is 'Tabla con los empleados externos';

comment on column tarea_persona_externa.id_tarea_persona_externa is 'Identificador persona externa';

comment on column tarea_persona_externa.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_externa.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_externa.fecha_inicio is 'Fecha inicio vigor empleado externo';

comment on column tarea_persona_externa.fecha_fin is 'Fecha fin vigor empleado externo';

create index ix_tarea_persona_externa_01
    on tarea_persona_externa (id_tarea, ccl_id_person);

create index ix_tarea_persona_externa_tarea
    on tarea_persona_externa (id_tarea);

grant delete, insert, select, update on table tarea_persona_externa to rcompensacion_comision;

grant select on table tarea_persona_externa to rmonitorizacion_compensacion_comision;

grant select on table tarea_persona_externa to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_externa to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_externa to rmantenimiento_income;

create table tarea_persona_historico
(id_tarea_persona_historico bigint generated always as identity (cache 100),
    id_tarea                   bigint                     not null
        constraint fk_tarea_persona_historico_tarea
            references tarea,
    std_id_leg_ent             varchar(24) not null,
    ccl_id_cod_origen          varchar(24) not null,
    std_id_work_locat          varchar(24) not null,
    ccl_id_origen              varchar(24) not null,
    std_id_hr                  varchar(9)  not null,
    ccl_id_person              varchar(24) not null,
    std_or_hr_period           varchar(24) not null,
    ccl_id_seccion             varchar(2)  not null,
    fecha_inicio_seccion       date                       not null,
    fecha_fin_seccion          date                       not null,
    fecha_inicio               date                       not null,
    fecha_fin                  date                       not null,
    fecha_fin_localizacion     date                       not null,
    fecha_inicio_localizacion  date                       not null,
    fecha_inicio_periodo       date                       not null,
    fecha_antiguedad           date,
    constraint pk_tarea_persona_historico
        primary key (fecha_inicio_periodo, id_tarea_persona_historico));

comment on table tarea_persona_historico is 'Tabla de datos de posicion de empleados';

comment on column tarea_persona_historico.id_tarea_persona_historico is 'Identficador';

comment on column tarea_persona_historico.id_tarea is 'Identificador de la tarea';

comment on column tarea_persona_historico.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column tarea_persona_historico.ccl_id_cod_origen is 'Id Código en Origen, STD_WORK_LOCATION, campo dentro del Maestro de lugar de Trabajo';

comment on column tarea_persona_historico.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column tarea_persona_historico.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column tarea_persona_historico.std_id_hr is 'Id. universal del empleado, STD_HR_PERIOD, tabla de Maestros de Periodos';

comment on column tarea_persona_historico.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_historico.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column tarea_persona_historico.ccl_id_seccion is 'Identificador de la seccion, M4CCL_OR_SECCIONES, Maestro Meta4 secciones';

comment on column tarea_persona_historico.fecha_inicio_seccion is 'Fecha inicio posición en la sección';

comment on column tarea_persona_historico.fecha_fin_seccion is 'Fecha fin posición en la sección';

comment on column tarea_persona_historico.fecha_inicio is 'Fecha inicio posicion';

comment on column tarea_persona_historico.fecha_fin is 'Fecha fin posición';

comment on column tarea_persona_historico.fecha_fin_localizacion is 'Fecha Fin localizacion';

comment on column tarea_persona_historico.fecha_inicio_localizacion is 'Fecha inicio Localizacion';

comment on column tarea_persona_historico.fecha_inicio_periodo is 'Fecha inicio periodo';

comment on column tarea_persona_historico.fecha_antiguedad is 'Fecha de incorporación del empleado';

create index ix_tarea_persona_historico_01
    on tarea_persona_historico (fecha_inicio_periodo, id_tarea, ccl_id_person, std_or_hr_period);

create index ix_tarea_persona_historico_tarea
    on tarea_persona_historico (id_tarea);

grant select on table tarea_persona_historico to rreporting_services_rrhh;

grant select on table tarea_persona_historico to rmonitorizacion_rrhh;

grant delete, insert, select, update on table tarea_persona_historico to rcompensacion_comision;

grant select on table tarea_persona_historico to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_persona_historico to rmantenimiento_compensacion_comision;

grant select on table tarea_persona_historico to rcompensacion_comision_meta4;

grant select on table tarea_persona_historico to rservicios_sil_sistema_informacional;

grant select on table tarea_persona_historico to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_persona_historico to rmantenimiento_income;

create table tarea_tipo_hora
(id_tarea_tipo_hora                            bigint generated always as identity (cache 100)
        constraint pk_tarea_tipo_hora
            primary key,
    id_tarea                                      bigint                 not null
        constraint fk_tarea_tipo_hora_tarea
            references tarea,
    cod_tipo_hora                                 integer                not null,
    es_excluido_calculo                           numeric(1)             not null,
    es_excluido_denominador                       numeric(1)             not null,
    es_incluido_challenge                         numeric(1)             not null,
    es_incluido_ecommerce                         numeric(1)             not null,
    es_incluido_venta                             numeric(1)             not null,
    es_excluido_denominador_y_repartido_provincia numeric(1) default 0   not null,
    es_incluido_challenge_porcentaje              numeric(1) default 0.0 not null);

comment on table tarea_tipo_hora is 'Tabla con la agrupación de tareas por tipo de hora';

comment on column tarea_tipo_hora.id_tarea_tipo_hora is 'Identificador de la tabla';

comment on column tarea_tipo_hora.id_tarea is 'Identificador de la tarea';

comment on column tarea_tipo_hora.cod_tipo_hora is 'Este dato está compuesto por los datos obtenidos de dos orígenes distintos, por un lado el tipo de hora que se obtiene de PTR (Obtenido de los SILes por país)
y por el otro el que se obtiene de Meta4 (PeopleNet), M4ICM_X_TP_HORA (ICM_ID_TP_HORA).';

comment on column tarea_tipo_hora.es_excluido_calculo is 'Flag Indicador de si esta exlcuida del calculo';

comment on column tarea_tipo_hora.es_excluido_denominador is 'Indicador de denominador';

comment on column tarea_tipo_hora.es_incluido_challenge is 'Indicador challenge';

comment on column tarea_tipo_hora.es_incluido_ecommerce is 'Indicador ecommerce';

comment on column tarea_tipo_hora.es_incluido_venta is 'Indicador incluido en la venta';

comment on column tarea_tipo_hora.es_excluido_denominador_y_repartido_provincia is 'Indicador de denominador y reparto de las presencias entre todas las localizaciones de la provincia';

comment on column tarea_tipo_hora.es_incluido_challenge_porcentaje is 'Indicador challenge incluido porcentaje';

create index ix_tarea_tipo_hora_01
    on tarea_tipo_hora (id_tarea, cod_tipo_hora);

create index ix_tarea_tipo_hora_tarea
    on tarea_tipo_hora (id_tarea);

grant select on table tarea_tipo_hora to rreporting_services_rrhh;

grant delete, insert, select, update on table tarea_tipo_hora to rcompensacion_comision;

grant select on table tarea_tipo_hora to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table tarea_tipo_hora to rmantenimiento_compensacion_comision;

grant select on table tarea_tipo_hora to rcompensacion_comision_meta4;

grant select on table tarea_tipo_hora to rservicios_sil_sistema_informacional;

grant select on table tarea_tipo_hora to rreporting_sil_sistema_informacional;

grant insert, select, update on table tarea_tipo_hora to rmantenimiento_income;

create index ix_trabajo_estado_trabajo
    on trabajo (id_estado_trabajo);

create index ix_trabajo_programacion
    on trabajo (id_programacion);

create index ix_trabajo_simulacion
    on trabajo (id_simulacion);

create index ix_trabajo_tipo_ambito
    on trabajo (id_tipo_ambito);

grant select on table trabajo to rreporting_services_rrhh;

grant delete, insert, select, update on table trabajo to rcompensacion_comision;

grant select on table trabajo to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table trabajo to rmantenimiento_compensacion_comision;

grant select on table trabajo to rcompensacion_comision_meta4;

grant select on table trabajo to retl_rrhh;

grant select on table trabajo to rservicios_sil_sistema_informacional;

grant select on table trabajo to rreporting_sil_sistema_informacional;

grant insert, select, update on table trabajo to rmantenimiento_income;

create table trabajo_ambito_empresa
(id_trabajo_ambito_empresa bigint generated always as identity (cache 100)
        constraint pk_trabajo_ambito_empresa
            primary key,
    id_trabajo                bigint                     not null
        constraint fk_trabajo_ambito_empresa_trabajo
            references trabajo,
    std_id_leg_ent            varchar(24) not null);

comment on table trabajo_ambito_empresa is 'Tabla que relaciona las empresas con el trabajo de cálculo';

comment on column trabajo_ambito_empresa.id_trabajo_ambito_empresa is 'Identificador de la tabla';

comment on column trabajo_ambito_empresa.id_trabajo is 'Indetificador del trabajo';

comment on column trabajo_ambito_empresa.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

create index ix_trabajo_ambito_empresa_trabajo
    on trabajo_ambito_empresa (id_trabajo);

grant delete, insert, select, update on table trabajo_ambito_empresa to rcompensacion_comision;

grant select on table trabajo_ambito_empresa to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table trabajo_ambito_empresa to rmantenimiento_compensacion_comision;

grant select on table trabajo_ambito_empresa to rcompensacion_comision_meta4;

grant select on table trabajo_ambito_empresa to rservicios_sil_sistema_informacional;

grant select on table trabajo_ambito_empresa to rreporting_sil_sistema_informacional;

grant insert, select, update on table trabajo_ambito_empresa to rmantenimiento_income;

create table trabajo_ambito_localizacion
(id_trabajo_ambito_localizacion bigint generated always as identity (cache 100)
        constraint pk_trabajo_ambito_localizacion
            primary key,
    id_trabajo                     bigint                     not null
        constraint fk_trabajo_ambito_localizacion_trabajo
            references trabajo,
    std_id_leg_ent                 varchar(24) not null,
    std_id_work_locat              varchar(24) not null,
    ccl_id_origen                  varchar(24) not null);

comment on table trabajo_ambito_localizacion is 'Tabla que relaciona la localización con el trabajo de cálculo';

comment on column trabajo_ambito_localizacion.id_trabajo_ambito_localizacion is 'Identificador de la tabla';

comment on column trabajo_ambito_localizacion.id_trabajo is 'Indetificador del trabajo';

comment on column trabajo_ambito_localizacion.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column trabajo_ambito_localizacion.std_id_work_locat is 'Id. Lugar de trabajo, STD_WORK_LOCATION, Maestro de lugar de Trabajo';

comment on column trabajo_ambito_localizacion.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_trabajo_ambito_localizacion_trabajo
    on trabajo_ambito_localizacion (id_trabajo);

grant delete, insert, select, update on table trabajo_ambito_localizacion to rcompensacion_comision;

grant select on table trabajo_ambito_localizacion to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table trabajo_ambito_localizacion to rmantenimiento_compensacion_comision;

grant select on table trabajo_ambito_localizacion to rcompensacion_comision_meta4;

grant select on table trabajo_ambito_localizacion to rservicios_sil_sistema_informacional;

grant select on table trabajo_ambito_localizacion to rreporting_sil_sistema_informacional;

grant insert, select, update on table trabajo_ambito_localizacion to rmantenimiento_income;

create table trabajo_ambito_origen
(id_trabajo_ambito_origen bigint generated always as identity (cache 100)
        constraint pk_trabajo_ambito_origen
            primary key,
    id_trabajo               bigint                     not null
        constraint fk_trabajo_ambito_origen_trabajo
            references trabajo,
    ccl_id_origen            varchar(24) not null);

comment on table trabajo_ambito_origen is 'Tabla que relaciona el origen con el trabajo de cálculo';

comment on column trabajo_ambito_origen.id_trabajo_ambito_origen is 'Identificador de la tabla';

comment on column trabajo_ambito_origen.id_trabajo is 'Indetificador del trabajo';

comment on column trabajo_ambito_origen.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

create index ix_trabajo_ambito_origen_trabajo
    on trabajo_ambito_origen (id_trabajo);

grant delete, insert, select, update on table trabajo_ambito_origen to rcompensacion_comision;

grant select on table trabajo_ambito_origen to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table trabajo_ambito_origen to rmantenimiento_compensacion_comision;

grant select on table trabajo_ambito_origen to rcompensacion_comision_meta4;

grant select on table trabajo_ambito_origen to rservicios_sil_sistema_informacional;

grant select on table trabajo_ambito_origen to rreporting_sil_sistema_informacional;

grant insert, select, update on table trabajo_ambito_origen to rmantenimiento_income;

create table trabajo_ambito_persona
(id_trabajo_ambito_persona bigint generated always as identity (cache 100)
        constraint pk_trabajo_ambito_persona
            primary key,
    id_trabajo                bigint                     not null
        constraint fk_trabajo_ambito_persona_trabajo
            references trabajo,
    std_id_leg_ent            varchar(54) not null,
    ccl_id_origen             varchar(24) not null,
    ccl_id_person             varchar(24) not null,
    std_or_hr_period          varchar(24) not null);

comment on table trabajo_ambito_persona is 'Tabla con las relación de personas solicitadas en el trabajo.';

comment on column trabajo_ambito_persona.id_trabajo_ambito_persona is 'Identificador de la tabla';

comment on column trabajo_ambito_persona.id_trabajo is 'Indetificador del trabajo';

comment on column trabajo_ambito_persona.std_id_leg_ent is 'Id empresa STD_LEG_ENT Maestro de empresas';

comment on column trabajo_ambito_persona.ccl_id_origen is 'Id. Origen, M4CCL_ORIGEN_DATOS_SINCRO, Maestro de orÃ­genes de sincronización';

comment on column trabajo_ambito_persona.ccl_id_person is 'Id. Local, viene de STD_HR_PERIOD, no hay tabla maestra de este campo';

comment on column trabajo_ambito_persona.std_or_hr_period is 'Ordinal del periodo, vien de STD_HR_PERIOD, no hay tabla maestra de este campo';

create index ix_trabajo_ambito_persona_trabajo
    on trabajo_ambito_persona (id_trabajo);

grant delete, insert, select, update on table trabajo_ambito_persona to rcompensacion_comision;

grant select on table trabajo_ambito_persona to rmonitorizacion_compensacion_comision;

grant delete, insert, select, update on table trabajo_ambito_persona to rmantenimiento_compensacion_comision;

grant select on table trabajo_ambito_persona to rcompensacion_comision_meta4;

grant select on table trabajo_ambito_persona to rservicios_sil_sistema_informacional;

grant select on table trabajo_ambito_persona to rreporting_sil_sistema_informacional;

grant insert, select, update on table trabajo_ambito_persona to rmantenimiento_income;
