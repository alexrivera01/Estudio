--NATURAL JOIN 
--Se usa cuando hay columnas exactamente iguales...ç
--Problema con tablas con multiples columnas ambiguas

-- INNER JOIN 
--Es la interseccion entre una tabla y otro por una columna que escojamos
SELECT estudiante.est_id,materia.nom_mat
FROM estudiante INNER JOIN materia 
ON estudiante.id_mat = materia.mat_id;

--FULL OUTER JOIN 
--Nos selecciona la tabla 1 + la interseccion + la tabla 2 sin importar si tiene un
SELECT e.est_id,m.nom_mat
FROM estudiante e FULL OUTER JOIN materia m
ON e.est_id = m.mat_id;

SELECT e.est_id,m.nom_mat
FROM estudiante e FULL JOIN materia m
ON e.est_id = m.mat_id;

--LEFT JOIN
--Selecciona la interseccion de los 2 + la tabla izquierda sin importar que tenga la columna comun en NULL.
SELECT e.est_id,e.nombre,m.nom_mat
FROM estudiante e LEFT JOIN materia m
ON e.id_mat = m.mat_id;

--RIGHT JOIN
--Selecciona la interseccion de los 2 + la tabla derecha sin importar que tenga la columna comun en NULL.
SELECT e.est_id,e.nombre,m.nom_mat
FROM estudiante e RIGHT JOIN materia m
ON e.id_mat = m.mat_id;

