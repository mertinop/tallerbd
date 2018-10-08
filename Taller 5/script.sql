-- 1.- Realice una consulta que muestre el apellido con estado de nivel educacional estudiante
-- Universitario que compre productos en promoción.
SELECT apellido_pat, apellido_mat FROM Cliente
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN DatosSuscriptor
ON Tarjeta.id = DatosSuscriptor.id_tarjeta
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE Compra.promocion = true AND DatosSuscriptor.educacion = 1;
-- 2.- Realice una consulta que indique la cantidad de soltero con cupo máximo sobre
-- $300.000
SELECT COUNT(*) FROM DatosSuscriptor
INNER JOIN Tarjeta
ON DatosSuscriptor.id_tarjeta = Tarjeta.id
WHERE DatosSuscriptor.estado_civil = 1 AND Tarjeta.cupo_max > 300000;
-- 3.- Realice una consulta que muestre en nombres de clientes que más ha comprado en el
-- año
SELECT promedio_compras, Cliente.nombres FROM Tarjeta
INNER JOIN Cliente
ON Tarjeta.rut_cliente = Cliente.rut
ORDER BY promedio_compras DESC;