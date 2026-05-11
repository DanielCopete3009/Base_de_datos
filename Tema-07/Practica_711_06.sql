-- practica711_06
-- Base de datos
-- 1

-- NOTA: Sentencia usada para obtener la cadena cifrada del password
SELECT PASSWORD('1234567');
-- Resultado: *6A7A490FB9DC8C33C2B025A91737077A7E9CC5E

-- 2. Crear el usuario con el hash obtenido (NO el texto plano)
CREATE USER 'danielcopete'@'localhost'
    IDENTIFIED BY PASSWORD '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E';

-- 3. Sin privilegios, solo acceso a la base de datos de testeo
GRANT USAGE ON test.* TO 'danielcopete'@'localhost';

FLUSH PRIVILEGES;



-- 2. Asignación de privilegios

-- 1. Superadministrador: todos los privilegios sobre todo, con GRANT OPTION
GRANT ALL PRIVILEGES ON *.* 
    TO 'danielcopete'@'localhost' 
    WITH GRANT OPTION;

-- 2. Todos los privilegios sobre la base de datos geslibros
GRANT ALL PRIVILEGES ON geslibros.* 
    TO 'danielcopete'@'localhost';

-- 3. Todos los privilegios sobre las tablas libros, editoriales y clientes
GRANT ALL PRIVILEGES ON geslibros.libros 
    TO 'danielcopete'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.editoriales 
    TO 'danielcopete'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.clientes 
    TO 'danielcopete'@'localhost';

-- 4. Solo consulta en las tablas libros, editoriales y clientes
GRANT SELECT ON geslibros.libros 
    TO 'danielcopete'@'localhost';
GRANT SELECT ON geslibros.editoriales 
    TO 'danielcopete'@'localhost';
GRANT SELECT ON geslibros.clientes 
    TO 'danielcopete'@'localhost';

-- 5. Consulta y actualización sobre columnas concretas de clientes
GRANT SELECT (nombre, direccion, poblacion, codpostal, telefono, email),
      UPDATE (nombre, direccion, poblacion, codpostal, telefono, email)
    ON geslibros.clientes 
    TO 'danielcopete'@'localhost';

-- 6. Consulta sobre algunas columnas y actualización de precio_venta y titulo en libros
GRANT SELECT (id, titulo, precio_venta, fechaedicion),
      UPDATE (precio_venta, titulo)
    ON geslibros.libros 
    TO 'danielcopete'@'localhost';

-- 7. Solo SELECT en todas las tablas de geslibros excepto ventas y lineasventas
GRANT SELECT ON geslibros.libros        TO 'danielcopete'@'localhost';
GRANT SELECT ON geslibros.editoriales   TO 'danielcopete'@'localhost';
GRANT SELECT ON geslibros.clientes      TO 'danielcopete'@'localhost';
GRANT SELECT ON geslibros.autores       TO 'danielcopete'@'localhost';
-- Añadir aquí el resto de tablas de geslibros que no sean ventas ni lineasventas

FLUSH PRIVILEGES;




-- practica711_06
-- Base de datos
-- 3. Eliminar privilegios

-- 1. Quitar el privilegio GRANT
REVOKE GRANT OPTION ON *.* 
    FROM 'danielcopete'@'localhost';

-- 2. Quitar todos los privilegios sobre todas las bases de datos
REVOKE ALL PRIVILEGES ON *.* 
    FROM 'danielcopete'@'localhost';

-- 3. Quitar todos los privilegios sobre la base de datos geslibros
REVOKE ALL PRIVILEGES ON geslibros.* 
    FROM 'danielcopete'@'localhost';

-- 4. Quitar el privilegio UPDATE sobre la tabla libros
REVOKE UPDATE ON geslibros.libros 
    FROM 'danielcopete'@'localhost';

-- 5. Quitar el privilegio SELECT sobre columnas concretas de libros
REVOKE SELECT (id, titulo, precio_venta) ON geslibros.libros 
    FROM 'danielcopete'@'localhost';

-- 6. Quitar SELECT sobre todas las tablas de geslibros excepto libros y clientes
-- MySQL no soporta REVOKE ... EXCEPT, hay que listar cada tabla individualmente
REVOKE SELECT ON geslibros.editoriales   FROM 'danielcopete'@'localhost';
REVOKE SELECT ON geslibros.autores       FROM 'danielcopete'@'localhost';
REVOKE SELECT ON geslibros.ventas        FROM 'danielcopete'@'localhost';
REVOKE SELECT ON geslibros.lineasventas  FROM 'danielcopete'@'localhost';
-- Añadir aquí el resto de tablas de geslibros que no sean libros ni clientes

-- 7. Quitar SELECT, UPDATE y DELETE sobre libros, clientes, editoriales y autores
REVOKE SELECT, UPDATE, DELETE ON geslibros.libros       FROM 'danielcopete'@'localhost';
REVOKE SELECT, UPDATE, DELETE ON geslibros.clientes     FROM 'danielcopete'@'localhost';
REVOKE SELECT, UPDATE, DELETE ON geslibros.editoriales  FROM 'danielcopete'@'localhost';
REVOKE SELECT, UPDATE, DELETE ON geslibros.autores      FROM 'danielcopete'@'localhost';

FLUSH PRIVILEGES;




-- 4. Cambiar password

-- Paso previo: obtener la cadena cifrada del nuevo password
SELECT PASSWORD('21436587');
-- *1DEB27DD74919473A2C69FDFA8E46B08E9F16547

-- Cambiar el password al usuario con el hash obtenido
ALTER USER 'danielcopete'@'localhost'
    IDENTIFIED BY PASSWORD -- Cambiar el password al usuario con el hash obtenido
ALTER USER 'danielcopete'@'localhost'
    IDENTIFIED BY PASSWORD '*1DEB27DD74919473A2C69FDFA8E46B08E9F16547';

FLUSH PRIVILEGES;



-- 5. Sorteo lotería primitiva

USE loteriaprimitiva;

-- Iniciar la transacción
START TRANSACTION;

-- Primer sorteo: fecha actual y números aleatorios
INSERT INTO Sorteos (fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES (
    NOW(),
    FLOOR(RAND() * 49) + 1,   -- num1: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num2: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num3: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num4: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num5: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num6: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- complementario: aleatorio entre 1 y 49
    FLOOR(RAND() * 10)         -- reintegro: aleatorio entre 0 y 9
);

-- Segundo sorteo: fecha actual y números aleatorios
INSERT INTO Sorteos (fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES (
    NOW(),
    FLOOR(RAND() * 49) + 1,   -- num1: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num2: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num3: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num4: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num5: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- num6: aleatorio entre 1 y 49
    FLOOR(RAND() * 49) + 1,   -- complementario: aleatorio entre 1 y 49
    FLOOR(RAND() * 10)         -- reintegro: aleatorio entre 0 y 9
);

-- Confirmar la transacción
COMMIT;

-- Verificar los registros insertados
SELECT * FROM Sorteos;


-- 6. Scripts sobre la base de datos maratoon

USE maratoon;

-- 6.1      
ALTER TABLE corredores
    ADD COLUMN apellido1 VARCHAR(40),
    ADD COLUMN apellido2 VARCHAR(40),
    ADD COLUMN codigo    CHAR(11);

-- 6.2 
UPDATE corredores
SET
    -- Primer apellido: todo lo que hay antes del primer espacio
    apellido1 = SUBSTRING_INDEX(apellidos, ' ', 1),
    -- Segundo apellido: todo lo que hay después del primer espacio
    apellido2 = SUBSTRING_INDEX(apellidos, ' ', -1);

-- 6.3
UPDATE corredores
SET codigo = UPPER(
    CONCAT(
        YEAR(fecha_nacimiento),             -- año nacimiento (4 dígitos)
        '/',                                -- separador
        LEFT(nombre,    2),                 -- 2 iniciales nombre
        LEFT(apellido1, 2),                 -- 2 iniciales apellido1
        LEFT(apellido2, 2)                  -- 2 iniciales apellido2
    )
);

-- 6.4 Actualizar la columna edad
UPDATE corredores
SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());

-- 6.5 Actualizar categoria_id a partir de la edad
UPDATE corredores c
    JOIN categorias cat
        ON c.edad BETWEEN cat.edad_min AND cat.edad_max
SET c.categoria_id = cat.id;

-- 6.6 Transacción: bloqueo de categorias y actualización de edad y categoria_id
START TRANSACTION;

    -- Bloquear todos los registros de categorias en modo UPDATE
    -- para que no puedan ser modificados durante el proceso
    SELECT * FROM categorias FOR UPDATE;

    -- Actualizar edad a partir de la fecha de nacimiento
    UPDATE corredores
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());

    -- Actualizar categoria_id a partir de la edad recién calculada
    UPDATE corredores c
        JOIN categorias cat
            ON c.edad BETWEEN cat.edad_min AND cat.edad_max
    SET c.categoria_id = cat.id;

COMMIT;

-- Verificar resultados
SELECT id, nombre, apellido1, apellido2, codigo, edad, categoria_id
FROM corredores;

-- 7
USE geslibros;

SELECT *
INTO OUTFILE 'C:/tmp/clientesUbrique.csv'
    FIELDS TERMINATED BY ';'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
FROM clientes
WHERE poblacion = 'Ubrique';



-- mysqldump -u root -p geslibros > "C:\tmp\geslibros_backup.sql"
-- mysql -u root -p geslibros < "C:\tmp\geslibros_backup.sql"

/*
id;titulo;autor_id;editorial_id;precio_venta;fechaedicion
1;"El Quijote";1;1;12.50;"2001-03-15"
2;"Cien años de soledad";2;2;14.95;"1998-06-20"
3;"La sombra del viento";3;3;11.75;"2004-09-10"
4;"El nombre de la rosa";4;4;13.20;"2000-11-05"
*/

LOAD DATA INFILE 'C:/tmp/libros.csv'
INTO TABLE libros
    FIELDS TERMINATED BY ';'
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(id, titulo, autor_id, editorial_id, precio_venta, fechaedicion);

SELECT * FROM libros;


