-- Actividad 6.4
-- Insertar una compra en la base de dato

INSERT INTO ventas (id, cliente_id,fecha,importe_bruto,importe_iva,importe_total) VALUES
(null, 6,now(),289.50,60.80,350.30);


-- Insertamos las lineas_ventas de esa factura
INSERT INTO lineasventas (venta_id,numero_linea,libro_id, iva,  cantidad, precio , importe) VALUES
(11,1,11,0.21,5,30,150),
(11,2,12,0.21,10,13,130),
(11,3,15,0.21,1,9.50,9.50);


-- Actualizar la dirección del cliente
-- id = 5
UPDATE clientes 
SET 
    direccion = 'Poligono Ansu Fati, Calle Messi, Nave 20'
WHERE
    nif = '23124234G';
    
    
-- Oscar wild añadirle el premio planta

SELECT id from autores where nombre= 'Oscar Wilde';

UPDATE autores 
SET 
    premios = CONCAT_WS(',', premios, 'Planeta')
WHERE
    id = 2;
    
    
-- Se decrementa el precio de venta de todos los libros en un 10%


UPDATE libros 
SET 
    precio_venta = precio_venta * 0.9;


-- Debido a una serie de impuestos se incrementa 
-- el precio de costo de todos los libros de las editoriales Alfaguara y Anaya en un 10%
select id from editoriales where nombre = 'Alfaguara';
select id from editoriales where nombre = 'Anaya';


UPDATE libros 
SET 
    precio_coste = precio_coste * 1.10
WHERE
    editoriales_id IN (5 , 6);
    
    
-- Todos los libros editados antes
-- del año 2000 se les descuenta 2 € del precio de venta

UPDATE libros SET precio_venta = precio_venta -2
WHERE YEAR(fecha_edicion) < 2000;

-- Se desea eliminar la editorial Alfaguara, pero antes es necesario eliminar todos los libros de dicha editorial
-- y a continuación eliminar la editorial Alfaguara

select id from editoriales where nombre = 'Alfaguara'

DELETE FROM libros WHERE  editoriales_id = 5;


DELETE FROM  editoriales WHERE id=5;







