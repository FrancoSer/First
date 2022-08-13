CREATE DATABASE Peluqueria_Canina; #crea la Base de Datos

USE Peluqueria_Canina; #Se selecciona la Base de datos para trabajar con ella

DROP TABLE IF EXISTS dueno; # si la tabla dueño no existe se crea
CREATE TABLE dueno
(
DNI int NOT NULL UNIQUE,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
telefono int,
direccion varchar(70),
PRIMARY KEY (DNI)
);

DROP TABLE IF EXISTS perro; #si la tabla perro no existe se crea
CREATE TABLE perro
(
id_perro int NOT NULL AUTO_INCREMENT,
nombre varchar(50) NOT NULL,
fecha_nac date NOT NULL,
sexo varchar(10) NOT NULL,
dni_dueno int NOT NULL,
PRIMARY KEY (id_perro),
FOREIGN KEY (dni_dueno) REFERENCES dueno (DNI) #clave foránea de la tabla dueno
);

CREATE TABLE historial
(
id_historial int NOT NULL AUTO_INCREMENT,
fecha datetime NOT NULL,
descripcion varchar(60),
monto double,
perro int,
PRIMARY KEY (id_historial),
FOREIGN KEY (perro) REFERENCES perro (id_perro) #clave foránea de la tabla perro
);

ALTER TABLE historial MODIFY descripcion varchar(255); # cambié la cantidad de caracteres de varchar descripcion

INSERT INTO dueno (DNI, nombre, apellido, telefono, direccion) #inserta registros en tabla dueno
VALUES
(98059339, 'Santiago', 'Santy', 448488484, 'Salsipuedes 67'),
(94039485, 'Maiku', 'Mikenetor', 546786556, 'Venezuela País 2433'),
(99458676, 'Shikamaru', 'Nara', 475868847, 'Calamuchita s/n'),
(98574747, 'Giako', 'Binni', 475868488, 'Buenos Aires 888');

DESCRIBE dueno; #muestra la tabla historial
DESCRIBE perro;
DESCRIBE historial;
SELECT * FROM dueno;
SELECT * FROM perro; #hace una consula de lo que tiene la tabla perro 
SELECT * FROM historial; #hace una consula de lo que tiene la tabla historial
# comandos para borrar tablas con sus claves foráneas
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE table dueno; 
TRUNCATE table historial; 
TRUNCATE table perro; 
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO perro (nombre, fecha_nac, sexo, dni_dueno) #agrega valores a los registros en la tabla perro
VALUES
('Ikari', '2016-04-14', 'Masculino', 98059339),
('LunaCat', '2020-12-25', 'Femenino', 94039485),
('Pipi', '2021-03-12', 'Masculino',99458676),
('Ellie', '2016-02-03', 'Femenino', 98574747);

INSERT INTO historial (fecha, descripcion, monto, perro) #agrega valores en los registros en la tabla historial
VALUES
('2022-08-04 14:06:00', 'El perrito de 7 años ingresa con la pata izquierda sin poder acentarla en el suelo', 2000, 1),
('2022-08-09 10:50:00', 'La perrita de 2 años ingresa para realizar una desparacitación', 2500, 2),
('2022-08-10 11:30:00', 'El perrito de 1 año ingresa por chequeo ', 3000, 3),
('2022-08-11 05:00:00', 'La perrita de 7 años ingresa con empacho', 2000, 4);

#6.Obtener todos los perros que asistieron a la peluquería en 2022

SELECT * FROM historial WHERE fecha LIKE '2022%';

#8.Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10.
INSERT INTO dueno (DNI, nombre, apellido, telefono, direccion)
VALUES
(99578388, 'Hydrogen', 'Sensei', 448455684, 'Tucora 48');
INSERT INTO perro (id_perro, nombre, fecha_nac, sexo, dni_dueno)
VALUES
(10,'Kiki', '2021-05-11', 'Masculino', 99578388);
INSERT INTO historial (fecha, descripcion, monto, perro)
VALUES
('2022-08-11 18:26:00', 'El perrito de 1 año ingresa con una pequeña lesión en la pata trasera derecha', 2000, 10);

#Inserta un nuevo registro en el historial del perro con ID 10
INSERT INTO historial (fecha, descripcion, monto, perro)
VALUES
('2022-08-12 10:04:00', 'El perrito de 1 año ingresa para hacer una limpieza en su lesión en la pata trasera derecha', 1500, 10);