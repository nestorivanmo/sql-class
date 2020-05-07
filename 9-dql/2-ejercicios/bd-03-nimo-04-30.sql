--@Autor:                Néstor Iván Martínez Ostoa
--@Fecha de creación:    30/04/2020
--@Descripción:          Script Ejercicios tema 9 parte 1


--4. Genere una sentencia SQL que calcule la edad en años del profesor 
--FELIPE LIMA RODRIGUEZ.
select trunc((sysdate - fecha_nacimiento)/365) as "Edad Profesor"
from profesor
where nombre = 'FELIPE'
and APELLIDO_PATERNO = 'LIMA'
and APELLIDO_MATERNO = 'RODRIGUEZ';

/*

"Edad Profesor"
67

*/


--10. Suponga que la universidad desea cancelar a todos aquellos cursos que 
--tengan un cupo máximo de 30 estudiantes excepto aquellos cursos que
--tengan clave 001. Empleando operadores del álgebra relacional, generar una 
--sentencia SQL que obtenga el identificador del curso y su clave de los
--cursos que se eliminarán.


--P(curso_id, clave_grupo)(S(cupo_maximo=30(curso))) - 
--P(curso_id, clave_grupo)(S(clave_grupo=001))

/*
select curso_id, clave_grupo
from CURSO 
where CUPO_MAXIMO = 30
minus 
select curso_id, clave_grupo
from CURSO
where CLAVE_GRUPO = '001';
*/

select curso_id, clave_grupo
from (
    select *
    from CURSO
    where CUPO_MAXIMO = 30 
    minus
    select * 
    from CURSO
    where CLAVE_GRUPO = '001'
);

/*

"CURSO_ID"	"CLAVE_GRUPO"
17	"002"
18	"003"
19	"004"
20	"005"
21	"006"
23	"002"
24	"003"
26	"002"
27	"003"
28	"004"
29	"005"


*/


--11. Para el próximo semestre, la universidad tiene planeado reducir el número 
--de cursos para las asignaturas que cumplan con las siguientes reglas: La
--asignatura debe pertenecer a los planes de estudios con id 1 o 2, aunque, 
--si existen materias con 9 o más créditos, estas no se consideran. Emplear
--alguno de los operadores relacionales determine el id de la asignatura, el 
--nombre, su plan de estudios y el número de créditos.

-- P(asignatura_id, nombre, plan_estudios_id, creditos)(
--  (S(plan_estudios_id = 1)(asignatura) U S(plan_estudios_id=2)(asignatura)) - 
--  S(materias >= 9)(asignatura)
-- )

select asignatura_id, nombre, plan_estudios_id, creditos 
from (
  select *
  from ASIGNATURA
  where PLAN_ESTUDIOS_ID = 1
  union
  select *
  from ASIGNATURA
  where PLAN_ESTUDIOS_ID = 2
  minus
  select *
  from ASIGNATURA
  where CREDITOS >= 9
);


/*

"ASIGNATURA_ID"	"NOMBRE"	"PLAN_ESTUDIOS_ID"	"CREDITOS"
1	"ALGEBRA"	1	8
4	"ALGEBRA LINEAL"	1	7
7	"CALCULO 3"	1	8
10	"ELECTRICIDAD Y MAGNETISMO"	1	8
11	"ALGORITMOS Y ESTRUCTURA DE DATOS"	2	6
13	"BASES DE DATOS"	1	8
14	"ANALISIS DE SISTEMAS Y SEÑALES"	1	7
16	"DINAMICA DE SISTEMAS FISICOS"	1	6
20	"TEMAS SELECTOS DE BD"	1	5

*/


--12. Se desea generar un reporte que muestre los datos de los exámenes 
-- extraordinarios que ha realizado la alumna con id 21. El reporte debe incluir
-- su nombre completo, el número de examen, su calificación y el identificador 
-- de la asignatura.

-- P(nombre, ap_pat, ap_mat, num_examen, calificacion, asignatura-id)(
--  S(estudiante_id = 21)(estudiante) J estudiante_extraordinario
-- )

select e.nombre, e.apellido_paterno, e.apellido_materno, ex.num_examen,
  ex.calificacion, ex.asignatura_id
from estudiante e
join estudiante_extraordinario ex
on e.estudiante_id = ex.estudiante_id
where e.estudiante_id = 21


/*

"NOMBRE" "APELLIDO_PATERNO" "APELLIDO_MATERNO" "NUM_EXAMEN" "CALIFICACION"
                                                                "ASIGNATURA_ID"
"LILIANA"	"BURGOS"	"VALDOVINOS"	1	5	3
"LILIANA"	"BURGOS"	"VALDOVINOS"	2	6	3
"LILIANA"	"BURGOS"	"VALDOVINOS"	3	6	7
"LILIANA"	"BURGOS"	"VALDOVINOS"	4	7	8


*/


--14. Generar una sentencia SQL que muestre nombre de la asignatura, clave del 
-- plan de estudios, clave del grupo y día de la semana de todos los cursos
-- que imparte el profesor JULIAN VALDEZ SANCHEZ en el semestre 2008-1, emplear 
-- notación anterior. Ordenar por nombre de la asignatura y después por la clave
-- del grupo.

/*

tablas:
asignatura a
plan_estudios pl
curso c
horario h
profesor pf
semestre s
curso horario ch

*/

select a.nombre, pl.clave, c.clave_grupo, h.dia_semana
from asignatura a, plan_estudios pl, curso c, profesor p, semestre s, horario h,
  curso_horario ch
where pl.plan_estudios_id = a.plan_estudios_id
and a.asignatura_id = c.asignatura_id
and c.profesor_id = p.profesor_id
and c.semestre_id = s.semestre_id
and c.curso_id = ch.curso_id
and ch.horario_id = h.horario_id
and p.nombre = 'JULIAN'
and p.apellido_paterno = 'VALDEZ'
and p.apellido_materno = 'SANCHEZ'
and s.anio = 2008
and s.periodo = 1
order by 1,2 desc;

/*

"NOMBRE"	"CLAVE"	"CLAVE_GRUPO"	"DIA_SEMANA"
"CALCULO 1"	"PL-2OO4"	"001"	5
"CALCULO 1"	"PL-2OO4"	"004"	5
"CALCULO 1"	"PL-2OO4"	"004"	3
"CALCULO 1"	"PL-2OO4"	"004"	1
"CALCULO 1"	"PL-2OO4"	"001"	3
"CALCULO 1"	"PL-2OO4"	"001"	1
"CALCULO 2"	"PL-2OO4"	"003"	2
"CALCULO 2"	"PL-2OO4"	"003"	4
"GEOMETRIA ANALITICA"	"PL-2OO4"	"002"	5
"GEOMETRIA ANALITICA"	"PL-2OO4"	"002"	3
"GEOMETRIA ANALITICA"	"PL-2OO4"	"002"	1


*/































