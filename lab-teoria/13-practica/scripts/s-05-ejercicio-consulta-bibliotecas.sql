---@Autor(es):					Néstor Martínez Ostoa
---@Fecha de creación: 	4/06/2020
---@Descripción:				Ejercicio 2 práctica 13
set serveroutput on

create or replace procedure p_consulta_bibliotecas(
	p_clave_biblio in varchar2
) is
v_num_libros number;
cursor cur_libros is
	select b.biblioteca_id, b.clave, b.nombre, l.libro_id, l.isbn, l.titulo, 
		l.tipo, lc.precio_unitario, ld.nombre_donante, 
		(
			count(al.asignacion_libro_id)
			from asignacion_libro al
			where al.biblioteca_id = b.biblioteca_id
			and al.libro_id = l.libro_id;
		) as num_libros
	from biblioteca b
	join asignacion_libro al on al.biblioteca_id = b.biblioteca_id
	join libro l on l.libro_id = al.libro_id
	left join libro_comprado lc on lc.libro_id = l.libro_id
	left join libro_donado ld on ld.libro_id = l.libro_id
	group by b.biblioteca_id, b.clave, b.nombre, l.libro_id, l.isbn, l.titulo,
		l.tipo, lc.precio_unitario, ld.nombre_donante
	having b.clave = p_clave_biblio;
begin
	v_num_libros := 0;
	for r in cur_libros loop
		v_num_libros := v_num_libros + 1;
	end loop;
	dbms_output.put_line(v_num_libros);
end;
/
show errors;