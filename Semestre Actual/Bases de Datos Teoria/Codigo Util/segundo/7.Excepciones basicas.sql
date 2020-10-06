--vamos a hacer un B.A SIN CONTROLAR EXCEPCION para ver que codigo nos arroja

DECLARE 
    v_dividendo NUMBER := 5;
    v_divisor NUMBER := 0;
    v_res NUMBER;
BEGIN
    v_res := v_dividendo / v_divisor;
END;

--PARA ENCAPSULAR ESTE ERROR UTILIZAMOS DESPUES DE BEGIN Y ANTES DEL END LA 
--CLAUSAULA EXCEPTION 

DECLARE 
    v_dividendo NUMBER := 5;
    v_divisor NUMBER := 0;
    v_res NUMBER;
BEGIN
    v_res := v_dividendo / v_divisor;
EXCEPTION 
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('No se puede dividir por cero');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error contacte al administrador');
END;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--SIN ENCAPSULAR EXCEPCION 
DECLARE 
    v_est_nom estudiante.nombre%TYPE;
BEGIN
    SELECT est_id
    INTO v_est_nom
    FROM estudiante
    WHERE est_id = 100;
END;

--ENCAPSULANDO LA EXCEPCION

DECLARE 
    v_est_nom estudiante.nombre%TYPE;
BEGIN
    SELECT est_id
    INTO v_est_nom
    FROM estudiante
    WHERE est_id = 100;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro el estudiante no : 100');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error contacte al administrador');
END;








