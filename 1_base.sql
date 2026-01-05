drop table Hospedes cascade;
drop table Enderecos cascade;
drop table Propriedades cascade;

create table Enderecos (
	id_endereco serial primary key not null,
	cep varchar(9) not null,
	rua varchar(100) not null,
	numero int not null,
	bairro varchar(20) not null,
	cidade varchar(20) not null,
	estado char(2) not null
);

create table Hospedes (
	id_hospede serial primary key not null,
	nome varchar(50),
	nascimento date not null,
	email varchar(100),
	telefone varchar(20) not null
	);
	
	create table Propriedades (
	id_propriedade serial not null,
	nome_imovel varchar(30),
	capacidade_hospedes int default 1,
	fk_endereco int references Enderecos(id_endereco)
);
	
	
	
	