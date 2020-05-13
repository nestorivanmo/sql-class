---@Autor(es): Néstor Martínez Ostoa
---@Fecha de creación: 12/05/2020
---@Descripción: Script inicial de la práctica 10.

prompt Creando al usuario 
create user nimo_p001_subastas identified by nestor quota unlimited on users;

grant create table, create sequence, create procedure, create view
to nimo_p001_subastas;


