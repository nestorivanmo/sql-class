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
create table consulta_1 as
  select count(*) as num_articulos, sum(v.precio_venta) as ingresos
  from articulo a
  full outer join subasta s on a.subasta_id = s.subasta_id
  full outer join subasta_venta v on v.articulo_id = a.articulo_id
  where s.fecha_inicio between to_date('01/01/2010', 'dd/mm/yyyy') and 
  to_date('31/12/2010', 'dd/mm/yyyy');
  

/*
2. Mostrar el total de artículos que no fueron vendidos en las subastas del 2010

R: El resultado debe estar entre 187 y 190
*/
create table consulta_2 as
  select count(*) as total_vendidos
  from articulo a 
  join subasta s on s.subasta_id = a.subasta_id
  join status_articulo st on st.status_articulo_id = a.status_articulo_id
  where st.clave in ('REGISTRADO', 'EN SUBASTA') and
    s.fecha_inicio between to_date('01/01/2010', 'dd/mm/yyyy') and 
    to_date('31/12/2010', 'dd/mm/yyyy');


/*
3. Generar una consulta que contenga las siguientes columnas considerando 
únicamente a la subasta ‘EXPO-MAZATLAN’
 Precio inicial del artículo más barato (precio de compra)
 Precio inicial más caro
 Precio de venta más barato,
 Precio de venta más caro

R: El resultado es un solo registro con las 4 columnas anteriores, el precio más
barato de compra es 34001.52.
*/
create table consulta_3 as
  select min(a.precio_inicial) as mas_barato_compra, 
    max(a.precio_inicial) as mas_caro_compra, 
    min(v.precio_venta) as mas_barato_venta, 
    max(v.precio_venta) as mas_caro_venta
  from articulo a
  join subasta_venta v on v.articulo_id = a.articulo_id
  join subasta s on s.subasta_id = a.subasta_id
  where s.nombre = 'EXPO-MAZATLAN';


/*
4. Se ha detectado que en la base de datos existen clientes nacidos entre los 
años 1970 y 1975 que tienen registrada al menos una tarjeta de crédito, pero que
 no han comprado artículos en las subastas. Generar un reporte que muestre el 
 identificador, el email y el número de tarjeta de dichos clientes. 
 
Tip: Los clientes que no han comprado artículos no tienen registro en 
subasta_venta.

R: Se obtiene un solo registro.
*/
create table consulta_4 as
  select c.cliente_id, c.email, t.numero_tarjeta
  from cliente c
  join tarjeta_cliente t on t.cliente_id = c.cliente_id
  left join subasta_venta v on v.cliente_id = c.cliente_id  
  where c.fecha_nacimiento between to_date('01/01/1970', 'dd/mm/yyyy') and
    to_date('31/12/1975', 'dd/mm/yyyy')
    and v.precio_venta is null;


/*
5. Se desea generar un reporte estadístico que contenga la cantidad de artículos
que hayan sido vendidos o entregados para cada uno de los tipos existentes. 
Genere una sentencia SQL que genere el reporte solicitado mostrando el número de
artículos, el tipo de artículo y la clave del status.


R: Se deben obtener 6 registros.
*/
create table consulta_5 as
  select count(*) as num, a.tipo_articulo, s.clave
  from articulo a
  join status_articulo s on s.status_articulo_id = a.status_articulo_id
  group by a.tipo_articulo, s.clave
  having s.clave in ('VENDIDO', 'ENTREGADO');



/*
6. Suponga que se desea generar un reporte anual que muestre los totales 
recaudados en cada subasta realizada en el 2009, y por cada tipo de artículo. 
Genere un reporte que muestre, el nombre de la subasta, la fecha de inicio, el 
lugar en la que se realizó, el tipo de articulo y el monto total recaudado 
ordenadas del mayor al menor monto obtenido 

Emplear notación SQL estándar.
R: Se deben obtener 18 registros.
*/
create table consulta_6 as
  select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo, 
    sum(v.precio_venta) as total
  from articulo a
  join subasta_venta v on v.articulo_id = a.articulo_id
  join subasta s on s.subasta_id = a.subasta_id
  group by a.tipo_articulo, s.fecha_inicio, s.nombre, s.lugar
  having s.fecha_inicio between to_date('01/01/2009', 'dd/mm/yyyy') and
    to_date('31/12/2009', 'dd/mm/yyyy')
  ;

/*
7. La empresa desea regalar un artículo a todos los clientes que cumplan con 
alguna de las siguientes condiciones:
a. Que el cliente haya comprado más de 5 productos desde que se registró en la 
base de datos.
b. Que el monto total de todos los productos que haya comprado supere a los 
$3,000,000.

Generar una sentencia SQL empleando operadores del álgebra relacional (Set 
operators). 
Determine id, nombre, apellidos, numero de productos comprados y monto total.

*/
create table consulta_7 as
  select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno, 
    count(*) as num_prods, sum(v.precio_venta) as monto_total
  from cliente c 
  join subasta_venta v on v.cliente_id = c.cliente_id
  group by c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
  having count(*) >= 4
  intersect
  select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno, 
    count(*) as num_prods, sum(v.precio_venta) as monto_total
  from cliente c 
  join subasta_venta v on v.cliente_id = c.cliente_id
  group by c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
  having sum(v.precio_venta) >= 3000000;

/*

8. Para cada una de las subastas que se realizaron durante los meses enero, 
marzo y junio del 2010, mostrar id, nombre, fecha inicio de la subasta, así como
el nombre y clave del artículo más caro (precio venta) que se haya vendido o 
entregado.

R: Se deben obtener 11 registros.
*/
create table consulta_8 as
  select s.subasta_id, s.nombre, s.fecha_inicio, (a.nombre) as articulo_nombre,
    a.clave_articulo, v.precio_venta
  from subasta s
  join articulo a on a.subasta_id = s.subasta_id
  join subasta_venta v on v.articulo_id = a.articulo_id
  where to_char(s.fecha_inicio, 'yyyy') = '2010' and
    to_char(s.fecha_inicio, 'mm') in ('01', '03', '06') and
    v.precio_venta = (
      select max(v.precio_venta) as precio
      from subasta r
      join articulo a on a.subasta_id = r.subasta_id
      join subasta_venta v on v.articulo_id = a.articulo_id
      where r.subasta_id = s.subasta_id
    );


/*
9. Calcular el monto total de la última factura del cliente GALILEA GOMEZ 
GONZALEZ.

R: Se debe obtener $ 1765264.89
*/
create table consulta_9 as
  select sum(v.precio_venta) as precio_venta
  from subasta_venta v
  join cliente c on c.cliente_id = v.cliente_id
  join factura_cliente f on f.factura_cliente_id = v.factura_cliente_id
  where c.nombre = 'GALILEA' and c.apellido_paterno = 'GOMEZ' and
    c.apellido_materno = 'GONZALEZ'
    and f.fecha_factura = (
      select max(f.fecha_factura) as fecha_factura
      from factura_cliente f 
      join subasta_venta v on v.factura_cliente_id = f.factura_cliente_id
      where v.cliente_id = c.cliente_id
    );


/*
10. Suponga que, para el próximo año, la empresa va a repetir la misma ronda de 
subastas por el éxito que tuvieron durante el 2010 a excepto de todas aquellas 
que hayan vendido 3 o menos artículos. Determinar id de la subasta, nombre, 
número de artículos vendidos de las subastas que podrán ser repetidas ordenadas 
por id.

R: Se deben obtener 11 subastas.
*/
create table consulta_10 as
  select s.subasta_id, s.nombre, count(*) as vendidos
  from subasta s
  join articulo a on a.subasta_id = s.subasta_id
  join subasta_venta v on v.articulo_id = a.articulo_id
  group by s.nombre, s.subasta_id, s.fecha_inicio
  having count(*) >= 4 and to_char(s.fecha_inicio, 'yy') = '10'
  order by s.subasta_id; 


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
create table consulta_11 as
  select s.subasta_id, s.fecha_inicio, a.articulo_id, a.nombre, a.precio_inicial, 
    (
      select avg(a.precio_inicial)
      from articulo a
      join subasta s on s.subasta_id = a.subasta_id
      where instr(a.nombre, 'Motocicleta') != 0 and
        to_char(s.fecha_inicio, 'yy') = '10'
    ) as promedio_general
  from subasta s
  join articulo a on a.subasta_id = s.subasta_id
  join status_articulo st on st.status_articulo_id = a.status_articulo_id
  where instr(a.nombre, 'Motocicleta') != 0 and
    to_char(s.fecha_inicio, 'mm/yy') = '07/10' and
    st.clave in ('VENDIDO', 'ENTREGADO');

/*
12. La empresa decide reconocer a ciertos países por su buena participación: 
Generar un reporte con todos los datos de los países que han donado 3 o más 
artículos con un precio de venta inicial mayor a $300,000

R: Se deben obtener 2 países.
*/
create table consulta_12 as
  select p.*
  from pais p 
  join (
    select d.pais_id
    from articulo a 
    join articulo_donado d on d.articulo_id = a.articulo_id
    group by d.pais_id, a.articulo_id, a.precio_inicial
    having a.precio_inicial > 300000
    order by d.pais_id
  ) q1 
  on p.pais_id = q1.pais_id
  group by p.pais_id, p.clave, p.descripcion
  having count(*) >= 3;
  

/*
13. Generar una consulta que determine el id, nombre, fecha inicio e importe 
total de ventas de las subastas que durante el año 2010 hayan logrado obtener 
$3,000,000 o más en ventas.

R: Se deben obtener 5 subastas.
*/
create table consulta_13 as
  select s.subasta_id, s.nombre, s.fecha_inicio, sum(v.precio_venta) as importe
  from subasta s 
  join articulo a on a.subasta_id = s.subasta_id
  join subasta_venta v on v.articulo_id = a.articulo_id
  group by s.subasta_id, s.nombre, s.fecha_inicio
  having to_char(s.fecha_inicio, 'yy') = '10' and
    sum(v.precio_venta) > 3000000;


/*
14. Se ha detectado que en la base de datos existen compras realizadas por 
algunos clientes sin factura con montos de más de $1,000,000, ya que la empresa 
tiene como política, que toda compra igual o superior a dicho monto, debe 
generar factura. Determine una sentencia SQL que muestre nombre, apellidos, y el
total del monto a cubrir, con la finalidad de notificarle al cliente la 
inexistencia de su factura.

R: Se deben obtener 6 registros.
*/
create table consulta_14 as
  select c.nombre, c.apellido_paterno, c.apellido_materno, sum(v.precio_venta)
    as precio_venta
  from cliente c
  join subasta_venta v on v.cliente_id = c.cliente_id
  group by c.nombre, c.apellido_paterno, c.apellido_materno, v.factura_cliente_id
  having sum(v.precio_venta) > 1000000 and v.factura_cliente_id is null;


/*
15. Seleccionar todos los datos de la subasta que ha vendido el mayor número de
artículos registrada en la base de datos.

R: La subasta que más vendió se realizó en Cuernavaca y vendió 6 artículos.
*/
create table consulta_15 as
  select s.*
  from subasta s 
  join articulo a on a.subasta_id = s.subasta_id
  join subasta_venta v on v.articulo_id = a.articulo_id
  group by s.subasta_id, s.nombre, s.fecha_inicio, s.fecha_fin, s.lugar, s.cupo
  having count(*) = (
    select max(count(*)) 
    from subasta s
    join articulo a on a.subasta_id = s.subasta_id
    join subasta_venta v on v.articulo_id = a.articulo_id
    group by s.subasta_id
  );


