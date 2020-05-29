---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	21/05/2020
---@Descripción: 				Ejercicios tema 10


set serveroutput on
declare
	cursor cur_reprobados is
		select rownum, e.nombre as nombre_estudiante, e.apellido_paterno, 
			e.apellido_materno, a.nombre as nombre_asignatura
		from estudiante e, asignatura a, estudiante_inscrito ei, curso c
		where e.estudiante_id = ei.estudiante_id 
			and ei.curso_id = c.curso_id 
			and c.asignatura_id = a.asignatura_id
			and ei.calificacion = 5;
begin
	for r in cur_reprobados loop
		dbms_output.put_line(
			r.rownum || '#' || r.nombre_estudiante || '#' || r.apellido_paterno || '#'
			|| r.apellido_materno || '#' || r.nombre_asignatura
		);
	end loop;
end;
/