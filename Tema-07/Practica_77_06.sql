-- Practica_77_06


USE empresa;
-- 1 
UPDATE empleados
SET apellidos = CONCAT(apellidos, ' Pérez');

-- 2
SELECT 
    id,
    nss,
    CONCAT(apellidos, ', ', nombre) AS nombre
FROM empleados;

-- 3

SELECT 
    id,
    nss,
    nombre,
    SUBSTRING_INDEX(apellidos, ' ', 1) AS apellido1,
    SUBSTRING_INDEX(apellidos, ' ', -1) AS apellido2
FROM empleados;

-- 4

SELECT 
    id,
    nombre,
    apellidos,
    nss,
    SUBSTRING_INDEX(direccion, ',', -1) AS estado,
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ',', -2), ',', 1) AS provincia,
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ',', -3), ',', 1) AS ciudad,
    SUBSTRING_INDEX(direccion, ',', 1) AS codigo_postal
FROM empleados;


-- 5

SELECT 
    id,
    apellidos,
    nombre,
    nss,
    CONCAT(
        RIGHT(nss, 3),
        UPPER(LEFT(nombre, 2)),
        UPPER(LEFT(SUBSTRING_INDEX(apellidos, ' ', 1), 2)),
        UPPER(LEFT(SUBSTRING_INDEX(apellidos, ' ', -1), 2))
    ) AS codigo_generado
FROM empleados;


