---@Autor(es):					Néstor Martínez Ostoa
---@Fecha de creación: 	4/06/2020
---@Descripción:				Ejercicio 2 práctica 13
set serveroutput on

create or replace procedure p_consulta_bibliotecas(p_clave_biblio varchar2) is
	cursor cur_libros is
		select b.biblioteca_id, b.clave, b.nombre, l.libro_id, l.isbn, l.titulo,
			q1.total_asignados, l.tipo, lc.precio_unitario, ld.nombre_donante,
			q2.total_prestamos
		from biblioteca b
		join asignacion_libro al on al.biblioteca_id = b.biblioteca_id
		join libro l on l.libro_id = al.libro_id
		left join libro_comprado lc on lc.libro_id = l.libro_id
		left join libro_donado ld on ld.libro_id = l.libro_id
		join (
			select biblioteca_id, sum(num_copias) as total_asignados
			from asignacion_libro al
			group by biblioteca_id
		) q1 
		on q1.biblioteca_id = b.biblioteca_id
		join (
			select libro_id, count(*) as total_prestamos
			from detalle_prestamo
			group by libro_id
		) q2
		on q2.libro_id = l.libro_id
		where b.clave = p_clave_biblio
		order by l.titulo;
begin
	for r in cur_libros loop
		insert into t_reporte_biblioteca(biblioteca_id, clave, nombre, 
			total_libros_asignados, libro_id, isbn, titulo, tipo, precio_unitario, 
			nombre_donante, total_prestamos)
		values (r.biblioteca_id, r.clave, r.nombre, r.total_asignados, 
			r.libro_id, r.isbn, r.titulo, r.tipo, r.precio_unitario, r.nombre_donante,
			r.total_prestamos);
	end loop;
end;
/
show errors;

declare
	v_count number;
begin
	for r in (
		select clave
		from biblioteca
		sample(20)
		where rownum <= 5
	) loop
		p_consulta_bibliotecas(r.clave);
		select count(*)
		into v_count
		from t_reporte_biblioteca;
		dbms_output.put_line('Registros exportados para biblioteca: '
			|| r.clave 
			|| '  -  ' 
			|| v_count);
		delete from t_reporte_biblioteca;
	end loop;		
end;
/