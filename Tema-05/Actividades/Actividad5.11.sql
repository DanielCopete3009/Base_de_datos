-- Actividad: Base de datos restricciones_check
-- Daniel Copete

-- Crear la base de datos con cotejamiento UTF8
CREATE DATABASE IF NOT EXISTS restricciones_check
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE restricciones_check;

-- Borrar la tabla operadorLike si ya existe
DROP TABLE IF EXISTS operadorLike;

-- Crear la tabla operadorLike
CREATE TABLE operadorLike (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Clave primaria
    descripcion VARCHAR(100) NOT NULL,          -- Obligatorio
    nombre VARCHAR(50) NOT NULL,               -- Obligatorio
    email VARCHAR(100) NOT NULL,               -- Obligatorio
    password VARCHAR(50) NOT NULL,             -- Obligatorio
    cpostal CHAR(5) NOT NULL,                  -- Obligatorio
    codigo CHAR(7) NOT NULL,                   -- Obligatorio
    
    -- Restricciones de validación
    CONSTRAINT chk_descripcion CHECK (descripcion LIKE 'a%'),         -- Empieza por 'a'
    CONSTRAINT chk_nombre CHECK (nombre LIKE 'ju%'),                 -- Empieza por 'ju'
    CONSTRAINT chk_email CHECK (email LIKE '%@%'),                   -- Contiene '@'
    CONSTRAINT chk_password CHECK (LENGTH(password) >= 7 AND SUBSTRING(password,3,1) = 'M'),  -- >=7 caracteres y 3º = 'M'
    CONSTRAINT chk_cpostal CHECK (cpostal LIKE '11___'),             -- 5 caracteres, empieza '11'
    CONSTRAINT chk_codigo CHECK (codigo LIKE 'ES____9')              -- 7 caracteres, empieza 'ES', termina '9'
);

-- Insertar 3 registros de ejemplo válidos
INSERT INTO operadorLike (descripcion, nombre, email, password, cpostal, codigo)
VALUES
('administracion', 'juanito', 'juan@email.com', 'aMpassword', '11001', 'ESABCDE9'),
('asistente', 'julia', 'julia@mail.com', '1Mabcdef', '11234', 'ES123459'),
('apoyo', 'justo', 'justo@mail.es', 'xxMpassw', '11999', 'ESXYZ09');

-- Comprobar los datos
SELECT * FROM operadorLike;
