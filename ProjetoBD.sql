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
('smartphone', 'moto g31 128g', '09-02-2021', 05, 1000, 2, 2), --Telefonia 2
('aspirador ', 'aspirador de pó mondial asp 1450', '18-08-2022', 08, 290, 3, 3), --Eletrodomésticos
('furadeira', 'furadeira bosh 1200', '21-11-2021', 06, 500, 4, 4), --Construção
('serra ', 'serra tico tico  philco ptt01', '15-06-2022', 06, 190, 5, 4), --Construção
('batedeira', 'batedeira planetária mondial 700w', '02-11-2022', 08, 380, 6, 3); --Eletrodomésticos



