---@Autor(es):					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	22/05/2020
---@Descripción:				Archivo principal

prompt Proporcione el pwd del usuario sys
connect sys as sysdba

whenever sqlerror exit rollback

prompt creando usuario nimo_p1203_inmuebles
@s-01-creacion-usuario.sql 

prompt conectando como usuario nimo_p1203_inmuebles
connect nimo_p1203_inmuebles

prompt creando objetos
@s-02-inmuebles-ddl.sql

set define off

!curl "https://api.mockaroo.com/api/6ff13690?count=500&key=b71bb7e0" > s-03-carga-cliente.sql
!curl "https://api.mockaroo.com/api/b97d2aa0?count=5&key=b71bb7e0" > s-03-carga-status-inmueble.sql
!curl "https://api.mockaroo.com/api/c929d5a0?count=250&key=b71bb7e0" > s-03-carga-inmueble.sql
!curl "https://api.mockaroo.com/api/ecad28c0?count=125&key=b71bb7e0" > s-03-carga-renta-inmueble.sql
!curl "https://api.mockaroo.com/api/de641a50?count=125&key=b71bb7e0" > s-03-carga-compra-inmueble.sql

alter session set nls_date_format="yyyy-mm-dd hh24:mi:ss";

prompt realizando la carga de datos
@s-03-carga-cliente.sql
@s-03-carga-status-inmueble.sql
@s-03-carga-inmueble.sql
@s-03-carga-renta-inmueble.sql
@s-03-carga-compra-inmueble.sql
@s-03-carga-pagos.sql
@s-03-carga-historico.sql

set define on 

prompt confirmando cambios 
commit;

whenever sqlerror continue none

prompt Listo!