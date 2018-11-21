-- 1.
CREATE TABLE Socios(
    documento char(8) NOT NULL PRIMARY KEY,
    nombre varchar(40),
    domicilio varchar(30)
);

CREATE TABLE Profesores(
    documento char(8) NOT NULL PRIMARY KEY,
    nombre varchar(40),
    domicilio varchar(30)
);

CREATE TABLE Cursos(
    numero serial PRIMARY KEY,
    deporte varchar(20),
    dia varchar(15),
    documentoprofesor char(8)
);

CREATE TABLE Inscritos(
    documentosocio char(8) NOT NULL,
    numero smallint NOT NULL,
    matricula char(1),
    PRIMARY KEY(documentosocio, numero)
);
-- 2.
INSERT INTO cursos (numero, deporte, dia, documentoprofesor) VALUES ('1', 'futbol', 'lunes', '13'), ('2', 'tenis', 'martes', '14');
INSERT INTO inscritos (documentosocio, numero, matricula) VALUES ('999', '1', 'A'), ('888', '2', 'B'), ('000', '2', 'D');
INSERT INTO profesores (documento, nombre, domicilio) VALUES ('13', 'Juan Perez', 'Calle Falsa'), ('14', 'Domingo Dominguez', 'Calle Verdadera');
INSERT INTO socios (documento, nombre, domicilio) VALUES ('888', 'Asd WQerr', 'Unodos'), ('999', 'Azerty', 'Sisisi'), ('000', 'Pedro Piedra', 'Yey');
-- 3.
CREATE VIEW pregunta_tres AS
SELECT Socios.nombre as NombreSocio, Socios.documento, Cursos.deporte, Cursos.dia, Profesores.nombre as NombreProfe
FROM Socios INNER JOIN Inscritos
ON Socios.documento = Inscritos.documentosocio
INNER JOIN Cursos
ON Inscritos.numero = Cursos.numero
INNER JOIN Profesores
ON Cursos.documentoprofesor = Profesores.documento;
-- 4.
SELECT * from pregunta_tres;
-- 5.
SELECT deporte, COUNT(*) as cantidad FROM pregunta_tres GROUP BY deporte ORDER BY cantidad;
-- 6-9 no se pueden realizar con esta vista.
-- 10.
select nombreprofe, dia from pregunta_tres GROUP BY nombreprofe, dia;
-- 11. 
select nombreprofe, dia from pregunta_tres GROUP BY nombreprofe, dia ORDER BY dia;
-- 12.
select nombresocio from pregunta_tres where deporte = 'tenis' and dia = 'lunes';