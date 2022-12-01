
--Creación del espacio de trabajo 

create schema practica authorization plopwnoj;


--Creación de las tablas CORPORATEGROUP, BRAND, MODEL


create table practica.corporategroup (
	idcorp varchar(10) not null, --pk
	corp_name varchar(20) not null
);

alter table practica.corporategroup
add constraint corp_PK primary key (idcorp);



create table practica.brand (
	idbrand varchar(10) not null, --pk
	idcorp varchar(10) not null, --fk
	brand_name varchar(20) not null
);

alter table practica.brand
add constraint brand_PK primary key (idbrand);

alter table practica.brand
add constraint corp_FK foreign key (idcorp)
references practica.corporategroup (idcorp);



create table practica.model (
	idmodel varchar(10) not null, --pk
	idbrand varchar(10) not null, --fk
	model_name varchar(20) not null
);

alter table practica.model
add constraint model_PK primary key (idmodel);

alter table practica.model
add constraint brand_FK foreign key (idbrand)
references practica.brand (idbrand);




--Inserción de datos en estas tres tablas


insert into practica.corporategroup (idcorp, corp_name) values ('001', 'Volkswagen Group');
insert into practica.corporategroup (idcorp, corp_name) values ('002', 'PSA Group');


insert into practica.brand (idbrand, idcorp, brand_name) values ('001', '001', 'SEAT');
insert into practica.brand (idbrand, idcorp, brand_name) values ('002', '001', 'Audi');
insert into practica.brand (idbrand, idcorp, brand_name) values ('003', '002', 'Citroen');
insert into practica.brand (idbrand, idcorp, brand_name) values ('004', '002', 'Peugeout');


insert into practica.model (idmodel, idbrand, model_name) values ('001', '001', 'Ibiza');
insert into practica.model (idmodel, idbrand, model_name) values ('002', '001', 'Ateca');
insert into practica.model (idmodel, idbrand, model_name) values ('003', '002', 'A3');
insert into practica.model (idmodel, idbrand, model_name) values ('004', '002', 'A4');
insert into practica.model (idmodel, idbrand, model_name) values ('005', '003', 'C4');
insert into practica.model (idmodel, idbrand, model_name) values ('006', '003', 'C3');
insert into practica.model (idmodel, idbrand, model_name) values ('007', '004', '308');
insert into practica.model (idmodel, idbrand, model_name) values ('008', '004', '208');




--Creación de tablas auxiliares: INSURER, CURRENCY y COLOR


create table practica.insurer (
	idinsurer varchar(10) not null, --pk
	insurer_name varchar(20) not null
);

alter table practica.insurer
add constraint insurer_PK primary key (idinsurer);



create table practica.currency (
	idcurrency varchar(10) not null, --pk
	currency_name varchar(5) not null
);

alter table practica.currency
add constraint currency_PK primary key (idcurrency);



create table practica.color (
	idcolor varchar(10) not null, --pk
	color_name varchar(10) not null
);

alter table practica.color
add constraint color_PK primary key (idcolor);



--Inserción de datos en estas tres tablas auxiliares

insert into practica.insurer (idinsurer, insurer_name) values ('001', 'Maphre');
insert into practica.insurer (idinsurer, insurer_name) values ('002', 'Allianz');
insert into practica.insurer (idinsurer, insurer_name) values ('003', 'Mutua Madrileña');
insert into practica.insurer (idinsurer, insurer_name) values ('004', 'AXA');


insert into practica.currency (idcurrency, currency_name) values ('001', '$');
insert into practica.currency (idcurrency, currency_name) values ('002', '€');


insert into practica.color (idcolor, color_name) values ('001', 'Blanco');
insert into practica.color (idcolor, color_name) values ('002', 'Azul');
insert into practica.color (idcolor, color_name) values ('003', 'Gris');
insert into practica.color (idcolor, color_name) values ('004', 'Negro');



--Creación de tabla CAR con sus primary keys y foreign keys


create table practica.car (
	idcar varchar(10) not null, --pk
	idmodel varchar(10) not null, --fk
	idinsurer varchar(10) not null, --fk
	idcolor varchar(10) not null, --fk
	registration_num varchar(15) not null, 
	mileage integer not null,
	insurance_num integer not null,
	purchase_date date not null,
	description varchar(256) null default 'Sin observaciones'
);

alter table practica.car
add constraint car_PK primary key (idcar);


alter table practica.car
add constraint model_FK foreign key (idmodel)
references practica.model (idmodel);


alter table practica.car
add constraint insurer_FK foreign key (idinsurer)
references practica.insurer (idinsurer);


alter table practica.car
add constraint color_FK foreign key (idcolor)
references practica.color (idcolor);


--Inserción de datos en CAR

insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('001', '001', '002', '001', '9823QFH', 54700, 1092839, '2020-03-12');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('002', '007', '001', '004', '1824AML', 31000, 2092431, '2020-09-20');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('003', '003', '004', '003', '0821AFP', 45800, 9012833, '2021-01-10');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('004', '005', '001', '003', '3825KFJ', 21600, 6092830, '2022-04-26');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('005', '002', '003', '002', '4813KGH', 15200, 2012830, '2022-09-05');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('006', '008', '004', '001', '7813BGS', 12000, 8032240, '2022-11-09');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('007', '004', '004', '002', '0813XGS', 11500, 5229139, '2022-12-20');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('008', '005', '001', '001', '3198DLZ', 16100, 6549893, '2023-02-11');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date) values ('009', '002', '003', '003', '3876PCM', 15900, 7341831, '2023-04-01');
insert into practica.car (idcar, idmodel, idinsurer, idcolor, registration_num, mileage, insurance_num, purchase_date, description) values ('010', '007', '004', '002', '1937WDQ', 12000, 4243831, '2023-07-18', 'Fallos en las luces, requiere revisión');



--Creación de tabla INSPECTION con sus primary keys y foreign keys

create table practica.inspection (
	idcar varchar(10) not null, --pf, fk
	idinspection varchar(10) not null, --pk
	mileage integer not null,
	inspect_date date not null,
	amount decimal not null,
	idcurrency varchar(10) not null,
	description varchar(256) null default 'Revisión general' 
);

alter table practica.inspection
add constraint idinspection_PK primary key (idcar, idinspection);

alter table practica.inspection
add constraint idcar_FK foreign key (idcar)
references practica.car (idcar);

alter table practica.inspection
add constraint idcurrency_FK foreign key (idcurrency)
references practica.currency (idcurrency);


--Inserción de datos en INSPECTION


insert into practica.inspection (idcar, idinspection, mileage, inspect_date, amount, idcurrency) values ('001', '001', 21000, '2021-03-10', 149.79, '002');
insert into practica.inspection (idcar, idinspection, mileage, inspect_date, amount, idcurrency) values ('002', '001', 30000, '2021-09-16', 179.99, '002');
insert into practica.inspection (idcar, idinspection, mileage, inspect_date, amount, idcurrency) values ('003', '001', 45000, '2022-01-08', 169.99, '001');
insert into practica.inspection (idcar, idinspection, mileage, inspect_date, amount, idcurrency, description) values ('001', '002', 32000, '2022-03-19', 219.89, '002', 'Luna trasera cambiada');
insert into practica.inspection (idcar, idinspection, mileage, inspect_date, amount, idcurrency, description) values ('002', '002', 40000, '2022-09-28', 279.99, '002', 'Chasis reparado');




















































