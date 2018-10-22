-- 2.  Actualizar el porcentaje de uso de cupos en 10% de los productos. 
CREATE OR REPLACE FUNCTION  diezporc()
RETURNS void AS $diezporc$
declare
	porc numeric(4,1);
	rec RECORD;
BEGIN
    FOR rec IN SELECT id, porc_uso
    FROM Tarjeta
    LOOP 
	    UPDATE Tarjeta
	    SET porc_uso = rec.porc_uso*1.1
	    WHERE id = rec.id;
	    RAISE NOTICE '%', rec.porc_uso*1.1;
    END LOOP;
END;
$diezporc$ LANGUAGE plpgsql;

SELECT diezporc();

-- 3.  Actualizar el Estado civil del cliente cuyo nombre es Maria Cristina Cedres a 
-- soltero
CREATE OR REPLACE FUNCTION solterar(nombres text, apellido text)
RETURNS void AS $solterar$
BEGIN
    UPDATE DatosSuscriptor
        SET estado_civil = 1
    FROM Tarjeta
    INNER JOIN Cliente
        ON Tarjeta.rut_cliente = Cliente.rut
    WHERE Cliente.nombres = solterar.nombres
        and Cliente.apellido_pat = solterar.apellido
        and DatosSuscriptor.id_tarjeta = Tarjeta.id;
END;
$solterar$ LANGUAGE plpgsql;
SELECT solterar('MARIA CRISTINA', 'CEDRES');

-- 4.  Borrar al cliente Arias.
CREATE OR REPLACE FUNCTION matar(apellido text)
RETURNS void AS $matar$
BEGIN
    DELETE FROM Cliente 
    WHERE apellido_pat=matar.apellido;
END;
$matar$ LANGUAGE plpgsql;
SELECT matar('ARIAS');

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