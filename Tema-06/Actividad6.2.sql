-- Actividad6.2
-- Daniel Copete
-- base de datos

USE futbol;
-- Cambiar el nombre de un equipo
-- Cambia el nombre del equipo "Girona FC" a "Girona Futbol Club".
UPDATE equipos 

SET nombre = 'Girona FC'
WHERE id = 2;


-- Actualizar la ciudad de un equipo
-- Actualiza la ciudad de Villarreal CF a "Vila-real".
UPDATE equipos 
SET 
    ciudad = 'Vila-real'
WHERE
    id = 7 LIMIT 1;


-- Incrementar aforo de estadios grandes
-- Aumenta en 1.000 el aforo de todos los equipos cuyo aforo sea mayor de 50.000.
UPDATE equipos 
SET 
    aforo = aforo + 1000
WHERE
    aforo > 50000;

-- Cambiar el equipo de un jugador
-- Mueve a Hugo Duro al equipo Villarreal CF (id=7).
UPDATE jugadores 
SET 
    equipo_id = 7
WHERE
    ID = 17 LIMIT 1;

-- Corregir fecha de nacimiento
-- Corrige la fecha de nacimiento de Takefusa Kubo a '2001-06-05'.
UPDATE jugadores 
SET 
    fecha_nac = '2001-06-05'
WHERE
    id = 23 LIMIT 1;

-- Ajustar goles de un partido
-- Corrige los goles de partido id=7 a 2-1 a favor del equipo de casa.
UPDATE partidos 
SET 
    goles_casa = 2,
    goles_fuera = 1
WHERE
    id = 7 LIMIT 1;


-- Actualizar observaciones de partidos recientes
-- Agrega "(actualizado)" al final de las observaciones de los 3 últimos partidos, usando ORDER BY y LIMIT.
UPDATE partidos 
SET 
    observaciones = CONCAT_WS(' ', observaciones, '(actualizado)')
ORDER BY fecha DESC LIMIT 3;

-- Cambiar minutos de goles por penalti
-- Todos los goles que contienen "penalti" en la descripción se retrasan 1 minuto.
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    descripcion LIKE '%penalti%';



-- Asignar jugadores de un partido
-- Cambia todos los goles del partido id=13 para que pertenezcan al jugador Gerard Moreno (id=18), solo los goles del equipo de casa.
UPDATE goles g
        JOIN
    partidos p ON g.partido_id = p.id
        JOIN
    jugadores j ON g.jugador_id = j.id 
SET 
    g.jugador_id = 18
WHERE
    g.partido_id = 13
        AND j.equipo_id = p.equipo_casa_id;
  

-- Incrementar goles de los jugadores estrella
-- Suma 1 al minuto de los goles de Iñaki Williams, pero solo los 2 primeros goles, usando ORDER BY y LIMIT.
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    jugador_id = 20 ORDER BY id ASC LIMIT 2;


-- Modificar estadio de un equipo
-- Cambia el estadio de Real Sociedad a "Reale Arena Nuevo".
UPDATE equipos
SET estadio = 'Reale Arena Nuevo'
WHERE nombre = 'Real Sociedad';



-- Actualizar el equipo de varios jugadores
-- Mueve a todos los jugadores de Girona Futbol Club al Athletic Club (id=8).
UPDATE jugadores 
SET 
    equipo_id = 8
WHERE
    equipo_id = 10;



-- Incrementar goles de todos los partidos de un equipo
-- Suma 1 gol al equipo de casa en todos los partidos donde Valencia CF sea local.
UPDATE partidos 
SET 
    goles_casa = goles_casa + 1
WHERE
    equipo_casa_id = 6;




-- Corregir minutos de los goles antiguos
-- Resta 2 minutos a todos los goles que tengan un minuto mayor a 80.
UPDATE goles 
SET 
    minuto = minuto - 2
WHERE
    minuto > 80;



-- Renombrar un jugador
-- Cambia el nombre de José Luis Gayà a "José Gayà".
UPDATE jugadores
SET nombre = 'José Gayà'
WHERE id = 16 ;











