# Create, Delete, Alter objects with SQL


$ORACLE_HOME/sqlplus/admin -> archivo glogin.sql que se ejecuta cada vez que usamos sqlplus. 


vista muy particular llamada: Dictionary -> contiene el diccionario de datos

En Dictionary -> Table_name se almacena todos los nombres de las vistas de la bases de datos junto con los nombres de las tablas del usuario. 

las tablas que creemos se almacenan en el tablespace users. 

- Tablas permanentes: datos una vez que se inserten se guardan permanentemente.
	- Ordinarias: registros no se guardan en un orden particular. 
	- Indexadas: registros se guardan con respecto a la PK.
	
- Tablas externas: tablas de solo lectura porque los datos que leen/muestran están guardados en un almacenamiento externo a la base de datos. 
	