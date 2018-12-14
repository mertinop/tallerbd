# 1
``` 
pg_ctl initdb -D c:\db
psql -p 3540 -d postgres
pg_ctl -D C:\db -o "-p 3540" start
```
# 2
```
psql -p 3540 -d postgres
CREATE TABLE Socios(rut text, nombre text, domicilio text);
-- (BD postgres)
INSERT INTO Socios(rut, nombre, domicilio) VALUES ('12345678-9', 'Juan', 'CalleFalsa'), ('98765432-1', 'Diego', 'CalleVerdadera');
```
# 3
```
CREATE DATABASE bd2;
\c bd2
CREATE TABLE Socios(rut text, nombre text, domicilio text);
INSERT INTO Socios(rut, nombre, domicilio) VALUES ('0000000-9', 'Peter', 'Brasil 2241'), ('1111111-1', 'Vicente', 'Av. Siempre Viva 333');
```
# 4
```
CREATE SCHEMA esquema2;
```
# 5
```
CREATE TABLE esquema2.Socios(rut text, nombre text, domicilio text);
INSERT INTO esquema2.Socios(rut, nombre, domicilio) VALUES('59595959-4', 'Myriam', 'Arlegui 333'), ('48484848-3', 'Joselyn', 'Agua Santa 1234');
```
# 6
```
bd2=# select * from socios;
    rut    | nombre  |      domicilio
-----------+---------+----------------------
 0000000-9 | Peter   | Brasil 2241
 1111111-1 | Vicente | Av. Siempre Viva 333
(2 filas)


bd2=# select * from esquema2.socios;
    rut     | nombre  |    domicilio
------------+---------+-----------------
 59595959-4 | Myriam  | Arlegui 333
 48484848-3 | Joselyn | Agua Santa 1234
(2 filas)


bd2=# select * from public.socios;
    rut    | nombre  |      domicilio
-----------+---------+----------------------
 0000000-9 | Peter   | Brasil 2241
 1111111-1 | Vicente | Av. Siempre Viva 333
(2 filas)
```