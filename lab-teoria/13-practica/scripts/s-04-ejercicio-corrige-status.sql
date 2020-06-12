---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Ejercicio 1 Práctica 13
set serveroutput on

create or replace procedure p_corrige_status (p_num_expirados out number, 
	p_num_multados out number, p_num_curso out number) is
	cursor cur_prestamos is
		select prestamo_id, fecha_status, status_prestamo_id
		from prestamo;
	v_count number;
begin
	p_num_expirados := 0;
	p_num_multados 	:= 0;
	p_num_curso 		:= 0;

	for r in cur_prestamos loop
		insert into t_detalle_prestamo
			select detalle_prestamo_id, num_dias, fecha_vencimiento, multa_por_pagar,
				prestamo_id, libro_id
			from detalle_prestamo
			where prestamo_id = r.prestamo_id;

		select count(*)
		into v_count
		from t_detalle_prestamo
		where multa_por_pagar > 0;

		if v_count > 0 then
			update prestamo set status_prestamo_id = 5, fecha_status = sysdate
			where prestamo_id = r.prestamo_id;
			p_num_multados := p_num_multados + 1;
		else
			select count(*)
			into v_count
			from t_detalle_prestamo
			where fecha_vencimiento < sysdate;

			if v_count > 0 then
				update prestamo set status_prestamo_id = 4, fecha_status = sysdate
				where prestamo_id = r.prestamo_id;
				p_num_expirados := p_num_expirados + 1;
			else
				update prestamo set status_prestamo_id = 2, fecha_status = sysdate
				where prestamo_id = r.prestamo_id;
				p_num_curso := p_num_curso + 1;
			end if;
		end if;
		delete from t_detalle_prestamo
		where prestamo_id = r.prestamo_id;
	end loop;
end;
/
show errors;

declare
	v_num_multados 	number;
	v_num_expirados number;
	v_num_en_curso 	number;
begin
	p_corrige_status(
		p_num_expirados => v_num_expirados, 
		p_num_multados	=> v_num_multados, 
		p_num_curso			=> v_num_en_curso);
	dbms_output.put_line('============== Resultados : ==============');
	dbms_output.put_line('Cambios a Expirados: ' 	|| v_num_expirados);
	dbms_output.put_line('Cambios a Multados: ' 	|| v_num_multados);
	dbms_output.put_line('Cambios a En curso: ' 	|| v_num_en_curso);
end;
/