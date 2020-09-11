CREATE OR REPLACE FUNCTION suma
(
    v_num1 NUMBER,v_num2 NUMBER
)
RETURN NUMBER
IS 
    v_res NUMBER;
BEGIN 
    v_res := v_num1 + v_num2;
    dbms_output.put_line('resultado es :'|| v_res);
    return v_res;
END;

--NOTA: Las funciones deben ejecutase dentro de un b.a y igualarlas a una variable

DECLARE
    v_res NUMBER;
begin 
    v_res := suma(1,5);
    DBMS_OUTPUT.PUT_LINE(v_res);
END;