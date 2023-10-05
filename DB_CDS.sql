drop database db_CDS;

create database db_CDS;

use db_CDS;

create table tbArtistas(
    codArt int not null,
    nomeArt varchar(100) not null unique,
    primary key(codArt)
);
create table tbGravadoras(
    codGrav int not null,
    nomeGrav varchar(50) not null unique,
    primary key(codGrav)
);
create table tbCategorias(
    codCat int not null,
    nomeCat varchar(50) not null unique,
    primary key(codCat)
);
create table tbEstados(
    siglaEst char(2) not null,
    nomeEst varchar(50) not null unique,
    primary key(siglaEst)
);
create table tbCidades(
    codCid int not null,
    siglaEst char(2) not null,
    nomeCid varchar(50) not null,
    primary key(codCid),
    foreign key(siglaEst) references tbEstados(siglaEst)
);
create table tbClientes(
    codCli int not null,
    codCid int not null,
    nomeCli varchar(50) not null,
    endeCli varchar(100) not null,
    rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
    sexoCli char(1) not null default 'F' check(sexoCli in('F','M')),
    primary key(codCli),
    foreign key(codCid) references tbCidades(codCid)
);
create table tbConjuge(
    codConj int not null,
    codCli int not null,
    nomeConj varchar(50) not null,
    rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
    sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
    primary key(codConj),
    foreign key(codCli) references tbClientes(codCli)
);
create table tbFuncionarios(
    codFunc int not null,
    nomeFunc varchar(50) not null,
    endeFunc varchar(100) not null,
    salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
    sexoFunc char(1) not null default 'F' check(sexoFunc in('F','M')),
    primary key(codFunc)
);
create table tbDependentes(
    codDep int not null,
    codFunc int not null,
    nomeDep varchar(100) not null,
    sexoDep char(1) not null default 'F' check(sexoDep in('F','M')),
    primary key(codDep),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);
create table tbTitulos(
    codTit int not null,
    codCat int not null,
    codGrav int not null,
    nomeCd varchar(50) not null unique,
    valCd decimal(9,2) not null check(valCd > 0),
    quantEstoque int not null check(quantEstoque >= 0),
    primary key(codTit),
    foreign key(codCat) references tbCategorias(codCat),
    foreign key(codGrav) references tbGravadoras(codGrav)
);
create table tbPedidos(
    numPed int not null,
    codCli int not null,
    codFunc int not null,
    dataPed date not null,
    valorPed decimal(9,2) not null default 0 check(valorPed >= 0),
    primary key(numPed),
    foreign key(codCli) references tbClientes(codCli),
    foreign key(codFunc) references tbFuncionarios(codFunc)
);
create table tbTitulos_Pedidos(
    numPed int not null,
    codTit int not null,
    quantCd int not null check(quantCd >=1),
    valCd decimal(9,2) not null check(valCd>0),
    foreign key(numPed) references tbPedidos(numPed),
    foreign key(codTit) references tbTitulos(codTit)
);
create table tbTitulos_Artistas(
    codTit int not null,
    codArt int not null,
    foreign key(codTit) references tbTitulos(codTit),
    foreign key(codArt) references tbArtistas(codArt)
);

desc tbArtistas; 
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulos_Pedidos;
desc tbTitulos_Artistas;

insert into tbArtistas(codArt,nomeArt) values(1,'Marisa Monte');
insert into tbArtistas(codArt,nomeArt) values(2,'Gibeltor Gil');
insert into tbArtistas(codArt,nomeArt) values(3,'Caetano Veloso');
insert into tbArtistas(codArt,nomeArt) values(4,'Milton Nascimento');
insert into tbArtistas(codArt,nomeArt) values(5,'Legião Urbana');
insert into tbArtistas(codArt,nomeArt) values(6,'The Beatles');
insert into tbArtistas(codArt,nomeArt) values(7,'Rita Lee');

insert into tbGravadoras(codGrav,nomeGrav) values(1,'Polygram');
insert into tbGravadoras(codGrav,nomeGrav) values(2,'Emi');
insert into tbGravadoras(codGrav,nomeGrav) values(3,'Som Livre');
insert into tbGravadoras(codGrav,nomeGrav) values(4,'Som Music');

insert into tbCategorias(codCat,nomeCat) values(1,'MPB');
insert into tbCategorias(codCat,nomeCat) values(2,'Trilha Sonora');
insert into tbCategorias(codCat,nomeCat) values(3,'Rock Internacional');
insert into tbCategorias(codCat,nomeCat) values(4,'Rock Nacional');

insert into tbEstados(siglaEst,nomeEst) values('SP','São Paulo');
insert into tbEstados(siglaEst,nomeEst) values('MG','Minas Gerais');
insert into tbEstados(siglaEst,nomeEst) values('RJ','Rio de Janeiro');
insert into tbEstados(siglaEst,nomeEst) values('ES','Espírito Santo');

insert into tbCidades(codCid,siglaEst,nomeCid) values(1,'SP','São Paulo');
insert into tbCidades(codCid,siglaEst,nomeCid) values(2,'SP','Sorocaba');
insert into tbCidades(codCid,siglaEst,nomeCid) values(3,'SP','Jundiaí');
insert into tbCidades(codCid,siglaEst,nomeCid) values(4,'SP','Americana');
insert into tbCidades(codCid,siglaEst,nomeCid) values(5,'SP','Araraquara');
insert into tbCidades(codCid,siglaEst,nomeCid) values(6,'MG','Ouro Preto');
insert into tbCidades(codCid,siglaEst,nomeCid) values(7,'ES','Cachoeira do Itapemirim');

insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(1,1,'José Nogueira','Rua A',1500,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(2,1,'Ângelo Pereira','Rua B',2000,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(3,1,'Além Mar Paranhos','Rua C',1500,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(4,1,'Catarina Souza','Rua D',892,'F');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(5,1,'Vagner Costa','Rua E',950,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(6,2,'Antenor da Costa','Rua F',1582,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(7,2,'Maria Amélia de Souza','Rua G',1152,'F');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(8,2,'Paulo Roberto Silva','Rua H',3250,'M');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(9,3,'Fátima Souza','Rua I',1632,'F');
insert into tbClientes(codCli,codCid,nomeCli,endeCli,rendaCli,sexoCli) values(10,3,'Joel da Rocha','Rua J',2000,'M');

insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj) values(1,1,'Carla Nogueira',2500,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj) values(2,2,'Emilia Pereira',5500,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj) values(6,6,'Altiva da Costa',3000,'F');
insert into tbConjuge(codConj,codCli,nomeConj,rendaConj,sexoConj) values(7,7,'Carlos de Souz',3250,'M');

insert into tbFuncionarios(codFunc,nomeFunc,endeFunc,salFunc,sexoFunc) values(1,'Vâniaa Gabriela Pereira','Rua A',2500,'F');
insert into tbFuncionarios(codFunc,nomeFunc,endeFunc,salFunc,sexoFunc) values(2,'Noberto Pereira da Silva','Rua B',300,'M');
insert into tbFuncionarios(codFunc,nomeFunc,endeFunc,salFunc,sexoFunc) values(3,'Olavo Linhares','Rua C',580,'M');
insert into tbFuncionarios(codFunc,nomeFunc,endeFunc,salFunc,sexoFunc) values(4,'Paula da Silva','Rua D',3000,'F');
insert into tbFuncionarios(codFunc,nomeFunc,endeFunc,salFunc,sexoFunc) values(5,'Rolando Rocha','Rua E',2000,'M');

insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(1,1,'Ana Pereira','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(2,1,'Roberto Pereira','M');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(3,1,'Celso Pereira','M');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(4,3,'Brisa Linhares','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(5,3,'Mari Sol Linhares','F');
insert into tbDependentes(codDep,codFunc,nomeDep,sexoDep) values(6,4,'Sonia da Silva','F');

insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(1,1,1,'Tribalistas',30,1500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(2,1,2,'Tropicália',50,500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(3,1,1,'Aquele Abraço',50,600);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(4,1,2,'Refazenda',60,1000);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(5,1,3,'Totalmente Demais',50,2000);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(6,1,3,'Travessia',55,500);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(7,1,2,'Courage',30,200);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(8,4,3,'Legião Urbana',20,100);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(9,3,2,'The Beatles',30,300);
insert into tbTitulos(codTit,codCat,codGrav,nomeCd,valCd,quantEstoque) values(10,4,1,'Rita Lee',30,500);

insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(1,1,2,'02/05/02',1500);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(2,3,4,'02/05/02',50);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(3,4,5,'02/06/02',100);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(4,1,4,'02/02/03',200);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(5,7,5,'02/03/03',300);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(6,4,4,'02/03/03',100);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(7,5,5,'02/03/03',50);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(8,8,2,'02/03/03',50);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(9,2,2,'02/03/03',2000);
insert into tbPedidos(numPed,codCli,codFunc,dataPed,valorPed) values(10,7,1,'02/03/03',3000);

insert into tbTitulos_Artistas(codTit,codArt) values(1,1);
insert into tbTitulos_Artistas(codTit,codArt) values(2,2);
insert into tbTitulos_Artistas(codTit,codArt) values(3,2);
insert into tbTitulos_Artistas(codTit,codArt) values(4,2);
insert into tbTitulos_Artistas(codTit,codArt) values(5,3);
insert into tbTitulos_Artistas(codTit,codArt) values(6,4);
insert into tbTitulos_Artistas(codTit,codArt) values(7,4);
insert into tbTitulos_Artistas(codTit,codArt) values(8,5);
insert into tbTitulos_Artistas(codTit,codArt) values(9,6);
insert into tbTitulos_Artistas(codTit,codArt) values(10,7);

insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(1,1,2,30);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(1,2,3,20);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(2,1,1,50);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(2,2,3,30);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(3,1,2,40);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(4,2,3,20);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(5,1,2,25);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(6,2,3,30);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(6,3,1,35);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(7,4,2,55);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(8,1,4,60);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(9,2,3,15);
insert into tbTitulos_Pedidos(numPed,codTit,quantCd,valCd) values(10,7,2,15);

select * from tbArtistas order by codArt;
select * from tbGravadoras order by codGrav;
select * from tbCategorias order by codCat;
select * from tbEstados;
select * from tbCidades order by codCid;
select * from tbClientes order by codCli;
select * from tbConjuge order by codConj;
select * from tbFuncionarios order by codFunc;
select * from tbDependentes order by codDep;
select * from tbTitulos order by codTit;
select * from tbPedidos order by numPed;
select * from tbTitulos_Artistas order by codTit;
select * from tbTitulos_Pedidos order by numPed;



-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 
select tit.nomeCd as 'Nome dos CDs', grav.nomeGrav as 'Nome da gravadora' from tbTitulos as tit inner join tbGravadoras as grav on tit.codGrav = grav.codGrav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.

select tit.nomeCd as 'Nome dos CDs', cat.nomeCat as 'Nome da categoria' from tbTitulos as tit inner join tbCategorias as cat on cat.codCat = tit.codCat;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD. 
select tit.nomeCd as 'Nome dos CDs', grav.nomeGrav as 'Nome da gravadora',cat.nomeCat as 'Nome da categoria' from tbTitulos as tit inner join tbGravadoras as grav on tit.codGrav = grav.codGrav inner join tbCategorias as cat on cat.codCat = tit.codCat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.
select cli.nomeCli as 'Nome dos clientes', tit.nomeCd as 'Titulos dos CDs' from tbClientes as cli left join tbTitulos as tit on cli.codCli = tit.codTit;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.

select func.nomeFunc as 'Nome do funcionário', ped.numPed as 'Número do pedido', ped.dataPed as 'Data', ped.valorPed as 'Valor dos pedidos', cli.nomeCli as 'Nome do cliente' from tbFuncionarios as func inner join tbPedidos as ped on func.codFunc = ped.codFunc inner join tbClientes as cli on cli.codCli = ped.codCli;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário.

select func.nomeFunc as 'Nome dos funcionários', dep.nomeDep as 'Nome dos dependentes' from tbFuncionarios as func inner join tbDependentes as dep on func.codFunc = dep.codFunc;

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.
select cli.nomeCli as 'Nome dos clientes', conj.nomeConj as 'Nome dos cônjuges' from tbClientes as cli inner join tbConjuge as conj on cli.codcli = conj.codcli;

-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes de seus cônjuges também.

select cli.nomeCli as 'Nome dos clientes', conj.nomeConj as 'Nome dos cônjuges' from tbClientes as cli left join tbConjuge as conj on conj.codcli = cli.codcli;

-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez, valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido.

select cli.nomeCli as 'Nome dos clientes', conj.nomeConj as 'Nome dos cônjuges', ped.numPed as 'Numero dos pedidos', ped.valorPed as 'Valor dos pedidos', ped.codFunc as 'Codigo dos funcionarios' from tbClientes as cli inner join tbConjuge as conj on cli.codCli = conj.codCli left join tbPedidos as ped on cli.codCli = ped.codCli;
