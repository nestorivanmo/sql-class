---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Ejercicio 1 Práctica 13

create or replace procedure p_corrige_status (
	p_num_expirado out number, p_num_con_multa out number,
	p_num_en_curso out number
) is
cursor cur_prestamos is
select prestamo_id, fecha_status, lector_id, status_prestamo_id, biblioteca_id
from prestamo;
begin
	for r in cur_prestamos loop
		dbms_output.put_line(r.prestamo_id);
	end loop;
end;
/
show errors;