---@Autor(es): 					Néstor Martínez Ostoa
---@Fecha de creación: 	19/05/2020
---@Descripción: 				Hola Mundo en PL/SQL
set serveroutput on
begin
	dbms_output.put_line('Hola mundo desde PL/SQL');
end;
/

/*
Métricas de código

-Tamaño de línea: 80, 90, 100 caracteres como máximo
-Número de líneas de una clase: 1000 como máximo
-Número de líneas de un método: 100 como máximo
-Profundidad de bloques de código: 3 como máximo
-Complejidad ciclomática: conteo de todos los flujos posibles que puede tener un 
	método -> 10 como máximo

*/