
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


#MODIFICAR la estructura de una tabla   


#ahora vamos a modificar el tipo de dato de una columna ya con registros agregados tambien podemos usar CHANGE nombre_columna nombre_columna_modificada
#aqui cambiamos el numero de caracteres ya que es un tipo de dato compatible, cambiamos de varchar(30) a varchar(50) 
alter table persona modify column nombre varchar(50);

#aqui intentamos cambiar el tipo de dato de varchar(30) a int, pero ya haciendo datos de tipo string no se puede directamente cambiar el tipo de dato.
#solo podemos moficiar el tipo de datos en caso de que no hayamos agregados registros con valores a esta columna
alter table persona modify column nombre int;

#actualizamos el nombre de la tabla
ALTER TABLE persona RENAME humano;







