
--Hecho por Diego Hernandez
--Ejercicio Práctica de Modelado y SQL

create schema practica_sql authorization pbnzelim;



--Se crea la tabla PRINCIPAL  de carros
create table practica_sql.carros(
   idcarros varchar(10)  not null,  --PK
   constraint carros_PK primary key(idCarros), --Se crea la Clave primaria
   idColor varchar(10) not null,
   idPoliza varchar(10) not null,
   idModelo varchar(20) not null,
   matricula varchar(12) not null,
   kilometros varchar(100) not null,
   fecha_compra date not null,
   idRevision varchar(12) not null
);

--Tabla de Color
create table practica_sql.color(
idColor varchar(12) not null,
constraint color_PK primary key(idColor), --Se crea la Clave primaria
color varchar(12)
);


--Tabla de Polizas de Seguros
create table practica_sql.polizas(
idPoliza varchar(12) not null,
constraint poliza_PK primary key(idPoliza), --Se crea la Clave primaria
idSeguro varchar(12) not null,
numPoliza varchar(10)
);


--Tabla de Aseguradoras
create table practica_sql.aseguradora(
idSeguro varchar(12) not null,
constraint seguro_PK primary key(idSeguro), --Se crea la Clave primaria
nomAseguradora varchar(15)
);



--Tabla de Modelo de Carros
create table practica_sql.modelo(
idModelo varchar(15) not null,
constraint modelo_PK primary key(idModelo), --Se crea la Clave primaria
marcaCarro varchar(15) not null,
modeloCarro varchar(20) not null
);

--Tabla de Marcas de Carros
create table practica_sql.marcas(
idMarca varchar(15) not null,
constraint marca_PK primary key(idMarca), --Se crea la Clave primaria
marcaCarro varchar(15),
grupoMarca varchar(20) 
);

--Tabla del Grupo Empresarial
create table practica_sql.grupo(
idGrupo varchar(12) not null,
constraint grupo_PK primary key(idGrupo), --Se crea la Clave primaria
nombre varchar(21)
);

--Tabla de las Revisiones
create table practica_sql.revisiones(
idRevision varchar(12) not null,
constraint revision_PK primary key(idRevision), --Se crea la Clave primaria
kilometros varchar(10) not null,
fechaRevision date not null,
idMoneda varchar(15) not null
);


create table practica_sql.moneda(
idMoneda varchar(11) not null, 
constraint moneda_PK primary key(idMoneda), --Se crea la Clave primaria
monto varchar(20),
nombre varchar(12)
);


--Creacion de las Claves Foraneas
------------------------------------------------------------------------------------------------------

--Creacion de una clave foranea (color)
alter table practica_sql.carros
add constraint idColor foreign key (idColor)
references practica_sql.color(idColor);

--Creacion de una clave foranea (poliza)
alter table practica_sql.carros
add constraint idPoliza foreign key (idPoliza)
references practica_sql.polizas(idPoliza);

--Creacion de una clave foranea (seguro)
alter table practica_sql.polizas
add constraint idSeguro foreign key (idSeguro)
references practica_sql.aseguradora(idSeguro);

--Creacion de una clave foranea (modelo)
alter table practica_sql.carros
add constraint idModelo foreign key (idModelo)
references practica_sql.modelo(idModelo);

--Creacion de una clave foranea (marcas)
alter table practica_sql.modelo
add constraint idMarca foreign key (marcaCarro)
references practica_sql.marcas(idMarca);

--Creacion de una clave foranea (grupo)
alter table practica_sql.marcas
add constraint idGrupo foreign key (grupoMarca)
references practica_sql.grupo(idGrupo);

--Creacion de una clave foranea (moneda)
alter table practica_sql.revisiones
add constraint idMoneda foreign key (idMoneda)
references practica_sql.moneda(idMoneda);

--Creacion de una clave foranea (kilometros)
alter table practica_sql.carros
add constraint idkilom foreign key (kilometros)
references practica_sql.revisiones(idrevision);

--------------------------------------------------------------------------------------------------------

--Se insertan los datos de Color
insert into practica_sql.color (idColor, color) values ('01','Negro'); --Color Negro
insert into practica_sql.color (idColor, color) values ('02','Blanco'); --Color Blanco
insert into practica_sql.color (idColor, color) values ('03','Rojo'); --Color Rojo
insert into practica_sql.color (idColor, color) values ('04','Azul'); --Color Azul
insert into practica_sql.color (idColor, color) values ('05','Gris'); --Color Gris
insert into practica_sql.color (idColor, color) values ('06','Verde'); --Color Gris
insert into practica_sql.color (idColor, color) values ('07','Naranja'); --Color Naranja

--Se insertan los datos de la Aseguradora
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('01','Mapfre'); --Aseguradora Mapfre
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('02','Liberty Seguros'); --Aseguradora Liberty
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('03','Zurich'); --Aseguradora Zurich
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('04','AXA'); --Aseguradora AXA
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('05','VidaCaixa'); --Aseguradora VidaCaixa
insert into practica_sql.aseguradora (idseguro, nomaseguradora) values ('06','Generali'); --Aseguradora Generali


--Se insertan los datos de la poliza
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('01','03','JH43JK45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('02','02','HK35GJ45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('03','05','HK2LKJ45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('04','02','KHKL2445');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('05','01','HKGKKJ45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('06','03','JHFHK345');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('07','06','FHKJGK45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('08','06','HK34LH45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('09','02','JG43KH45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('10','01','JHDSEF45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('11','06','HKFW3445');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('12','04','FGF43245');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('13','02','HJ35W445');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('14','03','FGRD4545');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('15','01','HJREFG45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('16','02','JKGFD645');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('17','05','HK3EG545');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('18','06','JHRE4345');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('19','01','HFDW4D45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('20','03','KG43FG45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('21','01','JD6S4G45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('22','04','JKTR4345');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('23','01','JHFE3G45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('24','02','KJ43RG45');
insert into practica_sql.polizas (idpoliza, idseguro, numpoliza) values ('25','04','RGYU5445');

--Se insertan los datos en la Moneda
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('01','39,19 ','euros');  
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('02','51,62','euros');  
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('03','35,97','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('04','39,19 ','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('05','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('06','46,22','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('07','39,19 ','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('08','35,97','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('09','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('10','39,19 ','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('11','46,22','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('12','39,19 ','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('13','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('14','39,19 ','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('15','46,22','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('16','35,97','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('17','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('18','46,22','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('19','35,97','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('20','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('21','51,62','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('22','39,19','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('23','35,97','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('24','46,22','euros');
insert into practica_sql.moneda (idmoneda, monto, nombre) values ('25','35,97','euros');

--Se insertan los datos de las revisiones
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('01','12000','04-28-2021','01');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('02','14000','03-22-2020','02');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('03','27000','10-17-2022','03');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('04','12000','07-11-2020','04');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('05','22000','11-30-2020','05');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('06','35000','04-02-2023','06');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('07','12000','09-27-2022','07');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('08','12000','07-11-2023','08');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('09','14000','01-19-2023','09');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('10','22000','02-05-2023','10');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('11','35000','04-02-2022','11');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('12','22000','05-05-2020','12');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('13','27000','12-30-2023','13');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('14','22000','11-27-2022','14');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('15','14000','04-21-2020','15');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('16','35000','06-16-2020','16');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('17','14000','03-09-2023','17');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('18','22000','02-01-2022','18');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('19','23000','02-26-2020','19');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('20','27000','11-20-2021','20');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('21','22000','06-16-2023','21');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('22','27000','03-17-2021','22');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('23','14000','12-20-2020','23');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('24','22000','04-01-2021','24');
insert into practica_sql.revisiones (idrevision, kilometros, fecharevision, idmoneda) values ('25','12000','02-02-2023','25');

--Se insertan los datos de los Grupos Automovilisticos
insert into practica_sql.grupo (idgrupo, nombre) values ('01','Volkswagen'); --Grupo Volkswagen (Audi)
insert into practica_sql.grupo (idgrupo, nombre) values ('02','Ford'); --Grupo Ford 
insert into practica_sql.grupo (idgrupo, nombre) values ('03','Toyota'); --Grupo Toyota 


--Se insertan los datos de las Marcas Automovilisticas
insert into practica_sql.marcas (idmarca, marcacarro, grupomarca) values ('01','Audi','01'); --Marca Audi
insert into practica_sql.marcas (idmarca, marcacarro, grupomarca) values ('02','Ford','02'); --Marca Ford
insert into practica_sql.marcas (idmarca, marcacarro, grupomarca) values ('03','Toyota','03'); --Marca Toyota




--Se insertan los datos de los Modelos
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('01','01','A1'); --Audi A1
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('02','01','A3'); --Audi A3
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('03','01','A4'); --Audi A4
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('04','01','A7'); --Audi A7
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('05','02','Fiesta'); --Ford Fiesta
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('06','02','Mustang'); --Ford Mustang
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('07','02','Explorer'); --Ford Explorer
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('08','03','Corolla'); --Toyota Corolla
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('09','03','Yaris'); --Toyota Yaris
insert into practica_sql.modelo (idmodelo, marcacarro, modelocarro) values ('10','03','GR86'); --Toyota GR86


--Se insertan los datos de los Carros --id de carro, id del color, numero de poliza, modelo
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('01','05','01','02','6543 GFH','01','02-04-2019','01');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('02','07','02','04','4657 ETY','02','05-21-2018','02');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('03','04','03','01','4356 KJH','03','07-28-2020','03');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('04','05','04','09','1234 HFD','04','08-05-2017','04');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('05','02','05','02','6578 KII','05','03-05-2019','05');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('06','04','06','04','9876 ZXV','06','02-11-2019','06');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('07','05','07','09','9876 WER','07','10-12-2018','07');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('08','02','08','02','2345 TRF','08','05-30-2017','08');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('09','07','09','04','8765 LPO','09','02-09-2020','09');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('10','04','10','08','1234 FGT','10','12-12-2019','10');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('11','02','11','08','8766 LIU','11','06-21-2020','11');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('12','03','12','03','KJHG 756','12','05-22-2017','12');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('13','01','13','07','GHJK 746','13','12-27-2022','13');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('14','07','14','05','KIUG 234','14','04-09-2020','14');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('15','05','15','06','POLK 357','15','04-10-2017','15');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('16','02','16','09','MNBG 656','16','07-12-2019','16');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('17','01','17','03','SFGR 45','17','12-31-2022','17');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('18','03','18','05','FSDG 45','18','01-09-2019','18');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('19','03','19','06','NVDG 56','19','08-12-2018','19');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('20','06','20','01','JHDG 54','20','04-30-2020','20');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('21','05','21','07','JTET 43','21','01-26-2022','21');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('22','02','22','01','NGDF 24','22','11-28-2018','22');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('23','01','23','10','KHNK 87','23','10-15-2019','23');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('24','03','24','10','DZXV 43','24','07-12-2017','24');
insert into practica_sql.carros (idcarros,idcolor,idpoliza,idmodelo,matricula,kilometros,fecha_compra,idrevision) 
values ('25','03','25','03','KHGJ 65','25','09-05-2018','25');


-----------------------------------------------------------------------------------------------------------------------------------

--Se selecciona la Informacion del Carro, la fecha de compra, la matricula, el color, los kilometros, y la informacion
--sobre el seguro del Carro 

select modelo.modelocarro, marcas.marcacarro, grupo.nombre, fecha_compra, matricula, color, revisiones.kilometros, aseguradora.nomaseguradora, polizas.numpoliza  from pruebas.carros 
inner join practica_sql.modelo on carros.idmodelo = modelo.idmodelo           --Modelo del Carro
inner join practica_sql.marcas on modelo.marcacarro = idmarca            --Marca del Carro
inner join practica_sql.grupo on marcas.grupomarca = grupo.idgrupo             --Grupo Automotriz
inner join practica_sql.color on carros.idcolor = color.idcolor                 --Color del Carro
inner join practica_sql.revisiones on carros.idrevision = revisiones.idrevision --Se añade la tabla Revisiones
inner join practica_sql.polizas on carros.idpoliza  = polizas.idpoliza        --Se añade la tabla de Polizas
inner join practica_sql.aseguradora on polizas.idseguro = aseguradora.idseguro  --Se añade la tabla de Aseguradoras
order by carros.idcarros;

