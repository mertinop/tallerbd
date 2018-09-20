-- NOTA: En cada consulta se muestra solo una vez cada cliente.
-- 1.- Realice una sentencia SQL que muestre la suma de 2 números.
SELECT 2+2;
-- 2.- Realice una consulta que muestre todas las clientes que compran productos en promoción.
SELECT DISTINCT Cliente.rut, Cliente.dv, Cliente.nombres, Cliente.apellido_pat, Cliente.apellido_mat
FROM Cliente 
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE Compra.promocion = true;


-- 3.- Genere un listado donde aparezca el nombre de cada cliente junto a su nivel educacional, de forma que quede:
-- “El cliente “ xxxxxx “su nivel educacional es “ yyyyyyyy”
SELECT 'El cliente ' || Cliente.nombres || Cliente.apellido_pat || Cliente.apellido_mat || ' su nivel educacional es ' || NivelEducacion.texto
FROM Cliente 
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN DatosSuscriptor
ON Tarjeta.id = DatosSuscriptor.id_tarjeta
INNER JOIN NivelEducacion
ON DatosSuscriptor.educacion = NivelEducacion.id;
-- 4.- Realice dos consultas que muestre todos los clientes que son solteros y que compran
-- productos en promoción y los que son casados, que compren productos en promoción.
-- ¿Quién compra más?

-- (1, 'SOLTERO')
SELECT DISTINCT Cliente.rut, Cliente.dv, Cliente.nombres, Cliente.apellido_pat, Cliente.apellido_mat
FROM Cliente
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN DatosSuscriptor
ON Tarjeta.id = DatosSuscriptor.id_tarjeta
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE DatosSuscriptor.estado_civil = 1 AND Compra.promocion = true;
-- (3, 'CASADO'),
SELECT DISTINCT Cliente.rut, Cliente.dv, Cliente.nombres, Cliente.apellido_pat, Cliente.apellido_mat
FROM Cliente
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN DatosSuscriptor
ON Tarjeta.id = DatosSuscriptor.id_tarjeta
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE DatosSuscriptor.estado_civil = 3 AND Compra.promocion = true;