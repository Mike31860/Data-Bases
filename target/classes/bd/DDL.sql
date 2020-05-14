-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2019-11-13 15:46:28 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE clientes CASCADE CONSTRAINTS;

DROP TABLE clientesxproductos CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE tiposolicitud CASCADE CONSTRAINTS;

CREATE TABLE clientes (
    nombre            VARCHAR2(30),
    cedula            NUMBER(10) NOT NULL,
    fechanacimiento   DATE,
    telefono          NUMBER(10),
    direccion         VARCHAR2(30)
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( cedula );

CREATE TABLE clientesxproductos (
    id                VARCHAR2(20) NOT NULL,
    fechainicio       DATE,
    fecharetiro       DATE,
    clientes_cedula   NUMBER(10) NOT NULL,
    producto_codigo   VARCHAR2(20) NOT NULL
);

ALTER TABLE clientesxproductos ADD CONSTRAINT clientesxproductos_pk PRIMARY KEY ( id );

CREATE TABLE funcionario (
    cedula            NUMBER(10) NOT NULL,
    nombre            VARCHAR2(30),
    fechanacimiento   DATE,
    direccion         VARCHAR2(30),
    telefono          NUMBER(10)
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedula );

CREATE TABLE producto (
    codigo        VARCHAR2(20) NOT NULL,
    descripcion   VARCHAR2(60)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( codigo );

CREATE TABLE solicitud (
    codigo                  NUMBER(10) NOT NULL,
    observacion             VARCHAR2(60),
    tipoanomalia            VARCHAR2(30),
    estado                  VARCHAR2(20),
    clientes_cedula         NUMBER(10),
    funcionario_cedula      NUMBER(10) NOT NULL,
    tiposolicitud_codigo    VARCHAR2(20) NOT NULL,
    fechaatencion           DATE,
    fechaasignacion         DATE,
    clientesxproductos_id   VARCHAR2(20) NOT NULL,
    tipoproducto            VARCHAR2(20)
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( codigo );

CREATE TABLE tiposolicitud (
    codigo        VARCHAR2(20) NOT NULL,
    descripcion   VARCHAR2(30)
);

ALTER TABLE tiposolicitud ADD CONSTRAINT tiposolicitud_pk PRIMARY KEY ( codigo );

ALTER TABLE clientesxproductos
    ADD CONSTRAINT clientesxproductos_clientes_fk FOREIGN KEY ( clientes_cedula )
        REFERENCES clientes ( cedula );

ALTER TABLE clientesxproductos
    ADD CONSTRAINT clientesxproductos_producto_fk FOREIGN KEY ( producto_codigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_clientes_fk FOREIGN KEY ( clientes_cedula )
        REFERENCES clientes ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliexpr_fk FOREIGN KEY ( clientesxproductos_id )
        REFERENCES clientesxproductos ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_cedula )
        REFERENCES funcionario ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tiposolicitud_fk FOREIGN KEY ( tiposolicitud_codigo )
        REFERENCES tiposolicitud ( codigo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
