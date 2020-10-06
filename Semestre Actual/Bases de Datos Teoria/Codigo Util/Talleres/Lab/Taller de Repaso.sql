

--punto 2
create or replace procedure actualizar_sal
is 
begin
    update empleado
    set empsalario = empsalario + (empsalario*0.10);
end;

execute actualizar_sal();

--punto 3
create or replace procedure actualizar_salario
(
    v_id in number,
    v_porcent in number
)
is 
begin
    update empleado 
    set empsalario = empsalario  + (empsalario * (v_porcent * 0.01))
    where v_porcent = empleado.empid; 
end;

execute actualizar_salario(1,10);

--punto 4 
create or replace procedure obtener_datos_emp
(
    v_id in number,
    v_cargo out emp.job%TYPE,
    v_sal out emp.sal%TYPE
)
is 
begin
    select job,sal
    into v_cargo,v_sal
    from emp
    where v_id = emp.empno;
end;


accept v_id PROMPT 'Digite el id a insertar';
declare 
    v_idemp emp.empno%TYPE := &v_id;
    v_cargo emp.job%TYPE;
    v_sal emp.sal%TYPE;
begin 
    obtener_datos_emp(v_idemp,v_cargo,v_sal);
    if v_cargo = 'PRESIDENT' THEN
        dbms_output.put_line('datos :' || v_idemp || v_cargo || v_sal);
        insert into empleadotemp values(v_idemp,v_cargo,v_sal);
    else 
        dbms_output.put_line('no es president');
    end if;
end;
   
--punto 5

CREATE OR REPLACE PROCEDURE insertar
(
    v_emp_id empleado.empid%TYPE,
    v_emp_nombre empleado.empnombre%TYPE,
    v_emp_apellido empleado.empapellido%type,
    v_emp_salario empleado.empsalario%type
)
is
begin
    insert into empleado values(v_emp_id,v_emp_nombre,v_emp_apellido,v_emp_salario);
end;


execute insertar(&v_id,'&v_nombre','&v_ape',&v_sal);

set echo off
set verify off
set serveroutput on

--punto 6 

create or replace procedure eliminar
(
    v_id empleado.empid%TYPE
)
is 
begin
    delete from empleado
    where v_id =  empleado.empid;
end;

execute eliminar(8);

--punto 7 

set serveroutput on
set echo off
set verify off

accept v_id prompt 'Digite el id a cambiar';
declare
    v_cargo_obtenido empleadotemp.cargo%TYPE;
    v_id_obtenido  empleadotemp.id%TYPE := &v_id;
BEGIN
    select cargo into v_cargo_obtenido
    from empleadotemp
    where v_id_obtenido = empleadotemp.id;
    
    if v_cargo_obtenido = 'PRESIDENT' THEN
        update empleadotemp
        set cargo = 'jefe'
        where v_id_obtenido= empleadotemp.id;
        dbms_output.put_line('actualizado');
    else
        dbms_output.put_line('No se pudo llevar a cabo la actualizado');
    end if;
end;

--punto 8a

declare 
    v_cargo emp.job%TYPE := 'Abogado';
    v_salario emp.sal%TYPE := 6000;
    v_id empleado.empid%TYPE := 333;
begin
    LOOP 
        INSERT INTO empleadotemp values(v_id,v_cargo,v_salario*2);
        v_salario := v_salario + 1000;
        v_id := v_id + 111;
        EXIT WHEN v_salario > 10000;
    END LOOP;
END;

--punto 8b

declare 
    v_cargo emp.job%TYPE := 'Abogado';
    v_salario emp.sal%TYPE := 6000;
    v_id empleado.empid%TYPE := 333;
begin
    WHILE v_salario < 10001 loop
        INSERT INTO empleadotemp values(v_id,v_cargo,v_salario*2);
        v_salario := v_salario + 1000;
        v_id := v_id + 111;
    END LOOP;
END;

--punto 8c

declare 
    v_cargo emp.job%TYPE := 'Abogado';
    v_salario emp.sal%TYPE := 6000;
    v_id empleado.empid%TYPE := 333;
begin
    FOR i IN 1..10 LOOP
        INSERT INTO empleadotemp values(v_id,v_cargo,v_salario*2);
        v_salario := v_salario + 1000;
        v_id := v_id + 111;
    END LOOP;
END;