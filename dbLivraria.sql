drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGenero(
id_genero int not null,
descricao varchar(100) not null,
primary key(id_genero)
);

create table tbAutor(
id_autor int not null,
nome varchar(100) not null,
email varchar(100) not null,
primary key(id_autor)
);

create table tbCliente(
id_cliente int not null,
nome varchar(100) not null,
telefone varchar(45) not null,
primary key(id_cliente)
);

create table tbLivro(
id_livro int not null,
titulo varchar(100) not null,
preco float not null default 0 check(preco >= 0),
estoque int default 0 check(estoque > 0),
id_genero int,
primary key(id_livro),
foreign key(id_genero) references tbGenero(id_genero)
); 


create table tbEscreve(
id_livro int not null,
id_autor int not null,
foreign key(id_livro) references tbLivro(id_livro),
foreign key(id_autor) references tbAutor(id_autor)
);



create table tbVenda(
id_venda int not null,
data date not null,
total float,
id_cliente int not null,
primary key(id_venda),
foreign key(id_cliente) references tbCliente(id_cliente)
);


create table tbItens_da_venda(
id_venda int not null,
id_livro int not null,
qtd int not null default 0 check(qtd > 0),
subtotal varchar(45),
foreign key(id_venda) references tbVenda(id_venda),
foreign key(id_livro) references tbLivro(id_livro)
);

insert into tbGenero(id_genero,descricao)values(1,'Fantasia');
insert into tbGenero(id_genero,descricao)values(2,'Ficção científica');
insert into tbGenero(id_genero,descricao)values(3,'Distopia');
insert into tbGenero(id_genero,descricao)values(4,'Ação');
insert into tbGenero(id_genero,descricao)values(5,'Aventura');
insert into tbGenero(id_genero,descricao)values(6,'Ficção Policial');
insert into tbGenero(id_genero,descricao)values(7,'Horror');
insert into tbGenero(id_genero,descricao)values(8,'thrillher');
insert into tbGenero(id_genero,descricao)values(9,'Suspense');
insert into tbGenero(id_genero,descricao)values(10,'Ficção histórica');

update tbGenero set descricao = 'contos' where id_genero = 6;  
update tbGenero set descricao = 'Biografia' where id_genero = 7;  
update tbGenero set descricao = 'Poesia' where id_genero = 8;  
update tbGenero set descricao = 'Mistério' where id_genero = 9;  
update tbGenero set descricao = 'Autodesenvolvimento' where id_genero = 10;  

delete from tbGenero where id_genero = 6;
delete from tbGenero where id_genero = 7;
delete from tbGenero where id_genero = 8;
delete from tbGenero where id_genero = 9;
delete from tbGenero where id_genero = 10;

insert into tbAutor(id_autor,nome,email)values(1,'Sofia rodrigues','sofia.rodrigues123@email.com');
insert into tbAutor(id_autor,nome,email)values(2,'Lucas Anderson','lucas.anderson.writer@email.com');
insert into tbAutor(id_autor,nome,email)values(3,'Isabella Martins','isabella.martin.author@email.com');
insert into tbAutor(id_autor,nome,email)values(4,'Miguel Sanches','miguel.sanchez.books@email.com');
insert into tbAutor(id_autor,nome,email)values(5,'Emily Bennet','emily.bennett.writes@email.com');
insert into tbAutor(id_autor,nome,email)values(6,'Daniel Wu','daniel.wu.words@email.com');
insert into tbAutor(id_autor,nome,email)values(7,'Olivia Cavaleiro','olivia.knight.books@email.com');
insert into tbAutor(id_autor,nome,email)values(8,'Adrian Parker','adrian.parker.author@email.com');
insert into tbAutor(id_autor,nome,email)values(9,'Mia Thompson','adrian.parker.author@email.com');
insert into tbAutor(id_autor,nome,email)values(10,'Gabriel Lopes','gabriel123@gmail.com');

update tbAutor set nome = 'Ryan Cavalcanti', email = 'ryan123@gmail.com' where id_autor = 1;
update tbAutor set nome = 'Allan', email = 'allan123@gmail.com' where id_autor = 2;
update tbAutor set nome = 'Jhonathan', email = 'jho123@gmail.com' where id_autor = 3;
update tbAutor set nome = 'Rodrigo', email = 'pires123@gmail.com' where id_autor = 4;
update tbAutor set nome = 'Eric', email = 'eric123@gmail.com' where id_autor = 5;

delete from tbAutor where id_autor = 6;
delete from tbAutor where id_autor = 7;
delete from tbAutor where id_autor = 8;
delete from tbAutor where id_autor = 9;
delete from tbAutor where id_autor = 10;

insert into tbCliente(id_cliente,nome,telefone)values(1,'Ana Silva','95550-1234');
insert into tbCliente(id_cliente,nome,telefone)values(2,'Pedro Santos','95551-2345');
insert into tbCliente(id_cliente,nome,telefone)values(3,'Ryan Santos','95551-2375');
insert into tbCliente(id_cliente,nome,telefone)values(4,'Maria Oliveira','95552-3456');
insert into tbCliente(id_cliente,nome,telefone)values(5,'João Rodrigues','95553-4567');
insert into tbCliente(id_cliente,nome,telefone)values(6,'Miguel Pereira','95554-5678');
insert into tbCliente(id_cliente,nome,telefone)values(7,'Beatriz Costa','95555-6789');
insert into tbCliente(id_cliente,nome,telefone)values(8,'Diogo Fernandes','95556-7890');
insert into tbCliente(id_cliente,nome,telefone)values(9,'Inês Carvalho','95557-8901');
insert into tbCliente(id_cliente,nome,telefone)values(10,'rafael Gonçalves','95558-9012');

update tbCliente set nome = 'Marcos' where id_cliente = 6;
update tbCliente set nome = 'Fernando' where id_cliente = 7;
update tbCliente set nome = 'Davi' where id_cliente = 8;
update tbCliente set nome = 'Matheus' where id_cliente = 9;
update tbCliente set nome = 'Allan' where id_cliente = 10;

delete from tbCliente where id_cliente = 6;
delete from tbCliente where id_cliente = 7;
delete from tbCliente where id_cliente = 8;
delete from tbCliente where id_cliente = 9;
delete from tbCliente where id_cliente = 10;

insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(1,'Caminhos da Eternidade',38.00,10,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(2,'Sombra e ossos',48.00,40,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(3,'O enigma',35.00,30,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(4,'O caminho dourado',48.00,80,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(5,'O Dragão',60.00,90,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(6,'Avatar',10.00,20,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(7,'O corvo',24.00,15,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(8,'A casa assombrada',70.00,60,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(9,'Agua e fogo',15.00,90,3);
insert into tbLivro(id_livro,titulo,preco,estoque,id_genero)values(10,'O labirinto',100.00,60,3);

update tbLivro set titulo = 'A casa ', estoque = 30 where id_livro = 6;
update tbLivro set titulo = 'O comodo ', estoque = 40 where id_livro = 7;
update tbLivro set titulo = 'O banheiro ', estoque = 35 where id_livro = 8;
update tbLivro set titulo = 'O Boneca assasina ', estoque = 50 where id_livro = 9;
update tbLivro set titulo = 'O assassino ', estoque = 20 where id_livro = 10;


delete  from tbLivro where id_livro = 6;
delete  from tbLivro where id_livro = 7;
delete  from tbLivro where id_livro = 8;
delete  from tbLivro where id_livro = 9;
delete  from tbLivro where id_livro = 10;

insert into tbEscreve(id_livro,id_autor)values(1,1);
insert into tbEscreve(id_livro,id_autor)values(2,2);
insert into tbEscreve(id_livro,id_autor)values(3,3);
insert into tbEscreve(id_livro,id_autor)values(4,4);
insert into tbEscreve(id_livro,id_autor)values(5,5);
insert into tbEscreve(id_livro,id_autor)values(5,4);
insert into tbEscreve(id_livro,id_autor)values(5,3);
insert into tbEscreve(id_livro,id_autor)values(5,2);
insert into tbEscreve(id_livro,id_autor)values(5,1);
insert into tbEscreve(id_livro,id_autor)values(4,5);


delete from tbEscreve where id_livro = 5 and id_autor = 1 ;
delete from tbEscreve where id_livro = 4 and id_autor = 5 ;
delete from tbEscreve where id_livro = 5 and id_autor = 2 ;
delete from tbEscreve where id_livro = 5 and id_autor = 4 ;
delete from tbEscreve where id_livro = 4 and id_autor = 4 ;


update tbEscreve set id_autor = 5 where id_livro = 1;
update tbEscreve set id_autor = 4 where id_livro = 2;
update tbEscreve set id_autor = 3 where id_livro = 3;
update tbEscreve set id_autor = 2 where id_livro = 4;
update tbEscreve set id_autor = 1 where id_livro = 5;




insert into tbVenda(id_venda,data,total,id_cliente)values(1,'2023/06/18',10,'1');
insert into tbVenda(id_venda,data,total,id_cliente)values(2,'2023/04/25',16,'2');
insert into tbVenda(id_venda,data,total,id_cliente)values(3,'2023/05/11',20,'3');
insert into tbVenda(id_venda,data,total,id_cliente)values(4,'2023/07/01',35,'4');
insert into tbVenda(id_venda,data,total,id_cliente)values(5,'2023/04/30',27,'5');
insert into tbVenda(id_venda,data,total,id_cliente)values(6,'2023/04/01',18,'1');
insert into tbVenda(id_venda,data,total,id_cliente)values(7,'2023/04/01',40,'1');
insert into tbVenda(id_venda,data,total,id_cliente)values(8,'2023/04/01',12,'1');
insert into tbVenda(id_venda,data,total,id_cliente)values(9,'2023/04/01',33,'1');
insert into tbVenda(id_venda,data,total,id_cliente)values(10,'2023/04/01',39,'1');

update tbVenda set data = '2023/08/10' where id_venda = 6;
update tbVenda set data = '2023/07/15' where id_venda = 7;
update tbVenda set data = '2023/06/14' where id_venda = 8;
update tbVenda set data = '2023/05/10' where id_venda = 9;
update tbVenda set data = '2023/08/10' where id_venda = 10;

delete from tbVenda where id_venda = 6;
delete from tbVenda where id_venda = 7;
delete from tbVenda where id_venda = 8;
delete from tbVenda where id_venda = 9;
delete from tbVenda where id_venda = 10;


insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(1,1,400,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(2,2,500,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(3,3,600,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(4,4,700,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(5,5,200,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(1,1,33,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(2,2,33,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(3,3,33,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(4,4,33,40);
insert into tbItens_da_venda(id_venda,id_livro,qtd,subtotal)values(5,5,33,40);

update tbItens_da_venda set subtotal = 33 where id_venda = 1;
update tbItens_da_venda set subtotal = 33 where id_venda = 2;
update tbItens_da_venda set subtotal = 33 where id_venda = 3;
update tbItens_da_venda set subtotal = 33 where id_venda = 4;
update tbItens_da_venda set subtotal = 33 where id_venda = 5;


delete from tbItens_da_venda where id_venda = 1;
delete from tbItens_da_venda where id_venda = 2;
delete from tbItens_da_venda where id_venda = 3;
delete from tbItens_da_venda where id_venda = 4;
delete from tbItens_da_venda where id_venda = 5;




select * from tbGenero order by id_genero;
select * from tbAutor order by id_autor;
select * from tbCliente order by id_cliente;
select * from tbLivro order by id_livro;
select * from tbEscreve order by id_autor;
select * from tbVenda order by id_venda;
select * from tbItens_da_venda order by id_venda;