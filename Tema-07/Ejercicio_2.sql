-- practica_72_06

-- 1. Juan: todos los privilegios a nivel global
GRANT ALL PRIVILEGES ON *.* TO 'juan'@'%' WITH GRANT OPTION;

-- 2. Pedro: acceso a todas las bases de datos solo para consultar (SELECT)
GRANT SELECT ON *.* TO 'pedro'@'%';

-- 3. María: privilegios específicos en bases de datos gestlibros y maratoon
GRANT ALTER, CREATE, UPDATE, SELECT ON gestlibros.* TO 'maria'@'%';
GRANT ALTER, CREATE, UPDATE, SELECT ON maratoon.* TO 'maria'@'%';


-- 4. Roberto: super administrador (todos los privilegios globales)
CREATE USER 'roberto'@'%' IDENTIFIED BY 'roberto_67';
GRANT ALL PRIVILEGES ON *.* TO 'roberto'@'%' WITH GRANT OPTION;

-- 5. Rocío: todos los privilegios sobre la BD geslibros
CREATE USER 'rocio'@'%' IDENTIFIED BY 'rocio_69';
GRANT ALL PRIVILEGES ON geslibros.* TO 'rocio'@'%';

-- 6. Carlos: solo SELECT y UPDATE en tablas libros, editoriales y clientes
CREATE USER 'carlos'@'%' IDENTIFIED BY 'carlos_90';
GRANT SELECT, UPDATE ON geslibros.libros TO 'carlos'@'%';
GRANT SELECT, UPDATE ON geslibros.editoriales TO 'carlos'@'%';
GRANT SELECT, UPDATE ON geslibros.clientes TO 'carlos'@'%';

-- 7. Anamari: solo SELECT en columnas específicas de la tabla libros
CREATE USER 'anamari'@'%' IDENTIFIED BY 'anamari_2000';
GRANT SELECT (titulo, ean, isbn, precio_venta)
ON geslibros.libros TO 'anamari'@'%'; 

-- 8. Asignar al usuario anamari privilegios para acceder a las columnas nombre, telefono, email de la tabla clientes de la
-- base de datos geslibros sólo para consultar y actualizar.
GRANT SELECT (nombre, telefono, email),
      UPDATE (nombre, telefono, email)
ON geslibros.clientes
TO 'anamari'@'%';

FLUSH PRIVILEGES;

-- Aplicar los cambios
FLUSH PRIVILEGES;