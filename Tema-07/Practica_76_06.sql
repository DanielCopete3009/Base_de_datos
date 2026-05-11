-- Actividad_76_06

-- 1
DROP DATABASE IF EXISTS fmatematicas;
CREATE DATABASE IF NOT EXISTS fmatematicas;
USE fmatematicas;
-- 2

DROP TABLE IF EXISTS angulos;
CREATE TABLE  angulos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
grados  SMALLINT UNSIGNED, -- [0,360]
radianes DOUBLE(31,30),
seno DOUBLE(31,30), -- [-1,1]
coseno DOUBLE(31,30), -- [-1,1]
tangente DOUBLE -- cualquiera valor
);


-- 3
INSERT INTO angulos (grados) values
(0),(30),(60),(180),(270);

INSERT INTO angulos (grados) values
(45),(90),(120),(160),(200);


-- 4

UPDATE angulos SET radianes = radians(grados);

-- 5

UPDATE angulos SET 
	seno = sin(radianes),
    coseno = cos(radianes),
    tangente = tan(radianes);
    
    
    
    
-- 6 Obtener un valor ente 1 y 10

SELECT CEILING(RAND() * 10);

-- 7 Obtener un valor ente 0 y 9
SELECT FLOOR(RAND() * 10);

-- 8  Obtener un valor ente 0 y 4
SELECT FLOOR(RAND() * 5);

-- 9  Obtener un valor ente 0 y 100000

SELECT FLOOR(RAND() * 100001);