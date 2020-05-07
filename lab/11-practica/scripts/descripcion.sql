prompt 1
select * from persona
where sueldo > (
select sueldo from persona 
where rfc = 'TME9702079L5'
);


prompt 2
select id_pais, sum(sueldo) from persona
group by id_pais
order by sum(sueldo);


prompt 3
select id_pais, sum(sueldo) from persona
group by id_pais
having sum(sueldo) > 1;


prompt 4
select id_pais, sum(sueldo) from persona
group by id_pais;


prompt 5
select id_pais from persona
group by id_pais
having avg(sueldo) > (
select avg(sueldo)
from persona
);


prompt 6
select id_pais, sum(sueldo) from persona
group by id_pais
having avg(sueldo) > ( select avg(sueldo) from persona );


prompt 7
select id_pais, avg(sueldo) from persona
group by id_pais
having avg(sueldo) > ( select avg(sueldo) from persona );


--select * from especialidad;
--select * from pais;


prompt 8
select nombre from pais
where id_pais = (
select id_especialidad 
from especialidad
where nombre = 'REDES'
);


prompt 9
select nombre from especialidad
where id_especialidad = (
select id_curso
from curso 
where id_curso = (
select id_zona from zona 
where id_zona = (select count(area) from depto)
)
);


prompt 10
select * from persona
where id_pais = (
	select id_pais from persona
	where (nombre = 'Nancy' and apellido = 'Sánchez')
);


---
--- Introducción:
---		1. Cuadro comparativo entre JOIN vs SUBCONSULTA
---		2. ¿Se deben ocupar JOIN y SUBCONSULTAS juntas?
---		3. ¿Qué es mejor, un JOIN o una SUBCONSULTA?, ¿Por qué?		
---
