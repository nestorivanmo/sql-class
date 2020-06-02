---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	31/05/2020
---@Descripción:				Archivo inicial práctica 13

set serveroutput on 

declare 
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'NIMO_P1302_BIBLIO';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user nimo_p1302_biblio cascade';
  end if;   
end;
/

prompt Creando usuario inicial
create user nimo_p1302_biblio identified by nestor quota unlimited on users;

prompt Asignando permisos
grant create session, create table, create procedure, create sequence, 
  create trigger to nimo_p1302_biblio;