create global temporary table t_reporte_biblioteca (
	biblioteca_id number (10,0) not null,
	clave varchar2(10) not null,
	nombre varchar2(4000) not null,
	total_libros_asignados number(10,0) not null,
	libro_id number(10,0) not null,
	isbn varchar2(40) not null,
	titulo varchar2(500) not null,
	tipo char not null,
	precio_unitario number(8,2),
	nombre_donante varchar2(200),
	total_prestamos number(10,0) not null
) on commit preserve rows;