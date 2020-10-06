--
insert into facultad values(1,'FIET',10000,5000);
insert into facultad values(2,'HUMANAS',10000,5000);

ALTER TABLE programa add fecha_creacion DATE; 

insert into programa values(1,'Sistemas',1,'10/02/1998');
insert into programa values(2,'Electronica',1,'20/02/1996');


--punto 1 
SET SERVEROUTPUT ON
SET ECHO OFF
SET VERIFY OFF
ACCEPT v_program PROMPT 'Didite el nombre del programa: ';
DECLARE 
    TYPE datos_programa is RECORD
    (
        nombre_programa programa.nombre%TYPE,
        fecha_creacion DATE,
        nombre_facultad facultad.nombre%TYPE
    );
    v_programa_actual datos_programa;
BEGIN 
    SELECT p.nombre,p.fecha_creacion,f.nombre 
    INTO v_programa_actual
    FROM programa p INNER JOIN facultad f
    ON p.facultad_id = f.facultad_id
    WHERE p.programa_id = &v_program;
    DBMS_OUTPUT.PUT_LINE('nombre del programa:'|| v_programa_actual.nombre_programa || 
    ' fecha de creacion :'|| v_programa_actual.fecha_creacion || 'nombre de la facultad :' || v_programa_actual.nombre_facultad);
EXCEPTION 
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('No hay programa con el id digitado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error contacte con el admin');
END;