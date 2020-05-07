--@Autor(es): 			Néstor Iván Martínez Ostoa
--@Fecha creación:	19/04/2020
--@Descripción:			Creación de sinónimos.

--si hay error, detener la ejecución
whenever sqlerror exit;

prompt Proporciona el pwd del usuario nimo_p0701_admin
connect nimo_p0701_admin

prompt Asignando permisos para consultar estudiante a nimo_p0701_invitado
grant select on estudiante to nimo_p0701_invitado;

prompt Proporciona el pwd del usuario nimo_p0701_invitado 
connect nimo_p0701_invitado

prompt Creando el sinónimo
create or replace synonym s_alumno for nimo_p0701_admin.estudiante;

prompt Listo! 
disconnect