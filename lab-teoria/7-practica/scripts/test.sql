create table oyente_asignatura (
	estudiante_id 		NUMBER(10,0) 	not null,
	asignatura_id 		NUMBER(10,0) 	not null,
	fecha_aprobacion 	DATE 					default sysdate,
	calificacion 			NUMBER(2,0) 	null,
	constraint oyente_asignatura_pk 								primary key (estudiante_id, 
		asignatura_id),
	constraint oyente_asignatura_estudiante_id_fk 	foreign key (estudiante_id)
	references estudiante(estudiante_id),
	constraint oyente_asignatura_asignatura_id_fk 	foreign key (asignatura_id)
	references asignatura(asignatura_id),
	constraint oyente_asignatura_calificacion_chk 	check(
	(calificacion >= 5) and 
	(calificacion <= 10)
	)
);