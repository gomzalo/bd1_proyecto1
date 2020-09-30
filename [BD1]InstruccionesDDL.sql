-- Universidad de San Carlos de Guatemala
-- Facultad de Ingenieria
-- Escuela de Ciencias y Sistemas
-- Laboratorio de sistemas de bases de datos 1
-- Gonzalo Antonio Garcia Solares - 201318652
-- Proyecto 1

CREATE DATABASE bd1_pro1;

-- DDL
-- Instrucciones para la creacion de la base y sus tablas previamente definidas en el ER.

-- Creando la tabla "compania"
CREATE TABLE compania(
    id_compania INTEGER PRIMARY KEY NOT NULL,
    nombre_compania VARCHAR(100) NOT NULL,
    correo_compania VARCHAR(100) NOT NULL,
    telefono_compania INTEGER NOT NULL,
    
);