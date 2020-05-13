---@Autor(es): Néstor Iván Martínez Ostoa
---@Fecha de creación: 12/05/2020
---@Descripción: Respuestas para la práctica 10.

/*
1. Genere un reporte que muestre nombre del artículo, clave, clave del status de
todos los artículos donados por el artista ‘William Harvey’. Emplear sintaxis 
estándar.
*/
create table consulta_1 as
  select a.nombre, a.clave_articulo, s.clave
  from articulo a 
  join status_articulo s on a.status_articulo_id = s.status_articulo_id
  join articulo_famoso f on a.articulo_id = f.articulo_id
  where f.nombre_completo = 'William Harvey';


/*
2. Generar un reporte que muestre el id, nombre y clave de todos los artículos 
que hayan sido entregados al cliente (status= ENTREGADO, no emplear el id del 
status) en cualquier subasta y que hayan sido donados por 'BELGICA'. 
Emplear natural join.
*/
create table consulta_2 as
  select articulo_id, a.nombre, a.clave_articulo
  from articulo a
  join status_articulo s using(status_articulo_id)
  join articulo_donado d using(articulo_id)
  join pais p using(pais_id)
  where p.descripcion = 'BELGICA' and
    s.clave = 'ENTREGADO';
  

/*
3. Empleando natural join, generar un reporte que muestre el id, nombre, precio 
inicial, precio de venta y tipo de artículo, así como el nombre y fecha inicio
de la subasta de todos los artículos que compró el cliente 
MARICELA PAEZ MARTINEZ durante las subastas realizadas en el 2010. Nota: Un
artículo se considera comprado cuando se registra el cliente que lo adquirió y 
se registra el precio de venta. Para el caso de la fecha de inicio emplear el 
formato como se indica en los siguientes ejemplos.

Emplear como nombre de columna fecha_inicio
2019/10/24 10:16:44 PM Para fechas después de las 12 PM
2019/10/25 10:19:03 AM Para fechas antes de las 12 PM
*/
create table consulta_3 as
  select articulo_id, a.nombre, a.precio_inicial, v.precio_venta,
    a.tipo_articulo, (s.nombre) as subasta_nombre, 
    (to_char(s.fecha_inicio, 'yyyy/mm/dd hh:mi:ss AM')) as fecha_inicio
  from articulo a
  join subasta s using(subasta_id)
  join subasta_venta v using(articulo_id)
  join cliente c using(cliente_id)
  where c.nombre = 'MARICELA' and c.apellido_paterno = 'PAEZ' and
    c.apellido_materno = 'MARTINEZ' and
    to_char(s.fecha_inicio, 'yyyy') = '2010';
    

/*
4. Generar un reporte que muestre los datos de los clientes (id, nombre y 
apellidos) y los datos de sus tarjetas(número de tarjeta, tipo, año de vigencia,
mes de vigencia) que ya hayan expirado. 

Notas:
a. para validar si ya la tarjeta expiró emplear el mes y año de vigencia.
b. Considerar que la consulta se ejecuta en noviembre del 2011
c. Si una tarjeta tiene como año y mes de expiración los valores 11/11, la 
tarjeta aún se considera como vigente.
*/
create table consulta_4 as
  select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno, 
    t.numero_tarjeta, t.tipo_tarjeta, t.anio_vigencia, t.mes_vigencia
  from cliente c
  join tarjeta_cliente t on c.cliente_id = t.cliente_id
  where (t.ANIO_VIGENCIA = 11 and t.MES_VIGENCIA < 11) or 
    (t.ANIO_VIGENCIA < 11);


/*
5. Generar un reporte que muestre: identificador del artículo, nombre, clave, 
tipo, año de hallazgo precio inicial y precio venta (para los que ya fueron 
vendidos o entregados) de todos los artículos que sean de tipo arqueológico, y 
que tengan un precio inicial mayor a $800,000. Emplear notación SQL estándar.
*/
create table consulta_5 as
  select a.articulo_id, a.nombre, a.clave_articulo, a.tipo_articulo, 
    q.anio_hallazgo, a.precio_inicial, v.precio_venta
  from articulo a, articulo_arqueologico q, status_articulo s, subasta_venta v
  where a.articulo_id = q.articulo_id and
    a.articulo_id = v.articulo_id and
    a.status_articulo_id = s.status_articulo_id and
    a.tipo_articulo = 'A' and
    a.precio_inicial > 800000;
    


/*
6. Generar un reporte que muestre nombre, apellidos, email, de todos los 
clientes cuya ocupación sea ABOGADO, y en caso de tener registrado una o más 
tarjetas de crédito, incluir el tipo de tarjeta. Emplear notación SQL anterior 
compatible con Oracle.
*/
create table consulta_6 as
  select c.nombre, c.apellido_paterno, c.apellido_materno, c.email, c.ocupacion,
    t.tipo_tarjeta
  from cliente c, tarjeta_cliente t
  where c.cliente_id = t.cliente_id(+) and
    c.ocupacion = 'ABOGADO';

/*
7. Suponga que se desea retirar del catálogo a todos los artículos que tengan un
precio inicial de más de 900,000, siempre y cuando el artículo todavía no inicie
el proceso de subasta, es decir, el artículo no debe tener status EN SUBASTA, 
ENTREGADO O VENDIDO. Empleando operadores del álgebra relacional (operadores 
SET: union, intersection, minus), determine el id, nombre, clave, precio inicial
y e identificador del status de los artículos que se deben retirar.
*/
create table consulta_7 as
  select a.articulo_id, a.nombre, a.clave_articulo, a.precio_inicial, 
    s.status_articulo_id
  from articulo a, status_articulo s
  where a.precio_inicial > 900000
  minus
  select a.articulo_id, a.nombre, a.clave_articulo, a.precio_inicial, 
    s.status_articulo_id
  from articulo a, status_articulo s
  where s.status_articulo_id between 2 and 4;
  

/*
"ARTICULO_ID"	"NOMBRE"	"CLAVE_ARTICULO"	"PRECIO_INICIAL"	"STATUS_ARTICULO_ID"
8	"Espejo de roble "	"A1948DC000008"	993598.06	1
83	"mquina de colchonero"	"P1862DC000083"	936411.25	1
120	"calentador a querosene"	"P1911DC000120"	926589.56	1
176	"mesita de luz"	"P1916DC000176"	917693.06	1
205	"reproductor de magazines "	"P1873DC000205"	932488.06	1
219	"telfono de baquelita"	"P1889DC000219"	910594.88	1
*/
  
/*
8. SUBMEX ha decido incrementar en un 10% el precio inicial de todos aquellos 
artículos arqueológicos que tengan más de 150 años de antigüedad y que aún no se
han incluido en un proceso de subasta, es decir, solo se han registrado en la BD. 
Determine id, clave, nombre, id de status, año de hallazgo, y antigüedad en años
de dichos artículos.
*/
create table consulta_8 as 
  select a.articulo_id, a.clave_articulo, a.nombre, s.status_articulo_id, 
    q.anio_hallazgo, trunc((sysdate - to_date(to_char(q.anio_hallazgo), 'yyyy'))
    /365) as antiguedad
  from articulo a
  join articulo_arqueologico q on q.articulo_id = a.articulo_id
  join status_articulo s on a.status_articulo_id = s.status_articulo_id
  where s.clave = 'REGISTRADO' and 
    trunc((sysdate - to_date(to_char(q.anio_hallazgo), 'yyyy'))
    /365) > 150;
    
    
/*
9. Suponga que un cliente decide realizar una consulta en el catálogo de 
artículos. El cliente está interesado por todos aquellos artículos cuyo nombre
o descripción hagan referencia o hablen de la palabra “Colonial” que no han sido
aún vendidos, y que el articulo este en proceso de ser subastado. Generar la 
sentencia SQL que muestre el nombre y tipo de todos los artículos que cumplan 
con los criterios de búsqueda.
*/
create table consulta_9 as
  select a.nombre, a.tipo_articulo
  from articulo a
  join status_articulo s
  on a.status_articulo_id = s.status_articulo_id
  where s.clave = 'EN SUBASTA' and
    (instr(a.nombre, 'Colonial') != 0 or
    instr(a.descripcion, 'Colonial') != 0);


/*
10. Suponga que se desea generar un reporte a detalle de todos los artículos que
fueron comprados y pagados con la tarjeta de crédito 5681375824866375. Los datos
que el reporte debe mostrar son los siguientes:
a. Fecha de la factura en formato dd/mm/yyyy, emplear ‘fecha_factura’ como 
   nombre de columna.
b. Numero de la tarjeta
c. Nombre y apellidos del cliente
d. Precio de venta de cada articulo
e. Precio de compra de cada articulo
f. Diferencia entre el precio de compra y el de venta
g. Nombre y clave del artículo
h. Tipo de artículo
i. Nombre completo del famoso al que perteneció el articulo (en caso de ser 
  articulo perteneciente a un famoso)
j. Año de hallazgo, en caso de que el artículo sea arqueológico.
k. Clave del país, en caso de que el articulo haya sido donado por dicho país.
Emplear Notación estándar
*/
create table consulta_10 as
  select (to_char(fc.fecha_factura, 'dd/mm/yyyy')) as fecha_factura,
    t.numero_tarjeta, (c.nombre) as nombre_cliente, c.apellido_paterno, 
    c.apellido_materno, v.precio_venta, a.precio_inicial, (v.precio_venta -
    a.precio_inicial) as diferencia, a.nombre, a.clave_articulo, a.tipo_articulo,
    f.nombre_completo, q.anio_hallazgo, p.clave
  from factura_cliente fc
  join tarjeta_cliente t on fc.tarjeta_cliente_id = t.tarjeta_cliente_id
  join cliente c on c.cliente_id = t.cliente_id
  join subasta_venta v on v.factura_cliente_id = fc.factura_cliente_id
  join articulo a on a.articulo_id = v.articulo_id
  left join articulo_famoso f on f.articulo_id = a.articulo_id
  left join articulo_arqueologico q on q.articulo_id = a.articulo_id
  left join articulo_donado d on d.articulo_id = a.articulo_id
  left join pais p on p.pais_id = d.pais_id
  where t.numero_tarjeta = '5681375824866375';

/*
11. Reescribir la consulta anterior pero ahora empleando notación anterior 
compatible con Oracle.
*/
create table consulta_11 as
  select (to_char(fc.fecha_factura, 'dd/mm/yyyy')) as fecha_factura,
    t.numero_tarjeta, (c.nombre) as nombre_cliente, c.apellido_paterno, 
    c.apellido_materno, v.precio_venta, a.precio_inicial, (v.precio_venta -
    a.precio_inicial) as diferencia, a.nombre, a.clave_articulo, a.tipo_articulo,
    f.nombre_completo, q.anio_hallazgo, p.clave
  from factura_cliente fc, tarjeta_cliente t, cliente c, subasta_venta v,
    articulo a, articulo_famoso f, articulo_arqueologico q, pais p, 
    articulo_donado d
  where fc.tarjeta_cliente_id = t.tarjeta_cliente_id and
  c.cliente_id = t.cliente_id and
  v.factura_cliente_id = fc.factura_cliente_id and
  a.articulo_id = v.articulo_id and
  f.articulo_id(+) = a.articulo_id and
  q.articulo_id(+) = a.articulo_id and
  d.articulo_id(+) = a.articulo_id and
  p.pais_id(+) = d.pais_id and
  t.numero_tarjeta = '5681375824866375';


