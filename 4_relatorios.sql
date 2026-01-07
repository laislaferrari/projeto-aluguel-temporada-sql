--6. Crie uma VIEW chamada "vw_faturamento_por_imovel" que mostre o nome da propriedade e a soma de todos os valores de reservas já feitas nela.

Atualiza o projeto e faça o Commit e push.

--Nome do Hóspede, Nome do Imóvel e a Data de Início da reserva
select nome, nome_imovel, data_inicio 
from reservas
JOIN  hospedes h ON id_hospede = fk_hospede 
join propriedades p on id_propriedade = fk_propriedade;


--5. Crie um filtro (WHERE) para mostrar apenas reservas com valor total acima de R$ 500,00.

select * from reservas r
	where valor_total > 500;

--6. Crie uma VIEW chamada "vw_faturamento_por_imovel" que mostre o nome da propriedade e a soma de todos os valores de reservas já feitas nela.

create view vw_faturamento_por_imovel as
	select nome_imovel, sum(valor_total) as total_de_faturamento from reservas r
	join propriedades p on id_propriedade = fk_propriedade
	group by nome_imovel;

select * from vw_faturamento_por_imovel;







