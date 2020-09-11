--Bloque anonimo con impresion
SET SERVEROUTPUT ON 
DECLARE 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Soy un bloque anonimo');
END;

--Bloque anonimo pidiendo dato e imprimiendo
SET SERVEROUTPUT ON
SET ECHO OFF
SET VERIFY OFF
ACCEPT v_nombre PROMPT 'Digite el nombre: ';
DECLARE 
BEGIN
    dbms_output.put_line('El nombre asignado es:' || '&v_nombre');
END;