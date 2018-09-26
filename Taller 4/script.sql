-- 1.- Realice una consulta que muestre por cada tipo de Nivel educacional y por cada estado
-- civil , la cantidad de productos en promoción comprados (por separado, indicando
-- aquellas que han comprado productos en promoción).
SELECT EstadoCivil.texto, COUNT(Compra.id) FROM EstadoCivil
INNER JOIN DatosSuscriptor
ON EstadoCivil.id = DatosSuscriptor.estado_civil
INNER JOIN Tarjeta
ON DatosSuscriptor.id_tarjeta = Tarjeta.id
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE Compra.promocion = true
GROUP BY EstadoCivil.texto;

SELECT NivelEducacion.texto, COUNT(Compra.id) FROM NivelEducacion
INNER JOIN DatosSuscriptor
ON NivelEducacion.id = DatosSuscriptor.educacion
INNER JOIN Tarjeta
ON DatosSuscriptor.id_tarjeta = Tarjeta.id
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
WHERE Compra.promocion = true
GROUP BY NivelEducacion.texto;
-- 2.- Realice una consulta donde aparezca el nombre de todos los clientes que han comprado
-- productos en promoción A.
SELECT nombres, apellido_pat FROM Cliente
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
INNER JOIN Compra
ON Tarjeta.id = Compra.id_tarjeta
INNER JOIN Producto
ON Compra.id_producto = Producto.id
WHERE Producto.nombre = 'A' AND Compra.promocion = true;
-- 3.- Realice una consulta que muestre los clientes que han realizado más de 5 compras en
-- el año .
SELECT rut, nombres, apellido_pat FROM Cliente
INNER JOIN Tarjeta
ON Cliente.rut = Tarjeta.rut_cliente
WHERE Tarjeta.promedio_compras > 5;