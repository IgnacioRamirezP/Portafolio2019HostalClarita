
CREATE TABLE detalle_habitaciones (
    id_detalle_habitacion      BIGINT NOT NULL,
    id_huesped                 BIGINT NOT NULL,
    id_habitacion              BIGINT NOT NULL,
    id_estado_habitacion       VARCHAR(250),
    id_empleado                BIGINT,
    valor                      BIGINT,
    huesped_id_huesped         BIGINT NOT NULL,
    habitacion_id_habitacion   BIGINT NOT NULL,
    empleados_id_empleado      BIGINT NOT NULL
);

ALTER TABLE detalle_habitaciones ADD CONSTRAINT detalle_habitaciones_pk PRIMARY KEY ( id_detalle_habitacion );

CREATE TABLE detalle_servicio (
    id_detalle_servicio          BIGINT NOT NULL,
    id_servico                   BIGINT,
    id_huesped                   FLOAT,
    valor_servicio               BIGINT,
    servicio_comedor_id_sc       BIGINT NOT NULL,
    empleados_id_empleado        BIGINT NOT NULL,
    detalle_habitaciones_id_dh   BIGINT NOT NULL,
	fecha_ingreso                DATETIME,
	fecha_salida                 DATETIME
);

ALTER TABLE detalle_servicio ADD CONSTRAINT detalle_servicio_pk PRIMARY KEY ( id_detalle_servicio );

CREATE TABLE empleados (
    id_empleado                   BIGINT NOT NULL,
    nombre_empleado               VARCHAR(250),
    apellido_empleado             VARCHAR(250),
    telefono_empleado             BIGINT,
    correo_empleado               VARCHAR(250),
    edad_empleado                 BIGINT,
    direccion_empleado            VARCHAR(250),
    id_usuario                    BIGINT,
    perfiles_usuarios_id_perfil   BIGINT
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE empresa (
    id_empresa               FLOAT NOT NULL,
    razon_social             VARCHAR(250),
    rut_empresa              VARCHAR(250),
    dv_rut_empresa           CHAR(1),
    correo_empresa           VARCHAR(250),
    direccion_empresa        VARCHAR(500),
    telefono                 BIGINT,
    nombre_representante     VARCHAR(250),
    apellido_representante   VARCHAR(250),    
	id_usuario                    BIGINT,
    perfiles_usuarios_id_perfil   BIGINT
	
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE estado_habitacion (
    id_estado_habitacion       BIGINT NOT NULL,
    nombre_estado_habitacion   VARCHAR(250),
    habitacion_id_habitacion   BIGINT NOT NULL
);

ALTER TABLE estado_habitacion ADD CONSTRAINT estado_habitacion_pk PRIMARY KEY ( id_estado_habitacion );

CREATE TABLE factura (
    id_factura               BIGINT NOT NULL,
    valor_factura            BIGINT,
    estado_factura           VARCHAR(250),
    id_empleado              BIGINT,
    id_detalle_servicio1     BIGINT NOT NULL,
    id_servicio_comedor      BIGINT NOT NULL,
    detalle_servicio_id_dc   BIGINT NOT NULL,
	fecha_facturacion        DATETIME
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE habitacion (
    id_habitacion           BIGINT NOT NULL,
    nombre_habitacion       VARCHAR(250),
    tipo_cama_habitacion    VARCHAR(250),
    accesorios_habitacion   VARCHAR(500),
    valor_habitacion        BIGINT,
    id_estado_habitacion    VARCHAR(10)
);

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( id_habitacion );

CREATE TABLE huesped (
    id_huesped           BIGINT NOT NULL,
    nombre_huesped       VARCHAR(250),
    apellido_huesped     VARCHAR(250),
    rut_huesped          INT,
    dv_rut_huesped       CHAR(1),
    telefono_huesped     BIGINT,
    correo_huesped       VARCHAR(250),
    empresa_id_empresa   FLOAT NOT NULL,    
	id_usuario                    BIGINT,
    perfiles_usuarios_id_perfil   BIGINT
	
);

ALTER TABLE huesped ADD CONSTRAINT huesped_pk PRIMARY KEY ( id_huesped );

CREATE TABLE orden_pedido (
    id_orden_pedido                BIGINT NOT NULL,
    id_empleado                    BIGINT,
    id_proveedor                   BIGINT,
    id_producto                    BIGINT,
    cantidad_producto_solicitado   BIGINT,
    cantidad_producto_recibido     BIGINT,
    empleados_id_empleado          BIGINT NOT NULL,
    proveedor_id_proveedor         BIGINT NOT NULL,
    producto_id_producto           BIGINT NOT NULL,
	fecha_orden                    DATETIME
);

ALTER TABLE orden_pedido ADD CONSTRAINT orden_pedido_pk PRIMARY KEY ( id_orden_pedido );

CREATE TABLE perfiles_usuarios (
    id_perfil       BIGINT NOT NULL,
    nombre_perfil   VARCHAR(250)
);

ALTER TABLE perfiles_usuarios ADD CONSTRAINT perfiles_usuarios_pk PRIMARY KEY ( id_perfil );

CREATE TABLE platos (
    id_plato                 BIGINT NOT NULL,
    nombre_plato             VARCHAR(250),
    valor_plato              BIGINT,
    tipo_menu                VARCHAR(250),
    servicio_comedor_id_sc   BIGINT NOT NULL
);

ALTER TABLE platos ADD CONSTRAINT platos_pk PRIMARY KEY ( id_plato );

CREATE TABLE producto (
    id_producto         BIGINT NOT NULL,
    nombre_producto     VARCHAR(250),
    stock_producto      BIGINT,
    id_proveedor        BIGINT,
    fecha_vencimiento   DATETIME,
    precio              BIGINT,
    estado_producto     BIGINT
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    id_proveedor                  BIGINT NOT NULL,
    nombre_proveedor              VARCHAR(250),
    contacto_proveedor            BIGINT,
    rubro_proveedor               VARCHAR(250),
    direccion_proveedor           VARCHAR(250),
    correo_proveedor              VARCHAR(250),
    perfiles_usuarios_id_perfil   BIGINT NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE servicio_comedor (
    id_servicio_comedor       BIGINT NOT NULL,
    nombre_servicio_comedor   VARCHAR(250),
    id_plato                  BIGINT,
    valor_plato               BIGINT,
    id_empleado               BIGINT,
    huesped_id_huesped        BIGINT NOT NULL
);

ALTER TABLE servicio_comedor ADD CONSTRAINT servicio_comedor_pk PRIMARY KEY ( id_servicio_comedor );

CREATE TABLE usuarios (
    id_usuario                    FLOAT NOT NULL,
    nombre_usuario                VARCHAR(250),
    apellido_usuario              VARCHAR(250),
    username                      VARCHAR(250),
    password                      VARCHAR(250),
    estado_password               VARCHAR(250),
    id_perfil                     FLOAT,
    empresa_id_empresa            FLOAT NOT NULL,
    perfiles_usuarios_id_perfil   BIGINT NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_usuario );

ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habs_emp_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habs_hab_fk FOREIGN KEY ( habitacion_id_habitacion )
        REFERENCES habitacion ( id_habitacion );

ALTER TABLE detalle_habitaciones
    ADD CONSTRAINT detalle_habs_huesped_fk FOREIGN KEY ( huesped_id_huesped )
        REFERENCES huesped ( id_huesped );

ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_serv_det_habs_fk FOREIGN KEY ( detalle_habitaciones_id_dh )
        REFERENCES detalle_habitaciones ( id_detalle_habitacion );

ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_servicio_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE detalle_servicio
    ADD CONSTRAINT detalle_serv_serv_comr_fk FOREIGN KEY ( servicio_comedor_id_sc )
        REFERENCES servicio_comedor ( id_servicio_comedor );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );
		
ALTER TABLE empresa
    ADD CONSTRAINT empresa_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );
		
ALTER TABLE huesped
    ADD CONSTRAINT huesped_perfiles_usuarios_fk FOREIGN KEY ( perfiles_usuarios_id_perfil )
        REFERENCES perfiles_usuarios ( id_perfil );

ALTER TABLE estado_habitacion
    ADD CONSTRAINT estado_hab_hab_fk FOREIGN KEY ( habitacion_id_habitacion )
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


