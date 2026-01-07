--Parte 4: Precisamos criar um acesso para o funcionário do suporte técnico.  
create user suportetec with password '123';
--2. Crie o usuário suporte_estagiario. 
create user suporte_estagiario with password '123';
--3. Dê a ele permissão de SELECT em todas as tabelas.
GRANT SELECT ON TABLE enderecos, hospedes, propriedades, reservas TO suporte_estagiario;
--4. Dê permissão de UPDATE apenas na tabela Reservas (para que ele possa ajustar datas, se necessário).
GRANT update ON TABLE reservas TO suporte_estagiario;
--5. Crie uma conexão nova usando esse novo usuário e teste os comandos que ele pode e que não pode fazer.

--testes permissão:
SELECT * FROM hospedes;
SELECT * FROM reservas;

--estes não permitidos:
--SUPORTE ESTAGIARIO NÃO PODE:
insert into hospedes (nome, nascimento, telefone) values ( 'Mariana', '21-08-1997', '22158795');
update propriedades set preco_noite = '500' where id_reservas = 1;
delete from propriedades WHERE id = 1;
--Ajuste a pasta do projeto e faça o Commit e Push.