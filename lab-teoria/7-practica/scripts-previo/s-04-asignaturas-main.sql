--@Autor:			Néstor Martínez Ostoa
--@Fecha creación:	18/04/202
--@Descripción:		Archivo principal

whenever sqlerror exit rollback;

prompt conectando como sys para eliminar/crear al usuario
connect system

prompt eliminando al usuario nimo_p07_previo en caso de existir
@s-00-asignaturas-elimina-usuario.sql

prompt creando usuario nimo_p07_previo
@s-01-asignaturas-crea-usuario.sql

prompt conectando como usuario nimo_p07_previo
connect nimo_p07_previo

prompt creando tablas
@s-02-asignaturas-ddl.sql

prompt cargando datos
@s-03-asignaturas-carga-inicial.sql

prompt Listo!