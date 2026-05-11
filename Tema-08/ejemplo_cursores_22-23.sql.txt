-- Cursores
-- Ejemplo18: SELECT … INTO variables
-- Uso Base de Datos Maratoon
DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.ObtenerCorredor $$
CREATE PROCEDURE maratoon.ObtenerCorredor(id_corredor INT UNSIGNED)
BEGIN
	DECLARE vid INT UNSIGNED;
	DECLARE vnombre VARCHAR(20);
	DECLARE vapellidos VARCHAR(45);
	DECLARE vedad TINYINT UNSIGNED;
	DECLARE vcategoria CHAR(3);
	DECLARE vclub VARCHAR(30);
	SELECT 
		c.id,
		c.Nombre,
		c.Apellidos,
		c.Edad,
		ca.Nombrecorto,
		cl.Nombre
	INTO vid , vnombre , vapellidos , vedad , vcategoria , vclub FROM
    corredores AS c
        JOIN
    categorias AS ca ON c.categoria_id = ca.id
        JOIN
    clubs AS cl ON c.club_id = cl.id
	WHERE
		c.id = id_corredor;

	SELECT vid, vnombre, vapellidos, vedad, vcategoria, vclub;
END$$
DELIMITER ;
SET @NumCorredor=3;
CALL maratoon.ObtenerCorredor(@NumCorredor);

DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.corredores_poblacion $$
CREATE PROCEDURE maratoon.corredores_poblacion(IN poblacion VARCHAR(20))
BEGIN
	 DECLARE vid INT UNSIGNED;
	 DECLARE vnombre VARCHAR(20);
	 DECLARE vapellidos VARCHAR(40);
	 DECLARE vciudad VARCHAR(20);
	 DECLARE cursor01 CURSOR FOR SELECT id, nombre, apellidos, ciudad 
     FROM corredores WHERE ciudad = poblacion;
	
	 OPEN cursor01;
	
     l_cursor: LOOP
		FETCH Cursor01 INTO vid, vnombre, vapellidos, vciudad;
        select vid, vnombre, vapellidos, vciudad;
	 END LOOP l_cursor; 
	 CLOSE cursor01;
    
END $$
--
DELIMITER ;
CALL Corredores_Poblacion('Ubrique');

DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.corredores_poblacion_2 $$
CREATE PROCEDURE maratoon.corredores_poblacion_2(IN poblacion VARCHAR(20))
BEGIN	 
	 DECLARE vid INT UNSIGNED;
	 DECLARE vnombre VARCHAR(20);
	 DECLARE vapellidos VARCHAR(40);
	 DECLARE vciudad VARCHAR(20);
     DECLARE last_row_fetched BOOLEAN DEFAULT 0;
	 DECLARE cursor01 CURSOR FOR SELECT id, nombre, apellidos, ciudad 
     FROM corredores WHERE ciudad = poblacion;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET last_row_fetched = 1;
     
	
	 OPEN cursor01;
	
     l_cursor: LOOP
		FETCH Cursor01 INTO vid, vnombre, vapellidos, vciudad;
        select vid, vnombre, vapellidos, vciudad;
        IF last_row_fetched THEN
			LEAVE l_cursor;
		END IF;
	 END LOOP l_cursor; 
	 CLOSE cursor01;
    
END $$
--
DELIMITER ;
CALL Corredores_Poblacion('Ubrique');

DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.corredores_poblacion_3 $$
CREATE PROCEDURE maratoon.corredores_poblacion_3(IN poblacion VARCHAR(20))
BEGIN	 
	 DECLARE vid INT UNSIGNED;
	 DECLARE vnombre VARCHAR(20);
	 DECLARE vapellidos VARCHAR(40);
	 DECLARE vciudad VARCHAR(20);
     DECLARE last_row_fetched BOOLEAN DEFAULT 0;
	 DECLARE cursor01 CURSOR FOR SELECT id, nombre, apellidos, ciudad 
     FROM corredores WHERE ciudad = poblacion;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET last_row_fetched = 1;
     
	
	 OPEN cursor01;
	
     WHILE (NOT last_row_fetched) DO
		FETCH Cursor01 INTO vid, vnombre, vapellidos, vciudad;
        select vid, vnombre, vapellidos, vciudad;
	 END WHILE; 
	 CLOSE cursor01;
    
END $$
--
DELIMITER ;
CALL Corredores_Poblacion('Ubrique');

DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.corredores_poblacion_4 $$
CREATE PROCEDURE maratoon.corredores_poblacion_4(IN poblacion VARCHAR(20))
BEGIN	 
	 DECLARE vid INT UNSIGNED;
	 DECLARE vnombre VARCHAR(20);
	 DECLARE vapellidos VARCHAR(40);
	 DECLARE vciudad VARCHAR(20);
     DECLARE last_row_fetched BOOLEAN DEFAULT 0;
	 DECLARE cursor01 CURSOR FOR SELECT id, nombre, apellidos, ciudad 
     FROM corredores WHERE ciudad = poblacion;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET last_row_fetched = 1;
     
	
	 OPEN cursor01;
	
     REPEAT 
		FETCH Cursor01 INTO vid, vnombre, vapellidos, vciudad;
        select vid, vnombre, vapellidos, vciudad;
	 UNTIL last_row_fetched 
     END REPEAT;
      
	 CLOSE cursor01;
    
END $$
--
DELIMITER ;
CALL Corredores_Poblacion('Ubrique');