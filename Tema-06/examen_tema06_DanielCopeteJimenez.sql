-- Base de datos
-- Daniel  Copete
-- Examen  Práctico Tema 6


-- 1 Insertar libro Insertar un nuevo libro en la base de datos con los siguientes datos:
INSERT INTO libros 
(id, isbn, ean, titulo, autor_id, editorial_id, 
 precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion)
VALUES
(30, '9788408096528', '9788888199587', 'El Retrato de Dorian Gray',
 1, 1, 18.00, 24.00, 12, 5, 25, '2015-03-15');


-- 2.Insertar libros_tema Insertar los registros necesarios en la tabla libros_temas para asociar el libro insertado anteriormente con las temáticas de Novela y Ciencia.
INSERT INTO libros_temas (libro_id, tema_id)
VALUES
(30, 1),   -- Novela
(30, 2);   -- Ciencia

-- 3. Insertar registros en la tabla venta y en sus correspondiente registros

INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total)
VALUES (11, 1, '2014-05-10', 0, 0, 0);

INSERT INTO lineasventas
(id, venta_id, numero_linea, libro_id, iva, cantidad, precio, importe)
VALUES
(11, 11, 1, 30, 0.18, 1, 24.00, 24.00), -- Venta 11
(12, 11, 2, 1,  0.18, 1, 38.32, 38.32); -- Venta 12

UPDATE ventas
SET importe_bruto = 62.32,
    importe_iva = 11.22,
    importe_total = 73.54
WHERE id = 11;


-- 4. Insertar lineas ventas Crear 2 líneas de venta con al menos 2 libros diferentes y que se pueda emparejar con la venta anterior
INSERT INTO lineasventas
(id, venta_id, numero_linea, libro_id, iva, cantidad, precio, importe)
VALUES
(13, 11, 1, 30, 0.18, 1, 24.00, 24.00),
(14, 11, 2, 1,  0.18, 1, 38.32, 38.32);


-- 5.Update - Libros Actualizar el precio de venta de todos los libros de la editorial Planeta incrementándolo en un 15%.
UPDATE libros
SET precio_venta = precio_venta * 1.15
WHERE editorial_id = 4;

-- 6.Update - Libros Reducir el stock de todos los libros cuyo stock actual sea superior a 15 unidades en un 20%.
UPDATE Libros
SET stock = stock * 0.80
WHERE stock > 15;




-- 7  Delete - Libros Eliminar de la base de datos todos los libros de temática Viajes.

DELETE FROM libros
WHERE id IN (
    SELECT libro_id
    FROM libros_temas
    WHERE tema_id = (
        SELECT id 
        FROM temas 
        WHERE tema = 'Viajes'
    )
);


-- 8 Script - clientes Mostrar aquellos clientes cuya dirección de email pertenezca al dominio "gmail.com" y que estén ubicados en la provincia de Guadalajara.
SELECT 
    id, nombre, direccion, c_postal, nif, telefono, email
FROM
    clientes
WHERE
    poblacion = 'Guadalajara'
        AND email LIKE '%gmail.com%'
ORDER BY nombre;



-- 9. Script - ventas Mostrar las 5 ventas con menor importe total realizadas en el año 2013.
SELECT v.id,
       c.nombre,
       v.fecha,
       v.importe_bruto,
       v.importe_iva,
       v.importe_total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
WHERE YEAR(v.fecha) = 2013
ORDER BY v.importe_total ASC
LIMIT 5;



-- 10 Script - libros Mostrar los libros publicados en el año 2014 cuyo stock sea inferior a 20 unidades.

SELECT l.id,
       l.titulo,
       a.nombre,-- Autor 
       e.nombre,-- Editorial
       l.stock,
       l.precio_coste,
       l.precio_venta
FROM libros l
JOIN autores a     ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE YEAR(l.fecha_edicion) = 2014
  AND l.stock < 20
ORDER BY l.titulo;


-- 11 Script - libros
SELECT l.id,
       l.titulo,
       a.nombre,
       e.nombre,
       t.tema,
       l.precio_coste,
       l.precio_venta
FROM libros l
INNER JOIN autores a        ON l.autor_id = a.id
INNER JOIN editoriales e    ON l.editorial_id = e.id
INNER JOIN libros_temas lt  ON l.id = lt.libro_id
INNER JOIN temas t          ON lt.tema_id = t.id
WHERE t.tema = 'Novela'
  AND l.precio_venta > 20
ORDER BY l.titulo;


-- 12 Script - libro
SELECT l.id,
       l.titulo,
       a.nombre,
       e.nombre,
       l.precio_venta
FROM libros l
INNER JOIN autores a     ON l.autor_id = a.id
INNER JOIN editoriales e ON l.editorial_id = e.id
WHERE l.precio_venta > (
        SELECT AVG(precio_venta)
        FROM libros
      )
ORDER BY l.precio_venta DESC;



-- 13. Script - ventas  Mostrar el número de ventas realizadas y el importe total facturado por cada cliente.







































