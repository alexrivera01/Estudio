BEGIN #Creacion de Tablas
;
create table mascota(
id int not null primary key,
nombre varchar(39)
);

create table persona(
id int not null primary key,
nombre varchar(30),
idMascota int default null,
constraint fk_persona_mascota foreign key(idMascota) references mascota(id)
);

create table aux(
id int not null primary key,
id_persona int null,
constraint fk_aux_persona foreign key (id_persona) references persona(id) 
)
END;

BEGIN #INSERT 
;
#INSERTAR valores a las tablas
#agregar valores a todas las columna de la tabla persona 
insert into persona values(1,"Gustavo",null);
insert into persona values(2,"Alexander",null);
insert into mascota values(1,"Coqui");

#agregar valores a algunas columnas de la tabla persona 
insert into persona (id,nombre) values(3,'Sandra');
END;

#UPDATE, actualizar registros 

#actualizar una columna del registro con id = 1 
update persona
set nombre = "pedro"
where id = 1;


#DELETE borrar registros

#borrar todos los registros de las tablas 
delete from persona;

#borrar el registro con id = 1
delete from persona
where id = 1;


#mostrar info basica

#muestra todos los registros de una tabla 
select * from persona;
describe persona

#muestra la estructura de una tabla 
show create table persona