-- Actividad: Crear tabla pacientes
-- Daniel Copete
-- Base de datos: test

-- Usar la base de datos de test
USE test;

-- Borrar la tabla si ya existe
DROP TABLE IF EXISTS pacientes;

-- Crear la tabla pacientes
CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Clave primaria
    nombre VARCHAR(50) NOT NULL,            -- Obligatorio
    apellidos VARCHAR(100) NOT NULL,        -- Obligatorio
    nss VARCHAR(20) NOT NULL,               -- Número de seguridad social, obligatorio
    email VARCHAR(100),                      -- Opcional (*)
    telefono VARCHAR(20),                    -- Opcional (*)
    poblacion VARCHAR(50) NOT NULL,         -- Obligatorio
    expediente VARCHAR(50) NOT NULL,        -- Obligatorio
    dni VARCHAR(10) NOT NULL,               -- Obligatorio
    historial_clinico TEXT NOT NULL,        -- Obligatorio
    fecha_nac DATE NOT NULL,                -- Obligatorio
    edad INT NOT NULL                        -- Obligatorio
);

-- Insertar 3 registros de ejemplo
INSERT INTO pacientes
(nombre, apellidos, nss, email, telefono, poblacion, expediente, dni, historial_clinico, fecha_nac, edad)
VALUES
('Luis', 'García Pérez', '12345678901', 'luis@email.com', '+34 600123456', 'Madrid', 'EXP001', '12345678A', 'Paciente con alergias.', '2005-04-12', 20),
('María', 'López Díaz', '23456789012', NULL, NULL, 'Barcelona', 'EXP002', '23456789B', 'Paciente con cirugía menor.', '2003-10-05', 22),
('Carlos', 'Sánchez Martín', '34567890123', 'carlos@email.com', '+34 622345678', 'Sevilla', 'EXP003', '34567890C', 'Paciente con hipertensión.', '2000-01-20', 25);

-- Comprobar los datos
SELECT * FROM pacientes;

