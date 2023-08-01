-- apagar banco de dados
drop database dbManicure;

-- Criar banco de dados
create database dbManicure;

-- Acessando o banco de dados
use dbManicure;

-- Visualizar o banco de dados
show databases;

-- Criando as tabelas no banco de dados
create table tbProdutos(
codProd int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnit decimal(9,2)
);

-- Visualizando as tabelas
show tables;

-- Visualizando a estrutura da tabela
desc tbProdutos;

-- Inserindo registros nas tabelas
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(1,'Alicate de unha',10,'2023/08/01',5.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(2,'Algodão',100,'2023/07/31',2.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(3,'Esmalte',25,'2023/08/01',15.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(4,'Acetona',35,'2023/07/30',3.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(5,'Unha postiça',50,'2023/07/25',9.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(6,'Unha',50,'2023/07/25',9.50);

insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(7,'postiça',50,'2023/07/25',9.50);

-- Visualizar os registros inseridos nas tabelas
select * from tbProdutos;

-- Alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnit = 1.35 where codProd = 6;

-- Alterando registros das tabelas
update tbProdutos set descricao = 'Mascara de Proteção', valorUnit = 2.23 where codProd = 7;


-- Visualizar os registros inseridos nas tabelas
select * from tbProdutos;

-- Apagar registros  das tabelas
delete from tbProdutos where codProd = 7;

-- Visualizar os registros excluidos
select * from tbProdutos