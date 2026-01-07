-- Inserção de hóspedes;
insert into Hospedes (nome, nascimento, email, telefone) 
values ('Mariana', '2001-04-25', 'mariana@email.com', '2498856741');

insert into Hospedes (nome, nascimento, email, telefone) 
values ('Júlio', '1998-04-01', 'julio@email.com', '249887451');

insert into Hospedes (nome, nascimento, email, telefone) 
values ('Karla', '1962-11-01', 'karla@email.com', '249883771');

-- Inserção de endereços;
insert into Enderecos (cep, rua, numero, bairro, cidade, estado)
values ('25600-001', 'Rua das Palmeiras', 10, 'Centro', 'Petrópolis', 'RJ');

insert into Enderecos (cep, rua, numero, bairro, cidade, estado)
values ('25600-002', 'Av. Central', 200, 'Centro', 'Petrópolis', 'RJ');

insert into Enderecos (cep, rua, numero, bairro, cidade, estado)
values ('25600-003', 'Estrada da Serra', 55, 'Quitandinha', 'Petrópolis', 'RJ');

insert into Enderecos (cep, rua, numero, bairro, cidade, estado)
values ('25600-004', 'Rua Moderna', 12, 'Bingen', 'Petrópolis', 'RJ');

-- Inserção de propriedades;
insert into Propriedades (nome_imovel, capacidade_hospedes, fk_endereco, preco_noite) 
values ('Casa de Praia', 12, 1, 350.00);

insert into Propriedades (nome_imovel, capacidade_hospedes, fk_endereco, preco_noite) 
values ('Apartamento Central', 4, 2, 200.00);

insert into Propriedades (nome_imovel, capacidade_hospedes, fk_endereco, preco_noite) 
values ('Choupana na Serra', 8, 3, 280.00);

insert into Propriedades (nome_imovel, capacidade_hospedes, fk_endereco, preco_noite) 
values ('Studio Moderno', 2, 4, 150.00);

-----------------------------------RESERVAS

-- Reserva 1: Mariana na Casa de Praia
insert into Reservas (data_inicio, data_fim, valor_total, fk_hospede, fk_propriedade)
values ('2026-01-10', '2026-01-15', 1750.00, 1, 1);
        

-- Reserva 2: Karla na Choupana na Serra
insert into Reservas (data_inicio, data_fim, valor_total, fk_hospede, fk_propriedade)
values ('2026-03-12', '2026-03-20', 2240.00, 3, 3);




