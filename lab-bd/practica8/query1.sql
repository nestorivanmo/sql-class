select * from empleado;
select * from sucursal;
select * from departamento; 


--la consulta más sencilla
select * from empleado;

select nombre, apellido from empleado;

--where
select nombre, apellido, monto from empleado
where monto > 4500;

select nombre, apellido, monto, id_suc from empleado
where monto > 4500 and id_suc =1;

--order-by
select nombre, apellido, monto, id_suc from empleado
where monto > 4500 and id_suc = 1
order by monto;

select nombre, apellido, monto, id_suc from empleado
where monto > 4500 and id_suc = 1
order by monto desc;

--group-by y having
select * from empleado;

--cuantos empleados por sucursal?

select id_suc, count(matricula)
from empleado
group by id_suc;



select id_suc, count(matricula)
from empleado
group by id_suc
order by id_suc; --order by id_suc desc;


--having (aquí la condición debe llevar una operación sobre el campo, a diferencia del where) -> operación: count(columna), max, min, avg, sum, count.
--having siempre tiene que ir de la mano de un group by

select id_suc, count(matricula)
from empleado
group by id_suc
having count(matricula) > 9
order by id_suc desc;

--insert posicional: poner campos y valores insert into table(col1, col2) values(...)
--insert nominal: poner unicamente valores  insert into table values (...)

desc sucursal;
insert into sucursal (id_suc, nombre, cupo) values (8,'China', 50000);
insert into sucursal values (9,'Australia',50000);

--delete 
delete from sucursal
where id_suc = 9;

select * from sucursal;

delete from sucursal 
where nombre = 'China';


select * from sucursal; 


--update

update sucursal
set nombre='EUA'
where nombre='USA';


select * from sucursal;

commit;

rollback;


