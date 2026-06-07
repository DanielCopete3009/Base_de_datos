-- Actividad 5.13
-- Tema: Lenguaje SQL
-- Módulo Base de datos
-- Curso 25/26

-- Creación de la base de datos
DROP DATABASE IF EXISTS proyectos;
CREATE DATABASE IF NOT EXISTS proyectos;

-- Usar base de datos proyectos
USE proyectos;

-- Crear tabla clientes 
DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL
);

-- Crear la tabla de teléfono de clientes
DROP TABLE IF EXISTS telefono_cliente;
CREATE TABLE IF NOT EXISTS telefono_cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED,
    telefono CHAR(9) NOT NULL,
    UNIQUE (cliente_id, telefono),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla empleados
DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    proyecto_id INT UNSIGNED,
    supervisor_id INT UNSIGNED
    -- Las restricciones FOREIGN KEY se añaden al final
);

-- crear tabla telefonos empleado
DROP TABLE IF EXISTS telefono_empleado;
CREATE TABLE IF NOT EXISTS telefono_empleado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT UNSIGNED NOT NULL,
    telefono CHAR(9) NOT NULL,
    UNIQUE (empleado_id, telefono),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- crear tabla beneficiarios
DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nac DATE,
    empleado_id INT UNSIGNED,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- crear tabla proyectos
DROP TABLE IF EXISTS proyectos_tabla;
CREATE TABLE IF NOT EXISTS proyectos_tabla (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(50) NOT NULL,
    descripcion TEXT,
    presupuesto DECIMAL(10,2),
    cliente_id INT UNSIGNED,
    jefe_id INT UNSIGNED,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (jefe_id) REFERENCES empleados(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- crear tabla proyectos_empleados
DROP TABLE IF EXISTS proyectos_empleados;
CREATE TABLE IF NOT EXISTS proyectos_empleados (
    empleado_id INT UNSIGNED NOT NULL,
    proyecto_id INT UNSIGNED NOT NULL,
    horas SMALLINT UNSIGNED,
    valoracion VARCHAR(255),
    f_fin DATE,
    f_inicio DATE,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos_tabla(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Tabla empleados restricciones FOREIGN KEY
ALTER TABLE empleados
ADD CONSTRAINT FK_proyecto_id_empleados
FOREIGN KEY (proyecto_id) REFERENCES proyectos_tabla(id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
ADD CONSTRAINT FK_supervisor_id_empleados
FOREIGN KEY (supervisor_id) REFERENCES empleados(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- Crear índice para la columna nombre de la tabla empleados
CREATE INDEX IN_nombre_empleados ON empleados(nombre);

-- Crear índice para la columna proyecto de la tabla proyectos_tabla
CREATE INDEX IN_proyecto_proyectos ON proyectos_tabla(proyecto);

SHOW INDEX FROM proyectos_tabla;
SHOW INDEX FROM empleados;

-- Parte 2 
-- Modificaciones en la base de datos

-- 1. Añadir columna email en la tabla empleados con restricción UNIQUE
ALTER TABLE empleados
ADD COLUMN email VARCHAR(60) NOT NULL UNIQUE;


-- 2 Añadir  la columna estado en la  tabla proyectos.El estado podra ser:
-- presupuesto, iniciado, pausado, cancelado, finalizado
-- esta columna es obligatorio y por defecto valor presupuesto
ALTER TABLE proyectos_tabla
ADD COLUMN estado ENUM('presupuesto', 'iniciado', 'pausado', 'cancelado', 'finalizado')
NOT NULL DEFAULT 'presupuesto';





