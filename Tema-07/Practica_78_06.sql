-- practica_78_06

USE maratoon;
-- 1
INSERT INTO Corredores (nombre, apellidos, ciudad, fechaNacimiento, sexo, club_id)
VALUES 
('Juan', 'Pérez Gómez', 'Sevilla', '1990-05-14', 'M', 5),
('María', 'López Sánchez', 'Cádiz', '1985-09-22', 'F', 5),
('Carlos', 'Ruiz Martín', 'Huelva', '2000-01-10', 'M', 5);


-- 2
UPDATE Corredores
SET edad = TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE());

-- 3
UPDATE Corredores
SET categoria_id = CASE
    WHEN edad < 12 THEN 1   -- INF
    WHEN edad < 15 THEN 2   -- JUN
    WHEN edad < 18 THEN 3   -- JUV
    WHEN edad < 30 THEN 4   -- SNA
    WHEN edad < 40 THEN 5   -- SNB
    WHEN edad < 50 THEN 6   -- VTA
    WHEN edad < 60 THEN 7   -- VTB
    ELSE 8                  -- VTC (60 o más)
END;

SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    Corredores.fechaNacimiento,
    Corredores.edad,
    Categorias.Nombrecorto,
    clubs.nombre
FROM Corredores
JOIN Categorias ON Corredores.categoria_id = Categorias.id
JOIN clubs ON Corredores.club_id = clubs.id;


SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    Corredores.fechaNacimiento,
    Corredores.edad,
    Categorias.Nombrecorto,
    clubs.nombre
FROM Corredores
JOIN Categorias ON Corredores.categoria_id = Categorias.id
JOIN clubs ON Corredores.club_id = clubs.id
WHERE MONTH(Corredores.fechaNacimiento) = MONTH(CURDATE() + INTERVAL 1 MONTH);


SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    Corredores.fechaNacimiento,
    Corredores.edad,
    Categorias.Nombrecorto,
    clubs.nombre
FROM Corredores
JOIN Categorias ON Corredores.categoria_id = Categorias.id
JOIN clubs ON Corredores.club_id = clubs.id
WHERE WEEK(Corredores.fechaNacimiento) = WEEK(CURDATE() + INTERVAL 1 WEEK);


SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    Corredores.fechaNacimiento,
    Corredores.edad,
    Categorias.Nombrecorto,
    clubs.nombre
FROM Corredores
JOIN Categorias ON Corredores.categoria_id = Categorias.id
JOIN clubs ON Corredores.club_id = clubs.id
WHERE MONTH(Corredores.fechaNacimiento) BETWEEN 5 AND 8;


-- 4

INSERT INTO maratoon.registros
VALUES 
(NULL, 2, 2, '2019-12-02 09:00:00', '2019-12-02 11:15:30', NULL),
(NULL, 2, 3, '2019-12-02 09:00:00', '2019-12-02 11:22:10', NULL),
(NULL, 2, 4, '2019-12-02 09:00:00', '2019-12-02 11:35:45', NULL),
(NULL, 2, 5, '2019-12-02 09:00:00', '2019-12-02 11:50:20', NULL),
(NULL, 2, 6, '2019-12-02 09:00:00', '2019-12-02 12:05:00', NULL);


-- 5
UPDATE maratoon.registros
SET TiempoInvertido = TIMEDIFF(Llegada, Salida)
WHERE carrera_id = 2;


-- 6

SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    clubs.nombre AS club,
    Categorias.Nombre AS categoria,
    registros.TiempoInvertido
FROM registros
JOIN Corredores ON registros.corredor_id = Corredores.id
JOIN clubs ON Corredores.club_id = clubs.id
JOIN Categorias ON Corredores.categoria_id = Categorias.id
WHERE registros.carrera_id = 2
ORDER BY registros.TiempoInvertido ASC;


SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    clubs.nombre AS club,
    Categorias.Nombre AS categoria,
    registros.TiempoInvertido,
    TIME_TO_SEC(registros.TiempoInvertido) AS segundos
FROM registros
JOIN Corredores ON registros.corredor_id = Corredores.id
JOIN clubs ON Corredores.club_id = clubs.id
JOIN Categorias ON Corredores.categoria_id = Categorias.id
WHERE registros.carrera_id = 2
ORDER BY registros.TiempoInvertido ASC;

SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    clubs.nombre AS club,
    Categorias.Nombre AS categoria,
    registros.TiempoInvertido,
    SEC_TO_TIME(
        TIME_TO_SEC(registros.TiempoInvertido) - TIME_TO_SEC('02:01:39')
    ) AS diferencia_con_record
FROM registros
JOIN Corredores ON registros.corredor_id = Corredores.id
JOIN clubs ON Corredores.club_id = clubs.id
JOIN Categorias ON Corredores.categoria_id = Categorias.id
WHERE registros.carrera_id = 2
ORDER BY registros.TiempoInvertido ASC;



SELECT 
    Corredores.id,
    Corredores.nombre,
    Corredores.apellidos,
    clubs.nombre AS club,
    Categorias.Nombre AS categoria,
    registros.TiempoInvertido
FROM registros
JOIN Corredores ON registros.corredor_id = Corredores.id
JOIN clubs ON Corredores.club_id = clubs.id
JOIN Categorias ON Corredores.categoria_id = Categorias.id
WHERE registros.carrera_id = 2
  AND Categorias.Nombrecorto = 'SNA'
ORDER BY registros.TiempoInvertido ASC;

