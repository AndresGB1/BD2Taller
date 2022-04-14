create table ciudad(
	 ciudad varchar(30) not null primary key unique,
	 descripción varchar(30)
);

create table documento(
	 id_doc int not null primary key unique,
	 tipo varchar(30)
);

create table usuario(
	 username varchar(30) not null primary key unique,
	 nombres varchar(50),
	 apellidos varchar(50),
	 num_documento int not null,
	 correo varchar(30),
	 documento int not null,
	 contraseña varchar(80), 
	 direccion varchar(25),
	 ciudad varchar(10), 
	 foreign key (documento)
	 references documento(id_doc),
	 foreign key (ciudad)
	 references ciudad(ciudad)
);

create table telefono(
	 id_tel int not null primary key unique,
	 numero int not null unique,
	 estado varchar(1),
	 usuario varchar(20),
	 foreign key (usuario)
	 references usuario(username)
);

create table admin(
	 username varchar(30) not null primary key unique,
	 direccion varchar(50),
	 foreign key(username) references usuario (username)
	
);

create table comprador(
 	 username varchar(30) not null primary key unique,
	 descripcion varchar(50),
	 foreign key(username) references usuario (username)
	 
);

create table proveedor(
	 username varchar(30) not null primary key unique,
	 autorizado int not null,
	 descripcion varchar(50),
 	 foreign key(username) references usuario (username)
	
);
create table carroCompra(
	 id_carro int not null primary key unique,
	 comprador varchar(30),
	 cantidad int not null,
	 estado varchar(1),
	 fecha date,
	 foreign key (comprador)
	 references comprador(username)
);
create table tipoenvio(
	 tipo varchar(30) not null primary key unique
);


create table compra(
	 id_compra int not null primary key unique,
	 direccionEnvio varchar(25),
	 tipo varchar(30),
	 metodo varchar(30),
	 estado varchar(1),
	 foreign key (tipo)
	 references tipoenvio(tipo),
	 foreign key (id_compra)
	 references carroCompra(id_carro)
);

create table tarcredito(
	 id_numero int not null primary key unique,
	 tipo varchar(30),
	 mes date,
	 expiración int not null,
	 codigo int not null,
	 compra int not null,
	 foreign key (compra)
	 references compra(id_compra)
);


create table producto(
	 id_producto int not null primary key unique,
	 titulo varchar(20),
	 marca varchar(10),
	 foto varchar(500),
	 stock int,
	 descripcion varchar(50),
	 precio int,
	 proveedor varchar(30),
	 foreign key (proveedor)
	 references proveedor(username)
);
create table comentario(
 	 id_comentario int not null primary key unique,
	 direccion varchar(50),
	 valor int not null,
	 producto int not null,
	 comprador varchar(30),
	 foreign key (comprador)
	 references comprador(username),
	 foreign key (producto)
	 references producto(id_producto)
);
	 

create table variante(
	 id_variante int not null primary key unique,
     foto varchar(500)[],
	 color varchar(40),
	 estado varchar(1),
	 stock int,
	 producto int not null,
	 foreign key (producto)
	 references producto(id_producto)
);

create table item(
	id_item int not null primary key unique,
	variante int not null,
	id_carro int,
	foreign key (id_carro)
	references carroCompra(id_carro),
	foreign key (variante)
	references variante(id_variante)	
)
