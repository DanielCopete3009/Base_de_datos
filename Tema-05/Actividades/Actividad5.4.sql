-- Actividad 5.4 
-- Daniel Copete
-- Base de datos

-- Seleccionar la base de datos

USE actividad54;


-- 1. Borrar la tabla si existe
DROP TABLE IF EXISTS tipos_datos_string;

-- 2. Crear la tabla
CREATE TABLE tipos_datos_string (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    apellidos VARCHAR(100),
    nombre VARCHAR(50),
    nombre_acronimo VARCHAR(10),
    historial TEXT,
    direccion VARCHAR(200),
    provincia VARCHAR(50),
    observaciones TEXT,
    contenido_libro LONGTEXT,
    categoria ENUM('Primera','Segunda','Tercera','Regional'),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Insertar 3 registros
INSERT INTO tipos_datos_string
(codigo_postal, telefono, apellidos, nombre, nombre_acronimo, historial, direccion, provincia, observaciones, contenido_libro, categoria)
VALUES
('28001', '+34 600123456', 'García Pérez', 'Luis', 'LP', 'Paciente con historial de alergias.', 'Calle Mayor 10, Madrid', 'Madrid', 'Alumno aplicado, buen rendimiento.', 'Contenido completo del libro A...', 'Primera'),
('08002', '+34 611234567', 'López Díaz', 'María', 'MD', 'Paciente con historial de cirugía menor.', 'Avenida Diagonal 100, Barcelona', 'Barcelona', 'Alumno con dificultades en matemáticas.', 'Contenido completo del libro B...', 'Segunda'),
('41003', '+34 622345678', 'Sánchez Martín', 'Carlos', 'CM', 'Paciente con historial de hipertensión.', 'Calle Real 5, Sevilla', 'Sevilla', 'Alumno destacado en ciencias.', 'Contenido completo del libro C...', 'Regional');

-- 4. Comprobar
SELECT * FROM tipos_datos_string;





















  