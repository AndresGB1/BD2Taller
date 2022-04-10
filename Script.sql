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

create table comentario(
 	 id_comentario int not null primary key unique,
	 direccion varchar(50),
	 valor int not null,
	 producto int not null,
	 comprador varchar(30),
	 foreign key (comprador)
	 references comprador(username),
	 foreign key (comprador)
	 references comprador(username)
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
	 categoria varchar(30),
	 marca varchar(10),
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
	 id_pro int not null primary key unique,
	 titulo varchar(20),
	 marca varchar(10),
	 categoria varchar(10),
	 foto varchar(500),
	 descripcion varchar(50),
	 proveedor varchar(30),
	 foreign key (proveedor)
	 references proveedor(username)
);
	 

create table variante(
	 codigo int not null primary key unique,
	 expiracion int not null,
	 color varchar(40),
	 estado varchar(1),
	 stock int not null,
	 producto int not null,
	 carroCompra int not null,
	 foreign key (producto)
	 references producto(id_pro),
	 foreign key (carroCompra)
	 references carroCompra(id_carro)
);



