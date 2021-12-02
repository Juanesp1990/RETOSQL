Drop database if exists JuanPineda_1_12_2021;
create database JuanPineda_1_12_2021;
use JuanPineda_1_12_2021;

create table paciente(
identificacion varchar(50) primary key,
primerNombre varchar(30) not null,
segundoNombre varchar(30),
primerApellido varchar(30) not null,
segundoApellido varchar(30),
numeroSS varchar(50), 
calle varchar(50) not null,
numero varchar(3) not null,
piso varchar(3) not null,
telefono varchar(50) not null,
fechaNacimiento date not null 
);

create table farmaco(
numeroRegistro varchar(50) primary key,
codigoProveedor varchar(30) not null,
nombreComercial varchar(30) not null,
nombreClinico varchar(30) not null,
ubicacion varchar(30) not null,
compuestoQuimico varchar(50) not null,
cantidadDosis int not null,
precioTotal decimal not null,
precioUnidad decimal default (precioTotal/cantidadDosis)
);

create table servicio(
nombreServicio varchar(50) primary key,
valorServicio decimal not null
);

create table facultativo(
numeroColegiado varchar(50) primary key,
primerNombre varchar(30) not null,
segundoNombre varchar(30),
primerApellido varchar(30) not null,
segundoApellido varchar(30),
calle varchar(50) not null,
numero varchar(3) not null,
piso varchar(3) not null,
telefono varchar(50) not null,
especialidad varchar(50) not null,
FOREIGN KEY (especialidad) REFERENCES servicio (nombreServicio)
);

create table ingreso(
identificacion varchar(50),
consecutivo varchar(50),
fechaIngreso datetime not null,
fechaAlta dateTime,
diagnostico varchar(500) ,
nombreServicio varchar (50) not null ,
primary key (identificacion,consecutivo),
CONSTRAINT FK_PACIENTE FOREIGN KEY (identificacion) REFERENCES paciente (identificacion),
CONSTRAINT FK_SERVICIO FOREIGN KEY (nombreServicio) REFERENCES servicio (nombreServicio)
);

create table consumoServicio(
idservicio varchar(50),
idConsumoServicio varchar(50),
numeroRegistro varchar(50),
fechaConsumo datetime not null,
cantidad int,
primary key(idservicio,idConsumoServicio),
CONSTRAINT FK_SERVICIO1 FOREIGN KEY (idServicio) REFERENCES servicio (nombreServicio),
CONSTRAINT FK_FARMACO FOREIGN KEY (numeroRegistro) REFERENCES farmaco (numeroRegistro)
);

create table consumoReceta(
idFarmaco varchar(50),
idConsumoReceta varchar(50),
idIngreso1 varchar(50),
idIngreso2 varchar(50),
numeroColegiado varchar(50) not null,
fechaConsumo datetime not null,
cantidad int not null,
primary key(idFarmaco,idConsumoReceta),
CONSTRAINT FK_FARMACO1 FOREIGN KEY (idFarmaco) REFERENCES farmaco (numeroRegistro),
CONSTRAINT FK_INGRESO FOREIGN KEY (idIngreso1,idIngreso2) REFERENCES ingreso (identificacion,consecutivo),
CONSTRAINT FK_FACULTATIVO FOREIGN KEY (numeroColegiado) REFERENCES facultativo (numeroColegiado)
);

create table revision(
idFacultativo varchar(50),
idRevision  varchar(50),
idIngreso1 varchar(50),
idIngreso2 varchar(50),
fecha datetime not null,
informe varchar(500) not null,
CONSTRAINT FK_FACULTATIVO2 FOREIGN KEY (idFacultativo) REFERENCES facultativo (numeroColegiado),
CONSTRAINT FK_INGRESO2 FOREIGN KEY (idIngreso1,idIngreso2) REFERENCES ingreso (identificacion,consecutivo),
primary key (idFacultativo,idRevision)
);