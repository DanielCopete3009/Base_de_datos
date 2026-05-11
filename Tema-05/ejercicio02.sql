-- 1. Crear la base de datos ajedrez con ajustes por defecto
CREATE DATABASE IF NOT EXISTS ajedrez;

-- 2. Modificar ajedrez al juego de caracteres y cotejamiento inglés internacional (latin1)
ALTER DATABASE ajedrez CHARACTER SET latin1 COLLATE latin1_general_ci;

-- 3. Eliminar la base de datos ajedrez (CORREGIDO con IF EXISTS)
DROP DATABASE IF EXISTS ajedrez;


-- 4. Crear la base de datos futbol con UTF16
CREATE DATABASE IF NOT EXISTS futbol CHARACTER SET utf16 COLLATE utf16_general_ci;

-- 5. Modificar futbol a UTF8MB4
ALTER DATABASE futbol CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 6. Eliminar la base de datos futbol (CORREGIDO con IF EXISTS)
DROP DATABASE IF EXISTS futbol;