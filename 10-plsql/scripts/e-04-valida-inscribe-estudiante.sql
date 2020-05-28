---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	28/05/2020
---@Descripción:				Pruebas Ejericio 4 tema 10
set serveroutput on

Prompt =======================================
Prompt Prueba 1.
prompt El estudiante está cursando la materia
Prompt ========================================
declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--obteniendo a un estudiante cursando una asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo, v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id = ei.curso_id
	where ei.calificacion is null
	and rownum = 1; 
	--invocando al procedimiento
	sp_inscribe_estudiante(v_estudiante_id, v_semestre_id, v_asignatura_id, 
		v_clave_grupo, v_curso_id, v_resultado);

	if v_resultado = -2 then
		dbms_output.put_line('OK, prueba 1 exitosa.');
	else
		raise_application_error(-20001, 'ERROR: Código no esperado.' || v_resultado);
	end if;
end;
/


Prompt =======================================
Prompt Prueba 2.
prompt El estudiante ya cursó la materia
Prompt ========================================
declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--obteniendo a un estudiante cursando una asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo, v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id = ei.curso_id
	where ei.calificacion > 5
	and rownum = 1; 
	--invocando al procedimiento
	sp_inscribe_estudiante(v_estudiante_id, v_semestre_id, v_asignatura_id, 
		v_clave_grupo, v_curso_id, v_resultado);

	if v_resultado = -1 then
		dbms_output.put_line('OK, prueba 2 exitosa.');
	else
		raise_application_error(-20001, 'ERROR: Código no esperado.' || v_resultado);
	end if;
end;
/

Prompt =======================================
Prompt Prueba 3.
prompt El estudiante tiene la materia reprobada
Prompt ========================================
declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--obteniendo a un estudiante cursando una asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo, v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id = ei.curso_id
	where ei.calificacion = 5
	and rownum = 1; 
	--invocando al procedimiento, se espera que el procedimiento inscriba al
	--estudiante nuevamente en el semestre con id = 1
	v_semestre_id := 1;
	sp_inscribe_estudiante(v_estudiante_id, v_semestre_id, v_asignatura_id, 
		v_clave_grupo, v_curso_id, v_resultado);

	if v_resultado = 0 then
		dbms_output.put_line('OK, el estudiante fue inscrito.');
	else
		raise_application_error(-20001, 'ERROR: Código no esperado.' || v_resultado);
	end if;

	if v_curso_id = 1 then
		dbms_output.put_line('OK, el estudiante fue inscrito en el curso ' ||
			v_curso_id);
	else
		raise_application_error(-20001, 'ERROR: Código no esperado.' || v_resultado);
	end if;
end;
/

Prompt =======================================
Prompt Prueba 4.
prompt El estudiante nunca ha cursado la materia
Prompt ========================================


Prompt =======================================
Prompt Prueba 5.
prompt El estudiante se inscribe en el grupo solicitado
Prompt ========================================


Prompt =======================================
Prompt Prueba 6.
prompt No hay cupo en el grupo solicitado
Prompt ========================================

Prompt Prueba concluida, Haciendo Rollback para limpiar la BD.
rollback;