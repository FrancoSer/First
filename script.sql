CREATE DATABASE peluqueria_canina;
USE peluqueria_canina;
CREATE TABLE dueno(
dni INT NOT NULL UNIQUE,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
telefono VARCHAR(10) NOT NULL,
direccion VARCHAR(50) NOT NULL,
CONSTRAINT pk_dni PRIMARY KEY (dni)
);
CREATE TABLE perro(
id_perro INT AUTO_INCREMENT NOT NULL,
nombre_p VARCHAR(30) NOT NULL,
fecha_nac VARCHAR(15),
sexo VARCHAR (15) NOT NULL,
dni_dueno INT,
CONSTRAINT pk_id_perro PRIMARY KEY (id_perro),
CONSTRAINT fk_dni_dueno FOREIGN KEY (dni_dueno) REFERENCES dueno (dni)
);
CREATE TABLE historial(
id_historial INT AUTO_INCREMENT NOT NULL,
fecha_h DATE,
id_perro_h INT,
descripcion VARCHAR(300),
monto DECIMAL NOT NULL DEFAULT '0.00' NOT NULL,
CONSTRAINT pk_id_historial PRIMARY KEY (id_historial),
CONSTRAINT fk_id_perro FOREIGN KEY(id_perro_h) REFERENCES perro (id_perro)

);

/********Consultas a la base de datos Peluqueria_canina segun consignas********/


/* Se agregan datos de 4 dueños a la table dueno y 4 perros a la tabla dueno */

INSERT INTO dueno VALUES
(24300400,'Pedro', 'Sanchez','3512112562','Av rojas 311' ),
(24300200,'Juan', 'Lopez','3512112388','Av Liniers 400' ),
(24100100,'Maria', '14/03/2017','3512144321','Quilmes 3240' ),
(24000000,'Felipe', '04/03/2016','354165788','Maipu 18' );

INSERT INTO perro VALUES
(1,'Tom', '01/03/2018','Macho',24300400 ),
(2,'Jerry', '19/05/2020','Macho',24300200 ),
(3,'Lassy', '14/03/2017','Hembra',24100100 ),
(4,'Otto', '04/03/2016','Macho',24000000 );

/*Actualizacion de direccion de un dueño de Maipu 18 a Libertad 123 */

UPDATE dueno 
SET direccion = 'Libertad 123' 
WHERE dni = 24000000 ;


/*Consultar tabla dueno*/
SELECT * FROM dueno;

/*Actualizacion de fecha de nacimiento de un perro de la tabla */
UPDATE perro
SET fecha_nac = '10/10/2022' 
WHERE id_perro= 1;
/*Consulta sobre los perros de sexo 'Hembra' en la tabla perro */

SELECT * FROM perro WHERE sexo BETWEEN 'Hembra'AND 'Hembra';

/*Consultar tabla perro */
SELECT * FROM perro;
