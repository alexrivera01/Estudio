CREATE OR REPLACE PROCEDURE imp
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('que hay?');
END;

--Recordatorio los parametros no tienen () EXACTITUD
CREATE OR REPLACE PROCEDURE imprimir
(
    v_cadena VARCHAR
)
IS 
BEGIN 
    dbms_output.put_line('lo que me llego fue: ' || v_cadena);
END;


