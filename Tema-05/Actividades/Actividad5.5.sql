-- Actividad 5.5
-- Daniel Copete
-- Base de datos: actividad55

CREATE DATABASE IF NOT EXISTS actividad55;
USE actividad55;

-- Borrar la tabla si existe
DROP TABLE IF EXISTS tipo_datos_fechas;

-- Crear la tabla
CREATE TABLE tipo_datos_fechas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_nacimiento DATE,
    fecha_hora_nacimiento DATETIME,
    hora_llegada TIME,
    hora_salida TIME,
    anno_nacimiento YEAR,
    anno_fundacion YEAR,
    fecha_hora_salida DATETIME(3),
    fecha_hora_llegada DATETIME(3),
    fecha_hora_actual DATETIME(1),
    edad INT,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertar 3 registros
INSERT INTO tipo_datos_fechas
(fecha_nacimiento, fecha_hora_nacimiento, hora_llegada, hora_salida,
 anno_nacimiento, anno_fundacion, fecha_hora_salida, fecha_hora_llegada, fecha_hora_actual, edad)
VALUES
('2005-04-12', '2005-04-12 08:35:20', '08:00:00', '14:30:00', 2005, 1998, '2026-01-11 14:30:45.123', '2026-01-11 08:00:10.456', '2026-01-11 17:40:5.7', 20),
('2003-10-05', '2003-10-05 22:15:00', '07:45:00', '15:00:00', 2003, 2001, '2026-01-11 15:00:12.789', '2026-01-11 07:45:30.321', '2026-01-11 17:41:2.3', 22),
('2000-01-20', '2000-01-20 10:05:30', '09:00:00', '17:00:00', 2000, 1985, '2026-01-11 17:00:59.999', '2026-01-11 09:00:00.111', '2026-01-11 17:42:8.4', 25);

-- Comprobar datos
SELECT * FROM tipo_datos_fechas;
