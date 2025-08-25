# Type Changes Report

- Total columns with type changes: **315**

## Mappings

### `vargraphic(24)` → `varchar(24)`  (230 columns, 89 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** accion_ambito, clase_persona_sil_ambito, condicion, configuracion_aplicacion_baja_it, configuracion_jornada_laboral, localizacion_ficticia_historico, mail_ambito, paralelo_comparativa_challenge, paralelo_comparativa_detalle, paralelo_comparativa_politicas ...

### `vargraphic(2)` → `varchar(2)`  (30 columns, 19 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** condicion, paralelo_comparativa_challenge, paralelo_comparativa_detalle, paralelo_comparativa_por_venta, paralelo_comparativa_precio_hora, simulacion_localizacion_banda_excepcion, tarea_agrupacion_presencia, tarea_agrupacion_venta, tarea_localizacion_abierta, tarea_localizacion_estado ...

### `vargraphic(12)` → `varchar(12)`  (24 columns, 22 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** algoritmo_tipo_calculo, algoritmo_tipo_comision, localizacion_ficticia_historico, regla_validacion_excedidos, simulacion, tarea_calculo, tarea_calculo_ajuste_comision, tarea_localizacion_estado, tarea_localizacion_historico, tarea_localizacion_jornada ...

### `bigint generated always as identity(start with 1 minvalue -9223372036854775808)` → `bigint generated always as identity(start with 1)`  (14 columns, 14 tables)
- **Tables (sample):** clase_persona_sil_ambito, proceso, proceso_ambito_empresa, proceso_ambito_localizacion, proceso_ambito_origen, proceso_ambito_persona, simulacion_localizacion_banda_excepcion, tarea_ambito_global_empresa, tarea_ambito_global_fecha, tarea_localizacion_estado ...

### `vargraphic(9)` → `varchar(9)`  (5 columns, 5 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** simulacion, tarea_persona_coeficiente, tarea_persona_estructura, tarea_persona_estructura_desplazamiento_real, tarea_persona_historico

### `bigint generated always as identity(start with 1 minvalue -9223372036854775808 cache 100)` → `bigint generated always as identity(start with 1 cache 100)`  (2 columns, 2 tables)
- **Tables (sample):** paralelo_comparativa_detalle, paralelo_comparativa_total

### `bigint generated always as identity(start with 1 minvalue 0)` → `bigint generated always as identity(start with 1)`  (2 columns, 2 tables)
- **Tables (sample):** tarea_calculo_ajuste, tarea_calculo_ajuste_comision

### `vargraphic(4)` → `varchar(4)`  (2 columns, 2 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** localizacion_ficticia_historico, tarea_localizacion_historico

### `vargraphic(8)` → `varchar(8)`  (2 columns, 2 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** configuracion_aplicacion_baja_it, tarea_localizacion_historico

### `bigint generated always as identity(minvalue 0)` → `bigint generated always as identity`  (1 columns, 1 tables)
- **Tables (sample):** tarea_persona_externa

### `bigint generated always as identity(start with 1 minvalue -2147483648 maxvalue 2147483647)` → `bigint generated always as identity(start with 1)`  (1 columns, 1 tables)
- **Tables (sample):** paralelo_peticion

### `time` → `time without time zone`  (1 columns, 1 tables)
- **Tables (sample):** programacion

### `vargraphic(54)` → `varchar(54)`  (1 columns, 1 tables)
- **Risks/Notes:** Encoding/length: DB2 VARGRAPHIC uses UTF-16 code units; PG varchar uses character count (UTF-8). Check max lengths.; Verify VARGRAPHIC→VARCHAR lengths after encoding change (UTF-16→UTF-8).
- **Tables (sample):** trabajo_ambito_persona
