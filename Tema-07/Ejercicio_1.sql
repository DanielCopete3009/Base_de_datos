-- Practica_71_06
-- Creo los usuarios con sus contraseñas
CREATE USER 'juan'@'localhost' IDENTIFIED BY 'juan_01';
CREATE USER 'pedro'@'localhost' IDENTIFIED BY 'pedro_01';
CREATE USER 'maria'@'localhost' IDENTIFIED BY 'maria_03';
CREATE USER 'miguel'@'localhost' IDENTIFIED BY 'miguel_04';
CREATE USER 'rocio'@'localhost' IDENTIFIED BY 'rocio_05';

-- Aquí se ve la contraseña encriptada (aunque PASSWORD ya no se usa mucho)
SELECT 'juan' AS usuario, PASSWORD('juan_01') AS password_encriptado
UNION
SELECT 'pedro', PASSWORD('pedro_01')
UNION
SELECT 'maria', PASSWORD('maria_03')
UNION
SELECT 'miguel', PASSWORD('miguel_04')
UNION
SELECT 'rocio', PASSWORD('rocio_05');

-- Les doy permisos solo sobre la base de datos test
GRANT ALL PRIVILEGES ON test.* TO 'juan'@'localhost';
GRANT ALL PRIVILEGES ON test.* TO 'pedro'@'localhost';
GRANT ALL PRIVILEGES ON test.* TO 'maria'@'localhost';
GRANT ALL PRIVILEGES ON test.* TO 'miguel'@'localhost';
GRANT ALL PRIVILEGES ON test.* TO 'rocio'@'localhost';

FLUSH PRIVILEGES;

-- Creo el usuario roberto directamente en la tabla interna (no recomendado, pero para practicar)
INSERT INTO mysql.user (Host, User, authentication_string, plugin)
VALUES ('localhost', 'roberto', PASSWORD('roberto_79'), 'mysql_native_password');

FLUSH PRIVILEGES;

-- Le doy permisos sobre test
GRANT ALL PRIVILEGES ON test.* TO 'roberto'@'localhost';

FLUSH PRIVILEGES;

-- Borro los usuarios miguel y rocio
DROP USER 'miguel'@'localhost';
DROP USER 'rocio'@'localhost';