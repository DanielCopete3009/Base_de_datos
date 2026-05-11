-- Actividad 6.13
-- Tema 6. Lenguaje SQL - DML
-- Base de datos: geslibros

USE geslibros;

-- 1. Clientes de Ubrique con email del servidor ieslosremedios.org
SELECT id, nombre, direccion, nif, telefono, email
FROM clientes
WHERE poblacion = 'Ubrique'
  AND email LIKE '%ieslosremedios.org%'
ORDER BY nombre;

-- 2. Las 3 mejores ventas del año 2014
SELECT v.id,
       c.nombre AS cliente,
       v.fecha,
       v.importe_bruto,
       v.importe_iva,
       v.importe_total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
WHERE YEAR(v.fecha) = 2014
ORDER BY v.importe_total DESC
LIMIT 3;

-- 3. Libros de 2011 con stock entre 10 y 20
SELECT l.id,
       l.titulo,
       a.nombre AS autor,
       e.nombre AS editorial,
       l.stock,
       l.precio_coste,
       l.precio_venta
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE YEAR(l.fecha_edicion) = 2011
  AND l.stock BETWEEN 10 AND 20
ORDER BY l.id;

-- 4. Libros sobre PHP o Bases de Datos con precio < 30€
SELECT l.id,
       l.titulo,
       a.nombre AS autor,
       e.nombre AS editorial,
       l.stock,
       l.precio_coste,
       l.precio_venta
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE (l.titulo LIKE '%PHP%' OR l.titulo LIKE '%Base de Datos%')
  AND l.precio_venta < 30
ORDER BY l.id;

-- 5. Libros con margen de beneficio (Anaya y Alfaguara)
SELECT l.id,
       l.titulo,
       a.nombre AS autor,
       e.nombre AS editorial,
       l.stock,
       l.precio_coste,
       l.precio_venta,
       (l.precio_venta - l.precio_coste) AS margen_beneficio
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE e.nombre IN ('Anaya', 'Alfaguara')
ORDER BY margen_beneficio DESC;

-- 6. Libros con mismo precio_coste que 'Camboya'
SELECT l.id,
       l.titulo,
       a.nombre AS autor,
       e.nombre AS editorial,
       l.stock,
       l.precio_coste,
       l.precio_venta
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE l.precio_coste = (
    SELECT precio_coste
    FROM libros
    WHERE titulo = 'Camboya'
)
ORDER BY l.id;

-- 7. Volumen de ventas por cliente en 2014
SELECT c.id AS cliente_id,
       c.nombre,
       COUNT(v.id) AS num_ventas,
       MAX(v.importe_total) AS venta_max,
       MIN(v.importe_total) AS venta_min,
       SUM(v.importe_total) AS total_ventas
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
WHERE YEAR(v.fecha) = 2014
GROUP BY c.id, c.nombre
ORDER BY total_ventas DESC;

-- 8. Volumen total de ventas por editorial
SELECT e.id AS editorial_id,
       e.nombre AS editorial,
       COUNT(lv.libro_id) AS libros_vendidos,
       SUM(lv.importe) AS importe_total
FROM lineasventas lv
JOIN libros l ON lv.libro_id = l.id
JOIN editoriales e ON l.editorial_id = e.id
GROUP BY e.id, e.nombre
ORDER BY importe_total DESC;

-- 8.2 Editoriales con ventas > 1000
SELECT e.id AS editorial_id,
       e.nombre AS editorial,
       COUNT(lv.libro_id) AS libros_vendidos,
       SUM(lv.importe) AS importe_total
FROM lineasventas lv
JOIN libros l ON lv.libro_id = l.id
JOIN editoriales e ON l.editorial_id = e.id
GROUP BY e.id, e.nombre
HAVING SUM(lv.importe) > 1000
ORDER BY importe_total DESC;

-- 9. Crear vista ventas_editoriales
CREATE OR REPLACE VIEW ventas_editoriales AS
SELECT e.id AS editorial_id,
       e.nombre AS editorial,
       COUNT(lv.libro_id) AS libros_vendidos,
       SUM(lv.importe) AS importe_total
FROM lineasventas lv
JOIN libros l ON lv.libro_id = l.id
JOIN editoriales e ON l.editorial_id = e.id
GROUP BY e.id, e.nombre;

-- Consultar editoriales con más de 50 libros vendidos
SELECT *
FROM ventas_editoriales
WHERE libros_vendidos > 50;

-- 10. Insertar libro
INSERT INTO libros (id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, paginas, edicion, fecha_edicion)
VALUES (NULL, '9788448180833', '9788888199586', 'El toro que viene', 1, 5, 12.00, 29.00, 12, 200, 1, '2010-11-01');

-- 11. Insertar libros_temas
INSERT INTO libros_temas (libro_id, tema_id) VALUES
(20, 3),
(20, 9),
(20, 7);

-- 12. Insertar venta
INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total)
VALUES (NULL, 3, '2019-11-25', 200, 42, 242);

-- Insertar líneas de venta
INSERT INTO lineasventas (id, libro_id, venta_id, precio, iva, cantidad, descuento, importe)
VALUES
(NULL, 11, 1, 10, 0.21, 2, 0, 20),
(NULL, 11, 1, 8, 0.21, 4, 0, 32),
(NULL, 11, 1, 5, 0.21, 5, 0, 25);

-- 13. Subir precio libros Anaya un 10%
UPDATE libros
SET precio_venta = precio_venta * 1.10
WHERE editorial_id = (
    SELECT id FROM editoriales WHERE nombre = 'Anaya'
);

-- 14. Reducir precio libros no vendidos en 2014 un 30%
UPDATE libros
SET precio_venta = precio_venta * 0.70
WHERE id NOT IN (
    SELECT lv.libro_id
    FROM lineasventas lv
    JOIN ventas v ON lv.venta_id = v.id
    WHERE YEAR(v.fecha) = 2014
);

-- 15. Eliminar libros de temática belleza
DELETE FROM libros
WHERE id IN (
    SELECT libro_id
    FROM libros_temas
    WHERE tema_id = 5
);