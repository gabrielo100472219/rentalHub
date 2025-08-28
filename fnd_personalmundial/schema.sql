-- ===== Schema =====
-- If you didn't run the CREATE SCHEMA above, ensure it exists:
-- CREATE SCHEMA fnd_personalmundial;

-- =========================================
-- TABLE: fnd_personalmundial.presencias
-- =========================================
CREATE TABLE fnd_personalmundial.presencias (
    fnd_fecha_alta          TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
    fnd_fecha_proceso       TIMESTAMP WITHOUT TIME ZONE               NOT NULL,
    tipo                    INTEGER                                   NOT NULL,   -- NUMBER(6,0)
    tienda                  BIGINT                                    NOT NULL,   -- NUMBER(11,0)
    fecha                   TIMESTAMP WITHOUT TIME ZONE               NOT NULL,
    seccion                 SMALLINT                                  NOT NULL,   -- NUMBER(3,0)
    persona                 BIGINT                                    NOT NULL,   -- NUMBER(11,0)
    horas                   NUMERIC(4,2)                              NOT NULL,
    caja                    SMALLINT                                  NOT NULL,   -- NUMBER(1,0)
    convertido              SMALLINT                                  NOT NULL,   -- NUMBER(1,0)
    firma                   VARCHAR(100),
    fechacaja               TIMESTAMP WITHOUT TIME ZONE               NOT NULL,
    ejercicio               INTEGER,                                               -- NUMBER(6,0)
    idcatalogoaplicacion    BIGINT                                    NOT NULL,   -- NUMBER(11,0)
    CONSTRAINT pk_presencias PRIMARY KEY
        (tipo, tienda, fecha, seccion, persona, idcatalogoaplicacion)
);

-- Helpful indexes carried over from Oracle
CREATE INDEX ix_presencias_01 ON fnd_personalmundial.presencias (persona, fecha);
CREATE INDEX ix_presencias_02 ON fnd_personalmundial.presencias (tienda, fecha);

-- =========================================
-- TABLE: fnd_personalmundial.tiposh oras
-- =========================================
CREATE TABLE fnd_personalmundial.tiposhoras (
    fnd_fecha_alta           TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
    fnd_fecha_proceso        TIMESTAMP WITHOUT TIME ZONE               NOT NULL,
    tipohoras                INTEGER                                   NOT NULL,  -- NUMBER(6,0)
    descripcion              VARCHAR(60),
    excluidocalculo          SMALLINT                                  NOT NULL,  -- NUMBER(1,0)
    excluidodenominador      SMALLINT                                  NOT NULL,  -- NUMBER(1,0)
    virtual                  SMALLINT                                  NOT NULL,  -- NUMBER(1,0)
    firma                    VARCHAR(100),
    idcatalogoaplicacion     BIGINT                                    NOT NULL,
    incluidoporventa         SMALLINT DEFAULT 0                         NOT NULL, -- NUMBER(1,0)
    incluidopresupuesto      SMALLINT DEFAULT 0                         NOT NULL, -- NUMBER(1,0)
    incluidorepartoonline    SMALLINT DEFAULT 0                         NOT NULL, -- NUMBER(1,0)
    CONSTRAINT pk_tiposh oras PRIMARY KEY (tipohoras, idcatalogoaplicacion)
);
