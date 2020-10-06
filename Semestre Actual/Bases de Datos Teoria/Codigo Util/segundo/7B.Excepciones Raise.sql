SET SERVEROUTPUT ON
DECLARE 
    v_cadena VARCHAR2(30) := 'Alex';
    name_alex EXCEPTION;
BEGIN
    IF v_cadena = 'Alex' THEN
        RAISE name_alex;
    END IF;
EXCEPTION 
    WHEN name_alex THEN
        DBMS_OUTPUT.PUT_LINE('EL NOMBRE ES ALEX ERROR!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTROS ERRORES!');
END;


