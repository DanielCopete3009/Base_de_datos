-- Actividad: Base de datos RestriccionesDefault
-- Daniel Copete

-- Crear la base de datos con cotejamiento UTF8
CREATE DATABASE IF NOT EXISTS RestriccionesDefault
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE RestriccionesDefault;

-- Borrar la tabla si existe
DROP TABLE IF EXISTS resdefault;

-- Crear la tabla ResDEFAULT con valores por defecto
CREATE TABLE resdefault (
    id INT AUTO_INCREMENT PRIMARY KEY,                       -- Clave primaria
    poblacion VARCHAR(50) NOT NULL DEFAULT 'Ubrique',       -- Valor por defecto
    provincia VARCHAR(50) NOT NULL DEFAULT 'Cádiz',         -- Valor por defecto
    nacionalidad VARCHAR(50) NOT NULL DEFAULT 'España',     -- Valor por defecto
    precio DECIMAL(6,2) NOT NULL DEFAULT 10.20,            -- Valor por defecto 10,20 €
    sueldo DECIMAL(8,2) NOT NULL DEFAULT 1500.00,          -- Valor por defecto 1.500 €
    fecha_hora_llegada DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Fecha y hora actual
    fecha_llegada DATE DEFAULT CURRENT_DATE,                -- Fecha actual
    hora_llegada TIME DEFAULT CURRENT_TIME,                 -- Hora actual
    casado BOOLEAN NOT NULL DEFAULT 1,                      -- Valor por defecto TRUE
    carnet_conducir BOOLEAN NOT NULL DEFAULT 1              -- Valor por defecto TRUE
);

-- Insertar 3 registros de ejemplo
-- Si no se especifica algún valor, se usará el DEFAULT
INSERT INTO resdefault (poblacion, provincia, nacionalidad, precio, sueldo, casado, carnet_conducir)
VALUES
(NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Sevilla', 'Sevilla', 'España', 20.50, 1800.00, 0, 1),
('Málaga', 'Málaga', 'España', 15.75, 1600.00, 1, 0);

-- Comprobar que los datos se han insertado correctamente
SELECT * FROM resdefault;
