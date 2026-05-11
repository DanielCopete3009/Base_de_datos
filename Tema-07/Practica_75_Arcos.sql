-- practica_75_arcos01_solucion
-- conexion arcos_01

-- 2
USE geslibros;

-- 4 
SELECT * FROM clientes WHERE poblacion = 'Guadalajara';

INSERT INTO clientes (dni, nombre, provincia)
VALUES ('12345678A', 'Juan Pérez', 'Guadalajara');
-- La consulta SELECT está permitida porque es una operación de lectura, mientras que el INSERT no se puede ejecutar porque la tabla está bloqueada en modo READ y no permite modificaciones.

-- 6
SELECT * FROM clientes;

LOCK TABLES libros WRITE;

INSERT INTO libros (id, isbn, ean)
VALUES (101, 'Libro de prueba', 'Autor Ejemplo');

-- El INSERT se puede realizar porque la tabla libros está bloqueada en modo WRITE, lo que permite operaciones de escritura además de lectura.

-- 8
UNLOCK TABLES;

-- 9
START TRANSACTION;
SELECT *
FROM editoriales
FOR SHARE;

SELECT *
FROM autores
FOR SHARE;

INSERT INTO libros (id, titulo, autor, editorial)
VALUES (101, 'Libro 1', 'Autor 1', 'Editorial 1');

INSERT INTO libros (id, titulo, autor, editorial)
VALUES (102, 'Libro 2', 'Autor 2', 'Editorial 2');

COMMIT;

-- Se inicia la transacción con START TRANSACTION, se aplican bloqueos compartidos sobre las tablas editoriales y autores mediante SELECT ... FOR SHARE, se insertan dos registros en la tabla libros y finalmente se confirma la transacción con COMMIT.


