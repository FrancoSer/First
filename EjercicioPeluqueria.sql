CREATE DATABASE peluqueria_canina;
USE peluqueria_canina;
CREATE TABLE dueno(
dni INT NOT NULL UNIQUE,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
telefono VARCHAR(10) NOT NULL,
direccion VARCHAR(50) NOT NULL,
CONSTRAINT primarykey_dni PRIMARY KEY (dni)
);
CREATE TABLE perro(
id_perro INT AUTO_INCREMENT NOT NULL,
nombre_p VARCHAR(30) NOT NULL,
fecha_nac VARCHAR(15),
sexo VARCHAR (15) NOT NULL,
dni_dueno INT,
CONSTRAINT primarykey_id_perro PRIMARY KEY (id_perro),
CONSTRAINT fk_dni_dueno FOREIGN KEY (dni_dueno) REFERENCES dueno (dni)
);
CREATE TABLE historial(
id_historial INT AUTO_INCREMENT NOT NULL,
fecha_h DATE,
id_perro_h INT,
descripcion VARCHAR(300),
monto DECIMAL NOT NULL DEFAULT '0.00' NOT NULL,
CONSTRAINT primarykey_id_historial PRIMARY KEY (id_historial),
CONSTRAINT fk_id_perro FOREIGN KEY(id_perro_h) REFERENCES perro (id_perro)

);




/* Se agregan datos de dueños a la table dueno y  perros a la tabla dueno */

INSERT INTO dueno VALUES
(35205798,'Carlos', 'Perez','5492184503','Chaco 32' ),
(24300500,'Ramon', 'Martinez','5492180201','Av Libertador 4122' ),
(24100600,'Marta', 'Flores','5492180302','Alpina 344' ),
(24000900,'Ignacio', 'Gimenez','5492184345','Soler 51' );

INSERT INTO perro VALUES
(1,'Gino', '19/07/2018','Macho',35205798 ),
(2,'Raul', '05/08/2020','Macho',24300500 ),
(3,'Chiquita', '10/09/2017','Hembra',24100600 ),
(4,'Chimuelo', '21/05/2016','Macho',24000900 );





/*Consultar tabla perro */
SELECT * FROM perro;

/*Actualizacion de fecha de nacimiento de un perro de la tabla */
UPDATE perro
SET fecha_nac = '10/07/2021' 
WHERE id_perro= 1;


/*Consultar tabla dueno*/
SELECT * FROM dueno;

/*Actualizacion de direccion de un dueño de Chaco 32 a Libertad 123 */

UPDATE dueno 
SET direccion = 'Libertad 123' 
WHERE dni = 35205798 ;


