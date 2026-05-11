SELECT 
    m.id,
    m.id_cuenta,
    c.num_cuenta,
    CONCAT(cl.apellidos, ', ', cl.nombre) AS cliente,
    DATE(m.fecha) AS fecha,
    m.concepto,
    m.tipo,
    m.cantidad,
    m.saldo
FROM movimientos m
JOIN cuentas c ON m.id_cuenta = c.id
JOIN clientes cl ON c.id_cliente = cl.id
ORDER BY m.id;