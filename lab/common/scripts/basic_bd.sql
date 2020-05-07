drop table Sucursal cascade constraints;
drop table Departamento cascade constraints;
drop table Empleado cascade constraints;


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

insert into Sucursal values (1,'Chile',123456);
insert into Sucursal values (2,'MÃ©xico',90000);
insert into Sucursal values (3,'Colombia',55000);
insert into Sucursal values (4,'Peru',35000);
insert into Sucursal values (5,'Argentina',76000);
insert into Sucursal values (6,'USA',89000);
insert into Sucursal values (7,'Canada',77000);


INSERT INTO Departamento VALUES (1,'Ayu Gen','Jr',1000);
INSERT INTO Departamento VALUES (2,'Sistema','Sr',20000);
INSERT INTO Departamento VALUES (3,'Conta','Tr',12000);
INSERT INTO Departamento VALUES (4,'Admin','Sr',13000);
INSERT INTO Departamento VALUES (5,'DiseÃ±o','Tr',13500);

  
  
  

Insert into Empleado values(10311,'JONATHAN NOE','GALLARDO VILLEGAS','',4781,1,2);
Insert into Empleado values(10312,'ARTURO','GARCIA GARAY','',3569,2,1);
Insert into Empleado values(10313,'LUIS EDUARDO','GONZALEZ APONTE','',3087,3,1);
Insert into Empleado values(10314,'CARLOS ALBERTO','GONZALEZ GARCIA','',3487,4,5);
Insert into Empleado values(10315,'CARLOS ALBERTO','GONZALEZ SANCHEZ','',3064,5,1);
Insert into Empleado values(10316,'DIEGO ALAN','HERNANDEZ GUTIERREZ','',4378,6,'');
Insert into Empleado values(10317,'JORGE OMAR','HERNANDEZ LUNA','',4690,7,1);
Insert into Empleado values(10318,'ALEJANDRO','IZQUIERDO ALVARADO',10311,3864,7,3);
Insert into Empleado values(10319,'VICTOR HUGO','MAGOS JIMENEZ',10315,4239,'',2);
Insert into Empleado values(10320,'ABRAHAM','MEDINA DUQUE',10312,3020,3,1);
Insert into Empleado values(10321,'CLAUDIA ANDREA','MEDINA MURUETA',10313,3272,4,1);
Insert into Empleado values(10322,'CARLOS AXEL','MENDOZA REBOLLO',10312,4020,3,2);
Insert into Empleado values(10323,'LUIS FERNANDO','NAVA DOMINGUEZ',10314,3715,3,'');
Insert into Empleado values(10324,'SERGIO SALVADOR','NEAVE ARANA',10315,3882,5,4);
Insert into Empleado values(10325,'JAQUELINE','PIÃ‘A CASTILLO',10316,3930,3,'');
Insert into Empleado values(10326,'ADRIAN','RAMIREZ MUÃ‘OZ',10316,4851,3,5);
Insert into Empleado values(10327,'CARLOS DAVID','RAMIREZ REYES',10315,4989,2,4);
Insert into Empleado values(10328,'CHRISTOPHER ALEXANDER','REYES ADUNA',10315,4153,1,1);
Insert into Empleado values(10329,'GRECIA DENISSE','RODRIGUEZ CASTRO',10312,3353,5,5);
Insert into Empleado values(10330,'ROGELIO','RODRIGUEZ LOPEZ',10315,4020,1,3);
Insert into Empleado values(10331,'EMMANUEL','SANCHEZ OLIVARES',10312,3068,7,2);
Insert into Empleado values(10332,'JENNIFER DAFNE','SANTOS CRUZ',10314,3081,6,4);
Insert into Empleado values(10333,'MONICA VALERIA','VALVERDE CHAVEZ',10314,3964,6,'');
Insert into Empleado values(10334,'MARLON','VERA DIAZ',10311,4550,7,5);
Insert into Empleado values(10335,'RODRIGO','ZAVALA RODRIGUEZ',10313,4724,2,5);
Insert into Empleado values(10336,'LUIS ESTEBAN','AGUILAR ESCUTIA',10315,3313,4,2);
Insert into Empleado values(10337,'JULIO','AGUILAR ONOFRE',10311,4065,4,1);
Insert into Empleado values(10338,'JORGE GABRIEL','ALCANTARA PEREZ',10315,4198,5,5);
Insert into Empleado values(10339,'ARTURO','ALVAREZ CHAVEZ',10311,4864,7,1);
Insert into Empleado values(10340,'HERADIO JAVIER','ALVAREZ LOPEZ',10313,4083,2,2);
Insert into Empleado values(10341,'JUAN IRVING','AVILES TABARES',10313,4188,4,1);
Insert into Empleado values(10342,'OMAR YAIR','BALDERAS MATA',10313,3187,1,2);
Insert into Empleado values(10343,'MARCOS ANTONIO','BARCENAS GARCIA',10314,3093,1,5);
Insert into Empleado values(10344,'ARGELIA ELIZABETH','BARRERA DURAN',10316,3650,6,2);
Insert into Empleado values(10345,'JOVANY','CALDERON PACHECO',10312,3047,3,3);
Insert into Empleado values(10346,'RAMON','CORTES RUIZ',10316,3286,3,'');
Insert into Empleado values(10347,'LUIS ENRIQUE','DE LA ROSA MEJIA',10311,3311,'',1);
Insert into Empleado values(10348,'JOSUE TADEO','DIAZ MONROY',10313,3885,3,4);
Insert into Empleado values(10349,'EDMUNDO ISMAEL','FRAGOSO ARIZA',10312,3297,5,1);
Insert into Empleado values(10350,'BRYAN','GALICIA FALCON',10316,3864,2,5);
Insert into Empleado values(10351,'DAFNE YARETZI','GIRON REYES',10316,4833,1,1);
Insert into Empleado values(10352,'NOE','GOMEZ MARIN',10317,4690,5,2);
Insert into Empleado values(10353,'CARLOS ENRIQUE','GONZALEZ HERNANDEZ',10317,3754,2,3);
Insert into Empleado values(10354,'SANDRA IVETTE','GONZALEZ ROCHA',10317,4428,7,'');
Insert into Empleado values(10355,'ISRAEL','GONZALEZ SANCHEZ',10317,3742,3,5);
Insert into Empleado values(10356,'BRANDON SAUL','HERNANDEZ ISLAS',10317,3167,'',1);
Insert into Empleado values(10357,'ALAN','JARA PEDRAZA',10314,4720,5,'');
Insert into Empleado values(10358,'KAREN ALEXIA','JIMENEZ VAZQUEZ',10311,3871,5,2);
Insert into Empleado values(10359,'CARLOS AXEL','JIMENEZ VAZQUEZ',10316,4137,1,'');
Insert into Empleado values(10360,'GERMAN','LEON FELICIANO',10316,4745,4,'');
Insert into Empleado values(10361,'GAVIN ROLANDO','LEZA HERNANDEZ',10312,4833,7,2);
Insert into Empleado values(10362,'JESUS GEOVANI','LOPEZ LOPEZ',10311,4784,1,1);
Insert into Empleado values(10363,'JUAN CARLOS','LUNA INTERIAN',10311,3751,'','');
Insert into Empleado values(10364,'IAN MICHAEL','MARTINEZ CALDERON',10313,3393,'','');
Insert into Empleado values(10365,'BRENDA GUADALUPE','MARTINEZ JUAREZ',10314,3031,6,4);
Insert into Empleado values(10366,'CARLOS ALFREDO','MONJARAZ ARRIAGA',10312,4897,6,3);
Insert into Empleado values(10367,'MARCO FABIAN','MORENO PEDRAZA',10316,4481,7,1);
Insert into Empleado values(10368,'ITZCOATL','NAVARRO LOPEZ',10315,4894,'',2);
Insert into Empleado values(10369,'JULIO CESAR','PAREDES CERVANTES',10311,4413,2,3);
Insert into Empleado values(10370,'JUAN CARLOS DE JESUS','PEREZ GONZALEZ',10315,4178,6,3);
Insert into Empleado values(10371,'ANTONIO BALAM','POBLANO ESLAVA',10315,3225,2,3);
Insert into Empleado values(10372,'LUIS MARIO','RAMIREZ ENRIQUEZ',10315,3324,7,'');
Insert into Empleado values(10373,'EDUARDO','RAMIREZ MARTINEZ',10314,3249,'',1);
Insert into Empleado values(10374,'OMAR','RAMOS JUAREZ',10316,4186,2,2);
Insert into Empleado values(10375,'BRANDON GIOVANNI','RIVERA AGUILAR',10313,4224,4,1);
Insert into Empleado values(10376,'JANETH','RODRIGUEZ BARRON',10315,3613,7,3);
Insert into Empleado values(10377,'ROGELIO','RODRIGUEZ PEREZ',10313,4642,5,5);
Insert into Empleado values(10378,'VIVIANA ITZU','RUIZ VALDEZ',10315,3692,'',2);
Insert into Empleado values(10379,'YOKO MICHELLE','SANDOVAL DE LA ROSA',10314,3056,2,1);
Insert into Empleado values(10380,'JUAN','SILLERO SANJUAN',10316,4188,4,4);
Insert into Empleado values(10381,'VALENTIN','SOSA VILLAGOMEZ',10312,4051,3,1);
Insert into Empleado values(10382,'ITZEL VIVIANA','VILLAMIL ESPINOSA',10315,3012,4,5);


SELECT COUNT(*) FROM EMPLEADO
UNION
SELECT COUNT(*) FROM SUCURSAL
UNION
SELECT COUNT(*) FROM DEPARTAMENTO;


