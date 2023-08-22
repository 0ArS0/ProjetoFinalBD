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


