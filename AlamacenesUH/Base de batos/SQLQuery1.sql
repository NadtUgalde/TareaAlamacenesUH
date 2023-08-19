 
create database AlmacenUH

use AlmacenUH

create table Clientes
(	
	Id_cliente int identity(1,1),
	Nombre varchar(50),
	Direccion varchar(50),
	Telefono varchar(12),
	constraint Pk_id primary key (Id_cliente)
	)


	create procedure Sp_GestionarClientes
		@Operacion int = 0,
		@id_cliente int = 0,
		@Nombre varchar(50) = '',
		@Direccion varchar (50) = '',
		@Telefono varchar (12) = ''

		as

		begin

		If @Operacion = 1  --Agregar
			begin
			insert into Clientes values (@Nombre, @Direccion, @Telefono)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete clientes where id_cliente=@id_cliente
			end
		Else if @Operacion =3 --Modificar
			begin
			update clientes set Nombre=@Nombre, Direccion =@Direccion, Telefono= @Telefono
			where id_cliente=@id_cliente
			end
		Else if @Operacion =4 --Consultar
			begin
			select * from Clientes
			end
		end


	exec sp_gestionarClientes 1,0,'esteban','san ramon','444444'
	exec sp_gestionarClientes 4


	create TABLE ordenes
	(   id_orden INT identity,     
		id_cliente INT,     
		fecha DATE,     
		total DECIMAL(10,2),
		constraint PK_id_orden primary key (id_orden),
		FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
	);

	create TABLE productos 
	(   id_producto INT PRIMARY KEY,    
		nombre VARCHAR(100),    
		precio DECIMAL(10,2) 
		
     );

	create TABLE detalles_ordenes 
	(    
		id_detalle INT PRIMARY KEY,     
		id_orden INT,     
		id_producto INT,     
		cantidad INT,     
		FOREIGN KEY (id_orden) REFERENCES ordenes (id_orden),     
		FOREIGN KEY (id_producto) REFERENCES productos(id_producto) 
	);



	create procedure Sp_GestionarOrdenes
		@Operacion int = 0,
		@id_orden  int = 0,
		@id_cliente int = 0,
		@fecha DATE = '',     --formato YYYY-MM-DD
		@total DECIMAL(10,2)= 0
		as
		begin
		If @Operacion = 1  --Agregar
			begin
			insert into ordenes (id_cliente,fecha,total) values ( @id_cliente,@fecha, @total)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete ordenes where id_orden=@id_orden
			end
		Else if @Operacion =3 --Modificar
			begin
			update ordenes set id_cliente=@id_cliente, fecha=@fecha, total =@total
			where id_orden=@id_orden
			end
		Else if @Operacion =4 --Consultar
			begin
			select * from ordenes
			end
		end

	
	EXEC Sp_GestionarOrdenes 1,1,1,'2023-07-22',7001
	Exec Sp_GestionarOrdenes 4
	


	 create procedure sp_productos 
		@Operacion int = 0,
		@id_producto INT = 0,    
		@nombre VARCHAR(100) ='',    
		@precio DECIMAL(10,2)= 0   
		as
		begin
		If @Operacion = 1  --Agregar
			begin
			insert into productos (id_producto, nombre, precio) values (@id_producto,@nombre,@precio)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete productos where id_producto=@id_producto
			end
		Else if @Operacion =3 --Modificar
			begin
			update productos set  nombre=@nombre, precio =@precio
			where id_producto=@id_producto
			end
		Else if @Operacion = 4 --Consultar
			begin
			select * from productos
			end
		end

	exec sp_productos 1,2,'camisa amarilla',2000
	
	execute sp_productos 4 


	

	create procedure sp_GestionarDetallesOrdenes
		@Operacion int = 0,
		@id_detalle INT =0,     
		@id_orden INT =0,     
		@id_producto INT =0, 
		@cantidad INT =0  
		as
		begin
		If @Operacion = 1  --Agregar
			begin
			insert into detalles_ordenes (id_detalle, id_orden, id_producto,cantidad) 
			values (@id_detalle, @id_orden, @id_producto, @cantidad)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete detalles_ordenes where id_detalle=@id_detalle
			end
		Else if @Operacion =3 --Modificar
			begin
			update detalles_ordenes set  id_producto=@id_producto, cantidad =@cantidad
			where id_detalle=@id_detalle
			end
		Else if @Operacion = 4 --Consultar
			begin
			select * from detalles_ordenes
			end
		end

		exec sp_GestionarDetallesOrdenes 1,2,2,8,10

		exec sp_GestionarDetallesOrdenes 4



	create table USUARIOS
	(	Id int identity,
		usuario varchar (50),
		clave varchar (50),
		constraint pk_usuario primary key (ID),
		constraint uq_usuario unique (usuario)
	)

	create procedure ValidarUsuario
	@usuario varchar (50),
	@clave varchar (50)

	as 
	begin
		select usuario, clave from usuarios where usuario=@usuario and clave= @clave
	end


	insert into usuarios (usuario, clave) values ('Bryan',123),('Vale',123)
	select * from Usuarios