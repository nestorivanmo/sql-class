---Autor: Néstor Martínez Ostoa
---Fecha: 26/04/2020
---Descripción: Sentencias update.

---
--- Ejercicio A
---

connect nimo_p0802_cuentas;

prompt A. Congelando cuenta 903911

update cuenta set estatus_cuenta_id = 3 where num_cuenta = '903911';
update cuenta set fecha_estatus = to_date('25/12/2018 23:59:59', 'dd/mm/yyyy hh24:mi:ss')
where num_cuenta = '903911';

insert into historico_estatus_cuenta (historico_estatus_cuenta_id, 
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (hist_estatus_cta_seq.nextval, 
to_date('25/12/2018 23:59:59', 'dd/mm/yyyy hh24:mi:ss'),
(select cuenta_id from cuenta where num_cuenta = '903911'), 3);


---
--- Ejercicio B
---

prompt B. Eliminando portafolio IVV del usuario Hugo Mora Paz

delete portafolio_inversion
where tipo_portafolio_id = (
    select tipo_portafolio_id from tipo_portafolio 
    where clave = 'IVV'     
)
and cuenta_id = (
    select cuenta_id from cuenta_inversion
    where num_contrato = '124884-2'
);

update cuenta_inversion set total_portafolios = total_portafolios - 1 
where num_contrato = '124884-2';

update portafolio_inversion set porcentaje = 100 
where tipo_portafolio_id = (
    select tipo_portafolio_id from tipo_portafolio
    where clave = 'IEFA'
    ) 
and cuenta_id = (
    select cuenta_id from cuenta_inversion 
    where num_contrato = '124884-2'
);


---
--- Ejercicio C
---

prompt C. Eliminando al usuario PACO LUNA PEREZ

update cliente set cliente_aval_id = null
where cliente_aval_id = (
    select cliente_id from cliente
    where nombre = 'PACO'   and
    ap_paterno = 'LUNA'     and
    ap_materno = 'PEREZ'
);
delete from historico_estatus_cuenta
where cuenta_id = (
    select cuenta_id from cuenta
    where cliente_id = (
        select cliente_id from cliente
        where nombre = 'PACO'   and
        ap_paterno = 'LUNA'     and
        ap_materno = 'PEREZ'
    )
);
delete from portafolio_inversion
where cuenta_id = (
    select cuenta_id from cuenta
    where cliente_id = (
        select cliente_id from cliente
        where nombre = 'PACO'   and
        ap_paterno = 'LUNA'     and
        ap_materno = 'PEREZ'
    )
);
delete from cuenta_inversion
where cuenta_id = (
    select cuenta_id from cuenta
    where cliente_id = (
        select cliente_id from cliente
        where nombre = 'PACO'   and
        ap_paterno = 'LUNA'     and
        ap_materno = 'PEREZ'
    )
);
delete from cuenta_ahorro
where cuenta_id = (
    select cuenta_id from cuenta
    where cliente_id = (
        select cliente_id from cliente where 
        nombre = 'PACO'     and
        ap_paterno = 'LUNA' and
        ap_materno = 'PEREZ'
    )
);
delete from cuenta
where cliente_id = (
    select cliente_id from cliente where 
    nombre = 'PACO'     and
    ap_paterno = 'LUNA' and
    ap_materno = 'PEREZ'
);
delete from cliente where 
nombre = 'PACO'     and
ap_paterno = 'LUNA' and
ap_materno = 'PEREZ';


prompt D. Haciendo commit
commit;