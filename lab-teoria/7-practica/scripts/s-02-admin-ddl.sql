--@Autor(es): 		Néstor Iván Martínez Ostoa
--@Fecha creación:	17/04/2020
--@Descripción:		Creación de modelos Control Escolar.

--si hay error, detener la ejecución
whenever sqlerror exit;

prompt Proporcionar pwd para nimo_p0701_admin
connect nimo_p0701_admin


-- 
-- sequence: seq_estudiante 
--

create sequence seq_estudiante
start with 10
increment by 3
nocycle
cache 5
;


prompt Obteniendo el primer valor de la secuencia seq_estudiante
select seq_estudiante.nextval from dual;


prompt Obtienendo el valor actual de la secuencia seq_estudiante
select seq_estudiante.currval from dual;


-- 
-- table: estudiante 
--

create table estudiante( 
	estudiante_id 	NUMBER(10, 0) 	not null,
	nombre 					VARCHAR2(40) 		not null,
	ap_paterno 			VARCHAR2(40)		not null,
	ap_materno 			VARCHAR2(40) 		null, 
	num_cuenta 			NUMBER(9,0) 		not null,
	tipo 						CHAR(1) 				not null,
	constraint estudiante_pk 							primary key (estudiante_id),
	constraint estudiante_tipo_chk 				check (tipo in ('O', 'R')),
	constraint estudiante_num_cuenta_chk	check (
  	(tipo = 'R' and substr(num_cuenta, 1, 2) = '31') or 
  	(tipo = 'O' and substr(num_cuenta, 1, 2) = '30')
  ),
  constraint estudiante_num_cuenta_uk		unique (num_cuenta)
);


-- 
-- table: oyente 
--

create table oyente (
	estudiante_id 			NUMBER(10,0) 	not null, 
	num_recursamientos 	NUMBER(2,0) 	not null,
	num_extraordinarios NUMBER(2,0) 	not null,
	suma_recu_extra 		as (num_recursamientos + num_extraordinarios) virtual,
	constraint oyente_pk 									primary key (estudiante_id),
	constraint oyente_estudiante_id_fk 		foreign key (estudiante_id)
	references estudiante(estudiante_id),
	constraint oye_suma_recu_extra_chk 		check (suma_recu_extra < 11)
);


-- 
-- table: regular 
--

create table regular (
	estudiante_id 		NUMBER(10,0) 	not null, 
	semestre 					NUMBER(10,0) 	not null,
	promedio_general 	NUMBER(4,2) 	not null,
	constraint regular_pk 							primary key (estudiante_id),
	constraint regular_estudiante_id_fk foreign key (estudiante_id)
	references estudiante(estudiante_id)
);


-- 
-- index: num_cuenta
--

create unique index estudiante_num_cuenta_iuk on 
estudiante(substr(num_cuenta,3,5));
--create index estudiante_num_cuenta_ix on estudiante(substr(num_cuenta,3,5));


-- 
-- view: v_estudiante 
--

create view v_estudiante (
	estudiante_id, 
	nombre, 
	semestre, 
	num_cuenta
) as 
select e.estudiante_id, e.nombre, r.semestre, e.num_cuenta
from estudiante e, regular r
where e.estudiante_id = r.estudiante_id;


-- 
-- table: asignatura 
--

create table asignatura (
	asignatura_id 						NUMBER(10,0) 	not null,
	nombre 										VARCHAR2(40) 	not null,
	clave 										NUMBER(4,0) 	not null,
	creditos 									NUMBER(2,0) 	not null,
	asignatura_requerida_id 	NUMBER(10,0) 	null,
	constraint asignatura_pk 													primary key (asignatura_id),
	constraint asignatura_asignatura_requerida_id_fk 	foreign key (
		asignatura_requerida_id)
	references asignatura(asignatura_id),
	constraint asignatura_clave_uk 									unique 			(clave)
);


-- 
-- index: asignatura_requerida 
--

create index asig_asignatura_requerida_ix on asignatura(asignatura_requerida);

-- 
-- table: oyente_asignatura 
--

create table oyente_asignatura (
	estudiante_id 		NUMBER(10,0) 	not null,
	asignatura_id 		NUMBER(10,0) 	not null,
	fecha_aprobacion 	DATE 					default sysdate,
	calificacion 			NUMBER(2,0) 	null,
	constraint oyente_asignatura_pk 								primary key (estudiante_id, 
		asignatura_id),
	constraint oyente_asignatura_estudiante_id_fk 	foreign key (estudiante_id)
	references oyente(estudiante_id),
	constraint oyente_asignatura_asignatura_id_fk 	foreign key (asignatura_id)
	references asignatura(asignatura_id),
	constraint oyente_asignatura_calificacion_chk 	check( (calificacion >= 5) and 
	(calificacion <= 10))
);


prompt Listo!
disconnect