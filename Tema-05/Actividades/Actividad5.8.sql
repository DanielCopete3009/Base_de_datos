-- Actividad: Base de datos Horarios
-- Daniel Copete

-- Crear la Base de Datos
CREATE DATABASE IF NOT EXISTS Horarios;
USE Horarios;

-- Tabla Departamentos
DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Clave primaria
    nombre VARCHAR(50) NOT NULL,                -- Obligatorio
    cod_departamento CHAR(3) NOT NULL UNIQUE    -- Código de depto, 3 caracteres, clave secundaria
);

-- Tabla Profesor
DROP TABLE IF EXISTS profesor;
CREATE TABLE profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Clave primaria
    nombre VARCHAR(50) NOT NULL,                -- Obligatorio
    apellidos VARCHAR(100) NOT NULL,            -- Obligatorio
    email VARCHAR(100) UNIQUE,                  -- Clave secundaria, opcional
    fecha_ingreso DATE NOT NULL,                -- Obligatorio
    especialidad VARCHAR(50) NOT NULL,          -- Obligatorio
    nrp VARCHAR(20) NOT NULL UNIQUE,            -- Número registro personal, clave secundaria
    departamento_id INT NOT NULL,               -- FK a departamentos
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (departamento_id)
        REFERENCES departamentos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla Asignatura
DROP TABLE IF EXISTS asignatura;
CREATE TABLE asignatura (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Clave primaria
    nombre VARCHAR(50) NOT NULL,                -- Nombre asignatura
    nivel CHAR(4) NOT NULL,                     -- Curso, abreviado
    cod_asignatura CHAR(7) NOT NULL UNIQUE,     -- Código de asignatura, clave secundaria
    horas INT NOT NULL,                          -- Número de horas anuales
    departamento_id INT NOT NULL,               -- FK a departamentos
    CONSTRAINT fk_asignatura_departamento FOREIGN KEY (departamento_id)
        REFERENCES departamentos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla Horario
DROP TABLE IF EXISTS horario;
CREATE TABLE horario (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Clave primaria
    profesor_id INT NOT NULL,                   -- FK a profesor
    dia TINYINT NOT NULL,                        -- 1=lunes, 5=viernes
    tramo TINYINT NOT NULL,                      -- 1=primera hora, 6=última
    turno TINYINT NOT NULL CHECK (turno IN (1,2)), -- 1=mañana, 2=tarde
    asignatura_id INT NOT NULL,                 -- FK a asignatura
    horas INT NOT NULL,                          -- Duración clase en horas
    CONSTRAINT fk_horario_profesor FOREIGN KEY (profesor_id)
        REFERENCES profesor(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_horario_asignatura FOREIGN KEY (asignatura_id)
        REFERENCES asignatura(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

