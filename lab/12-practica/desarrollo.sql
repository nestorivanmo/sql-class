--desarrollo

--1
set serveroutput on
create or replace procedure promedio_sueldos
as
  v_sueldo number(20,5);
begin
  select round(avg(e.monto)) as sueldo_prom
  into v_sueldo
  from departamento d inner join empleado e
  on e.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO;
  
  dbms_output.put_line('El sueldo promedio es: '|| v_sueldo);
end;
exec promedio_sueldos;

--2
set serverouput on
create or replace procedure promedio_por_sucursal(p_id_suc number)
as
  v_sueldo number(20,5);
begin
  select round(avg(d.sueldo)) as sueldo_prom
  into v_sueldo
  from departamento d inner join empleado e
  on d.ID_DEPARTAMENTO = e.ID_DEPARTAMENTO
  inner join sucursal s
  on s.id_suc = e.id_suc
  where s.id_suc = p_id_suc;
  
  dbms_output.put_line('El promedio para la sucursal ' || p_id_suc
  || ' es $' || v_sueldo);
  
end;
exec promedio_por_sucursal(2);


--3
set serveroutput on 
create or replace procedure nombre_empleado(p_matricula number)
as
  v_nombre varchar(30);
  v_sucursal varchar(10);
  v_departamento varchar(30);
begin
  select e.nombre, s.nombre, d.departamento
  into v_nombre, v_sucursal, v_departamento
  from empleado e inner join sucursal s
  on e.id_suc = s.id_suc
  inner join departamento d
  on e.id_departamento = d.id_departamento
  where matricula = p_matricula;
  
  dbms_output.put_line(v_nombre || ':' || v_sucursal
  || ':' || v_departamento);
end;
exec nombre_empleado(10320);

--4
set serveroutput on 
create or replace procedure nombre_empleado_sueldo(p_matricula number)
as
  v_nombre varchar(30);
  v_sucursal varchar(10);
  v_departamento varchar(30);
  v_sueldo number(6,0);
begin
  select e.nombre, s.nombre, d.departamento, e.monto
  into v_nombre, v_sucursal, v_departamento, v_sueldo
  from empleado e inner join sucursal s
  on e.id_suc = s.id_suc
  inner join departamento d
  on e.id_departamento = d.id_departamento
  where matricula = p_matricula;
  
  dbms_output.put_line(v_nombre || ':' || v_sucursal || ':' || v_departamento);
  
  if v_sueldo < 2000 then
    dbms_output.put_line('Becario');
  elsif v_sueldo >= 2000 and v_sueldo < 4000 then
    dbms_output.put_line('Egresado menor a un mes');
  else 
    dbms_output.put_line('Egresado mayor a un mes');
  end if;
end;
exec nombre_empleado_sueldo(10320);


--5
set serverouput on
create or replace procedure loop_switch(p_id_suc number)
as
  v_nombre varchar(30);
  v_cupo number(8,0);
  v_otro_cupo number(8,0);
begin
  select nombre, cupo
  into v_nombre, v_cupo
  from sucursal
  where id_suc = p_id_suc;
  dbms_output.put_line('País seleccionado:');
  case v_nombre
      when 'Chile' then 
        dbms_output.put_line(v_nombre || '-> Santiago de Chile' 
        || ' -> cupo: ' || v_cupo);  
      when 'MÃ©xico' then 
        dbms_output.put_line('México' || '-> Ciudad de México'
        || ' -> cupo: ' || v_cupo);  
      when 'Colombia' then 
        dbms_output.put_line(v_nombre || '-> Bogotá'
        || ' -> cupo: ' || v_cupo);  
      when 'Peru' then 
        dbms_output.put_line(v_nombre || '-> Lima'
        || ' -> cupo: ' || v_cupo);  
      when 'Argentina' then 
        dbms_output.put_line(v_nombre || '-> Buenos Aires'
        || ' -> cupo: ' || v_cupo);  
      when 'USA' then 
        dbms_output.put_line(v_nombre || '-> Washington DC'
        || ' -> cupo: ' || v_cupo);  
      when 'Canada' then 
        dbms_output.put_line(v_nombre || '-> Ottawa'
        || ' -> cupo: ' || v_cupo); 
  end case;
  dbms_output.put_line('');
  dbms_output.put_line('Otros países con mayor cupo:');
  for i in 1..7 loop
    select cupo, nombre
    into v_otro_cupo, v_nombre
    from sucursal
    where id_suc = i;
    if p_id_suc != i then
      if v_otro_cupo > v_cupo then
        dbms_output.put_line(v_nombre || ' -> cupo: ' || v_otro_cupo);
      end if;
    end if;
  end loop;
end;
exec loop_switch(5);


