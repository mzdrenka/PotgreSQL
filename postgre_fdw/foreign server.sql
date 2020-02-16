
1) Create extesion on remote and local srver

CREATE EXTENSION postgres_fdw;

2) CREATE FOREIGN DATA WRAPPER ON LOCAL SERVER 

CREATE SERVER foreign_server
        FOREIGN DATA WRAPPER postgres_fdw
        OPTIONS (host 'IP', port '5432', dbname 'foreign_db');