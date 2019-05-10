<<<<<<< HEAD
-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-04-20 22:34:04 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE detalle_habitaciones (
    id_detalle_habitacion      NUMBER(10) NOT NULL,
    id_huesped                 NUMBER(10) NOT NULL,
    id_habitacion              NUMBER(10) NOT NULL,
    id_estado_habitacion       VARCHAR2(250),
    id_empleado                NUMBER(10),
    valor                      NUMBER(10),
    huesped_id_huesped         NUMBER(10) NOT NULL,
    habitacion_id_habitacion   NUMBER(10) NOT NULL,
    empleados_id_empleado      NUMBER(10) NOT NULL
);

ALTER TABLE detalle_habitaciones ADD CONSTRAINT detalle_habitaciones_pk PRIMARY KEY ( id_detalle_habitacion );

CREATE TABLE detalle_servicio (
    id_detalle_servicio          NUMBER(10) NOT NULL,
    id_servico                   NUMBER(10),
    id_huesped                   NUMBER,
    valor_servicio               NUMBER(10),
    servicio_comedor_id_sc       NUMBER(10) NOT NULL,
    empleados_id_empleado        NUMBER(10) NOT NULL,
    detalle_habitaciones_id_dh   NUMBER(10) NOT NULL
);

ALTER TABLE detalle_servicio ADD CONSTRAINT detalle_servicio_pk PRIMARY KEY ( id_detalle_servicio );

CREATE TABLE empleados (
    id_empleado                   NUMBER(10) NOT NULL,
    nombre_empleado               VARCHAR2(250),
    apellido_empleado             VARCHAR2(250),
    telefono_empleado             NUMBER(10),
    correo_empleado               VARCHAR2(250),
    edad_empleado                 NUMBER(10),
    direccion_empleado            VARCHAR2(250),
    id_usuario                    NUMBER(10),
    perfiles_usuarios_id_perfil   NUMBER(10)
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE empresa (
    id_empresa               NUMBER NOT NULL,
    razon_social             VARCHAR2(250),
    rut_empresa              VARCHAR2(250),
    dv_rut_empresa           CHAR(1),
    correo_empresa           VARCHAR2(250),
    direccion_empresa        VARCHAR2(500),
    telefono                 NUMBER(10),
    nombre_representante     VARCHAR2(250),
    apellido_representante   VARCHAR2(250)
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE estado_habitacion (
    id_estado_habitacion       NUMBER(10) NOT NULL,
    nombre_estado_habitacion   VARCHAR2(250),
    habitacion_id_habitacion   NUMBER(10) NOT NULL
);

ALTER TABLE estado_habitacion ADD CONSTRAINT estado_habitacion_pk PRIMARY KEY ( id_estado_habitacion );

CREATE TABLE factura (
    id_factura               NUMBER(10) NOT NULL,
    valor_factura            NUMBER(10),
    estado_factura           VARCHAR2(250),
    id_empleado              NUMBER(10),
    id_detalle_servicio1     NUMBER(10) NOT NULL,
    id_servicio_comedor      NUMBER(10) NOT NULL,
    detalle_servicio_id_dc   NUMBER(10) NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE habitacion (
    id_habitacion           NUMBER(10) NOT NULL,
    nombre_habitacion       VARCHAR2(250),
    tipo_cama_habitacion    VARCHAR2(250),
    accesorios_habitacion   VARCHAR2(500),
    valor_habitacion        NUMBER(10),
    id_estado_habitacion    VARCHAR2(10)
);

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( id_habitacion );

CREATE TABLE huesped (
    id_huesped           NUMBER(10) NOT NULL,
    nombre_huesped       VARCHAR2(250),
    apellido_huesped     VARCHAR2(250),
    rut_huesped          NUMBER(8),
    dv_rut_huesped       CHAR(1),
    telefono_huesped     NUMBER(10),
    correo_huesped       VARCHAR2(250),
    empresa_id_empresa   NUMBER(10) NOT NULL
);

ALTER TABLE huesped ADD CONSTRAINT huesped_pk PRIMARY KEY ( id_huesped );

CREATE TABLE orden_pedido (
    id_orden_pedido                NUMBER(10) NOT NULL,
    id_empleado                    NUMBER(10),
    id_proveedor                   NUMBER(10),
    id_producto                    NUMBER(10),
    cantidad_producto_solicitado   NUMBER(10),
    cantidad_producto_recibido     NUMBER(10),
    empleados_id_empleado          NUMBER(10) NOT NULL,
    proveedor_id_proveedor         NUMBER(10) NOT NULL,
    producto_id_producto           NUMBER(10) NOT NULL
);

ALTER TABLE orden_pedido ADD CONSTRAINT orden_pedido_pk PRIMARY KEY ( id_orden_pedido );

CREATE TABLE perfiles_usuarios (
    id_perfil       NUMBER(10) NOT NULL,
    nombre_perfil   VARCHAR2(250)
);

ALTER TABLE perfiles_usuarios ADD CONSTRAINT perfiles_usuarios_pk PRIMARY KEY ( id_perfil );

CREATE TABLE platos (
    id_plato                 NUMBER(10) NOT NULL,
    nombre_plato             VARCHAR2(250),
    valor_plato              NUMBER(10),
    tipo_menu                VARCHAR2(250),
    servicio_comedor_id_sc   NUMBER(10) NOT NULL
);

ALTER TABLE platos ADD CONSTRAINT platos_pk PRIMARY KEY ( id_plato );

CREATE TABLE producto (
    id_producto         NUMBER(10) NOT NULL,
    nombre_producto     VARCHAR2(250),
    stock_producto      NUMBER(10),
    id_proveedor        NUMBER(10),
    fecha_vencimiento   DATE,
    precio              NUMBER(10),
    estado_producto     NUMBER(10)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    id_proveedor                  NUMBER(10) NOT NULL,
    nombre_proveedor              VARCHAR2(250),
    contacto_proveedor            NUMBER(10),
    rubro_proveedor               VARCHAR2(250),
    direccion_proveedor           VARCHAR2(250),
    correo_proveedor              VARCHAR2(250),
    perfiles_usuarios_id_perfil   NUMBER(10) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE servicio_comedor (
    id_servicio_comedor       NUMBER(10) NOT NULL,
    nombre_servicio_comedor   VARCHAR2(250),
    id_plato                  NUMBER(10),
    valor_plato               NUMBER(10),
    id_empleado               NUMBER(10),
    huesped_id_huesped        NUMBER(10) NOT NULL
);

ALTER TABLE servicio_comedor ADD CONSTRAINT servicio_comedor_pk PRIMARY KEY ( id_servicio_comedor );

CREATE TABLE usuarios (
    id_usuario                    NUMBER NOT NULL,
    nombre_usuario                VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    apellido_usuario              VARCHAR2(250),
    username                      VARCHAR2(250),
    password                      VARCHAR2(250),
    estado_password               VARCHAR2(250),
    id_perfil                     NUMBER,
    empresa_id_empresa            NUMBER NOT NULL,
    perfiles_usuarios_id_perfil   NUMBER(10) NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_habitacion_fk FOREIGN KEY ( habitacion_id_habitacion )
        REFERENCES habitacion ( id_habitacion );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_huesped_fk FOREIGN KEY ( huesped_id_huesped )
        REFERENCES huesped ( id_huesped );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_detalle_habitaciones_fk FOREIGN KEY ( detalle_habitaciones_id_dh )
        REFERENCES detalle_habitaciones ( id_detalle_habitacion );

ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_servicio_comedor_fk FOREIGN KEY ( servicio_comedor_id_sc )
        REFERENCES servicio_comedor ( id_servicio_comedor );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE estado_habitacion
    ADD CONSTRAINT estado_habitacion_habitacion_fk FOREIGN KEY ( habitacion_id_habitacion )
        REFERENCES habitacion ( id_habitacion );

ALTER TABLE factura
    ADD CONSTRAINT factura_detalle_servicio_fk FOREIGN KEY ( detalle_servicio_id_dc )
        REFERENCES detalle_servicio ( id_detalle_servicio );

ALTER TABLE huesped
    ADD CONSTRAINT huesped_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE platos
    ADD CONSTRAINT platos_servicio_comedor_fk FOREIGN KEY ( servicio_comedor_id_sc )
        REFERENCES servicio_comedor ( id_servicio_comedor );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );

ALTER TABLE servicio_comedor
    ADD CONSTRAINT servicio_comedor_huesped_fk FOREIGN KEY ( huesped_id_huesped )
        REFERENCES huesped ( id_huesped );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             33
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
-- ERRORS                                   7
-- WARNINGS                                 0
=======
-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-04-20 22:34:04 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE detalle_habitaciones (
    id_detalle_habitacion      NUMBER(10) NOT NULL,
    id_huesped                 NUMBER(10) NOT NULL,
    id_habitacion              NUMBER(10) NOT NULL,
    id_estado_habitacion       VARCHAR2(250),
    id_empleado                NUMBER(10),
    valor                      NUMBER(10),
    huesped_id_huesped         NUMBER(10) NOT NULL,
    habitacion_id_habitacion   NUMBER(10) NOT NULL,
    empleados_id_empleado      NUMBER(10) NOT NULL
);

ALTER TABLE detalle_habitaciones ADD CONSTRAINT detalle_habitaciones_pk PRIMARY KEY ( id_detalle_habitacion );

CREATE TABLE detalle_servicio (
    id_detalle_servicio          NUMBER(10) NOT NULL,
    id_servico                   NUMBER(10),
    id_huesped                   NUMBER,
    valor_servicio               NUMBER(10),
    servicio_comedor_id_sc       NUMBER(10) NOT NULL,
    empleados_id_empleado        NUMBER(10) NOT NULL,
    detalle_habitaciones_id_dh   NUMBER(10) NOT NULL
);

ALTER TABLE detalle_servicio ADD CONSTRAINT detalle_servicio_pk PRIMARY KEY ( id_detalle_servicio );

CREATE TABLE empleados (
    id_empleado                   NUMBER(10) NOT NULL,
    nombre_empleado               VARCHAR2(250),
    apellido_empleado             VARCHAR2(250),
    telefono_empleado             NUMBER(10),
    correo_empleado               VARCHAR2(250),
    edad_empleado                 NUMBER(10),
    direccion_empleado            VARCHAR2(250),
    id_usuario                    NUMBER(10),
    perfiles_usuarios_id_perfil   NUMBER(10)
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE empresa (
    id_empresa               NUMBER NOT NULL,
    razon_social             VARCHAR2(250),
    rut_empresa              VARCHAR2(250),
    dv_rut_empresa           CHAR(1),
    correo_empresa           VARCHAR2(250),
    direccion_empresa        VARCHAR2(500),
    telefono                 NUMBER(10),
    nombre_representante     VARCHAR2(250),
    apellido_representante   VARCHAR2(250)
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE estado_habitacion (
    id_estado_habitacion       NUMBER(10) NOT NULL,
    nombre_estado_habitacion   VARCHAR2(250),
    habitacion_id_habitacion   NUMBER(10) NOT NULL
);

ALTER TABLE estado_habitacion ADD CONSTRAINT estado_habitacion_pk PRIMARY KEY ( id_estado_habitacion );

CREATE TABLE factura (
    id_factura               NUMBER(10) NOT NULL,
    valor_factura            NUMBER(10),
    estado_factura           VARCHAR2(250),
    id_empleado              NUMBER(10),
    id_detalle_servicio1     NUMBER(10) NOT NULL,
    id_servicio_comedor      NUMBER(10) NOT NULL,
    detalle_servicio_id_dc   NUMBER(10) NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE habitacion (
    id_habitacion           NUMBER(10) NOT NULL,
    nombre_habitacion       VARCHAR2(250),
    tipo_cama_habitacion    VARCHAR2(250),
    accesorios_habitacion   VARCHAR2(500),
    valor_habitacion        NUMBER(10),
    id_estado_habitacion    VARCHAR2(10)
);

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( id_habitacion );

CREATE TABLE huesped (
    id_huesped           NUMBER(10) NOT NULL,
    nombre_huesped       VARCHAR2(250),
    apellido_huesped     VARCHAR2(250),
    rut_huesped          NUMBER(8),
    dv_rut_huesped       CHAR(1),
    telefono_huesped     NUMBER(10),
    correo_huesped       VARCHAR2(250),
    empresa_id_empresa   NUMBER(10) NOT NULL
);

ALTER TABLE huesped ADD CONSTRAINT huesped_pk PRIMARY KEY ( id_huesped );

CREATE TABLE orden_pedido (
    id_orden_pedido                NUMBER(10) NOT NULL,
    id_empleado                    NUMBER(10),
    id_proveedor                   NUMBER(10),
    id_producto                    NUMBER(10),
    cantidad_producto_solicitado   NUMBER(10),
    cantidad_producto_recibido     NUMBER(10),
    empleados_id_empleado          NUMBER(10) NOT NULL,
    proveedor_id_proveedor         NUMBER(10) NOT NULL,
    producto_id_producto           NUMBER(10) NOT NULL
);

ALTER TABLE orden_pedido ADD CONSTRAINT orden_pedido_pk PRIMARY KEY ( id_orden_pedido );

CREATE TABLE perfiles_usuarios (
    id_perfil       NUMBER(10) NOT NULL,
    nombre_perfil   VARCHAR2(250)
);

ALTER TABLE perfiles_usuarios ADD CONSTRAINT perfiles_usuarios_pk PRIMARY KEY ( id_perfil );

CREATE TABLE platos (
    id_plato                 NUMBER(10) NOT NULL,
    nombre_plato             VARCHAR2(250),
    valor_plato              NUMBER(10),
    tipo_menu                VARCHAR2(250),
    servicio_comedor_id_sc   NUMBER(10) NOT NULL
);

ALTER TABLE platos ADD CONSTRAINT platos_pk PRIMARY KEY ( id_plato );

CREATE TABLE producto (
    id_producto         NUMBER(10) NOT NULL,
    nombre_producto     VARCHAR2(250),
    stock_producto      NUMBER(10),
    id_proveedor        NUMBER(10),
    fecha_vencimiento   DATE,
    precio              NUMBER(10),
    estado_producto     NUMBER(10)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    id_proveedor                  NUMBER(10) NOT NULL,
    nombre_proveedor              VARCHAR2(250),
    contacto_proveedor            NUMBER(10),
    rubro_proveedor               VARCHAR2(250),
    direccion_proveedor           VARCHAR2(250),
    correo_proveedor              VARCHAR2(250),
    perfiles_usuarios_id_perfil   NUMBER(10) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE servicio_comedor (
    id_servicio_comedor       NUMBER(10) NOT NULL,
    nombre_servicio_comedor   VARCHAR2(250),
    id_plato                  NUMBER(10),
    valor_plato               NUMBER(10),
    id_empleado               NUMBER(10),
    huesped_id_huesped        NUMBER(10) NOT NULL
);

ALTER TABLE servicio_comedor ADD CONSTRAINT servicio_comedor_pk PRIMARY KEY ( id_servicio_comedor );

CREATE TABLE usuarios (
    id_usuario                    NUMBER NOT NULL,
    nombre_usuario                VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    apellido_usuario              VARCHAR2(250),
    username                      VARCHAR2(250),
    password                      VARCHAR2(250),
    estado_password               VARCHAR2(250),
    id_perfil                     NUMBER,
    empresa_id_empresa            NUMBER NOT NULL,
    perfiles_usuarios_id_perfil   NUMBER(10) NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_habitacion_fk FOREIGN KEY ( habitacion_id_habitacion )
        REFERENCES habitacion ( id_habitacion );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habitaciones_huesped_fk FOREIGN KEY ( huesped_id_huesped )
        REFERENCES huesped ( id_huesped );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_detalle_habitaciones_fk FOREIGN KEY ( detalle_habitaciones_id_dh )
        REFERENCES detalle_habitaciones ( id_detalle_habitacion );

ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_servicio_comedor_fk FOREIGN KEY ( servicio_comedor_id_sc )
        REFERENCES servicio_comedor ( id_servicio_comedor );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE estado_habitacion
    ADD CONSTRAINT estado_habitacion_habitacion_fk FOREIGN KEY ( habitacion_id_habitacion )
        REFERENCES habitacion ( id_habitacion );

ALTER TABLE factura
    ADD CONSTRAINT factura_detalle_servicio_fk FOREIGN KEY ( detalle_servicio_id_dc )
        REFERENCES detalle_servicio ( id_detalle_servicio );

ALTER TABLE huesped
    ADD CONSTRAINT huesped_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE platos
    ADD CONSTRAINT platos_servicio_comedor_fk FOREIGN KEY ( servicio_comedor_id_sc )
        REFERENCES servicio_comedor ( id_servicio_comedor );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );

ALTER TABLE servicio_comedor
    ADD CONSTRAINT servicio_comedor_huesped_fk FOREIGN KEY ( huesped_id_huesped )
        REFERENCES huesped ( id_huesped );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             33
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
-- ERRORS                                   7
-- WARNINGS                                 0
>>>>>>> 2f0e589acd61404fc042430b9e43f1d3ddfde8a6
