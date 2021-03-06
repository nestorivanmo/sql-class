--@Autor:			Néstor Martínez Ostoa
--@Fecha creación:	18/04/202
--@Descripción:		Creación de objetos
prompt creando tabla plan_estudios
create table plan_estudios (
	plan_estudios_id 	number(3,2) 	not null,
	clave 				varchar2(10) 	not null,
	fecha_aprobacion 	date 			not null,
	fecha_inicio 		date 			not null,
	fecha_fin 			date			null,
	constraint plan_estudios_pk primary key (plan_estudios_id)
);


prompt creando tabla asignatura
create table asignatura(
asignatura_id
number(10, 0)
not null,
nombre
varchar2(50)
not null,
creditos
number(2, 0)
not null,
asignatura_requerida_id
number(10, 0),
plan_estudios_id
number(2, 0)
not null,
constraint asignatura_pk primary key (asignatura_id),
constraint asignatura_plan_fk foreign key (plan_estudios_id)
references plan_estudios(plan_estudios_id),
constraint asignatura_req_fk foreign key (asignatura_requerida_id)
references asignatura(asignatura_id)
);