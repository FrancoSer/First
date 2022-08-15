#DROP DATABASE peluqueriaCanina;
create database if not exists peluqueriaCanina;
use peluqueriaCanina;
create table dueno(
dni int not null unique,
nombre varchar (30) not null,
apellido varchar (30) not null,
telefono bigint not null,
direccion varchar (50) not null,
constraint pk_dni primary key (dni)
);
create table perro(
idPerro int not null,
nombrePerro varchar (30) not null,
fechaNac date,
sexo varchar (10) not null,
dniDueno int,
constraint pk_id_p primary key (idPerro),
constraint fk_dni_d foreign key (dniDueno) references dueno (dni)
);
create table historial
(
idHistorial int NOT NULL AUTO_INCREMENT,
fecha datetime NOT NULL,
descripcion varchar(60),
monto double,
perro int,
PRIMARY KEY (idHistorial),
FOREIGN KEY (perro) REFERENCES perro (idPerro)  
);
insert into dueno (dni, nombre, apellido, telefono, direccion) values ('36139680','Luis Pablo','Rios','3513155670','Arturo Orgaz 1905');
insert into perro (idPerro,nombrePerro,fechaNac,sexo,dniDueno) values (1,'Deku','2016-02-03','MACHO','36139680');
#select *from dueno;
#select*from perro;
#select*from historial;

INSERT INTO dueno (dni, nombre, apellido, telefono, direccion) 
VALUES
(35454555, 'Jose', 'Varsoti', 35148454, 'Don Orione 67'),
(33454454, 'Pablo', 'Ruiz', 35148745, 'Camino del cielo 2433'),
(38582456, 'Florencia', 'Tapia', 35145875, 'Atahualpa 45'),
(40452451, 'Ulises', 'Camino', 35134568, 'Cosquin 234');

INSERT INTO perro (idPerro,nombrePerro, fechaNac, sexo, dniDueno) 
VALUES
(2,'Krol', '2014-04-10', 'Macho',35454555 ),
(3,'Malteada', '2018-10-23', 'Macho', 33454454),
(4,'Bowser', '2019-05-10', 'Macho',38582456),
(5,'Moma', '2022-04-07', 'Hembra',40452451 );
UPDATE perro set sexo= 'Macho' WHERE idPerro=1 ;#modifique el string de sexo,lo habia colocado en mayusculas

INSERT INTO historial (fecha, descripcion, monto, perro) 
VALUES
('2022-07-04 18:06:00', 'Se coloca inyeccion antiparasitaria',2500, 1),
('2022-08-09 13:50:00', 'Consulta por infeccion en ojo izquierdo', 1500, 2),
('2022-07-05 11:30:00', 'Curacion post castramiento mas antibioticos', 800, 3),
('2022-08-11 08:00:00', 'Cirugia extraccion dientes superiores', 9470, 4),
('2022-07-22 16:00:00', 'Castracion', 12450, 5);
#select * FROM historial;
#DELETE FROM historial;

#7. Obtener los ingresos percibidos en Julio del 2022
SELECT fecha as Fecha,monto as Ingresos from historial WHERE MONTH(fecha) = 07 AND YEAR(fecha) = 2022










