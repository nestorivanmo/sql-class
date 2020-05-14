---@Autor(es): Néstor Martínez Ostoa
---@Fecha de creación: 14/05/2020
---@Descripción: Ejercicios tema 9 parte 2

/*
8. Se desea generar un reporte que muestre la distribución de las edades de los
alumnos de la universidad. El reporte debe contener: nombre, apellido paterno, 
apellido materno, fecha_nacimiento, edad_promedio y edad. La columna 
EDAD_PROMEDIO corresponde con la edad promedio de todos los estudiantes para 
mostrarse como referencia, y la columna EDAD, contiene la edad en años que tiene
el alumno. Genere una sentencia SQL que obtenga los datos del reporte.

R: Se debe obtener 23 registros, la ed
*/

select nombre, apellido_paterno, apellido_materno, fecha_nacimiento,
  trunc((sysdate-fecha_nacimiento) / 365) as edad, (
    select trunc(avg( (sysdate - fecha_nacimiento) / 365))
    from estudiante
  ) as edad_promedio
from estudiante;

/*
"NOMBRE"	"APELLIDO_PATERNO"	"APELLIDO_MATERNO"	"FECHA_NACIMIENTO"	"EDAD"	"EDAD_PROMEDIO"
"JUAN"	"JUAREZ"	"MENDOZA"	02-JAN-79	41	39
"VIRIDIANA"	"AGUIRRE"	"MONTES"	15-FEB-81	39	39
"HUGO"	"MONROY"	"ZUÑIGA"	25-OCT-82	37	39
"ANTONIO ALEJANDRO"	"GUZMAN"	"NIETO"	05-JAN-83	37	39
"HERNAN"	"MARTINEZ"	"PAEZ"	29-NOV-79	40	39
"ALBERTO"	"LOPEZ"	"MENDOZA"	02-JAN-79	41	39
"MARIANA"	"AGUIRRE"	"PEREZ"	22-AUG-80	39	39
"HUGO"	"MONROY"	"ZUÑIGA"	11-MAY-80	40	39
"MARICELA"	"SANROMAN"	"PEÑA"	25-DEC-82	37	39
"ARTURO"	"JIMENEZ"	"SANCHEZ"	10-NOV-78	41	39
"SOFIA"	"HURTADO"	"CORONA"	02-JAN-79	41	39
"MONSERRAT"	"LANDEROS"	"LUJAN"	15-FEB-81	39	39
"LISETTE"	"CASARES"	"ORTEGA"	25-OCT-82	37	39
"ALONSO"	"NOGUERA"	"AGUILAR"	05-JAN-83	37	39
"ALBERTO"	"TOLEDO"	"MARQUEZ"	29-NOV-79	40	39
"HILARIO DE JESUS"	"DURAN"	"LARA"	02-JAN-79	41	39
"ALFREDO"	"FLORES"	"LUNA"	22-AUG-80	39	39
"MARICELA"	"GUTIERREZ"	"DURAN"	11-MAY-80	40	39
"CARLA"	"LOPEZ"	"VILLAREAL"	25-DEC-82	37	39
"ARACELI"	"ESQUIVEL"	"GONZALEZ"	31-DEC-79	40	39
"LILIANA"	"BURGOS"	"VALDOVINOS"	20-MAY-78	42	39
"MARTHA"	"RODRIGUEZ"	"GOMEZ"	30-SEP-78	41	39
"LAURA ELENA"	"FONSECA"	"PEREZ"	31-JAN-78	42	39
*/


/*
10. Determinar el nombre de las asignaturas, la clave del grupo, nombre, 
apellidos y fecha de nacimiento del profesor más joven que imparte cursos en la 
universidad.
*/
select a.nombre, c.clave_grupo, p.nombre, p.apellido_paterno, 
  p.apellido_materno, p.fecha_nacimiento
from profesor p
join curso c on c.profesor_id  = p.profesor_id
join asignatura a on a.asignatura_id = c.asignatura_id
where p.fecha_nacimiento = (
    select max(p.fecha_nacimiento)
    from profesor p, curso c
    where p.profesor_id = c.profesor_id
);

/*
"NOMBRE"	"CLAVE_GRUPO"	"NOMBRE_1"	"APELLIDO_PATERNO"	"APELLIDO_MATERNO"	"FECHA_NACIMIENTO"
"BASES DE DATOS"	"005"	"SAMANTA"	"MIRANDA"	"ORTEGA"	22-FEB-75
"BASES DE DATOS AVANZADAS"	"001"	"SAMANTA"	"MIRANDA"	"ORTEGA"	22-FEB-75
*/


/*
13. Se desea generar un reporte que muestre todos los datos de las asignaturas,
y número de cursos que se crearon para todas aquellas asignaturas impartidas 
durante el semestre 2008-1 (ID =1). En caso que solo se hayan creado 3 o menos 
cursos, estos no deben mostrarse en el resultado.

Considerar los siguientes 2 escenarios:
A. Generar una consulta empleando una subconsulta en la cláusula from. Emplear 
sintaxis anterior.
B. ¿Será posible generar la consulta sin emplear subconsultas? 

En caso afirmativo, generar la consulta empleando sintaxis estándar.
*/

select a.*, count(*) as num_cursos
from asignatura a, curso c
where a.asignatura_id = c.asignatura_id
group by a.asignatura_id, a.nombre, a.creditos, a.asignatura_requerida_id,
  a.plan_estudios_id, c.semestre_id
having count(*) > 3 and c.semestre_id = 1;

select a.*, q1.num_cursos
from asignatura a, (
  select asignatura_id, count(*) as num_cursos
  from curso
  where semestre_id = 1
  group by asignatura_id
) q1
where q1.asignatura_id = a.asignatura_id and 
  q1.num_cursos > 3; 

/*
"ASIGNATURA_ID"	"NOMBRE"	"CREDITOS""ASIGNATURA_REQUERIDA_ID""PLAN_ESTUDIOS_ID"	
                                                                  "NUM_CURSOS"
3	"CALCULO 1"	9		1	4
5	"CALCULO 2"	9	3	1	5
6	"COMPUTO PARA INGENIEROS"	6		3	6
13	"BASES DE DATOS"	8	12	1	5
*/


/*
14. Para cada asignatura impartida en el semestre 2008-1 (id =1) seleccionar el 
nombre de la asignatura, el nombre, apellidos y la calificación del estudiante
que obtuve el mayor valor. Considerar los siguientes escenarios:

A. Generar una sentencia SQL que haga uso de una subconsulta en la cláusula from,
emplear sintaxis anterior.
B. ¿Será posible generar una sentencia SQL que no haga uso de subconsultas? De 
ser posible, crear la sentencia con sintaxis estándar.
*/
select (q1.nombre) as materia, e.nombre, e.apellido_paterno, e.apellido_materno, 
  q1.max_calificacion
from (
  select a.asignatura_id, a.nombre, max(ei.calificacion) as max_calificacion
  from asignatura a
  join curso c 
  on c.asignatura_id = a.asignatura_id
  join estudiante_inscrito ei
  on ei.curso_id = c.curso_id
  where c.semestre_id = 1
  group by a.asignatura_id, a.nombre
) q1
join curso c on c.asignatura_id = q1.asignatura_id
join estudiante_inscrito ei on ei.curso_id = c.curso_id
join estudiante e on e.estudiante_id = ei.estudiante_id
where c.semestre_id = 1 and ei.calificacion = q1.max_calificacion;

/*
"MATERIA"	"NOMBRE"	"APELLIDO_PATERNO"	"APELLIDO_MATERNO"	"MAX_CALIFICACION"
"CALCULO 1"	"JUAN"	"JUAREZ"	"MENDOZA"	10
"GEOMETRIA ANALITICA"	"VIRIDIANA"	"AGUIRRE"	"MONTES"	10
"ALGEBRA"	"ANTONIO ALEJANDRO"	"GUZMAN"	"NIETO"	10
"ALGEBRA LINEAL"	"MARICELA"	"SANROMAN"	"PEÑA"	8
"BASES DE DATOS ESPACIALES"	"ALFREDO"	"FLORES"	"LUNA"	9
*/









































