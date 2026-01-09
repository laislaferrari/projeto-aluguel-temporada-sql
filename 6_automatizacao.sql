--Parte 5: Para evitar fraudes, queremos saber sempre que o preço de uma diária for alterado e automatizar algumas outras coisas.

--1. Crie o arquivo 6_automatizacao.sql.
--2. Crie uma tabela Log_Precos (ID, Propriedade_ID, Preco_Antigo, Preco_Novo, Data_Alteracao).

create table Log_Precos (
	id_log_precos serial primary key,
	fk_propriedade_ID int references Propriedades(id_propriedade),
	preco_antigo numeric(10,2),
	preco_novo numeric(10,2),
	data_alteracao timestamp
);	

--3. Crie uma Trigger que será disparada pela ação de atualizar um registro da tabela propriedades.
--4. Crie uma Function que será chamada pela trigger acima e precisará inserir os dados nessa tabela nova que foi criada (log_preços).

--FN:
	create or replace function fn_log_preco()
returns trigger as $$
begin
IF (old.preco_noite <> new.preco_noite) THEN
    insert into Log_Precos (fk_propriedade_ID, preco_antigo, preco_novo, data_alteracao)
    values (old.id_propriedade, old.preco_noite, new.preco_noite, current_timestamp);
end if;


return new;
end;
$$ language plpgsql;

	--TRIGGER:
	create or replace trigger trg_log_preco
	after update on Propriedades
	for each row
execute function fn_log_preco();


--5. Automatize o processo de inserção de nome (ou de hospede, ou de propriedade ou de endereço) para que o nome sempre seja salvo com as letras minúsculas, mesmo que a informação tenha sido passada com letras maiúsculas.

	create or replace function fn_minimizar_hospedes()
	returns trigger as $$
	begin
    new.nome = lower(new.nome);
    return new;
end;
$$ language plpgsql;

create or replace trigger trg_minimizar
	before insert or update on Hospedes -- antes dele salvar os dados, ele vai ter que modificar a informação, por isso o before
	for each row
execute function fn_minimizar_hospedes();

--inserção para teste 

	insert into hospedes ( nome, nascimento, email, telefone)
	values ( 'JULIO', '21-04-2001', 'julio@email.com', '2422456223' );


--6. Automatize o processo de calcular o valor_total da reserva quando algum registro de reserva é alterada e tenha sua data modificada.

-- Automatizar cálculo do valor_total da reserva:

create or replace function fn_calcular_valor_reserva()
	returns trigger as $$
begin
	new.valor_total = (new.data_fim - new.data_inicio) 
	* 
-- preço da Unidade Habitacional:
    (select preco_noite
	from Propriedades
    where id_propriedade = new.fk_propriedade); -- vai considerar cada linha 

    return new;
end;
$$ language plpgsql;

create or replace trigger trg_calcular_valor_reserva
	before update on Reservas -- antes dele salvar os dados, ele vai ter que modificar a informação, por isso o before
	for each row
	execute function fn_calcular_valor_reserva();

update reservas 
	set data_inicio = '01-01-2026'
	where id_reserva = 1;


--Ao finalizar use os comandos gits para subir a nova versão (lembre de estar dentro da pasta correta)
--git add .
--git commit -m "....descrição da versão..."
--git push

--Envie o link do repositório do github