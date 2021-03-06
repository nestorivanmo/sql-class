--@Autor:           Jorge Rodriguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Creación de objetos


-- 
-- SEQUENCE: SEQ_ASIGNACION_PENDIENTE 
--

CREATE SEQUENCE SEQ_ASIGNACION_PENDIENTE
    START WITH 1
    INCREMENT BY 1
    NOMINVALUE
    NOMAXVALUE
    CACHE 20
    NOORDER
;

-- 
-- SEQUENCE: SEQ_HIST_STATUS_INMUEBLE 
--

CREATE SEQUENCE SEQ_HIST_STATUS_INMUEBLE
    START WITH 1
    INCREMENT BY 1
    NOMINVALUE
    NOMAXVALUE
    CACHE 20
    NOORDER
;

-- 
-- SEQUENCE: SEQ_INMUEBLE 
--

CREATE SEQUENCE SEQ_INMUEBLE
    START WITH 1000
    INCREMENT BY 1
    NOMINVALUE
    NOMAXVALUE
    CACHE 20
    NOORDER
;

-- 
-- TABLE: CLIENTE 
--

CREATE TABLE CLIENTE(
    CLIENTE_ID         NUMBER(10, 0)    NOT NULL,
    NOMBRE             VARCHAR2(40)     NOT NULL,
    AP_PAT             VARCHAR2(40)     NOT NULL,
    AP_MAT             VARCHAR2(40),
    RFC                VARCHAR2(13)     NOT NULL,
    EMAIL              VARCHAR2(200)    NOT NULL,
    AVAL_CLIENTE_ID    NUMBER(10, 0),
    CONSTRAINT CLIENTE_PK PRIMARY KEY (CLIENTE_ID), 
    CONSTRAINT CLIENTE_AVAL_ID_FK FOREIGN KEY (AVAL_CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
)
;



-- 
-- TABLE: STATUS_INMUEBLE 
--

CREATE TABLE STATUS_INMUEBLE(
    STATUS_INMUEBLE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE                 VARCHAR2(50)     NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    CONSTRAINT STATUS_INMUEBLE_PK PRIMARY KEY (STATUS_INMUEBLE_ID)
)
;



-- 
-- TABLE: ASIGNACION_PENDIENTE 
--

CREATE TABLE ASIGNACION_PENDIENTE(
    ASIGNACION_PENDIENTE_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION                VARCHAR2(500)    NOT NULL,
    FECHA_REGISTRO             DATE             NOT NULL,
    INMUEBLE_ID                NUMBER(10, 0)    NOT NULL,
    CLIENTE_SIN_AVAL_ID        NUMBER(10, 0),
    STATUS_INMUEBLE_ID         NUMBER(2, 0)     NOT NULL,
    CONSTRAINT ASIGNACION_PENDIENTE_PK PRIMARY KEY (ASIGNACION_PENDIENTE_ID), 
    CONSTRAINT ASIGNACION_PENDIENTE_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_SIN_AVAL_ID)
    REFERENCES CLIENTE(CLIENTE_ID),
    CONSTRAINT ASIGNACION_PENDIENTE_STATUS_ID_FK FOREIGN KEY (STATUS_INMUEBLE_ID)
    REFERENCES STATUS_INMUEBLE(STATUS_INMUEBLE_ID)
)
;



-- 
-- TABLE: INMUEBLE 
--

CREATE TABLE INMUEBLE(
    INMUEBLE_ID           NUMBER(10, 0)    NOT NULL,
    DIRECCION             VARCHAR2(500)    NOT NULL,
    LATITUD               NUMBER(15, 5)    NOT NULL,
    LONGITUD              NUMBER(15, 5)    NOT NULL,
    TIPO_INMUEBLE         CHAR(1)          NOT NULL,
    FOTO                  BLOB,
    FECHA_STATUS          DATE             NOT NULL,
    CLIENTE_ID            NUMBER(10, 0),
    STATUS_INMUEBLE_ID    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT INMUEBLE_PK PRIMARY KEY (INMUEBLE_ID), 
    CONSTRAINT INMUEBLE_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID),
    CONSTRAINT INMUEBLE_STATUS_ID_FK FOREIGN KEY (STATUS_INMUEBLE_ID)
    REFERENCES STATUS_INMUEBLE(STATUS_INMUEBLE_ID)
)
;



-- 
-- TABLE: COMPRA_INMUEBLE 
--

CREATE TABLE COMPRA_INMUEBLE(
    INMUEBLE_ID     NUMBER(10, 0)    NOT NULL,
    PRECIO_VENTA    NUMBER(10, 2)    NOT NULL,
    PLAZO           NUMBER(4, 0)     NOT NULL,
    TASA_INTERES    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT COMPRA_INMUEBLE_PK PRIMARY KEY (INMUEBLE_ID), 
    CONSTRAINT RefINMUEBLE4 FOREIGN KEY (INMUEBLE_ID)
    REFERENCES INMUEBLE(INMUEBLE_ID)
)
;



-- 
-- TABLE: HISTORICO_STATUS_INMUEBLE 
--

CREATE TABLE HISTORICO_STATUS_INMUEBLE(
    HISTORICO_STATUS_INMUEBLE_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                    DATE             NOT NULL,
    STATUS_INMUEBLE_ID              NUMBER(2, 0)     NOT NULL,
    INMUEBLE_ID                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HISTORICO_STATUS_INMUEBLE_PK PRIMARY KEY (HISTORICO_STATUS_INMUEBLE_ID), 
    CONSTRAINT HISTORICO_INMUEBLE_ID_FK FOREIGN KEY (INMUEBLE_ID)
    REFERENCES INMUEBLE(INMUEBLE_ID),
    CONSTRAINT HISTORICO_STATUS_INMUEBLE_ID_FK FOREIGN KEY (STATUS_INMUEBLE_ID)
    REFERENCES STATUS_INMUEBLE(STATUS_INMUEBLE_ID)
)
;



-- 
-- TABLE: PAGO_INMUEBLE 
--

CREATE TABLE PAGO_INMUEBLE(
    NUM_PAGO       NUMBER(10, 0)    NOT NULL,
    INMUEBLE_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_PAGO     DATE             NOT NULL,
    IMPORTE        NUMBER(10, 2)    NOT NULL,
    CONSTRAINT PAGO_INMUEBLE_PK PRIMARY KEY (NUM_PAGO, INMUEBLE_ID), 
    CONSTRAINT PAGO_INMUEBLE_ID_FK FOREIGN KEY (INMUEBLE_ID)
    REFERENCES INMUEBLE(INMUEBLE_ID)
)
;



-- 
-- TABLE: RENTA_INMUEBLE 
--

CREATE TABLE RENTA_INMUEBLE(
    INMUEBLE_ID        NUMBER(10, 0)    NOT NULL,
    DIA_PAGO           NUMBER(2, 0)     NOT NULL,
    RENTA_MENSUAL      NUMBER(8, 2)     NOT NULL,
    INTERES_MENSUAL    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT RENTA_INMUEBLE_PK PRIMARY KEY (INMUEBLE_ID), 
    CONSTRAINT RefINMUEBLE3 FOREIGN KEY (INMUEBLE_ID)
    REFERENCES INMUEBLE(INMUEBLE_ID)
)
;











