---Autor: Néstor Martínez Ostoa
---Fecha: 26 de abril del 2020
---Descripción: creación de usuario nimo_p0802_cuentas

prompt Proporciona el pwd del usuario SYSTEM
connect system


prompt Creando usuario
create user nimo_p0802_cuentas identified by nestor quota unlimited on users;

prompt Asignando permisos
grant create session to nimo_p0802_cuentas;
grant create table to nimo_p0802_cuentas;
grant create sequence to nimo_p0802_cuentas;
grant create procedure to nimo_p0802_cuentas;