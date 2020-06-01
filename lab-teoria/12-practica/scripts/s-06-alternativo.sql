set serverouput on

create or replace trigger t_revision_aval_alternativo
	after insert or update of cliente_id on inmueble
declare
	v_nuevo_cliente_id number;
	v_nuevo_cliente_aval_id number;
	v_inmuebles_pagados_por_aval number;
begin
	--obteniendo el id del aval del nuevo cliente (si es que existe)
	select cliente_id
	into v_nuevo_cliente_id
	from inmueble;
	if v_nuevo_cliente_id is not null then
		select aval_cliente_id
		into v_nuevo_cliente_aval_id
		from cliente
		where cliente_id = v_nuevo_cliente_id;
	end if;

	--contando la cantidad de inmuebles del aval del nuevo cliente
	v_inmuebles_pagados_por_aval := 0;
	if v_nuevo_cliente_aval_id is not null  then
		select count(*)
		into v_inmuebles_pagados_por_aval
		from cliente c
		join inmueble i
		on i.cliente_id = c.cliente_id
		join status_inmueble s
		on s.status_inmueble_id = i.status_inmueble_id
		and s.clave = 5
		and c.cliente_id = v_nuevo_cliente_aval_id;
	end if;

	--reglas de negocio
	if v_nuevo_cliente_id

end;
/
show errors;
