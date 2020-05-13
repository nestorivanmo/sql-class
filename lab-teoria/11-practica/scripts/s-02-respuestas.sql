---@Autor(es): Néstor Iván Martínez Ostoa
---@Fecha de creación: 13/05/2020
---@Descripcón: Sentencias práctica 11.

/*
1. Seleccionar el número total de artículos que pertenecen a las subastas del 
2010, así como el total de los ingresos obtenidos en las subastas del 2010. 
Emplear como nombres de columnas: num_articulos, ingresos. 

Emplear sintaxis estándar.
R: Se han vendido 309 artículos
*/


/*
2. Mostrar el total de artículos que no fueron vendidos en las subastas del 2010

R: El resultado debe estar entre 187 y 190
*/

/*
3. Generar una consulta que contenga las siguientes columnas considerando 
únicamente a la subasta ‘EXPO-MAZATLAN’
 Precio inicial del artículo más barato (precio de compra)
 Precio Inicial más caro
 Precio de venta más barato,
 Precio de venta más caro

R: El resultado es un solo registro con las 4 columnas anteriores, el precio más
barato de compra es 34001.52.
*/


/*
4. Se ha detectado que en la base de datos existen clientes nacidos entre los 
años 1970 y 1975 que tienen registrada al menos una tarjeta de crédito, pero que
 no han comprado artículos en las subastas. Generar un reporte que muestre el 
 identificador, el email y el número de tarjeta de dichos clientes. 
 
Tip: Los clientes que no han comprado artículos no tienen registro en 
subasta_venta.

R: Se obtiene un solo registro.
*/


/*
5. Se desea generar un reporte estadístico que contenga la cantidad de artículos
que hayan sido vendidos o entregados para cada uno de los tipos existentes. 
Genere una sentencia SQL que genere el reporte solicitado mostrando el número de
artículos, el tipo de artículo y la clave del status.


R: Se deben obtener 6 registros.
*/


/*
6. Suponga que se desea generar un reporte anual que muestre los totales 
recaudados en cada subasta realizada en el 2009, y por cada tipo de artículo. 
Genere un reporte que muestre, el nombre de la subasta, la fecha de inicio, el 
lugar en la que se realizó, el tipo de articulo y el monto total recaudado 
ordenadas del mayor al menor monto obtenido 

Emplear notación SQL estándar.
R: Se deben obtener 18 registros.
*/


/*
7. La empresa desea regalar un artículo a todos los clientes que cumplan con 
alguna de las siguientes condiciones:
a. Que el cliente haya comprado más de 5 productos desde que se registró en la 
base de datos.
b. Que el monto total de todos los productos que haya comprado supere a los 
$3,000,000.

Generar una sentencia SQL empleando operadores del álgebra relacional 
(Set operators). Determine id, nombre, apellidos, numero de productos
comprados y monto total.


R: Los montos totales y el número de artículos son: TOTAL NUM_ARTICULOS
========== =============
4487933.17 6
3542077.21 4 
3034465.63 4 
3421015.72 5 
3083806.95 4 
3859436.78 4 
3116215.04 5 
3481850.47 6
*/


/*

8. Para cada una de las subastas que se realizaron durante los meses enero, 
marzo y junio del 2010, mostrar id, nombre, fecha inicio de la subasta, así como
el nombre y clave del artículo más caro (precio venta) que se haya vendido o 
entregado.

R: Se deben obtener 11 registros.
*/

/*
9. Calcular el monto total de la última factura del cliente GALILEA GOMEZ 
GONZALEZ.

R: Se debe obtener $ 1765264.89
*/

/*
10. Suponga que, para el próximo año, la empresa va a repetir la misma ronda de 
subastas por el éxito que tuvieron durante el 2010 a excepto de todas aquellas 
que hayan vendido 3 o menos artículos. Determinar id de la subasta, nombre, 
número de artículos vendidos de las subastas que podrán ser repetidas ordenadas 
por id.

R: Se deben obtener 11 subastas.
*/


/*
11. En julio del 2010 la empresa lanzó una promoción de venta de Motocicletas 
en sus subastas. Se desea generar un reporte que muestre los siguientes datos:
a. Identificador de la subasta, fecha de inicio, identificador del artículo, 
nombre del artículo, precio inicial del artículo de todas las motocicletas que 
se vendieron o entregaron a un cliente en las subastas que se realizaron en el 
periodo que duró la promoción.
b. Agregar una columna más al reporte (columna de referencia), que indique el 
promedio del precio inicial de todas las motocicletas considerando todo el año 
2010 sin importar si estas fueron vendidas o entregadas a un cliente.

SUBASTA_ID FECHA_INICIO ARTICULO_ID NOMBRE DEL ARTICULO PRECIO INICIAL PROMEDIO 
1 24/07/2010 232 Motocicleta turbo 879238.28 782932.34 
1 2/07/2010  232 Motocicleta antigua 2342343.5 782932.34
1 15/07/2010 232 Motocicleta BMW 7827344.28 782932.34

R: Se debe obtener solo un artículo con id = 386, promedio general = 
412386.15208333335
*/


/*
12. La empresa decide reconocer a ciertos países por su buena participación: 
Generar un reporte con todos los datos de los países que han donado 3 o más 
artículos con un precio de venta inicial mayor a $300,000

R: Se deben obtener 2 países.
*/

/*
13. Generar una consulta que determine el id, nombre, fecha inicio e importe 
total de ventas de las subastas que durante el año 2010 hayan logrado obtener 
$3,000,000 o más en ventas.

R: Se deben obtener 5 subastas.
*/

/*
14. Se ha detectado que en la base de datos existen compras realizadas por 
algunos clientes sin factura con montos de más de $1,000,000, ya que la empresa 
tiene como política, que toda compra igual o superior a dicho monto, debe 
generar factura. Determine una sentencia SQL que muestre nombre, apellidos, y el
total del monto a cubrir, con la finalidad de notificarle al cliente la 
inexistencia de su factura.

R: Se deben obtener 6 registros.
*/


/*
15. Seleccionar todos los datos de la subasta que ha vendido el mayor número de
artículos registrada en la base de datos.

R: La subasta que más vendió se realizó en Cuernavaca y vendió 6 artículos.
*/