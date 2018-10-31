-- 1.-Construya un trigger llamado Artículos para postgresql que garantice que, al insertar un 
-- nuevo registro en la tabla Artículos, se guarda la fecha y hora de la inserción en el campo 
-- Auditoria. 

CREATE OR REPLACE FUNCTION auditoria_articulos()
  RETURNS trigger AS
$arts$
BEGIN
 INSERT INTO Auditoria(added_on)
 VALUES(now());
 RETURN NEW;
END;
$arts$

CREATE TRIGGER Articulos
  BEFORE INSERT
  ON articulos
  FOR EACH ROW
  EXECUTE PROCEDURE auditoria_articulos();
