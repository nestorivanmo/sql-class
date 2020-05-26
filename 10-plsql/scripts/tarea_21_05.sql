---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	21/05/2020
---@Descripción: 				Tarea


set serveroutput on
declare
	cursor cur_reprobados is
		select rownum, e.nombre, e.apellido_paterno, e.apellido_materno, a.nombre
		from estudiante e, asignatura a, estudiante_inscrito ei, curso c
		where e.estudiante_id = ei.estudiante_id 
			and ei.curso_id = c.curso_id 
			and c.asignatura_id = a.asignatura_id
			and ei.calificacion = 5;

	v_rownum number;
	v_nombre_estudiante estudiante.nombre%type;
	v_apellido_paterno estudiante.apellido_paterno%type;
	v_apellido_materno estudiante.apellido_materno%type;
	v_nombre_asignatura asignatura.nombre%type;
begin
	open cur_reprobados;
	loop 
		fetch cur_reprobados into
			v_rownum, v_nombre_estudiante, v_apellido_paterno,
			v_apellido_materno,v_nombre_asignatura;
		exit when cur_reprobados%notfound;
		dbms_output.put_line(
			v_rownum || '#' || v_nombre_estudiante || '#' || v_apellido_paterno || '#'
			|| v_apellido_materno || '#' || v_nombre_asignatura
		);
	end loop;
end;
/