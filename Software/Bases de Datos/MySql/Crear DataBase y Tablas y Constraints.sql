#creamos una base de datos limpia
CREATE DATABASE basedeprueba;

#creamos una table persona con primary key. v1
create table persona(
id int not null primary key,
nombre varchar(30) default 'sn', 
fecha_nacimiento int);

#creamos otra tabla para utilizar los foreing keys
create table mascota(
id int not null primary key,
apodo varchar(30)
);


#AGREGAMOS Constrains y columnas 

#agregamos una clave primaria
alter table persona add constraint primary key(id);

#agregamos una columnna a una tabla 
alter table persona add column estatura int not null default 0;

#agregamos una columna a nuestra tabla persona y despues hacemos que sea referenciada(foreing key) a la tabla mascota
#la palabra 'fk_persona_mascota' es solo una palabra que escogemos para referencias este constraint que en este caso es una llave foranea

alter table persona 
add column id_mascota int not null,
add constraint fk_persona_mascota foreign key (id_mascota) references mascota(id);

 


#AQUI VAMOS A VER ALGUNAS FORMAS DE INICIAR UNA TABLA CON Y SIN LLAVE PRIMARIA

#creamos una tabla persona con primary key. V2 
create table persona(
id int not null,
nombre varchar(30) default 'sn', 
fecha_nacimiento int,
constraint primary key(id)
);

#creamos una tabla persona sin clave primaria 
create table persona(
id int not null,
nombre varchar(30) default 'sn', 
fecha_nacimiento int default null 
);