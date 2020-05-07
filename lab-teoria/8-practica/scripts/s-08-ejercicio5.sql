---Autor: Néstor Martínez Ostoa
---Fecha: 26/04/2020
---Descripción: Sentencia merge.

connect nimo_p0802_cuentas;


---
--- Ejercicio A
---

prompt A. Actualizando la tabla Cliente con los datos de la tabla Cliente_import

merge into cliente c using cliente_import i on 
(c.cliente_id = i.cliente_id) 
when matched then update
set c.nombre            =   i.nombre,
    c.ap_paterno        =   i.ap_paterno,
    c.ap_materno        =   i.ap_materno,
    c.curp              =   i.curp,
    c.fecha_nacimiento  =   i.fecha_nacimiento,
    c.email             =   i.email,
    c.cliente_aval_id   =   i.cliente_aval_id
when not matched then insert
(c.cliente_id, c.nombre, c.ap_paterno, c.ap_materno, c.curp,
c.fecha_nacimiento, c.email, c.cliente_aval_id)
values
(i.cliente_id, i.nombre, i.ap_paterno, i.ap_materno, i.curp,
i.fecha_nacimiento, i.email, i.cliente_aval_id);

prompt B. Haciendo commit;
commit;