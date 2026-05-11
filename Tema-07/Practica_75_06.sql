-- practica_75_06
-- Descripción:Bloqueo de tablas y filas
-- Autor :daniel copete
USE geslibros;

CREATE USER 'ubrique_01'@'localhost' IDENTIFIED BY 'ubrique01';
CREATE USER 'arcos_01'@'localhost' IDENTIFIED BY 'arcos01';

GRANT ALL PRIVILEGES ON *.* TO 'ubrique_01'@'localhost', 'arcos_01'@'localhost';

FLUSH PRIVILEGES;