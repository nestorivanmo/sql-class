create or replace trigger T_IUD after insert or update or delete 
on angel.empleado
for each row
declare
begin
  if inserting then
    insert into angel.movimiento values ('INSERTO', USER, SYSDATE);
  elseif updating then
    insert into angel.movimiento values ('ACTUALIZO', USER, SYSDATE);
  elseif deleting then
    insert into angel.movimiento values ('BORRO', USER, SYSDATE);
  end if;
commit;
end;

delete from angel.empleado
where matricula = 10400;

update angel.empleado
set nombre = 'NESTOR'
where matricula = 10400;