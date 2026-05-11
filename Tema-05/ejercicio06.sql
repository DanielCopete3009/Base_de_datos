-- Usar base de datos
USE test;

-- 1. TABLA ALUMNOS

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    dni CHAR(9) NOT NULL,
    fecha_nac DATE NOT NULL,
    edad INT,
    poblacion VARCHAR(20),
    direccion VARCHAR(255),
    cpostal CHAR(4),
    provincia VARCHAR(20),
    nacionalidad VARCHAR(20),
    telefono VARCHAR(13),
    email VARCHAR(60)
);


-- 2. TABLA ARTICULOS

DROP TABLE IF EXISTS articulos;

CREATE TABLE articulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    referencia VARCHAR(30),
    precio_coste DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    descuento DECIMAL(5,2), 
    imagen VARCHAR(255),
    categoria VARCHAR(50),
    stock INT,
    stock_min INT,
    stock_max INT
);


-- 3. TABLA REGISTRO_LLEGADAS

DROP TABLE IF EXISTS registro_llegadas;

CREATE TABLE registro_llegadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_salida DATETIME NOT NULL,
    fecha_hora_llegada DATETIME NOT NULL,
    tiempo_realizado TIME,
    id_corredor INT
);
