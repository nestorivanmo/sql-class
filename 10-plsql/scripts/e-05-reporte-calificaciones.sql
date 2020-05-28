---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	28/05/2020
---@Descripción:				Ejericio 5 tema 10
set serveroutput on 

create or replace procedure sp_reporte_calificaciones(
	p_semestre_id in number, 
	p_num_registros out number
) is
v_estudiante_id estudiante.estudiante_id%type;
v_nombre varchar2(100);
v_asignatura asignatura.nombre%type;
v_antecedente asignatura.nombre%type;
v_calificacion estudiante_inscrito.calficacion%type;
v_promedio number(3,1);
cur_resultado sys_refcursor; --variable para crear un cursor
cur_reporte is
	select e.estudiante_id, e.nombre 
		|| ' '
		|| e.apellido_paterno
		|| ' '
		|| e.apellido_materno as nombre_completo, 
		a.nombre, ar.nombre as nombre_antecedente,
		ei.calificacion, (
			select round(avg(ei.calificacion),1)
			from estudiante_inscrito ei
			where ei.curso_id = c.curso_id
		) as promedio_global
	from estudiante e, estudiante_inscrito ei, curso c, asignatura a, asignatura ar
	where e.estudiante_id = ei.estudiante_id
	and ei.curso_id = c.curso_id
	and c.asignatura_id = a.asignatura_id
	and a.asignatura_requerida_id = ar.asignatura_id(+)
	and c.semestre_id = p_semestre_id
	and ei.calificacion > (
			select round(avg(ei.calificacion), 1)
			from estudiante_inscrito ei
			where ei.curso_id = c.curso_id
		);
begin
	
end;
/