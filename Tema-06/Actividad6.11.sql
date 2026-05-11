-- Actividad 6.11
-- GROUP BY - HAVING

-- Base de datos empresa

USE empresa;

-- 1 Número de empleados en cada departamento
-- columnas : id, departamento, num_empleados


SELECT 
    d.id,
    d.nombre AS departamento,
    COUNT(e.id) AS num_empleados
FROM departamentos d
LEFT JOIN empleados e 
    ON e.departamento_id = d.id
GROUP BY d.id, d.nombre;


-- 2 Número de empleados en cada departamento cuyo sueldo
-- esté por encima de los 30000 anuales
-- columnas : id, departamento, num_empleados

SELECT 
    d.id,
    d.nombre AS departamento,
    COUNT(e.id) AS num_empleados
FROM departamentos d
LEFT JOIN empleados e 
    ON e.departamento_id = d.id
WHERE e.salario > 30000
GROUP BY d.id, d.nombre;


-- 3 Número total de empleados en cada departamento cuyo
-- salario esté entre 20000 y 50000
-- columnas : id, departamento, num_empleados

SELECT 
    d.id,
    d.nombre AS departamento,
    COUNT(e.id) AS num_empleados
FROM departamentos d
LEFT JOIN empleados e 
    ON e.departamento_id = d.id
WHERE e.salario BETWEEN 20000 AND 50000
GROUP BY d.id, d.nombre;


-- 4 Número de empleados que nacieron en cada año
-- columnas : Año, Nempleados

SELECT 
    YEAR(fecha_nacimiento) AS Año,
    COUNT(*) AS Nempleados
FROM empleados
GROUP BY YEAR(fecha_nacimiento);


-- 5 Suma total de horas trabajadas en cada proyecto
-- tabla empleados_proyectos
-- columnas : id, proyecto, HorasAcumuladas

SELECT 
    p.id,
    p.nombre AS proyecto,
    SUM(ep.horas) AS HorasAcumuladas
FROM empleados_proyectos ep
JOIN proyectos p 
    ON ep.proyecto_id = p.id
GROUP BY p.id, p.nombre;


-- 6 Número de empleados que tiene a su cargo cada supervisor
-- columnas : id, apellidos, nombre, numDependientes

SELECT 
    s.id,
    s.apellidos,
    s.nombre,
    COUNT(e.id) AS numDependientes
FROM empleados e
JOIN empleados s 
    ON e.supervisor_id = s.id
GROUP BY s.id, s.apellidos, s.nombre;


-- 7 Información estadística de cada departamento
-- a. Número de Departamento
-- b. Nombre del Departamento
-- c. Jefe del Departamento
-- d. Numero de Empleados
-- e. Salario Medio
-- f. Salario Máximo
-- g. Salario Mínimo
-- h. Suma Salarios

SELECT 
    d.id AS NumeroDepartamento,
    d.nombre AS NombreDepartamento,
    d.jefe_id AS JefeDepartamento,
    COUNT(e.id) AS NumeroEmpleados,
    AVG(e.salario) AS SalarioMedio,
    MAX(e.salario) AS SalarioMaximo,
    MIN(e.salario) AS SalarioMinimo,
    SUM(e.salario) AS SumaSalarios
FROM departamentos d
LEFT JOIN empleados e 
    ON e.departamento_id = d.id
GROUP BY d.id, d.nombre, d.jefe_id;


-- 8 Número total de beneficiarios por empleado
-- columnas :
-- a. id
-- b. NSS
-- c. Nombre
-- d. Número total de beneficiarios

SELECT 
    e.id,
    e.nss,
    e.nombre,
    COUNT(dep.id) AS TotalBeneficiarios
FROM empleados e
LEFT JOIN dependientes dep 
    ON dep.empleado_id = e.id
GROUP BY e.id, e.nss, e.nombre;


-- 9 Número de beneficiarios de cada departamento
-- intervienen las tablas empleados, departamentos y dependientes
-- columnas :
-- a. id departamento
-- b. nombre departamento
-- c. número de beneficiarios

SELECT 
    d.id,
    d.nombre AS departamento,
    COUNT(dep.id) AS NumBeneficiarios
FROM departamentos d
JOIN empleados e 
    ON e.departamento_id = d.id
JOIN dependientes dep 
    ON dep.empleado_id = e.id
GROUP BY d.id, d.nombre;


-- 10 Número de horas acumuladas en cada proyecto
-- columnas :
-- a. id proyecto
-- b. nombre proyecto
-- c. nombre departamento
-- d. suma de horas

SELECT 
    p.id,
    p.nombre AS proyecto,
    d.nombre AS departamento,
    SUM(ep.horas) AS HorasAcumuladas
FROM empleados_proyectos ep
JOIN proyectos p 
    ON ep.proyecto_id = p.id
JOIN departamentos d 
    ON p.departamento_id = d.id
GROUP BY p.id, p.nombre, d.nombre;


-- 11 Número de horas acumuladas por cada trabajador
-- columnas :
-- a. empleado_id
-- b. horas acumuladas

SELECT 
    empleado_id,
    SUM(horas) AS HorasAcumuladas
FROM empleados_proyectos
GROUP BY empleado_id;


-- 12 Número de horas acumuladas por cada trabajador en
-- cada proyecto
-- columnas :
-- a. empleado_id
-- b. proyecto_id
-- c. horas acumuladas

SELECT 
    empleado_id,
    proyecto_id,
    SUM(horas) AS HorasAcumuladas
FROM empleados_proyectos
GROUP BY empleado_id, proyecto_id;