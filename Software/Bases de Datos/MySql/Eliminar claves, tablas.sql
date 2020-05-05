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

#ELIMINAR algunas constraint, columnas, registros y tablas 

#eliminamos una columna 
alter table persona drop column idMascota;
	
#eliminamos clave primaria 
alter table persona drop primary key;

#eliminaos clave foranea con el nombre del foreign key
Alter table persona drop foreign key fk_persona_mascota;
#usamos en caso de que no sepamos el nombre 
show create table persona;


#eliminar tabla en caso de que no tenga llaves foraneas con ninguna mas 
drop table if exists mascota;

#eliminar tabla con llaves foraneas OJO AL USAR no sabemos como funciona 

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists persona;
SET FOREIGN_KEY_CHECKS = 1;








