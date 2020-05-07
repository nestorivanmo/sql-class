--@Autor(es):           Néstor Iván Martínez Ostoa
--@Fecha creación:      19/04/2020
--@Descripción:         Modificaciones de diseño.

--si hay error, detener la ejecución
whenever sqlerror exit;

prompt Ingresa pwd para nimo_p0701_oper
connect nimo_p0701_oper


---
--- alter: 1
---

alter table pizzeria drop column tipo;
alter table pizzeria add es_almacen number(1,0) not null;
alter table pizzeria add es_sucursal number(1,0) not null;
alter table pizzeria add constraint pizzeria_es_almacen_chk 	check (
(es_almacen = 0) or (es_almacen = 1));
alter table pizzeria add constraint pizzeria_es_sucursal_chk 	check (
(es_sucursal = 1) or (es_sucursal = 1));


---
--- alter: 2
--- 

alter table pizzeria_almacen modify requiere_surtir number(1,0);
alter table pizzeria_almacen add constraint almacen_requiere_surtir_chk 
check (requiere_surtir = 0 or requiere_surtir = 1);


---
--- alter: 3
---

alter table empleado rename column ap_pat to ap_paterno;
alter table empleado rename column ap_mat to ap_materno;
alter table empleado modify ap_materno varchar2(40) null;


---
--- alter: 4
--- 

alter table status_pedido rename column status_id to status_pedido_id;
alter table pedido drop constraint pedido_status_id_fk;
alter table pedido rename column status_id to status_pedido_id;
alter table pedido add constraint pedido_status_pedido_fk foreign key (
status_pedido_id) references status_pedido(status_pedido_id);


--- 
--- alter: 5
--- 

alter table pizzeria drop column empleado_id;
alter table empleado add pizzeria_id number(10,0) not null;
alter table empleado add constraint empleado_pizzeria_id_fk 
foreign key (pizzeria_id) references pizzeria(pizzeria_id);


---
--- alter: 6
---

alter table empleado modify fecha_ing date;
alter table pedido modify importe_total number(8,2);


---
--- alter: 7
---

alter table sucursal add fecha_apertura date default sysdate;


---
--- alter: 8
--- 

alter table pizzeria modify clave varchar2(10);
alter table pizzeria add constraint pizzeria_clave_chk check (
(substr(clave, 1,4) = 'PIZ-') and 
(
	(es_almacen = 1 	and es_sucursal = 1 and substr(clave, 5, 2) = 'AS') or
	(es_almacen = 1 	and es_sucursal = 0 and substr(clave, 5, 2) = 'A-') or 
	(es_almacen = 0		and es_sucursal = 1 and substr(clave, 5, 2) = 'S-')
)
);


---
--- alter : 9
---

alter table pedido drop constraint pedido_pk;
alter table pedido rename column num_pedido to pedido_id;
alter table pedido add constraint pedido_pk primary key 
(pedido_id, pizzeria_id);


---
--- alter: 10
---

alter table empleado rename column fecha_ing to fecha_ingreso;


---
--- alter: 11
---

alter table pizzeria add constraint pizzeria_telefono_chk check 
( length(telefono) <= 10 );


---
--- alter: 12
---

alter table pizzeria_almacen rename to almacen;


---
--- alter: 13
---

alter sequence seq_pizzeria increment by 4 minvalue 7 cache 7 nocycle;


---
--- insert values
---

--1
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
telefono,num_empleados,es_almacen,es_sucursal)
values(1,'PIZ-AS-001','Pizzas Cachos','Av. Juarez 512',5510028938,
200,1,1);
--2
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
telefono,num_empleados,es_almacen,es_sucursal)
values(2,'PIZ-S-002','Pizza Planeta','Av. Constitucion de 1917 10',5513523978,
400,0,1);
--3
insert into empleado(empleado_id,nombre,ap_paterno,ap_materno,
fecha_ingreso,pizzeria_id)
values(1,'Daniel','Lopez',null,sysdate,1);
--4
insert into almacen(pizzeria_id,descripcion,num_refrescos,
num_ingredientes,requiere_surtir)
values(1,'Almacen para pizza planeta',80,100,0);
--5
insert into sucursal(pizzeria_id,fecha_apertura,total_pedidos)
values(2,sysdate,500);
--6
insert into status_pedido(status_pedido_id,clave,descripcion)
values(1,'ACTIVO', 'SOLICITADO');
--7
insert into pedido(pedido_id,importe_total,total_pizzas,total_refrescos,
pizzeria_id,status_pedido_id)
values(1,145.50,1,2,2,1);

prompt Listo!
disconnect