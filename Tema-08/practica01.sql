USE Bancos;

-- Ejercicio 1
DELIMITER $$
DROP PROCEDURE IF EXISTS clientes_por_ciudad $$
CREATE PROCEDURE clientes_por_ciudad(IN p_ciudad VARCHAR(20))
BEGIN
    SELECT * FROM clientes WHERE ciudad = ciudad;
END $$

DELIMITER ;


-- 2 Actividad

DELIMITER $$

CREATE PROCEDURE movimientos_cuentas(IN p_id_cuenta INT UNSIGNED)
BEGIN
    SELECT *
    FROM movimientos
    WHERE cuenta_id = p_id_cuenta;
END $$

DELIMITER ;

-- Actividad 3

DELIMITER $$

CREATE PROCEDURE clientes_cuentas(IN p_id_cliente INT UNSIGNED)
BEGIN
    SELECT *
    FROM cuentas
    WHERE cliente_id = p_id_cliente;
END $$

DELIMITER;


-- Actividad 4

DELIMITER $$

CREATE PROCEDURE SaldosBajos()
BEGIN
    SELECT 
        c.id AS id_cuenta,
        c.iban,
        cl.nombre,
        cl.apellidos,
        cl.dni,
        c.saldo
    FROM cuentas c
    INNER JOIN clientes cl ON c.cliente_id = cl.id
    WHERE c.saldo <= 200;
END $$

DELIMITER ;



