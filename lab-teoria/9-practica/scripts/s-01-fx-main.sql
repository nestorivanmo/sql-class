---@Autor:		Néstor Iván Martínez Ostoa
---@Fecha de creación:	05/05/2020
---@Descripción:	Script inicial para la práctica 9


Prompt conectando como usuario System
connect system

Prompt creando usuario nimo_p0903_fx

create user nimo_p0903_fx identified by nestor quota unlimited on users;
grant create table, create session, create sequence, create procedure to nimo_p0903_fx;

Prompt conectando como nimo_p0903_fx
connect nimo_p0903_fx

start s-02-fx-ddl.sql

set define off
@@s-03-fx-carga-inicial.sql
set define on

commit;
