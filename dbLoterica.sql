-- Apagar banco de dados
drop database dbLoterica;

-- Criar banco de dados
create database dbLoterica;

-- Acessando o banco de dados
use dbLoterica;

-- Visualizando o banco de dados
show databases;

-- Criando tabela dos banco de dados
create table tbJogos(
codJog int,
nome varchar(100),
valor decimal (9,2),
dataEntrada date
);

-- Visualizando as tabelas
show tables;

-- Visualizando a estrutura da tabela
desc tbJogos;

-- inserindo registros na tabela
insert into tbJogos(codJog,nome,dataEntrada,valor)values(1,'Mega-Sena','2023/08/02',5.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(2,'Lotofácil','2023/08/02',2.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(3,'Quina','2023/08/02',6.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(4,'Lotomania','2023/08/02',3.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(5,'Timemania','2023/08/02',4.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(6,'Dupla Sena','2023/08/02',7.50);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(7,'Dia de Sorte','2023/08/02',6.00);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(8,'Super Sete','2023/08/02',5.40);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(9,'+Milionária','2023/08/02',2.00);
insert into tbJogos(codJog,nome,dataEntrada,valor)values(10,'Loteca','2023/08/02',9.00);

-- Visualizar os valores inseridos na tabela
select * from tbJogos;

-- Alterando registros da tabela
update tbJogos set nome = 'Blaze', valor = 9.00 where codJog = 9; 

update tbJogos set nome = 'pixbet',valor = 8.00 where codJog = 10;

-- Apagar registros  das tabelas
delete from tbJogos where codJog = 7;
delete from tbJogos where codJog = 6;
delete from tbJogos where codJog = 5;

-- Visualizar os registros excluidos
select * from tbJogos;







