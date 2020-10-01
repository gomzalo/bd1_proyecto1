-- Universidad de San Carlos de Guatemala
-- Facultad de Ingenieria
-- Escuela de Ciencias y Sistemas
-- Laboratorio de sistemas de bases de datos 1
-- Gonzalo Antonio Garcia Solares - 201318652
-- Proyecto 1

CREATE DATABASE bd1_pro1;

-- :::::::::::::::::::::::::::    DDL     :::::::::::::::::::::::::::
-- Instrucciones para la creacion de la base y sus tablas previamente definidas en el ER.

-- Creacion de tabla "compania"
CREATE TABLE compania(
    id_compania INTEGER PRIMARY KEY NOT NULL,
    nombre_compania VARCHAR(100) NOT NULL,
    correo_compania VARCHAR(100) NOT NULL,
    telefono_compania INTEGER NOT NULL,
    contacto_compania VARCHAR(100) NOT NULL
);

-- Creacion de tabla "factura"
CREATE TABLE factura(
    id_factura INTEGER PRIMARY KEY NOT NULL,
    total INTEGER NOT NULL
);

-- Creacion de tabla "detalle"
CREATE TABLE detalle(
    id_detalle INTEGER PRIMARY KEY NOT NULL,
    cantidad INTEGER NOT NULL
);

-- Creacion de tabla "cliente"
CREATE TABLE cliente(
    id_cliente INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- Creacion de tabla "tipo cliente"
CREATE TABLE tipo_cliente(
    id_tipo_cliente INTEGER PRIMARY KEY NOT NULL,
    tipo CHAR NOT NULL
);

-- Creacion de tabla "ciudad"
CREATE TABLE ciudad(
    cod_postal INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- Creacion de tabla "region"
CREATE TABLE region(
    id_region INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- Creacion de tabla "producto"
CREATE TABLE producto(
    id_producto INTEGER PRIMARY KEY NOT NULL,
    producto VARCHAR(100) NOT NULL,
    precio_unitario 

);

-- Creacion de tabla "categoria"
CREATE TABLE categoria(
    id_categoria INTEGER PRIMARY KEY NOT NULL,
    categoria VARCHAR(100) NOT NULL
);

