# Floristria
mysql -u root -h localhost -p


drop database floristeria;
create database floristeria;
use floristeria;


create table clientes(
numerocli int auto_increment,
nombrecli varchar(50) not null,
direcc varchar(30) not null,
email varchar(30) not null,
primary key (numerocli)
) ENGINE=InnoDB;

create table especies(
cod_especie int auto_increment,
nomesp varchar(50) not null,
tfloracion varchar(30) not null,
suelo varchar(30) not null,
explosion time not null,
primary key(cod_especie)
) ENGINE=innodb;


create table flores(
codigo int auto_increment,
nombrefl varchar(50) not null,
precio decimal(10,2) not null,
id_especie int not null,
Primary Key(codigo),
constraint FK_floreria_especies
Foreign Key(id_especie) References especies (cod_especie)
ON DELETE CASCADE
ON UPDATE CASCADE ) Engine = InnoDB;

create table pedidos(
id_cliente int not null,
id_flor int not null,
fecha date not null,
total decimal(10, 2) not null,
primary key(id_cliente, id_flor),
constraint fk_pedidos_clientes
foreign key(id_cliente)
references clientes(numerocli)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_pedidos_floreria
FOREIGN KEY(id_flor) references flores(codigo)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE=InnoDB;
