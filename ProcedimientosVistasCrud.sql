USE JuanPineda_1_12_2021;

# CREATE Pacientes

drop procedure if exists sp_insertar_pacientes;
DELIMITER $$
create procedure sp_insertar_pacientes(
	in identificacion varchar(50),
    in primerNombre varchar(30),
    in segundoNombre varchar(30),
    in primerApellido varchar(30),
    in segundoApellido varchar(30),
    in numeroSS varchar(50),
    in calle varchar(50),
    in numero varchar(3),
    in piso varchar(3),
    in telefono varchar(20),
    in fechaNacimiento date
)
begin
	insert into paciente value(
		identificacion,
        primerNombre,
        segundoNombre,
        primerApellido,
        segundoApellido,
        numeroSS,
        calle,
        numero,
        piso,
        telefono,
        fechaNacimiento
    );
end$$
DELIMITER ;

call sp_insertar_pacientes("id123456789","Camilo","Andres","Martinez","Lopez",null,"calle 10","14","4","3105478963",'1989-11-11');

# READ Pacientes

drop procedure if exists sp_listar_pacientes;
DELIMITER $$
create procedure sp_listar_pacientes()
begin
	select 
		u.identificacion as 'Código',
        u.primerNombre as '1 Nombre ',
        u.segundoNombre as '2 Nombre',
        u.primerApellido as'Apellido Paterno',
        u.segundoApellido as'Apellido Materno',
        u.numeroSS as 'Seguridad Social',
        u.calle as"Calle Principal",
        u.numero as "#",
        u.piso as"Piso o Interior",
        u.telefono as 'Contacto',
        u.fechaNacimiento as "Fecha de nacimiento "
	from
		paciente u;
end$$
DELIMITER ;

call sp_listar_pacientes();

# UPDATE Pacientes

drop procedure if exists sp_actualizar_pacientes;
DELIMITER $$
create procedure sp_actualizar_pacientes(
	in identificacion varchar(50),
    in primerNombre varchar(30),
    in segundoNombre varchar(30),
    in primerApellido varchar(30),
    in segundoApellido varchar(30),
    in numeroSS varchar(50),
    in calle varchar(50),
    in numero varchar(3),
    in piso varchar(3),
    in telefono varchar(20),
    in fechaNacimiento date
)
begin
	update paciente p set
		p.primerNombre=primerNombre,
        p.segundoNombre=segundoNombre,
        p.primerApellido=primerApellido,
        p.segundoApellido=segundoApellido,
        p.numeroSS=numeroSS,
        p.calle=calle,
        p.numero=numero,
        p.piso=piso,
        p.telefono=telefono,
        p.fechaNacimiento=fechaNacimiento
     where p.identificacion=identificacion;
end$$
DELIMITER ;

call sp_actualizar_pacientes("id123456789","Cami","Andres","Martinez","Lopez","2456789","calle 10","14","4","3105478963",'1989-11-11');

# DELETE PACIENTES

drop procedure if exists sp_borrar_paciente_identificacion;
DELIMITER $$
create procedure sp_borrar_paciente_identificacion(
	in identificacion varchar(50)
)
begin

	delete from paciente u
	where 
		u.identificacion = identificacion;
end$$
DELIMITER ;

call sp_borrar_paciente_identificacion("71456987");

####################################################################################################################################
# CREATE Servicios

drop procedure if exists sp_insertar_servicios;
DELIMITER $$
create procedure sp_insertar_servicios(
	in nombreServicio varchar(50),
    in valorServicio decimal
)
begin
	insert into servicio value(
		nombreServicio,
        valorServicio
    );
end$$
DELIMITER ;

call sp_insertar_servicios("Neurologia",1000000);

# READ SERVICIOS

drop procedure if exists sp_listar_servicios;
DELIMITER $$
create procedure sp_listar_servicios()
begin
	select 
		s.nombreServicio as 'Servicio Medico',
        s.valorServicio   as "Costo Servicio "
	from
		servicio s;
end$$
DELIMITER ;

call sp_listar_servicios();

# UPDATE SERVICIOS

drop procedure if exists sp_actualizar_servicios;
DELIMITER $$
create procedure sp_actualizar_servicios(
	in nombreServicio varchar(50),
    in valorServicio decimal
)
begin
	update servicio s set
		s.valorServicio  =valorServicio
     where s.nombreServicio=nombreServicio;
end$$
DELIMITER ;

call sp_actualizar_servicios("Neurologia",500000);

# DELETE SERVICIOS

drop procedure if exists sp_borrar_servicio;
DELIMITER $$
create procedure sp_borrar_servicio(
	in nombreServicio varchar(50)
)
begin

	delete from servicio s
	where 
		s.nombreServicio = nombreServicio;
end$$
DELIMITER ;

call sp_borrar_servicio("Neurologia");

select * from revision;
#############################################################
#VISTAS

drop view if exists detalle_revision;
create view detalle_revision as 
 select 
	r.informe as "INFORME",
    f.primerNombre AS "NOMBRE FACULTATIVO",
    p.primerNombre AS "PACIENTE"
from 
	facultativo f inner join revision r on f.numeroColegiado = r.idFacultativo
    inner join ingreso i on i.identificacion = r.idIngreso1 and i.consecutivo = r.idIngreso2
    inner join paciente p on p.identificacion = i.identificacion;
 
 select * from detalle_revision;
 
 
 select * from servicio; 
 
drop view if exists gastoServicio;
create view gastoServicio as
 select 
	s.nombreServicio as "servicio",
    s.valorServicio as "valor",
    c.cantidad as "Cantidad",
    f.nombreComercial as "Nombre Farmaco",
    f.precioUnidad as "Precio por Unidad",
    s.valorServicio+(c.cantidad*f.precioUnidad) as "Total Consumido en el servicio"
 
 from
 servicio s inner join consumoServicio c on s.nombreServicio=c.idservicio
 inner join farmaco f on c.numeroRegistro = f.numeroRegistro;
 
  select * from gastoServicio;
 