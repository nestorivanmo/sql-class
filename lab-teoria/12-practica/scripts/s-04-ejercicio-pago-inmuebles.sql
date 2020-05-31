---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	30/05/2020
---@Descripción:				Ejercicios práctica 12: pago inmuebles

set serverouput on

create or replace procedure sp_corrige_pago_inmuebles (
	p_inmueble_id in out number, p_pago_actualizado in out number
) is
	v_num_pagos number(4,0);
	v_plazo compra_inmueble.plazo%type;
	v_fecha_status_final date;
	v_fecha_status_actual date;
	v_importe_total number;
	v_importe_parcial number;
	v_importe_suma number;
	v_decimales_restantes number;
	v_index number;
begin 
	--obteniendo el número de pagos actuales
	select count(*)
	into v_num_pagos
	from pago_inmueble 
	where inmueble_id = p_inmueble_id;

	--obteniendo el plazo de la compra
	select plazo, precio_venta
	into v_plazo, v_importe_total
	from compra_inmueble
	where inmueble_id = p_inmueble_id;

	--obteniendo la fecha final
	select h.fecha_status
	into v_fecha_status_final
	from historico_status_inmueble h
	join status_inmueble s
	on s.status_inmueble_id = h.status_inmueble_id
	where h.inmueble_id = p_inmueble_id
	and s.clave = 'PAGADO';

	if v_num_pagos = v_plazo then
		p_pago_actualizado := 1;
	else --hay que actualizar
		p_pago_actualizado := 0;

		--borrando los pagos existentes
		delete from pago_inmueble
		where inmueble_id = p_inmueble_id;

		--creando los pagos correctos
		v_importe_parcial := trunc(v_importe_total / v_plazo,2);
		v_importe_suma := 0;
		for v_index in 1 .. v_plazo loop 
			v_fecha_status_actual := add_months(v_fecha_status_final, -1 * (v_plazo - v_index)
			);
			v_importe_suma := v_importe_suma + v_importe_parcial;
			if v_index = v_plazo then
				v_decimales_restantes := v_importe_total - v_importe_suma;
				v_importe_parcial := v_importe_parcial + v_decimales_restantes;
			end if;
			insert into pago_inmueble(num_pago, inmueble_id, fecha_pago, importe)
			values(v_index, p_inmueble_id, v_fecha_status_actual, v_importe_parcial);
		end loop;
	end if;

end;
/
show errors