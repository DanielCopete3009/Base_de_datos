-- Desactivar temporalmente las restricciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Crear base de datos y seleccionarla
CREATE DATABASE IF NOT EXISTS libros_almacen;
USE libros_almacen;

--  Crear tabla Autores
DROP TABLE IF EXISTS Autores;
CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50),
    fechaNac DATE,
    estilo VARCHAR(50)
);

-- Crear tabla Libros
DROP TABLE IF EXISTS Libros;
CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    ISBN CHAR(13) NOT NULL,
    EAN CHAR(13),
    categorias SET('DRAMA','NOVELA','COMEDIA'),
    tipo_lector ENUM('infantil','juvenil','adulto','mayor'),
    fecha_edicion DATE,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

-- Crear tabla Socios
DROP TABLE IF EXISTS Socios;
CREATE TABLE Socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    socio VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    poblacion VARCHAR(100),
    c_postal VARCHAR(10),
    provincia VARCHAR(100),
    nacionalidad VARCHAR(50),
    valoracion TINYINT CHECK (valoracion BETWEEN 0 AND 10),
    CONSTRAINT unique_telefono UNIQUE (telefono)
);

--  Crear tabla LibrosPedidos
DROP TABLE IF EXISTS LibrosPedidos;
CREATE TABLE LibrosPedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libro_id INT,
    pedido_id INT,
    descuento DECIMAL(4,3) DEFAULT 0,
    importe DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES Libros(id)
);

-- Crear tabla Pedidos
DROP TABLE IF EXISTS Pedidos;
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE
);

-- Crear tabla Almacenes
DROP TABLE IF EXISTS Almacenes;
CREATE TABLE Almacenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Crear índices

ALTER TABLE Libros ADD INDEX idx_titulo (titulo);
ALTER TABLE Pedidos ADD INDEX idx_fecha (fecha);
ALTER TABLE Almacenes ADD INDEX idx_nombre_almacen (nombre);
ALTER TABLE Socios ADD INDEX idx_socio (socio);

--  Volver a activar las restricciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

