create tablespace tbs_empresa
datafile '/df_ventas_01.dbf'
size 3M;


--consultar que se creo el tablespace
select * from dba_tablespaces
where tablespace_name = 'tbs_empresa';


--3. consultar la ubicacion donde se creo el tbs
select file#, name from V$DATAFILE;


--4. Creacion de usuario Angel y asignacion de privilegios
create user angel identified by 123
default tablespace tbs_empresa;

create role admin_1;
grant all privileges to admin_1;
grant unlimited tablespace to angel;
grant admin_1 to angel;

--5. creacion de tablas desde el usuario angel
create table movimiento (
  movimiento varchar(10),
  usuario varchar(10),
  momento timestamp
);

CREATE TABLE Sucursal (
 ID_SUC NUMERIC(8,0) NULL,
 NOMBRE VARCHAR(10)  ,
 CUPO   NUMERIC(8,0) 
 );

CREATE TABLE Departamento (
 ID_Departamento NUMERIC(8,0) NOT NULL,
 Departamento     VARCHAR(10)  NOT NULL,
 Nivel   VARCHAR(10),
 Sueldo  NUMERIC(6,0)
 );
 
 CREATE TABLE Empleado (
 MATRICULA NUMERIC(9,0) NOT NULL,
 NOMBRE     VARCHAR(30)  NOT NULL,
 APELLIDO   VARCHAR(30),
 ID_JEFE    NUMERIC(8,0),
 MONTO    NUMERIC(5,0),
 ID_SUC   NUMERIC(8,0),
 ID_Departamento  NUMERIC(8,0)
  );
  
select * from movimiento;

--6. creaction de trigger desde el usuario angel
create or replace trigger t1_iud after insert on angel.empleado
for each row
declare
begin
  insert into angel.movimiento values ('INSERTO', USER, SYSDATE);
end;

--7. comprobacion del trigger
select * from sys.all_triggers
where trigger_name = 'T1_IUD';


--8. inserción de datos y verificacion del trigger
insert into angel.empleado
values (10384, 'JUAN', 'CALVILLO', 10311, 50000, 1, 1);
select * from empleado;
select * from movimiento;


--9. VERIFICACION DE FUNCIONALIDAD DEL TRIGGER
select * from movimiento;  

--10. Creacion de otro usuario y de privilegios
create user juan identified by 123
default tablespace tbs_empresa;

create role capturista;

grant create session to capturista;
grant create any table to capturista;
grant select any table to capturista;
grant insert on angel.empleado to capturista;
grant insert on angel.sucursal to capturista;
grant insert on angel.departamento to capturista;

grant capturista to juan;


commit;


--11. conectados como juan y comprobamos los datos de angel.empleado





