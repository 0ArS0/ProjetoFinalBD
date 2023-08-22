--Projeto Final Grupo 4
--Mateus Oliveira
Pragma foreing_key = on;

CREATE table usuario (
id integer primary key autoincrement not null,
nome text,
endereco text,
telefone text,
celular text,
nome_usuario text,
email text,
cpf text,
data_nasc date
);

CREATE table produto (
id integer primary key autoincrement not null,
nome text,
descricao text,
data_fabricacao date,
estoque integer,
valor_unitario integer,
id_usuario integer,
id_categoria integer,
foreign key (id_usuario)references usuario(id),
foreign key (id_categoria)references categoria(id)
);

CREATE table categoria (
id integer primary key autoincrement not null,
nome text,
descricao text
);

-- Carlos Paz
create table pedido(
id integer primary key autoincrement not null,
id_produto integer,
id_usuario_comprador integer,
data_pedido date,
foreign key (id_produto)references produto(id),
foreign key (id_usuario_comprador)references usuario(id)

);

create table pedido_produto(
id integer primary key autoincrement not null,
id_produtos integer,
id_pedidos integer,
foreign key (id_produtos)references produto(id),
foreign key (id_pedidos)references pedido(id)
);

-- Wallace Henriques
insert into usuario (nome, endereco, telefone, celular, nome_usuario, email, cpf, data_nasc) 
values 
('Pedro de Souza', 'Rua Matias de Souza nº 52', '011 1111-0000', '11 99818-1118', 'Psouza', 'psouza_@gmail.com', '987.654.321-02', '2000-08-15'),
('Ana da Silva', 'Rua D. João VI nº 30', '085 1111-8800', '85 99858-0000', 'Asilva', 'asilva_@hotmail.com', '107.322.111-12', '2001-06-14'),
('João de Almeida', 'Av. Getúlio Vargas nº 1005', '012 2222-7700', '12 91000-1111', 'Jalmeida', 'jalmeida3_@hotmail.com', '100.999.111-01', '2000-01-19'),
('Sergio Vasconcelos da Silva', 'Av. Paula Buarque nº 9180', '098 1010-6600', '98 99000-0101', 'Sdasilva', 'svasconcelos_@yahoo.com', '200.929.000-99', '2003-04-06'),
('Ingrid Maria Antunes', 'Rua Tiradentes nº 16', '031 2020-7777', '31 98000-8888', 'Iantunes', 'mariaa_@hotmail.com', '333.878.555-88', '2002-02-21'),
('Carlos de Oliveira', 'Rua Soares Sobrinho nº 312', '029 1010-8767', '29 98111-2222', 'Coliveira', 'cdeoliveira_@gmail.com', '444.777.565-61', '2001-08-08'),
('Franciso Camargo', 'Rua Moreira Barros nº 401', '037 4141-8989', '37 97878-0000', 'Fcamargo', 'fcamargo_@gmail.com', '555.111.569-52', '2000-01-17'),
('Jonas Pinheiro', 'Rua Almirante Cerqueira nº 102', '099 5151-1288', '99 91999-3331', 'Jpinheiro', 'jpinheiro_@hotmail.com', '444.189.123-01', '2003-05-11');

insert into produto  (nome, descricao, data_fabricacao, estoque, valor_unitario, id_usuario, id_categoria) 
values 
('televisão', 'smart tv LG 60', '11-09-2022', 10, 3200, 1, 1), --Eletrônico 1
('smartphone', 'moto g31 128g', '09-02-2021', 05, 1000, 1, 1), --Eletrônico 1
('aspirador ', 'aspirador de pó mondial asp 1450', '18-08-2022', 08, 290, 3, 2), --Eletrodomésticos
('furadeira', 'furadeira bosh 1200', '21-11-2021', 06, 500, 4, 3), --Construção
('serra ', 'serra tico tico  philco ptt01', '15-06-2022', 06, 190, 5, 3), --Construção
('batedeira', 'batedeira planetária mondial 700w', '02-11-2022', 08, 380, 3, 2), --Eletrodomésticos
('Camiseta', 'Polo Piquet Azul GG', '01-08-2023', 20, 100, 2, 4), -- Roupa
('Caixa bombom', 'Ferrero Rocher 8Un','27-07-2023', 5, 24, 6, 5); -- Alimentos


-- Vitor Mello
INSERT	INTO categoria (nome, descricao) VALUES
('Eletrônico', 'Produtos eletrônicos em geral'),
('Eletrodomésticos', 'Aparelhos de uso domestico'),
('Construção','Materiais e equipamentos para construção em geral'),
('Roupa', 'Vestuário em geral'),
('Alimentos', 'Comidas, bebidas e afins');

INSERT	INTO pedido (data_pedido, id_produto, id_usuario_comprador) VALUES	
('01-08-2023', 1, 7),
('02-08-2023', 2, 3),
('03-08-2023', 3, 1),
('04-08-2023', 4, 2),
('05-08-2023', 5, 6),
('06-08-2023', 6, 4);

-- Breno Xavier
INSERT INTO pedido_produto (id, id_produtos,id_pedidos )VALUES
( 1, 7, 1),
( 2, 3, 2),
( 3, 1, 3),
( 4, 2, 4),
( 5, 6, 5),
( 6, 4, 6);

UPDATE produto SET estoque = 7 WHERE id = 8;

DELETE FROM categoria WHERE id = 5;

-- Arthur Monteiro

--a. Pelo menos 2 com algum tipo de junção
SELECT produto.nome, categoria.nome 
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id

SELECT usuario.nome AS id_usuario, produto.nome,produto.estoque
FROM produto
JOIN usuario ON produto.id_usuario = usuario.id
WHERE produto.estoque > 0;

--b. Pelo menos 1 com usando count() e group by()
SELECT categoria.nome, COUNT(*) AS QTDproduto
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id
GROUP BY categoria.nome







