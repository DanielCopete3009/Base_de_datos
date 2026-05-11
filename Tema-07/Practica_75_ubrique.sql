-- practica_75_ubrique01_solucion
-- conexion ubrique_01

-- 2
USE geslibros;

-- 3 
LOCK TABLE  clientes READ;
SELECT * FROM libros; -- El SELECT no se ejecuta porque, tras aplicar LOCK TABLES, solo se pueden consultar las tablas bloqueadas, y libros no está incluida.

-- 5
UNLOCK TABLES;

-- 7
SELECT * FROM libros; -- El SELECT sobre libros no se permite porque el usuario no tiene privilegios de consulta sobre esa tabla.
LOCK TABLES libros READ; -- El LOCK TABLES tampoco se permite porque el usuario no tiene permisos para bloquear dicha tabla.

-- 9
START TRANSACTION;

SELECT precio_venta
FROM libros
FOR UPDATE;

UPDATE libros
SET precio_venta = precio_venta * 0.70;

COMMIT;

-- Se inicia la transacción con START TRANSACTION, se aplica un bloqueo exclusivo sobre los registros de la columna precio_venta mediante SELECT ... FOR UPDATE, se reduce el precio de los libros en un 30% usando UPDATE y finalmente se confirma la transacción con COMMIT.


