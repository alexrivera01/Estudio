insert into estudiante values(1,'Alexander',1);
CREATE TABLE ESTUDIANTE 
(
est_id integer,
nombre varchar2(30),
id_mat int,
constraint "pk_estudiante" primary key(est_id),
constraint "fk_estudiante_materia" foreign key (id_mat) references materia(mat_id)
)


CREATE TABLE materia 
(
    mat_id integer,
    nom_mat varchar(30),
    id_fac integer,
    constraint "pk_materia" primary key(mat_id),
    constraint "fk_materia_facultad" foreign key (id_fac) references facultad(fac_id)
)

CREATE TABLE facultad 
(
fac_id integer,
nombre varchar2(30),
constraint "pk_facultad" primary key(fac_id)
)

insert into facultad values(1,'FIET');
insert into facultad values(2,'Humanas');

insert into materia values(1,'Calculo',1);
insert into materia values(2,'Bases de datos 2',2);
insert into materia values(9,'Analisis numero',null);

insert into estudiante values(1,'Alexander',1);
insert into estudiante values(2,'Pedro',2);
insert into estudiante values(3,'Camila',1);
insert into estudiante values(4,'Laura',null);





