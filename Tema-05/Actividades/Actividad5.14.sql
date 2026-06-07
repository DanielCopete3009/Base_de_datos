-- Daniel Copete
-- ACTIVIDAD 5.14
-- Módulo: Base de Datos
-- Tema: Lenguaje SQL
-- Curso 2025 / 2026



-- CREAR BASE DE DATOS

CREATE DATABASE IF NOT EXISTS empleados_taller;
USE empleados_taller;

-- CREAR TABLA CLIENTES (estructura base)

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- 1. AÑADIR NUEVAS COLUMNAS

ALTER TABLE clientes
ADD COLUMN apellidos VARCHAR(45),
ADD COLUMN poblacion VARCHAR(50),
ADD COLUMN nacionalidad VARCHAR(30) DEFAULT 'España',
ADD COLUMN email VARCHAR(80),
ADD COLUMN direccion VARCHAR(100),
ADD COLUMN cod_cliente CHAR(7),
ADD COLUMN tipo_cliente TINYINT;

-- 2. MODIFICAR COLUMNAS EXISTENTES

ALTER TABLE clientes
MODIFY nombre VARCHAR(25) NOT NULL,
MODIFY apellidos VARCHAR(45) NOT NULL,
MODIFY nacionalidad VARCHAR(30) DEFAULT 'España',
MODIFY direccion VARCHAR(100);

-- 3. CAMBIAR NOMBRE DE email → correo_electronico

ALTER TABLE clientes
CHANGE email correo_electronico VARCHAR(80);

-- 4. AÑADIR RESTRICCIONES

-- El correo debe contener @
ALTER TABLE clientes
ADD CONSTRAINT CHK_correo
CHECK (correo_electronico LIKE '%@%');

-- Tipo de cliente entre 0 y 10
ALTER TABLE clientes
ADD CONSTRAINT CHK_tipo_cliente
CHECK (tipo_cliente BETWEEN 0 AND 10);

-- 5. CREAR ÍNDICE SOBRE apellidos y nombre

CREATE INDEX IN_apellidos_nombre
ON clientes (apellidos, nombre);

-- 6. MOSTRAR ÍNDICES DE LA TABLA

SHOW INDEX FROM clientes;

