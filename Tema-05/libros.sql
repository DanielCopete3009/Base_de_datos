-- ejemplo
-- SELECT

-- Muestras todos los regisros  de la tabla libro,
-- con todas las columnas de la tabla
-- Lista de columnas : *
SELECT * FROM geslibros.libros;

-- Especificamos lista de columnas
SELECT id, titulo, autos_id, editorial_id, precio_venta FROM libros;

-- Especificamos lista de columnas con otro orden
SELECT 
    id,
    titulo,
    precio_venta,
    autor_id,
    editorialid,
    precio_coste
FROM
    libros;
    
-- Lista de columnas con expresión
-- Beneficio que obtengo de cada libro: precio_venta - precio_coste
-- la clausula as no es obligatoria
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste as beneficio
FROM
    libros;
    

--  Uso de prefijos
-- Columnas: nombre de la base de datos, nombre de la tabla
-- tablas: nombre de la base de datos
SELECT 
    libros.id,
    libros.titulo,
    libros.autor_id,
    libros.editorial_id,
    libros.precio_coste,
    libros.precio_venta,
    libros.precio_venta - libros.precio_coste as beneficio
FROM
    geslibros.libros;
    
    
-- 
use marca




--  Cláusula FROM
-- las tablas a partir de la cual extraigo  los datos
select libros.id, libros.titulo, libros.autor_id, autores.nombre as autor, editorial_id, editoriales.nombre as  editoriales,  libros.precio_venta
FROM libros, autores, editoriales;










    
    
    

