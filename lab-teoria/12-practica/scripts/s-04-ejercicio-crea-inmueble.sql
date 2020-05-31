---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	30/05/2020
---@Descripción:				Ejercicios práctica 12: inserta inmuebles

set serveroutput on
---
---Ejercicio 1: Registro de inmuebles nuevos
---
create or replace procedure sp_crea_inmueble (
	p_inmueble_id in out number, p_direccion in varchar2, p_latitud in number, 
	p_longitud in number, p_tipo in char, p_cliente_id in number default null, 
	p_dia_pago in number default null, p_renta_mensual in number default null, 
	p_interes_mensual in number default null, p_precio_venta in number default null,
	p_plazo in number default null, p_tasa_interes in number default null
)	is 
	v_foto inmueble.foto%type;
	v_historico_status_inmueble_id number(10,1);
begin
	v_foto := empty_blob();
	v_historico_status_inmueble_id := seq_hist_status_inmueble.nextval;
	p_inmueble_id := seq_inmueble.nextval;

	if p_tipo = 'R' or p_tipo = 'C' then
		--insertando inmueble
		insert into inmueble(inmueble_id, direccion, latitud, longitud, tipo_inmueble,
			foto, fecha_status, cliente_id, status_inmueble_id)
		values (p_inmueble_id, p_direccion, p_latitud, p_longitud, p_tipo, v_foto,
			sysdate, p_cliente_id, 1);

		case p_tipo
			when 'R' then
				if p_dia_pago is null or p_renta_mensual is null or 
					p_interes_mensual is null then 
					raise_application_error(-20010, 'Datos incorrectos para este tipo
							de inmueble');
				else
					--insertando tipo inmueble renta
					insert into renta_inmueble(inmueble_id, dia_pago, renta_mensual,
						interes_mensual)
					values(p_inmueble_id, p_dia_pago, p_renta_mensual, p_interes_mensual);
				end if;

			when 'C' then
				if p_precio_venta is null or p_plazo is null or p_tasa_interes is null
					then 
						raise_application_error(-20010, 'Datos incorrectos para este tipo
							de inmueble');
				else 
					--insertando tipo inmueble compra
					insert into compra_inmueble(inmueble_id, precio_venta, plazo, tasa_interes)
					values(p_inmueble_id, p_precio_venta, p_plazo, p_tasa_interes);
				end if;
		end case;

		--insertando en el histórico
		insert into historico_status_inmueble (historico_status_inmueble_id,
			fecha_status, status_inmueble_id, inmueble_id)
		values(v_historico_status_inmueble_id, sysdate, 1, p_inmueble_id	);
	else
		raise_application_error(-20010, 'El tipo del inmueble es inválido');
	end if;
end;
/
show errors