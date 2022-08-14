
-- -----------------------------------------------------
-- Base de Datos - PeluqueriaCanina
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS PeluqueriaCanina;
USE PeluqueriaCanina ;

-- -----------------------------------------------------
-- Tabla "PeluqueriaCanina.Dueño"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PeluqueriaCanina.Dueno (
  DNI INT NOT NULL UNIQUE,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Telefono bigint NOT NULL,
  Direccion TEXT(55) NOT NULL,
  CONSTRAINT PRIMARY KEY (DNI)
);


-- -----------------------------------------------------
-- Tabla "PeluqueriaCanina.Perro"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PeluqueriaCanina.Perro (
  idPerro INT AUTO_INCREMENT NOT NULL,
  NombrePerro VARCHAR(45) NOT NULL,
  Fecha_nac DATE NOT NULL,
  Sexo VARCHAR(45) NOT NULL,
  DNI_dueno INT NOT NULL,
  PRIMARY KEY (idPerro),
  CONSTRAINT DNI_dueno
    FOREIGN KEY (DNI_dueno)
    REFERENCES PeluqueriaCanina.Dueno (DNI)
);

-- -----------------------------------------------------
-- Tabla "PeluqueriaCanina.Historial"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PeluqueriaCanina.Historial (
  idHistorial INT AUTO_INCREMENT NOT NULL,
  Fecha DATE NOT NULL,
  Perro INT NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  Monto INT NOT NULL,
  PRIMARY KEY (idHistorial),
  CONSTRAINT Perro
    FOREIGN KEY (Perro)
    REFERENCES PeluqueriaCanina.Perro (idPerro)
);


-- 2.Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) 
VALUES
('35648345', 'Mario', 'Rojas', '3415555555', 'Chapecu 3232'),
('20238101','Rodrigo', 'Lopez', '7786801467', 'Florida 1114'),
('34818899', 'Marieta', 'Sanchez', '8893589129', 'Beneviento 444');

INSERT INTO Perro (NombrePerro, Fecha_nac, Sexo, DNI_dueno) 
VALUES
("Pupi", "2019-01-02", 'Femenino', '35648345'),
("Floppy", "2012-12-25",'Femenino','20238101'),
("Black", "2018-02-09",'Macho','34818899');

SELECT * FROM PeluqueriaCanina.Dueno;
SELECT * FROM PeluqueriaCanina.Perro;

-- 11.Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.

	-- Inserto datos en el historial
INSERT INTO Historial (Fecha, Perro, Descripcion, Monto) 
VALUES
('2022-08-04 14:06:00', 1, 'Perrita atendida para el control de pulgas', 1500),
('2014-10-19 09:30:00', 2, 'Perra para corte de uñas', 1200),
('2019-01-20 16:30:00', 3, 'Perro atendido para realizar baño, corte de pelo', 4200);

	-- calculo la edad de los perros (no lo termine usando)
SELECT Fecha_nac, TIMESTAMPDIFF(YEAR, Fecha_nac, '2022-08-01') AS edadPerro from PeluqueriaCanina.Perro;

    -- Obtengo el dni del dueño del perro que haya nacido en un año mayor a (2017-01-01)
SELECT DNI
FROM Perro
INNER JOIN Dueno dueño ON dueño.dni = Perro.DNI_dueno # Inner Join recupera todos los registros con coincidencias en las tablas involucradas (excluye los que no tienen coincidencias)
WHERE DATE(Fecha_nac) >= '2017-01-01'
AND Perro.idPerro NOT IN
	(SELECT 
		DISTINCT Perro # DISTINTCT nos devuelve valores unicos o diferentes
	FROM Historial
    WHERE Fecha >= "2022-01-01");
    
#El resultado es el dni 34.818.899 que corresponde a Marieta dueña del perro llamado Black que es el unico que cumple con los requisitos del ejercicio nuduenomero 11.
