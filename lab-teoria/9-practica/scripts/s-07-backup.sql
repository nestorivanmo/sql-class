---@Autor:              Néstor Martínez Ostoa
---@Fecha de creación:  05/05/2020
---@Descripción:        Desarrollo práctica 9


---
--- Table: consulta1
---

create table consulta_1 as
  select id, nombre, clave, municipio, 
    to_char(ultima_revision, 'dd/mm/yyyy hh24:mi:ss') as "ULTIMA_REVISION"
  from aeropuerto
  where tipo='closed' and ultima_revision between to_date('10/2012', 'mm/yyyy')
    and to_date('03/2015', 'mm/yyyy')
  ;
  
--drop table consulta_1;
--select * from consulta_1;


---
--- Table: consulta2
---

create table consulta_2 as
  select id, nombre, municipio, region_iso, 
    trunc((elevacion * (1/3.281)),3) as "ELEVACION_METROS"
  from aeropuerto
  where tipo='large_airport';
  
--drop table consulta_2;
--select * from consulta_2;


---
--- Table: consulta3
---


create table consulta_3 as
  select nombre, 
    trunc(((latitud * 10002.29) / 90), 4) as "LAT_CARTESIANA",
    trunc(((longitud * 10002.29) / 90), 4) as "LONG_CARTESIANA",
    latitud as "LATITUD_GRADOS",
    longitud as "LONGITUD_GRADOS"
  from aeropuerto
  where region_iso = 'MX-OAX';
  
--drop table consulta_3;
--select * from consulta_3;


---
--- Table: consulta4
---

create table consulta_4 as
  select d.nombre, d.tipo,            --d: destino
    o.latitud   as "LATITUD_BENITO",  --o: origen
    o.longitud  as "LONGITUD_BENITO", 
    d.latitud   as "LATITUD_OTRO", 
    d.longitud  as "LONGITUD_OTRO",
    trunc(sqrt(
          power(((o.latitud * 10002.29)/90) - ((d.latitud * 10002.29)/90), 2) +
          power(((o.longitud * 10002.29)/90) - ((d.longitud * 10002.29)/90), 2)
          ), 5
    )           as distancia
  from aeropuerto o, aeropuerto d
  where o.id = 4731
  and d.region_iso = 'MX-DIF'
  and d.id <> 4731
  and d.tipo <> 'closed'
  order by distancia asc;
  
--drop table consulta_4;
--select * from consulta_4;


---
--- table: consulta5
---

create table consulta_5 as
  select id, clave, nombre, municipio, codigo_gps, codigo_iata,
    to_char(ultima_revision, 'Fmday"," month dd "of" yyyy "at" hh24:mi:ss') 
    as "ULTIMA_REVISION"
  from aeropuerto
  where region_iso='MX-CHP';
  
--drop table consulta_5;
--select * from consulta_5;


---
--- Table: consulta6
---

alter session set nls_language=spanish;

create table consulta_6 as
  select id, to_char(ultima_revision, 'FMdd/month/yyyy') as ultima_revision,
  trunc(to_date('01/01/2018', 'dd/mm/yyyy') - ultima_revision) as faltan
  from aeropuerto
  where to_char(ultima_revision, 'dd/mm') = '10/12' or
    to_char(ultima_revision, 'dd/mm') = '15/12'
  order by faltan desc;
  
--drop table consulta_6;
--select * from consulta_6;
alter session set nls_language=american;

---
--- Table: consulta7
---

create table consulta_7 as
  select distinct decode (tipo,   'seaplane_base',  'B',
                                  'medium_airport', 'M',
                                  'small_airport',  'S',
                                  'closed',         'C',
                                  'large_airport',  'L',
                                  'heliport',       'H') "CLAVE_TIPO",
                  upper(tipo) as "TIPO"
  from aeropuerto;
  
--drop table consulta_7;
--select * from consulta_7;


---
--- Table: consulta8
---

create table consulta_8 as
  select 
    ( decode(length(id),  1,  '00000' ||  to_char(id),
                          2,  '0000'  ||  to_char(id),
                          3,  '000'   ||  to_char(id),  
                          4,  '00'    ||  to_char(id),
                          5,  '0'     ||  to_char(id),
                          6,              to_char(id)
      ) || '-' || 
      upper(substr(region_iso, 4,3)) || '-' ||
      upper(substr(municipio, -2))
    ) as folio, 
    region_iso, municipio, wikipedia_link
  from aeropuerto;

--drop table consulta_8;
--select * from consulta_8;


---
--- Table: consulta9
---

create table consulta_9 as
  select 
    ( decode(length(id),  1,  '00000' ||  to_char(id),
                          2,  '0000'  ||  to_char(id),
                          3,  '000'   ||  to_char(id),  
                          4,  '00'    ||  to_char(id),
                          5,  '0'     ||  to_char(id),
                          6,              to_char(id)
      ) || '-' || 
      upper(substr(region_iso, 4,3)) || '-' ||
      nvl(upper(substr(municipio, -2)), 'NN')
    ) as folio, 
    region_iso, municipio, wikipedia_link
  from aeropuerto;

--drop table consulta_9;
--select * from consulta_9;


---
--- Table: consulta10
---


create table consulta_10 as
  select nombre, pagina_web,
    nullif(substr(pagina_web, instr(pagina_web, '?') + 1), pagina_web) 
    as parametros
  from aeropuerto
  where pagina_web is not null;
  
--drop table consulta_10;
--select * from consulta_10;


---
--- Table: consulta11
---

create table consulta_11 as
  select nombre, municipio, 
  substr(wikipedia_link, instr(wikipedia_link, '/', 1, 4)) as path,
  decode(substr(wikipedia_link, instr(wikipedia_link, '/', 1, 4)),
        null, 0,
              length(substr(wikipedia_link, instr(wikipedia_link, '/', 1, 4)))
  ) as total_longitud
  from aeropuerto
  where tipo='small_airport' and region_iso = 'MX-BCS';

--drop table consulta_11;
--select * from consulta_11;

