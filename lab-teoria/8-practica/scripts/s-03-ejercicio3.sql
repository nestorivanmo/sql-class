---Autor: Néstor Martínez Ostoa
---Fecha: 26/04/2020
---Descripción: Inserción de datos. 

connect nimo_p0802_cuentas;

prompt A. Llenando la tabla Estatus de cuentas empleados.
insert into estatus_cuenta(estatus_cuenta_id, clave, activo, descripcion)
values (1, 'ABIERTA', 1, 'Cuenta válida y vigente');
insert into estatus_cuenta(estatus_cuenta_id, clave, activo, descripcion)
values (2, 'SUSPENDIDA', 1, 'Cuenta que no permite movimientos por un periodo de 
tiempo determinado.');
insert into estatus_cuenta(estatus_cuenta_id, clave, activo, descripcion)
values (3, 'CONGELADA', 1, 'Cuenta que no permite movimientos por tiempo 
indefinido.');

prompt B. Generando las sentencias para llenar la tabla Banco.
insert into banco(banco_id, nombre) values (60, 'BMEX');
insert into banco(banco_id, nombre) values (61, 'BANCA PLUS');
insert into banco(banco_id, nombre) values (62, 'BANEXITO');

prompt C. Generando las sentencias para llenar la tabla tipo portafolio.
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values(100, 'IEFA', 'Renta variable Internacional', 1);
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values(200, 'IVV', 'Renta variable de los EU', 1);
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values(300, 'IEMG', 'Renta variable Internacional Global', 1);


prompt D. Generar un cliente. 
insert into cliente(cliente_id, nombre, ap_paterno, ap_materno, curp,
fecha_nacimiento, email)
values (cliente_seq.nextval, 'GERARDO', 'LARA', 'URSUL','LAURGE891101HDF003',
to_date('01/11/1989', 'dd/mm/yyyy'), 'gerardo@mail.com');


prompt E. Generar cliente con cuenta
insert into cliente(cliente_id, nombre, ap_paterno, ap_materno, curp,
fecha_nacimiento, email)
values (cliente_seq.nextval, 'PACO', 'LUNA', 'PEREZ', 'LUPEPA900401HDF009',
to_date('01/04/1990', 'dd/mm/yyyy'), 'paco@mail.com');

insert into cuenta(cuenta_id, num_cuenta, tipo, saldo, fecha_estatus, 
estatus_cuenta_id, banco_id, cliente_id)
values (cuenta_seq.nextval, '903903', 'A', 5500.50, 
to_date('10/10/2009', 'dd/mm/yyyy'), 1, 60, cliente_seq.currval);

insert into cuenta_ahorro(cuenta_id, nip_cajero, num_tarjeta_debito, 
limite_retiro)
values(cuenta_seq.currval, 9990, '1657090812110000', 10000);

insert into historico_estatus_cuenta (historico_estatus_cuenta_id, fecha_estatus, 
cuenta_id, estatus_cuenta_id)
values (hist_estatus_cta_seq.nextval, to_date('10/10/2009', 'dd/mm/yyyy'),
cuenta_seq.currval, 1);


prompt F. Insertar datos de un portafolio
insert into cliente(cliente_id, nombre, ap_paterno, ap_materno, curp,
fecha_nacimiento, cliente_aval_id)
values (cliente_seq.nextval, 'HUGO', 'MORA', 'PAZ', 'MOPAHU010922HDF005',
to_date('22/09/2001', 'dd/mm/yyyy'), (select cliente_id from cliente where 
nombre = 'PACO' and ap_paterno = 'LUNA' and ap_materno = 'PEREZ'));

insert into cuenta (cuenta_id, num_cuenta, tipo, saldo, fecha_estatus,
estatus_cuenta_id, banco_id, cliente_id)
values 
(cuenta_seq.nextval, '903904', 'I', 1000000, 
to_date('14/02/2017', 'dd/mm/yyyy'), 3, 62, cliente_seq.currval);

insert into historico_estatus_cuenta (historico_estatus_cuenta_id,
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (
hist_estatus_cta_seq.nextval, to_date('01/01/2016', 'dd/mm/yyyy'),
cuenta_seq.currval, 1);

insert into historico_estatus_cuenta (historico_estatus_cuenta_id,
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (
hist_estatus_cta_seq.nextval, to_date('14/02/2017', 'dd/mm/yyyy'),
cuenta_seq.currval, 3);


insert into cuenta_inversion (cuenta_id, num_contrato, fecha_contrato,
total_portafolios)
values ( cuenta_seq.currval, '124884-2',
to_date('31/12/2018', 'dd/mm/yyyy'), 2);


insert into portafolio_inversion (tipo_portafolio_id, cuenta_id, 
porcentaje, plazo)
values (100, cuenta_seq.currval, 50.00, 6);

insert into portafolio_inversion (tipo_portafolio_id, cuenta_id, 
porcentaje, plazo)
values (200, cuenta_seq.currval, 50.00, 6);


prompt G. Cliente import
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno,
curp, fecha_nacimiento, email, cliente_aval_id)
values (cliente_seq.nextval, 'SARA', 'OLMOS', 'GUTIERREZ', 
'GUOLSA790203HDFG00', to_date('03/02/1979', 'dd/mm/yyyy'),
'sara@gmail.com', (select cliente_id from cliente where
nombre = 'PACO' and ap_paterno = 'LUNA'));


insert into cuenta( cuenta_id, num_cuenta, tipo, saldo, 
fecha_estatus, estatus_cuenta_id, banco_id, cliente_id)
values (cuenta_seq.nextval, '903911', 'A', 5000,
to_date('18/09/2017 11:51:05', 'dd/mm/yyyy hh24:mi:ss'),
1, 62, cliente_seq.currval);


insert into cuenta_ahorro(cuenta_id, nip_cajero, num_tarjeta_debito, 
limite_retiro)
values (cuenta_seq.currval, 8888, '1450678300097777', 25000);

insert into historico_estatus_cuenta(historico_estatus_cuenta_id,
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (hist_estatus_cta_seq.nextval, 
to_date('18/09/2017 11:51:05', 'dd/mm/yyyy hh24:mi:ss'), 
cuenta_seq.currval, 1);


insert into cuenta( cuenta_id, num_cuenta, tipo, saldo, 
fecha_estatus, estatus_cuenta_id, banco_id, cliente_id)
values (cuenta_seq.nextval, '903912', 'I', 5000,
to_date('18/10/2017', 'dd/mm/yyyy'), 3, 62, cliente_seq.currval);


insert into cuenta_inversion(cuenta_id, num_contrato,
fecha_contrato, total_portafolios)
values (cuenta_seq.currval, '133478-3', 
to_date('19/09/2017', 'dd/mm/yyyy'), 1);


insert into portafolio_inversion (tipo_portafolio_id,
cuenta_id, porcentaje, plazo)
values (300, cuenta_seq.currval, 10, 2);

insert into historico_estatus_cuenta(historico_estatus_cuenta_id,
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (hist_estatus_cta_seq.nextval, 
to_date('18/09/2017 11:51:05', 'dd/mm/yyyy hh24:mi:ss'), 
cuenta_seq.currval, 1);


insert into historico_estatus_cuenta(historico_estatus_cuenta_id,
fecha_estatus, cuenta_id, estatus_cuenta_id)
values (hist_estatus_cta_seq.nextval, 
to_date('18/10/2017 11:51:05', 'dd/mm/yyyy hh24:mi:ss'), 
cuenta_seq.currval, 3);

prompt H. commit
commit;