---
--- Desarrollo:
---		Hacer 6 subconsultas con la base proporcionada:
---		3 con WHERE
---		2 con HAVING
---		1 combinación entre WHERE y HAVING
---

---
--- Enunciado: Nombre y costo de los cursos de Big Data y POO
---
prompt 1.WHERE
select nombre, costo
from curso
where id_especialidad in (
	select id_especialidad from especialidad
	where nombre = 'BIG DATA' or nombre = 'POO'
);

---
--- Enunciado: Sueldos de America 
---
prompt 2.WHERE
select sum(sueldo) from persona
where id_emp in (
	select id_pais from pais
	where id_pais between 14 and 16 or id_pais = 23
);	

---
--- Enunciado: Cupo de Sistemas
---
prompt 3.WHERE
select nombre, cupo from zona 
where id_zona = (
	select id_depto from depto d
	where area = 'SISTEMAS'
);

---
--- Enunciado: Personas cuyo sueldo es mayor que el promedio de sueldos en 
--- Europa
---
prompt 4.HAVING
select nombre, sueldo from persona
group by nombre, sueldo
having sueldo > (
	select avg(sueldo) from persona
	where id_pais between 1 and 13 or
	id_pais between 17 and 22 or
	id_pais = 24
);


---
--- Enunciado: Selecciona la especilidad con cursos de costo entre 10K y 40K
---
prompt 5.HAVING
select id_pais, avg(sueldo) from persona
group by id_pais
having avg(sueldo) > ( select avg(sueldo) from persona where id_pais = 24);


---
--- Enunciado: 
---
prompt 6.WHERE/HAVING
select id_pais from persona
group by id_pais
having avg(sueldo) > (
	select avg(sueldo) from persona
	where id_pais = (
		select id_pais from pais 
		where nombre = 'ALEMANIA'
	)
);