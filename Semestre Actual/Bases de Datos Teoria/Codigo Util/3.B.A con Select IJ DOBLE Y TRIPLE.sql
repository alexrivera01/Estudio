--B.A. select inner join simple con into
SET SERVEROUTPUT ON 
DECLARE
    v_id_est estudiante.est_id%TYPE;
    v_nom_mat materia.nom_mat%TYPE;
BEGIN
    SELECT est_id, nom_mat
    INTO v_id_est,v_nom_mat
    FROM estudiante e INNER JOIN materia m 
    ON e.id_mat = m.mat_id
    WHERE e.est_id = 1;
    
    dbms_output.put_line('El nombre de la materia es: ' || v_id_est || 'que la ve el estudiante con codigo: ' || v_id_est);
END;

SET SERVEROUTPUT ON
DECLARE
    v_nom_est estudiante.nombre%TYPE;
    v_nom_mat materia.nom_mat%TYPE;
    v_nom_fac facultad.nombre%TYPE;
BEGIN
    SELECT e.nombre,f.nombre,m.nom_mat
    INTO v_nom_est,v_nom_fac,v_nom_mat
    FROM estudiante e INNER JOIN materia m ON e.id_mat = m.mat_id INNER JOIN facultad f ON m.id_fac = f.fac_id
    WHERE e.est_id = 1;
    
    DBMS_OUTPUT.PUT_LINE('nombe es:'|| v_nom_est || 'facultad es: '|| v_nom_fac);
END;