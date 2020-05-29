---@Autor(es): 					Néstor Iván Martínez Ostoa
---@Fecha de creación: 	22/05/2020
---@Descripción: 				Ejercicios tema 10

create or replace trigger tr_valida_extraordinarios
  before insert
  or update of calificacion
  or delete
  on estudiante_extraordinario
  for each row
declare
  v_count number;
begin
  case
    when inserting then
      select count(*) into v_count
      from estudiante_inscrito ei
      join curso c
      on ei.curso_id = c.curso_id
      where ei.calificacion > 5
      and c.asignatura_id = :new.asignatura_id
      and ei.estudiante_id = :new.estudiante_id;
      if v_count > 0 then
        raise_application_error(-20010,'El estudiante '
          ||:new.estudiante_id
          ||' ya acreditó la asignatura '
          ||:new.asignatura_id
        );
      end if;
    when updating('calificacion') then
      insert into auditoria_extraordinario(auditoria_extraordinario_id,
      	fecha_cambio,
      	usuario,
      	calificacion_anterior,
      	calificacion_nueva,
      	estudiante_id,
      	asignatura_id)
      values(auditoria_extraordinario_seq.nextval,
      	sysdate,
      	sys_context('USERENV','SESSION_USER'),
      	:old.calificacion,
      	:new.calificacion,
      	:new.estudiante_id,
      	:new.asignatura_id
      	);
    when deleting then
      raise_application_error(-20011,'Las calificaciones no se pueden eliminar');
  end case;  
end;
/
show errors