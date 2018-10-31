CREATE USER INF3540 WITH PASSWORD 'tallerbd';
> psql -U INF3540 -d taller
SELECT * FROM Cliente;
-- ERROR:  permiso denegado a la relación cliente
GRANT SELECT(nombres), INSERT(nombres), DELETE ON Cliente TO INF3540;
GRANT UPDATE(apellido_pat) ON Cliente TO INF3540;
taller=> UPDATE Cliente SET nombres='asdf';
-- ERROR:  permiso denegado a la relación cliente

CREATE VIEW view_tarjeta
 AS SELECT *
 FROM Tarjeta;