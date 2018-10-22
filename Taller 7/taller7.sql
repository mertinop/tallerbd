-- 3.  Actualizar el Estado civil del cliente cuyo nombre es Maria Cristina Cedres a 
-- soltero
UPDATE DatosSuscriptor
    SET estado_civil = 1
FROM Tarjeta
INNER JOIN Cliente
    ON Tarjeta.rut_cliente = Cliente.rut
WHERE Cliente.nombres = 'MARIA CRISTINA' 
    and Cliente.apellido_pat = 'CEDRES' 
    and DatosSuscriptor.id_tarjeta = Tarjeta.id;

-- 4.  Borrar al cliente Arias.
-- Primero sera necesario actualizar los constraint para que se borre en cascada:
ALTER TABLE Tarjeta DROP CONSTRAINT tarjeta_rut_cliente_fkey;
ALTER TABLE Tarjeta ADD FOREIGN KEY (rut_cliente) REFERENCES Cliente(rut)
ON DELETE CASCADE;
ALTER TABLE DatosSuscriptor DROP CONSTRAINT datossuscriptor_id_tarjeta_fkey;
ALTER TABLE DatosSuscriptor ADD FOREIGN KEY (id_tarjeta) REFERENCES Tarjeta(id)
ON DELETE CASCADE;
ALTER TABLE Compra DROP CONSTRAINT compra_id_tarjeta_fkey;
ALTER TABLE Compra ADD FOREIGN KEY (id_tarjeta) REFERENCES Tarjeta(id)
ON DELETE CASCADE;
-- Ya podemos eliminar con seguridad.
DELETE FROM Cliente 
WHERE apellido_pat='ARIAS';

-- 5.  Escriba un procedimiento que reciba como parámetro un nombre de un cliente y que 
-- devuelva el número de veces que compra en promdeio al año. 
CREATE OR REPLACE FUNCTION  pcmprs(nombres text, apellido text)
RETURNS integer AS $pcmprs$
declare
	promedio integer;
BEGIN
   SELECT promedio_compras into promedio
    FROM Tarjeta
    INNER JOIN Cliente
    ON Tarjeta.rut_cliente = Cliente.rut
    WHERE Cliente.nombres = pcmprs.nombres AND Cliente.apellido_pat = pcmprs.apellido;
   RETURN promedio;
END;
$pcmprs$ LANGUAGE plpgsql;

SELECT pcmprs('MARIA ELSA', 'CASAS');
SELECT pcmprs('ORESTES', 'FIANDRA');