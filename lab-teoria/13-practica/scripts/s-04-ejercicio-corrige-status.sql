---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Ejercicio 1 Práctica 13
set serveroutput on

create or replace procedure p_corrige_status (
	p_num_expirado out number,
	p_num_con_multa out number,
	p_num_en_curso out number
) is
v_detalle_prestamo_id detalle_prestamo.detalle_prestamo_id%type;
v_num_dias detalle_prestamo.num_dias%type;
v_fecha_vencimiento detalle_prestamo.fecha_vencimiento%type;
v_multa_por_pagar detalle_prestamo.multa_por_pagar%type;
v_prestamo_id detalle_prestamo.prestamo_id%type;
v_libro_id detalle_prestamo.libro_id%type;
cursor cur_prestamo is
	select * from prestamo;
begin
	for r in cur_prestamo loop
		select detalle_prestamo_id, num_dias, fecha_vencimiento, multa_por_pagar,
			prestamo_id, libro_id
		into v_detalle_prestamo_id, v_num_dias, v_fecha_vencimiento, v_multa_por_pagar
			v_prestamo_id, v_libro_id
		from detalle_prestamo
		where prestamo_id = r.prestamo_id;
	end loop;
end;
/
show errors