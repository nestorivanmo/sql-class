---@Autor(es):
---@Fecha creacion:
---@Descripcion:

/*
  Ejercicio 21
  
  Generar un reporte de todas las asignaturas que tengan 8 créditos. 
  Los datos que debe mostrar es la siguiente:
    Nombre de la asignatura
    Créditos
    Clave del plan de estudios
    Nombre de la asignatura requerida (si existe)
*/

select a.nombre, a.creditos, p.clave, ar.nombre as antecedente
from plan_estudios p
join asignatura a on p.plan_estudios_id = a.plan_estudios_id
left join asignatura ar on ar.asignatura_id = a.asignatura_requerida_id
where a.creditos = 8;

/*
"NOMBRE"	"CREDITOS"	"CLAVE"	"ANTECEDENTE"
"CALCULO 3"	8	"PL-2OO4"	"CALCULO 2"
"ELECTRICIDAD Y MAGNETISMO"	8	"PL-2OO4"	"CALCULO 3"
"BASES DE DATOS"	8	"PL-2OO4"	"INGENIERIA DE SOFTWARE"
"ALGEBRA"	8	"PL-2OO4"	""
"BASES DE DATOS DISTRIBUIDAS"	8	"PL-2OO9"	""
/*


/*
Ejercicio 22
Mostrar las asignaturas dependientes, que no pueden cursarse sin antes acreditar 
calculo 2, incluir en la consulta el identificador y en nombre de Cálculo 2 así 
como el identificador y el nombre de las asignaturas dependientes. 
Emplear sintaxis anterior. La consulta deberá tener los siguientes
nombres de columnas:
ANTECEDENTE_ID ANTECEDENTE_NOMBRE DEPENDIENTE_ID DEPENDIENTE_NOMBRE
============== ================== ============== ==================
*/

select ar.asignatura_id as antecedente_id, ar.nombre as antecedente_nombre,
  a.asignatura_id as dependiente_id, a.nombre as dependiente_nombre
from asignatura a, asignatura ar
where a.asignatura_requerida_id = ar.asignatura_id
and ar.nombre = 'CALCULO 2';

/*
"ANTECEDENTE_ID"	"ANTECEDENTE_NOMBRE"	"DEPENDIENTE_ID"	"DEPENDIENTE_NOMBRE"
5	"CALCULO 2"	7	"CALCULO 3"
5	"CALCULO 2"	8	"ECUACIONES DIFERENCIALES"
*/


--Ejercicios 9 parte 2--

/*
1. Generar una sentencia SQL que calcule el número de registros que regresaría 
el producto cartesiano entre las tablas ESTUDIANTE y PLAN_ESTUDIOS.
*/

select (select count(*) from estudiante) * 
(select count(*) from plan_estudios) as num_registros
from dual;


/*
4.
Generar un reporte que muestre los siguientes datos para cada plan de estudios 
existente en la base de datos: id del plan de estudio, clave del plan de 
estudios, y el número de alumnos que pertenecen a cada plan.
*/

--select p.plan_estudios_id, p.clave, 
--  (select count(*)
--    from estudiante e
--      where e.plan_estudios_id = p.plan_estudios_id
--  ) as num_estudiantes
--from plan_estudios p
--order by num_estudiantes;

select p.plan_estudios_id, p.clave, count(*) as num_estudiantes
from estudiante e
join plan_estudios p
on e.plan_estudios_id = p.plan_estudios_id
group by p.plan_estudios_id, p.clave
order by num_estudiantes;


