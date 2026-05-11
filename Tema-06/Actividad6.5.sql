-- Actividad 6.5
-- Consultas Básicas de selección

USE futbol;

-- 1 consultas básicas
-- Listado de todos los equipos
SELECT *  FROM equipos;

SELECT * FROM equipos;
SELECT * FROM partidos;
SELECT * FROM partidos ORDER BY fecha DESC limit 3;

-- Cosultas con LIMIT
 select * from goles order by minuto limit 5;
 
 select * FROM goles order by id limit 5 offset 4;
 
 SELECT * FROM  partidos order by fecha DESC limit 3;
 
 SELECT id FROM  equipos WHERE nombre LIKE '%Betis%';
 
 -- betis id = 5
 SELECT * FROM  partidos WHERE  equipo_fuera_is = 5;
 
 -- 3. Consultas lista de columnas
 
 SELECT * FROM jugadores;
 

 
 