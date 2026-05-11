-- Muestra los juegos de caracteres disponibles mysql
SHOW CHARACTER SET;

-- Muestra los cotejamientos disponibles de my sql
SHOW COLLATION;

-- Crea la base de datos ejemplo con el cotejamiento establecido por defecto en my sql
CREATE DATABASE EJEMPLO;

-- Crea la base de datos Ejemplo solo si no existe (CORREGIDO: Se agregó ;)
CREATE DATABASE IF NOT EXISTS EJEMPLO;

-- Crea la base de datos banco multilingüe con utf8
CREATE DATABASE IF NOT EXISTS BANCO
CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

-- Crear la base de datos banco para español con utf8
CREATE DATABASE IF NOT EXISTS BANCO
CHARACTER SET UTF8 COLLATE utf8_spanish_ci;

-- Crea la base de datos banco para español con utf8mb4
CREATE DATABASE IF NOT EXISTS BANCO
CHARACTER SET UTF8mb4 COLLATE utf8mb4_spanish_ci;



 

