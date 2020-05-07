--@Autor:			Néstor Martínez Ostoa
--@Fecha creación:	18/04/2020
--@Descripción:		Creación de Usuarios
create user nimo_p07_previo identified by nestor quota unlimited on users;
grant create table, create session to nimo_p07_previo;