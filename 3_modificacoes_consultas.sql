-- Atualizar preço do Studio Moderno em 10%
update Propriedades
set preco_noite = preco_noite * 1.10
where nome_imovel = 'Studio Moderno';

-- Remover hóspede pelo ID 
delete from Hospedes
where id_hospede = 2;



select * from hospedes;

