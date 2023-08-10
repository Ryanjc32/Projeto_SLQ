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
