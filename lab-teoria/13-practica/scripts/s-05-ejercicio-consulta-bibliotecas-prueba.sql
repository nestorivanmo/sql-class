---@Autor(es):					Néstor Martínez Ostoa
---@Fecha de creación: 	4/06/2020
---@Descripción:				Prueba ejercicio 2 práctica 13

set serverouput on

declare
cursor cur_genera_claves is
	select clave
	from biblioteca sample(5);
begin
	for r in cur_genera_claves loop
		--dbms_output.put_line(r.clave);
		p_consulta_bibliotecas(
			p_clave_biblio => r.clave
		);
	end loop;
end;
/
show errors;

--B99008 -> ejemplo de clave de biblioteca