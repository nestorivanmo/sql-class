---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Prueba ejercicio práctica 12: revisa aval

set serveroutput on
begin
	insert into inmueble (inmueble_id, direccion, latitud, longitud, tipo_inmueble,
		fecha_status, cliente_id, status_inmueble_id)
	values(
		1107, 'ads', 1441421.66, 121135.772, 'C', sysdate, 332, 2
	);
end;
/