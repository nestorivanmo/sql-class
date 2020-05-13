---@Autor(es): Néstor Iván Martínez Ostoa
---@Fecha de creación: 13/05/2020
---@Descripcón: Script inicial práctica 11

prompt creando usuario nimo_p1101_subastas
create user nimo_p1101_subastas identified by nestor quota unlimited on users;

prompt asignando permisos
grant create session, create table, create procedure, create synonym, create
sequence to nimo_p1101_subastas;

prompt asignando permisos de lectura a tablas de la práctica 10
grant select on nimo_p1001_subastas.articulo to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.articulo_arqueologico to 
nimo_p1101_subastas; 
grant select on nimo_p1001_subastas.articulo_donado to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.articulo_famoso to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.cliente to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.entidad to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.factura_cliente to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.historico_status_articulo to 
nimo_p1101_subastas; 
grant select on nimo_p1001_subastas.pais to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.status_articulo to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.subasta to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.subasta_venta to nimo_p1101_subastas;
grant select on nimo_p1001_subastas.tarjeta_cliente to nimo_p1101_subastas;

prompt conectando como nimo_p1101_subastas
connect nimo_p1101_subastas

prompt creando sinónimos
create or replace synonym articulo for nimo_p1001_subastas.articulo;
create or replace synonym articulo_arqueologico for 
  nimo_p1001_subastas.articulo_arqueologico;
create or replace synonym articulo_donado for 
  nimo_p1001_subastas.articulo_donado;
create or replace synonym articulo_famoso for 
  nimo_p1001_subastas.articulo_famoso;
create or replace synonym cliente for nimo_p1001_subastas.cliente;
create or replace synonym entidad for nimo_p1001_subastas.entidad;
create or replace synonym factura_cliente for 
  nimo_p1001_subastas.factura_cliente;
create or replace synonym historico_status_articulo for 
  nimo_p1001_subastas.historico_status_articulo; 
create or replace synonym pais for nimo_p1001_subastas.pais;
create or replace synonym status_articulo for 
  nimo_p1001_subastas.status_articulo;
create or replace synonym subasta for nimo_p1001_subastas.subasta;
create or replace synonym subasta_venta for nimo_p1001_subastas.subasta_venta;
create or replace synonym tarjeta_cliente for 
  nimo_p1001_subastas.tarjeta_cliente;