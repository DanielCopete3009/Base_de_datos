-- Actividad: Base de datos restricciones_check
-- Daniel Copete

-- Crear la base de datos con cotejamiento UTF8
CREATE DATABASE IF NOT EXISTS restricciones_check
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE restricciones_check;

-- Tabla comparacion
DROP TABLE IF EXISTS comparacion;
CREATE TABLE comparacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    importe DECIMAL(10,2) CHECK (importe > 400),             -- Importe superior a 400 €
    saldo DECIMAL(10,2) CHECK (saldo < 0),                 -- Saldo inferior a 0 €
    nombre VARCHAR(50) DEFAULT NULL,                        -- Valor NULO
    apellidos VARCHAR(100) DEFAULT NULL,                    -- Valor NULO
    n_beneficiarios INT CHECK (n_beneficiarios >= 5),      -- Beneficiarios >= 5
    n_asignaturas INT CHECK (n_asignaturas <= 5),          -- Asignaturas <= 5
    beca BOOLEAN,                                           -- Beca concedida
    importe_beca DECIMAL(10,2) CHECK (importe_beca < 2500),-- Importe beca < 2.500 €
    n_goles INT CHECK (n_goles > 20),                      -- Goles > 20
    anno_nacimiento YEAR CHECK (anno_nacimiento >= 1970),  -- Año >= 1970
    fec_nacimiento DATE CHECK (fec_nacimiento < '2000-02-21'), -- Fecha nacimiento < 21/02/2000
    hora_llegada TIME CHECK (hora_llegada >= '12:00:00')   -- Hora llegada >= 12:00
);

-- Tabla comparacionBetween
DROP TABLE IF EXISTS comparacionBetween;
CREATE TABLE comparacionBetween (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n_goles INT CHECK (n_goles BETWEEN 20 AND 30),
    sueldo DECIMAL(10,2) CHECK (sueldo BETWEEN 2000 AND 3000),
    importe DECIMAL(10,2) CHECK (importe BETWEEN 400 AND 600),
    cantidad INT CHECK (cantidad BETWEEN 5 AND 20),
    valor INT CHECK (valor NOT BETWEEN 4 AND 7),
    tipodescuento DECIMAL(5,2) CHECK (tipodescuento BETWEEN 5.25 AND 20.50),
    precio DECIMAL(10,2) CHECK (precio BETWEEN 20 AND 30)
);

-- Tabla chekin
DROP TABLE IF EXISTS chekin;
CREATE TABLE chekin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    provincia VARCHAR(50) CHECK (provincia IN ('Cádiz','Málaga','Sevilla')),
    poblacion VARCHAR(50) CHECK (poblacion IN ('Ubrique','Villamartín','Prado del Rey','Olvera')),
    cicloEstudio VARCHAR(20) CHECK (cicloEstudio IN ('ESO','BACH','MEDIO','SUPERIOR','ADULTOS')),
    valores INT CHECK (valores IN (1,2,5,8,9)),
    nacionalidad VARCHAR(50) CHECK (nacionalidad IN ('España','Brasil','Portugal','Argentina','Italia')),
    codEmpleado CHAR(5) CHECK (SUBSTRING(codEmpleado,2,2) = 'AB'),  -- 2º y 3º dígito AB
    nrp VARCHAR(20) CHECK (RIGHT(nrp,1) = 'Z'),                     -- Termina en Z
    dni CHAR(10) CHECK (LEFT(dni,2) = '25')                         -- Los dos primeros dígitos 25
);
