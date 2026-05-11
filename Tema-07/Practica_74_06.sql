START TRANSACTION;
USE geslibros;

-- 1. Libros de tema 'Novela' → descuento del 10%
UPDATE libros 
SET precio_venta = precio_venta * 0.9
WHERE id IN (
    SELECT libro_id 
    FROM libros_temas 
    WHERE tema_id = (
        SELECT id 
        FROM temas 
        WHERE tema = 'Novela'
    )
);

-- Libros de editorial 'Anaya' → aumento del 6%
UPDATE libros 
SET precio_venta = precio_venta * 1.06
WHERE editorial_id = (
    SELECT id 
    FROM editoriales 
    WHERE nombre LIKE '%ANAYA%'
);

-- Resto de editoriales → reducción del 4.5%
UPDATE libros 
SET precio_venta = precio_venta * 0.955
WHERE editorial_id <> (
    SELECT id 
    FROM editoriales 
    WHERE nombre LIKE '%ANAYA%'
);

-- 2. Deshacer todo
ROLLBACK;

-- Comprobar
SELECT * FROM libros;


-- 3. Nueva transacción
START TRANSACTION;

-- Insertar libros
INSERT INTO libros (id, titulo, autor, editorial_id, precio_venta)
VALUES 
(201, 'Libro A', 'Autor A', (SELECT id FROM editoriales WHERE nombre LIKE '%ANAYA%'), 18.00),
(202, 'Libro B', 'Autor B', (SELECT id FROM editoriales WHERE nombre LIKE '%PLANETA%'), 22.00);

-- Insertar venta
INSERT INTO ventas (id, fecha, cliente_id)
VALUES (10, CURRENT_DATE, 1);

-- Insertar detalles
INSERT INTO detalle_ventas (id, venta_id, libro_id, cantidad, precio)
VALUES
(1, 10, 201, 2, 18.00),
(2, 10, 202, 1, 22.00),
(3, 10, 201, 1, 18.00);

-- 4. Confirmar
COMMIT;


-- 5. Transacción con SAVEPOINT
START TRANSACTION;

-- Insertar libros
INSERT INTO libros (id, titulo, autor, editorial_id, precio_venta)
VALUES 
(301, 'Libro C', 'Autor C', (SELECT id FROM editoriales WHERE nombre LIKE '%ANAYA%'), 20.00),
(302, 'Libro D', 'Autor D', (SELECT id FROM editoriales WHERE nombre LIKE '%PLANETA%'), 30.00);

-- Insertar clientes
INSERT INTO clientes (id, nombre)
VALUES 
(1, 'Cliente A'),
(2, 'Cliente B');

-- SAVEPOINT A
SAVEPOINT a;

-- Subir precios 10%
UPDATE libros 
SET precio_venta = precio_venta * 1.10;

-- SAVEPOINT B
SAVEPOINT b;

-- Eliminar libros no vendidos
DELETE FROM libros
WHERE id NOT IN (
    SELECT libro_id 
    FROM detalle_ventas
);

-- Volver a SAVEPOINT A
ROLLBACK TO a;

-- Comprobar
SELECT * FROM libros;

COMMIT;