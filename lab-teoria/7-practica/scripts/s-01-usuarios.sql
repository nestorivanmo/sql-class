--@Autor(es): 		Néstor Iván Martínez Ostoa
--@Fecha creación:	17/04/2020
--@Descripción:		Creación de usuarios y roles.

--si hay error, detener la ejecución
whenever sqlerror exit;

prompt Proprciona el pwd para system
connect system


prompt creando roles
create 	role p0701_admin_rol;
create 	role p0701_basic_rol;
create 	role p0701_guest_rol;

prompt asignando privilegios para el rol p0701_admin_rol
grant create session, create table, create view to p0701_admin_rol;
grant create session, create table 							to p0701_basic_rol;
grant create session, create synonym						to p0701_guest_rol;


prompt Crear usuarios admin, oper, invitado 
create user nimo_p0701_admin 		identified by admin 	quota 1G on users;
create user nimo_p0701_oper 		identified by oper 		quota 500m 	on users;
create user nimo_p0701_invitado identified by invitado;

prompt Asignar roles a los usuarios
grant p0701_admin_rol to nimo_p0701_admin;
grant p0701_basic_rol to nimo_p0701_oper;
grant p0701_guest_rol to nimo_p0701_invitado;


prompt Asignar privilegios para procedimientos y sequencias para tres usuarios
grant create procedure, create sequence to nimo_p0701_admin;
grant create procedure, create sequence to nimo_p0701_oper; 
grant create procedure, create sequence to nimo_p0701_invitado;

prompt Listo !
disconnect;