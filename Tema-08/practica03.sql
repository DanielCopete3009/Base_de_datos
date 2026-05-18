-- Daniel Copete
USE maratoon;
DELIMITER $$

CREATE FUNCTION Categoria(edad INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE idCat INT;

    SELECT id INTO idCat
    FROM categorias
    WHERE edad BETWEEN 
        CAST(SUBSTRING_INDEX(descripcion, '-', 1) AS UNSIGNED)
        AND
        CAST(SUBSTRING_INDEX(descripcion, '-', -1) AS UNSIGNED)
    LIMIT 1;

    RETURN idCat;
END$$

DELIMITER ;

-- parte 2
USE maratoon;
DELIMITER $$

CREATE PROCEDURE ActualizarCategoria()
BEGIN
    UPDATE corredores
    SET categoria_id = Categoria(edad);
END$$

DELIMITER ;

-- parte 3

USE maratoon;
DELIMITER $$

CREATE PROCEDURE ProximosCumpleaños()
BEGIN
    SELECT id, nombre, apellidos, fecha_nacimiento,
           TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) + 1 AS nueva_edad
    FROM corredores
    WHERE 
        DATE_FORMAT(fecha_nacimiento, '%m-%d')
        BETWEEN 
            DATE_FORMAT(CURDATE(), '%m-%d')
            AND
            DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 7 DAY), '%m-%d');
END$$

DELIMITER ;


-- parte 4


USE test;
DELIMITER $$

CREATE FUNCTION NumerosPrimos(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE suma INT DEFAULT 0;
    DECLARE esPrimo BOOLEAN;

    WHILE i <= n DO
        SET esPrimo = TRUE;

        -- Comprobar si i es primo
        DECLARE j INT DEFAULT 2;
        WHILE j <= SQRT(i) DO
            IF i % j = 0 THEN
                SET esPrimo = FALSE;
                LEAVE;
            END IF;
            SET j = j + 1;
        END WHILE;

        IF esPrimo THEN
            SET suma = suma + i;
        END IF;

        SET i = i + 1;
    END WHILE;

    RETURN suma;
END$$

DELIMITER ;



-- parte 5
USE test;
DELIMITER $$

CREATE FUNCTION Factorial(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultado INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        SET resultado = resultado * i;
        SET i = i + 1;
    END WHILE;

    RETURN resultado;
END$$

DELIMITER ;
