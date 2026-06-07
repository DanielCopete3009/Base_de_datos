-- Actividad 5.3
-- Tema 5: Lenguaje SQL - DDL
-- Descripción: tipos de dato numéricos

-- Borrar y crear la base de datos si existe / no existe
DROP DATABASE IF EXISTS tipo_datos;
CREATE DATABASE IF NOT EXISTS tipo_datos;

-- Poner base de datos activa tipo_datos
USE tipo_datos;

-- Borrar y crear la tabla tipo_datos_num
DROP TABLE IF EXISTS tipo_datos_num;
CREATE TABLE IF NOT EXISTS tipo_datos_num(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,     -- identificador
    num_camiseta TINYINT UNSIGNED,                  -- valores pequeños 0-255
    goles_a_favor SMALLINT UNSIGNED,                -- número de goles a favor
    goles_en_contra SMALLINT UNSIGNED,              -- número de goles en contra
    num_habitantes INT UNSIGNED,                    -- población
    humedad_relativa FLOAT(3 , 2) UNSIGNED,         -- porcentaje de humedad 0.00-9.99
    precipitaciones SMALLINT UNSIGNED,              -- mm de precipitación
    temperatura_max FLOAT(5 ,2),                    -- temperatura máxima
    temperatura_min FLOAT(5 ,2),                    -- temperatura mínima
    velocidad_viento FLOAT(5,2),                    -- velocidad del viento
    altura INT UNSIGNED,                            -- altura en metros
    precio DECIMAL(10,2),                           -- precio con decimales
    sueldo DECIMAL(10,2),                           -- sueldo con decimales
    seno FLOAT(10,6),                               -- valor del seno
    coseno FLOAT(10,6),                             -- valor del coseno
    tangente FLOAT(10,6)                            -- valor de la tangente
) CHARACTER SET = 'UTF8MB4' COLLATE = 'UTF8MB4_GENERAL_CI';


-- Añadir tres registros válidos a la tabla anterior
INSERT INTO tipo_datos_num VALUES
    (NULL, 10, 5, 2, 450000, 0.85, 300, 35.50, 20.10, 15.20, 500, 120.50, 1500.75, 0.567801, 0.825421, 0.123456),
    (NULL, 7, 12, 3, 120000, 0.60, 150, 40.00, 25.30, 10.50, 300, 50.00, 2000.00, 0.321456, 0.654789, 0.987654),
    (NULL, 23, 8, 1, 78000, 0.72, 50, 28.35, 12.22, 8.90, 120, 15.99, 900.00, 0.111222, 0.222333, 0.333444);

    
    
    
