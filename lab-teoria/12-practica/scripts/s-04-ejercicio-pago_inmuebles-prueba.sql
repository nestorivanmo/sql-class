---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	30/05/2020
---@Descripción:				Pruebas ejercicios práctica 12: pago inmuebles

set serveroutput on
declare
	v_inmueble_id number := 207;
	v_actualizado number(1,0);
begin
	sp_corrige_pago_inmuebles(v_inmueble_id,v_actualizado);
	dbms_output.put_line(
	'Procedimiento invocado, resultado (inmueble_id,actualizado): '
	||v_inmueble_id
	||','
	||v_actualizado
	);
end;
/
rollback;