use JuanPineda_1_12_2021;

#CRUD FLUJO PRINCIPAL DEL PROGRAMA

# -- CREATE 
INSERT INTO paciente values("id123456","Camilo","Andres","Martinez","Lopez",null,"calle 10","14","4","3105478963",'1989-11-11');
INSERT INTO farmaco values("fa145","prov123","Alcohol","Alcohol","ADF12345","R-OH",40,40000,1000);
INSERT INTO servicio values("neumologia",500000);
INSERT INTO facultativo values("co46789","Daniel","Oswaldo","Garcia","Perez","calle 18","20","44","3105474693","neumologia");
INSERT INTO ingreso values("id123456","A14",'2019-07-04 07:59:59',null,"Hombre con complicaciones para respirar","neumologia");
INSERT INTO consumoservicio values("neumologia","ACJ310","fa145",'2019-07-04 07:59:59',5);
INSERT INTO consumoreceta values("fa145","ABD1234","id123456","A14","co46789",'2019-07-04 07:59:59',6);
INSERT INTO revision values("co46789","re1456","id123456","A14",'2019-07-04 11:59:59',"paciente con flema abundante y con malestar general");

# -- READ
SELECT primerNombre as "Nombre",primerApellido as "Apellido" FROM juanpineda_1_12_2021.paciente WHERE identificacion ="id123456";
SELECT nombreComercial as "Nombre Comercial",precioUnidad as "Precio por Dosis" FROM juanpineda_1_12_2021.farmaco WHERE numeroRegistro ="fa145";
SELECT nombreServicio as "Servicio Clinico",valorServicio as "Costo Servicio" FROM juanpineda_1_12_2021.servicio WHERE nombreServicio ="neumologia";
SELECT primerNombre as "Nombre", especialidad as "Especialidad o área" FROM juanpineda_1_12_2021.facultativo WHERE numeroColegiado ="co46789";
SELECT concat(identificacion,"-",consecutivo) as "Numero de visita", nombreServicio as "Servicio" FROM juanpineda_1_12_2021.ingreso WHERE identificacion ="id123456";
SELECT idConsumoServicio as "Producto consumido",cantidad as "Cantidad consumido" FROM juanpineda_1_12_2021.consumoservicio WHERE idservicio ="neumologia";
SELECT idConsumoReceta as "Producto consumido",cantidad as "Cantidad consumido" FROM juanpineda_1_12_2021.consumoreceta WHERE idFarmaco ="fa145";
SELECT idIngreso1 as "Paciente",informe FROM juanpineda_1_12_2021.revision WHERE idFacultativo ="co46789";

# -- UPDATE
UPDATE  juanpineda_1_12_2021.paciente SET primerApellido="Marin" WHERE identificacion="id123456";
UPDATE  juanpineda_1_12_2021.farmaco SET ubicacion="ADF12362" WHERE numeroRegistro="fa145";
UPDATE  juanpineda_1_12_2021.servicio SET valorServicio=450000 WHERE nombreServicio="neumologia";
UPDATE  juanpineda_1_12_2021.facultativo SET telefono="3154889966" WHERE numeroColegiado="co46789";
UPDATE  juanpineda_1_12_2021.ingreso SET fechaAlta='2019-07-06 17:22:59' WHERE identificacion="id123456" and consecutivo="A14";
UPDATE  juanpineda_1_12_2021.consumoservicio SET cantidad=3 WHERE idservicio="neumologia" and idConsumoServicio="ACJ310";
UPDATE  juanpineda_1_12_2021.consumoreceta SET cantidad=3 WHERE idFarmaco="fa145";
UPDATE  juanpineda_1_12_2021.revision SET informe="El paciente es remitido a otra area de la clinica" WHERE idFacultativo="co46789";

#-- DELETE
DELETE  FROM juanpineda_1_12_2021.revision WHERE idFacultativo="co46789";
DELETE  FROM  juanpineda_1_12_2021.consumoreceta  WHERE idFarmaco="fa145";
DELETE  FROM  juanpineda_1_12_2021.consumoservicio  WHERE idservicio="neumologia" and idConsumoServicio="ACJ310";
DELETE  FROM  juanpineda_1_12_2021.ingreso  WHERE identificacion="id123456" and consecutivo="A14";
DELETE  FROM  juanpineda_1_12_2021.facultativo WHERE numeroColegiado="co46789";
DELETE  FROM  juanpineda_1_12_2021.servicio WHERE nombreServicio="neumologia";
DELETE  FROM  juanpineda_1_12_2021.farmaco WHERE numeroRegistro="fa145";
DELETE  FROM  juanpineda_1_12_2021.paciente WHERE identificacion="id123456";



