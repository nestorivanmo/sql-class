---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Ejercicios práctica 12: revisión de avales de inmuebles

create or replace trigger t_revision_aval
	before insert or update of cliente_id on inmueble
	for each row
declare
	v_aval_nuevo_cliente_id number;
	v_inmuebles_pagados_aval number;
begin
	--obteniendo el id del aval del nuevo cliente (en caso de que exista)
	if :new.cliente_id is not null then
		select aval_cliente_id
		into v_aval_nuevo_cliente_id
		from cliente
		where cliente_id = :new.cliente_id;
	end if;

	--contando la cantidad de inmuebles del aval del nuevo cliente
	if v_aval_nuevo_cliente_id is not null then
		select count(*)
		into v_inmuebles_pagados_aval
		from inmueble i
		join status_inmueble s
		on s.status_inmueble_id = i.status_inmueble_id
		join cliente c on c.cliente_id = i.cliente_id
		and s.clave = '5'
		and c.cliente_id = v_aval_nuevo_cliente_id;
	end if;

	--insert/update
	case
		when updating then
			--actualizando el campo cliente_id de la tabla inmueble
			if :old.cliente_id is null then
				if :old.status_inmueble_id != 1 then
					raise_application_error(-20010, 'ERROR: status del inmueble incorrecto.');
				end if;
			else
				if :old.status_inmueble_id = 1 then
					raise_application_error(-20011, 'ERROR: un inmueble disponible no puede
						tener cliente asignado.');
				else
					if (v_aval_nuevo_cliente_id is null and :old.status_inmueble_id != 5) 
						or (v_aval_nuevo_cliente_id is not null and 
							v_inmuebles_pagados_aval = 0) then
						--insertando en asignacion_pendiente
						insert into asignacion_pendiente(asignacion_pendiente_id, 
							descripcion, fecha_registro, inmueble_id, cliente_sin_aval_id, 
							status_inmueble_id)
						values(
							seq_asignacion_pendiente.nextval,
							'El cliente no cuenta con un aval válido',
							sysdate,
							:old.inmueble_id,
							:old.cliente_id,
							:old.status_inmueble_id
						);
						dbms_output.put_line('Se generó un nuevo registro en la tabla
							asignación pendiente: UPDATE');
						raise_application_error(-20012, 'ERROR: cliente no cuenta con un aval
							válido');
					end if;
				end if;
			end if;
		when inserting then
			if :new.cliente_id is null then
				if :new.status_inmueble_id != 1 then
					raise_application_error(-20010, 'ERROR: status del inmueble incorrecto.');
				end if;
			else
				if :new.status_inmueble_id = 1 then
					raise_application_error(-20011, 'ERROR: un inmueble disponible no puede
						tener cliente asignado.');
				else
					if (v_aval_nuevo_cliente_id is null and :old.status_inmueble_id != 5) 
						or (v_aval_nuevo_cliente_id is not null and 
							v_inmuebles_pagados_aval = 0) then
						--insertando en asignacion_pendiente
						insert into asignacion_pendiente(asignacion_pendiente_id, 
							descripcion, fecha_registro, inmueble_id, cliente_sin_aval_id, 
							status_inmueble_id)
						values(
							seq_asignacion_pendiente.nextval,
							'El cliente no cuenta con un aval válido',
							sysdate,
							:new.inmueble_id,
							:new.cliente_id,
							:new.status_inmueble_id
						);
						dbms_output.put_line('Se generó un nuevo registro en la tabla' 
            || 'asignación pendiente: INSERT');
					end if;
				end if;
			end if;
	end case;
end;
/
show errors