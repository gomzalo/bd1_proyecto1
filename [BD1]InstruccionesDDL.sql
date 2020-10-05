-- Universidad de San Carlos de Guatemala
-- Facultad de Ingenieria
-- Escuela de Ciencias y Sistemas
-- Laboratorio de sistemas de bases de datos 1
-- Gonzalo Antonio Garcia Solares - 201318652
-- Proyecto 1

CREATE DATABASE bd1_pro1;

-- :::::::::::::::::::::::::::    DDL     :::::::::::::::::::::::::::
-- Instrucciones para la creacion de la base y sus tablas previamente definidas en el ER.


-- ***********  Creacion de tabla "categoria"  ***********
CREATE TABLE categoria(
    id_categoria INTEGER NOT NULL,
    nombre_categoria VARCHAR(100) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

-- ***********  Creacion de tabla "ciudad"  ***********
CREATE TABLE ciudad(
    id_ciudad         INTEGER NOT NULL,
    nombre_ciudad     VARCHAR2(100) NOT NULL,
    region_id_region  INTEGER NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

-- ***********  Creacion de tabla "codigo postal"  ***********

CREATE TABLE codigo_postal (
    id_codigo_postal      INTEGER NOT NULL,
    numero_codigo_postal  INTEGER NOT NULL,
    ciudad_id_ciudad      INTEGER NOT NULL
);

ALTER TABLE codigo_postal ADD CONSTRAINT codigo_postal_pk PRIMARY KEY ( id_codigo_postal );

-- ***********  Creacion de tabla "compania"    ***********
CREATE TABLE compania(
    id_compania INTEGER NOT NULL,
    nombre_compania VARCHAR(100) NOT NULL,
    contacto_compania VARCHAR(100) NOT NULL,
    correo_compania VARCHAR(100) NOT NULL,
    telefono_compania INTEGER NOT NULL,
);

ALTER TABLE compania ADD CONSTRAINT compania_pk PRIMARY KEY ( id_compania );

-- ***********  Creacion de tabla "factura" ***********
-- CREATE TABLE factura(
--     id_factura INTEGER PRIMARY KEY NOT NULL,
--     total INTEGER NOT NULL
-- );

-- ***********  Creacion de tabla "detalle" ***********
-- CREATE TABLE detalle(
--     id_detalle INTEGER PRIMARY KEY NOT NULL,
--     cantidad INTEGER NOT NULL
-- );

-- ***********  Creacion de tabla "persona" ***********
CREATE TABLE persona(
    id_persona INTEGER NOT NULL,
    nombre_persona VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL
    codigo_postal_id_codigo_postal  INTEGER,
    tipo_id_tipo                    INTEGER
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

--  *********** Creacion de tabla "producto"    ***********
CREATE TABLE producto(
    id_producto INTEGER NOT NULL,
    producto VARCHAR(100) NOT NULL,
    precio_unitario NUMBER(5, 2) NOT NULL,
    categoria_id_categoria2  INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

-- ***********  Creacion de tabla "region"  ***********
CREATE TABLE region(
    id_region INTEGER NOT NULL,
    nombre_region VARCHAR(100) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

-- ***********  Creacion de tabla "tipo"    ***********
CREATE TABLE tipo(
    id_tipo INTEGER NOT NULL,
    nombre_tipo CHAR NOT NULL
);

ALTER TABLE tipo ADD CONSTRAINT tipo_pk PRIMARY KEY ( id_tipo );

-- ***********  Creacion de tabla "transaccion"     ***********
CREATE TABLE transaccion(
    no_transaccion INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_total NUMBER(5, 2) NOT NULL,
    persona_id_persona1    INTEGER,
    compania_id_compania1  INTEGER,
    producto_id_producto1  INTEGER
);

ALTER TABLE transaccion ADD CONSTRAINT transaccion_pk PRIMARY KEY ( no_transaccion );

-- ||||||||||||||||||   Creando las claves foraneas |||||||||||||||||||||

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_region_fk FOREIGN KEY ( region_id_region )
        REFERENCES region ( id_region )
            ON DELETE CASCADE;

ALTER TABLE codigo_postal
    ADD CONSTRAINT codigo_postal_ciudad_fk FOREIGN KEY ( ciudad_id_ciudad )
        REFERENCES ciudad ( id_ciudad )
            ON DELETE CASCADE;

ALTER TABLE persona
    ADD CONSTRAINT persona_codigo_postal_fk FOREIGN KEY ( codigo_postal_id_codigo_postal )
        REFERENCES codigo_postal ( id_codigo_postal );

ALTER TABLE persona
    ADD CONSTRAINT persona_tipo_fk FOREIGN KEY ( tipo_id_tipo )
        REFERENCES tipo ( id_tipo )
            ON DELETE CASCADE;

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria2 )
        REFERENCES categoria ( id_categoria )
            ON DELETE CASCADE;

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_compania_fk FOREIGN KEY ( compania_id_compania1 )
        REFERENCES compania ( id_compania )
            ON DELETE CASCADE;

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_persona_fk FOREIGN KEY ( persona_id_persona1 )
        REFERENCES persona ( id_persona )
            ON DELETE CASCADE;

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_producto_fk FOREIGN KEY ( producto_id_producto1 )
        REFERENCES producto ( id_producto )
            ON DELETE CASCADE;