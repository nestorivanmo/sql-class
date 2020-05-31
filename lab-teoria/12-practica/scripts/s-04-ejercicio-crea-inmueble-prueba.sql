---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	30/05/2020
---@Descripción:				Pruebas ejercicios práctica 12: crea inmueble
set serveroutput on 

declare
	v_inmueble_id number;
begin 
	
	sp_crea_inmueble	(
		p_inmueble_id 		=> 	v_inmueble_id,
		p_direccion				=> 	'direccion inmueble',
		p_latitud					=> 	38.7097954,
		p_longitud				=>	-9.4164575,
		p_tipo						=> 	'C',
		p_precio_venta 		=> 	2700000,
		p_plazo						=> 	36,
		p_tasa_interes 		=> 	0.5
	);
	dbms_output.put_line('inmueble creado: ' || v_inmueble_id);
end;
/