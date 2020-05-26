---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	26/05/2020
---@Descripción:				Ejericio 4

set serveroutput on

create or replace procedure sp_inscribe_estudiante(
	p_estudiante_id in number, p_semestre_id in number,
	p_asignatura_id in number, p_grupo in varchar2, 
	p_curso_id out number, p_resultado out number 
) is 
v_clave_grupo curso.clave_grupo%type;
v_cupo_maximo curso.cupo_maximo%type;
v_inscritos number(2,0);
v_calificacion estudiante_inscrito.calificacion%type;
cursor cur_cursos is
	select c.curso_id, c.clave_grupo, c.cupo_maximo, count(ei.curso_id) as num_inscritos
	from curso c
	left join estudiante_inscrito ei 
	on c.curso_id = ei.curso_id
	where c.asignatura_id = p_asignatura_id
	and c.semestre_id = p_semestre_id
	group by c.curso_id, c.clave_grupo, c.cupo_maximo
	having count(ei.curso_id) < c.cupo_maximo;
begin
	--consulta que muestra la situación académica del estudiante
	select ei.calificacion
	into v_calificacion
	from estudiante_inscrito ei, curso c 
	where ei.curso_id = c.curso_id
	and ei.estudiante_id = p_estudiante_id
	and c.asignatura_id = p_asignatura_id;

	exception 

end;
/
show errors