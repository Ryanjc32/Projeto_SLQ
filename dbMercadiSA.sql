drop database dbMercardoSA;

create database dbMercardoSA;

use dbMercardoSA;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
salario decimal (9,2) default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codFunc)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
primary key(codCli)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key (codUsu),
foreign key (codFunc) references tbFuncionarios(codfunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
dataEntrada time,
horaEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
codVendas int not null auto_increment,
codUsu int not null,
codCli int not null,
codProd int not null,
dataVenda date,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key(codVendas),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codCli) references tbClientes(codCli),
foreign key(codProd) references tbProdutos(codProd)
);

desc tbVendas;
desc tbProdutos;
desc tbUsuarios;
desc tbFornecedores;
desc tbClientes;
desc tbFuncionarios;

-- inserir registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,salario,sexo)values('Ryan de jesus Cavalcanti','ryan.jesus@gmail.com','124.555.999-88',1500.00,'M');

insert into tbClientes(nome,email,telCel)values('Allan Sampaio Rodrigues','Allan.S@gmail.com','99848-8886');
insert into tbClientes(nome,email,telCel)values('Amanda jesus','Amanda.S@gmail.com','99558-8886');

insert into tbFornecedores(nome,email,cnpj)values('Fernanda martins','fefe@gmail.com','22.584.541.0001/25');
insert into tbFornecedores(nome,email,cnpj)values('Marcos Cavalcanti','marcos.c@gmail.com','22.576.201.0001/25');



insert into tbUsuarios(nome,senha,codFunc)values('Ryan de jesus Cavalcanti','1234',1);

insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn)values('Banana','2023/08/10','16:53',10,5.50,1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn)values('Morango','2023/08/9','09:30',100,7.50,1);
insert into tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codForn)values('Bicicleta','2023/08/8','16:53',10,8.50,2);

insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)values(1,1,2,'2023/08/10',10,50.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)values(1,2,1,'2023/08/10',20,30.00);
insert into tbVendas(codUsu,codCli,codProd,dataVenda,quantidade,valorTotal)values(1,2,1,'2023/08/10',10,30.00);

select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

-- inner join 

select usu.nome as 'Nome do usuário',
func.nome as 'Nome do funcionário',
func.email as 'E-mail do funcionário'
from tbUsuarios as usu
inner join tbFuncionarios as func
on usu.codFunc = func.codFunc;



select forn.nome, forn.cnpj, prod.descricao
from tbProdutos as prod
inner join tbFornecedores as forn
on prod.codForn = forn.codForn;

select Cli.nome as Cli, Cli.email as Cli, .Cli.telCel as Cli
from tbVendas as Vendi
inner join tbClientes as Cli
on Cli.codCli = Vendi.codCli;


select cli.nome, cli.email, prod.descricao, vend.dataVenda
from tbVendas as vend 
inner join tbClientes as cli
on vend.codCli = cli.codCli
inner join tbProdutos as prod
on vend.codProd = prod.codProd
where codVendas = 1;


select cli.nome, cli.email, prod.descricao, vend.dataVenda
from tbVendas as vend 
inner join tbClientes as cli
on vend.codCli = cli.codCli
inner join tbProdutos as prod
on vend.codProd = prod.codProd
where prod.descricao like '%b%';

select usu.nome,func.nome,vendi.dataVenda,vendi.quantidade,vendi.valorTotal
from tbUsuarios as usu
inner join tbFuncionarios as func
on func.codFunc = usu.codFunc
inner join tbVendas as vendi
on vendi.codUsu = usu.codUsu
where func.codFunc = 1;

select cli.nome, vendi.dataVenda, prod.descricao, forn.nome
from tbClientes as cli
inner join tbVendas as vendi
on cli.codCli = vendi.codCli  
inner join tbProdutos as prod
on vendi.codProd = prod.codProd
inner join tbFornecedores as forn
on prod.codForn = forn.codForn;

select func.nome, usu.nome, vendi.dataVenda, vendi.valorTotal, prod.descricao, prod.dataEntrada, forn.nome, .forn.cnpj
from tbFuncionarios as func
inner join tbUsuarios as usu
on usu.codFunc = func.codFunc
inner join tbVendas as vendi
on vendi.codUsu = usu.codUsu
inner join tbProdutos as prod
on prod.codProd = vendi.codProd
inner join tbFornecedores = forn
on forn.codForn = prod.codForn;
