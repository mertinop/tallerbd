CREATE TABLE logs(
    tiempo date,
    tipo text
);

CREATE OR REPLACE FUNCTION log_delete()
  RETURNS trigger AS
$del$
BEGIN
 INSERT INTO Logs(tiempo, tipo)
 VALUES(now(), "DELETE");
 RETURN NEW;
END;
$del$

CREATE TRIGGER Book
  BEFORE DELETE
  ON Books
  FOR EACH ROW
  EXECUTE PROCEDURE log_delete();