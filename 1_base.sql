drop table Hospedes cascade;	
drop table Enderecos cascade;
drop table Propriedades cascade;
drop table Reservas cascade;

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
	

alter table Propriedades add column preco_noite numeric (10,2);

alter table Propriedades
alter column preco_noite set not null;

alter table Propriedades
add constraint preco_noite
check (preco_noite > 0);

drop table if exists Propriedades cascade;

create table Propriedades (
    id_propriedade serial primary key,
    nome_imovel varchar(30),
    capacidade_hospedes int default 1,
    fk_endereco int references Enderecos(id_endereco),
    preco_noite numeric(10,2)
);
create table Reservas (
    id_reserva serial primary key,
    data_inicio date not null,
    data_fim date not null,
    valor_total numeric(10,2) not null,
    fk_hospede int references Hospedes(id_hospede),
    fk_propriedade int references Propriedades(id_propriedade),
    constraint datas_reserva check (data_fim > data_inicio)
);




 
	
	
	