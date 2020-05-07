connect nimo_p0802_cuentas;

delete cuenta_ahorro;
delete cuenta;
delete historico_estatus_cuenta;
delete estatus_cuenta;
delete banco;
drop sequence cliente_seq;
drop sequence cuenta_seq;
drop sequence hist_estatus_cta_seq;
delete portafolio_inversion;
delete cuenta_inversion;
delete tipo_portafolio;
delete cliente;


create sequence cliente_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- sequence: cuenta_seq 
--

create sequence cuenta_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- sequence: hist_estatus_cta_seq 
--

create sequence hist_estatus_cta_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;