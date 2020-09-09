begin DDL TABLAS
create table estudiante(
id int not null,
promedio number,
constraint "pk_estudiante" primary key (id)
)

create table materia(
id_mat int,
nombre_mat varchar2(30),
constraint "pk_materia" primary key (id_mat)
)
end

begin -- DDL TABLAS
alter table estudiante add id_mat int

alter table estudiante add constraint "fk_estudiante_materia" foreign key (id_mat) references estudiante(id)
end

BEGIN -- DML INSERTS
insert into materia values(2,'IA');
insert into estudiante values(3,5,2);
END

BEGIN --BLOQUE ANONIMO Y CICLOS
DECLARE 

v_id estudiante.id%TYPE;
v_promedio estudiante.promedio%TYPE;
BEGIN

SELECT id,promedio
INTO v_id,v_promedio
FROM estudiante
WHERE estudiante.id = 1;

END;

--LOOP (DO_WHILE)
SET SERVEROUTPUT ON
DECLARE 
v_cadena VARCHAR(30);
v_contador NUMBER(30) := 0;

BEGIN

LOOP
    v_contador := v_contador+1;
    DBMS_OUTPUT.PUT_LINE(v_contador);
    EXIT WHEN v_contador >10;
END LOOP;
END;

--WHILE 
SET SERVEROUTPUT ON
DECLARE
v_num NUMBER := 1;
BEGIN 
WHILE v_num <10 LOOP
    DBMS_OUTPUT.PUT_LINE('NUMERO ES : ' || v_num);
    v_num := v_num+1;
END LOOP;
END;

--FOR 
SET SERVEROUTPUT ON
DECLARE
v_num NUMBER :=0;
v_remplazar NUMBER(10) :=0; 
BEGIN 
FOR i in v_num..10 LOOP
    DBMS_OUTPUT.PUT_LINE('iteracion no.'|| i);
END LOOP;
END;

END;


--PROCEDIMIENTOS ALMACENADOS



























