CREATE TABLE NivelEducacion(
  id int PRIMARY KEY,
  texto text
);
INSERT INTO NivelEducacion (id, texto) VALUES 
(1, 'ESTUDIANTE UNIVERSITARIO'),
(2, 'EDUC. UNIVERSITARIA'),
(3, 'EDUC. TÉCNICA'),
(4, 'EDUC. MEDIA');
CREATE TABLE EstadoCivil(
  id int PRIMARY KEY,
  texto text
);
INSERT INTO EstadoCivil (id, texto) VALUES
(1, 'SOLTERO'),
(2, 'VIUDO'),
(3, 'CASADO'),
(4, 'SEPARADO');
CREATE TABLE Actividad(
  id int PRIMARY KEY,
  texto text
);
INSERT INTO Actividad (id, texto) VALUES
(1, 'DEPENDIENTE'),
(2, 'ESTUDIANTE'),
(3, 'EMPRESARIO');
CREATE TABLE Producto(
  id int PRIMARY KEY,
  precio int,
  nombre text
);
INSERT INTO Producto(id, nombre) VALUES
(1, 'A'),
(2, 'B');
CREATE TABLE Cliente(
  rut int PRIMARY KEY,
  dv int,
  nombres text,
  apellido_pat text,
  apellido_mat text
);
CREATE TABLE Tarjeta(
  id serial PRIMARY KEY,
  rut_cliente int,
  FOREIGN KEY (rut_cliente) REFERENCES Cliente(rut) ON DELETE CASCADE,
  meses_deuda int,
  anho_apertura int,
  cupo_max numeric,
  porc_uso numeric(4, 1) CHECK (porc_uso >= 0),
  atrasos int,
  promedio_compras int
);
CREATE TABLE DatosSuscriptor(
  id_tarjeta int PRIMARY KEY,
  FOREIGN KEY (id_tarjeta) REFERENCES Tarjeta(id) ON DELETE CASCADE,
  rango_etario text,
  educacion int,
  estado_civil int,
  actividad int,
  FOREIGN KEY (educacion) REFERENCES NivelEducacion(id) ON DELETE CASCADE,
  FOREIGN KEY (estado_civil) REFERENCES EstadoCivil(id) ON DELETE CASCADE,
  FOREIGN KEY (actividad) REFERENCES Tarjeta(id) ON DELETE CASCADE
);
CREATE TABLE Compra(
  id serial PRIMARY KEY,
  id_tarjeta int,
  id_producto int,
  FOREIGN KEY (id_tarjeta) REFERENCES Tarjeta(id) ON DELETE CASCADE,
  FOREIGN KEY (id_producto) REFERENCES Producto(id) ON DELETE CASCADE,
  cantidad int,
  promocion boolean
);

CREATE TABLE dumpeo(
  id int PRIMARY KEY,
  rut int,
  dv int,
  apellido_pat text,
  apellido_mat text,
  nombres text,
  rango_etario text,
  educacion int,
  estado_civil int,
  actividad int,
  meses_deuda int,
  anho_apertura int,
  cupo_max numeric,
  porc_uso numeric(4, 1) CHECK (porc_uso >= 0),
  promedio_compras int,
  unidades_a int,
  unidades_b int,
  atrasos int,
  promocion boolean
);

COPY dumpeo FROM 'C:\Users\marti\import.csv' DELIMITER ';' CSV HEADER;

INSERT INTO Cliente (rut, dv, nombres, apellido_pat, apellido_mat) 
SELECT DISTINCT ON (rut) rut, dv, nombres, apellido_pat, apellido_mat FROM dumpeo;
 
INSERT INTO Tarjeta(id, rut_cliente, meses_deuda, anho_apertura, cupo_max, porc_uso, atrasos, promedio_compras)
SELECT id, rut, meses_deuda, anho_apertura, cupo_max, porc_uso, atrasos, promedio_compras FROM dumpeo;

INSERT INTO DatosSuscriptor(id_tarjeta, rango_etario, educacion, estado_civil, actividad)
SELECT id, rango_etario, educacion, estado_civil, actividad FROM dumpeo;

INSERT INTO Compra(id_tarjeta, id_producto, cantidad, promocion)
(SELECT id, 1, unidades_a, promocion FROM dumpeo);
INSERT INTO Compra(id_tarjeta, id_producto, cantidad, promocion)
(SELECT id, 2, unidades_b, promocion FROM dumpeo); 
DROP TABLE dumpeo;