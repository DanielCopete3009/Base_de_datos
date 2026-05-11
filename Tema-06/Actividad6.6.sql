-- Actividad 6.6
-- Base de datos

-- 1. ORDER BY, LIMIT, ALL, DISTINCT

-- 1.1 Obtener los 3 empleados con mayor salario
SELECT * FROM empleados ORDER BY salario DESC LIMIT 3;

-- 1.2 Obtener los 5 empleados con menor salario
SELECT * FROM empleadoS ORDER BY salario ASC LIMIT 5;

-- 1.3 Obtener los empleados ordenados alfabéticamente
SELECT * FROM empleados ORDER BY nombre ASC;

-- 1.4 Obtener los 3 primeros departamentos
SELECT * FROM departamentos ORDER BY id ASC LIMIT 3;

-- 1.5 Obtener los 3 empleados con mayores salarios del departamento 3
SELECT *  FROM empleados WHERE departamento_id = 3 ORDER BY salario DESC LIMIT 3;


-- 2. Función COUNT()

-- 2.1 Obtener el número total de departamentos
SELECT COUNT(*) AS total_departamentos FROM departamentos;

-- 2.2 Obtener el número total de beneficiarios     de sexo ‘M’ mujer
SELECT COUNT(*)











