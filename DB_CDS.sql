drop database dbCds;

create database dbCds;

use dbCds;

create table tbArtistas(
cod_Art int not null,
nome_Art varchar(100) not null unique,
primary key(cod_Art)
);

create table tbGravadoras(
cod_Grav int not null,
nome_Grav varchar(50) not null unique,
primary key(cod_Grav)
);

create table tbCategorias(
cod_Cat int not null,
nome_Cat varchar(50) not null unique,
primary key (cod_Cat)
);

create table tbEstados(
sigla_Est char(2) not null,
nome_Est varchar(50) not null unique,
primary key(sigla_Est)
);

create table tbCidades(
cod_Cid int not null,
sigla_Est char(2) not null,
nome_Cid varchar(50) not null,
primary key(cod_Cid),
foreign key(sigla_Est) references tbEstados(sigla_Est)
);

create table tbClientes(
cod_Cli int not null,
cod_Cid  int not null,
nome_Cli varchar(50) not null,
end_Cli varchar(100) not null,
renda_Cli decimal(9,2) not null default 0 check(renda_Cli >= 0),
sexo_Cli char(1) not null default 'F' check(sexo_Cli in('F','M')),
primary key(cod_Cli),
foreign key(cod_Cid) references tbCidades(cod_Cid)
);



create table tbConjuge(
cod_Conj int not null,
cod_Cli int not null,
nome_Conj varchar(50) not null,
renda_Conj decimal(9,2) not null default 0 check(renda_Conj >= 0),
sexo_Conj char(1) not null default 'F' check(sexo_Conj in('F','M')),
primary key(cod_Conj),
foreign key(cod_Cli) references tbClientes(cod_Cli)
);

create table tbFuncionarios(
cod_Func int not null,
nome_Func varchar(50) not null,
end_Func varchar(100) not null,
sal_Func decimal(9,2) not null default 0 check(sal_Func >=0),
sexo_Func char(1) not null default 'F' check(sexo_Func in('F','M')),
primary key(cod_Func)
);

create table tbDependentes(
cod_Dep int not null,
cod_Func int not null,
nome_Dep varchar(100) not null,
sexo_Dep char(1) not null default 'F' check(sexo_Dep in('F','M')),
primary key(cod_Dep),
foreign key(cod_Func) references tbFuncionarios(cod_Func)
);


create table tbTitulos(
cod_Tit int not null,
cod_Cat int not null,
cod_Grav int not null,
nome_CD varchar(50) not null unique,
val_CD decimal(9,2) not null check(val_CD > 0),
qtd_estq int not null check(qtd_estq >= 0),
primary key(cod_Tit),
foreign key(cod_Cat) references tbCategorias(cod_Cat)
);


create table tbPedidos(
num_Ped int not null,
cod_Cli int not null,
cod_Func int not null,
Data_Ped datetime not null,
val_Ped decimal(9,2) not null default 0 check(val_Ped >= 0),
primary key(num_Ped),
foreign key(cod_Cli) references tbClientes(cod_Cli),
foreign key(cod_Func) references tbFuncionarios(cod_Func)
);

create table tbTitulos_Pedidos(
num_Ped int not null,
cod_Tit int not null,
qtd_CD int not null check(qtd_Cd >= 1),
val_CD decimal(9,2) not null check(val_CD > 0),
foreign key(num_Ped) references tbPedidos(num_Ped),
foreign key(cod_Tit) references tbTitulos(cod_Tit)
);


create table tbTitulos_Artista(
cod_Tit int not null,
cod_Art int not null,
foreign key(cod_Tit) references tbTitulos(cod_Tit),
foreign key(cod_Art) references tbArtistas(cod_Art)
);

insert into tbArtistas(cod_Art,nome_Art)values(1,'Marisa Monte');
insert into tbArtistas(cod_Art,nome_Art)values(2,'gilberto Gil');
insert into tbArtistas(cod_Art,nome_Art)values(3,'Caeto Veloso');
insert into tbArtistas(cod_Art,nome_Art)values(4,'Milton Nascimento');
insert into tbArtistas(cod_Art,nome_Art)values(5,'Legião Urbanda');
insert into tbArtistas(cod_Art,nome_Art)values(6,'The Beatles');
insert into tbArtistas(cod_Art,nome_Art)values(7,'Rita Lee');
select * from tbArtistas order by cod_Art;

insert into tbGravadoras(cod_Grav,nome_Grav)values(1,'Polygram');
insert into tbGravadoras(cod_Grav,nome_Grav)values(2,'Emi');
insert into tbGravadoras(cod_Grav,nome_Grav)values(3,'Som Livre');
insert into tbGravadoras(cod_Grav,nome_Grav)values(4,'Som Music');
select * from tbGravadoras order by cod_Grav;

insert into tbCategorias(cod_Cat,nome_Cat)values(1,'MPB');
insert into tbCategorias(cod_Cat,nome_Cat)values(2,'Trilha Sonora');
insert into tbCategorias(cod_Cat,nome_Cat)values(3,'Rock Internacional');
insert into tbCategorias(cod_Cat,nome_Cat)values(4,'Rock Nacional');
select * from tbCategorias order by cod_Cat;

insert into tbEstados(sigla_Est,nome_Est)values('SP','São Paulo');
insert into tbEstados(sigla_Est,nome_Est)values('MG','Mina Gerais');
insert into tbEstados(sigla_Est,nome_Est)values('RJ','Rio Janeiro');
insert into tbEstados(sigla_Est,nome_Est)values('ES','Cachoeira do Itapemirim');
select * from tbEstados order by sigla_Est;

insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(1,'SP','São Pualo');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(2,'SP','Sorocaba');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(3,'SP','Jundiaí');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(4,'SP','Americana');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(5,'SP','Araraquara');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(6,'MG','Outro Preto');
insert into tbCidades(cod_Cid,sigla_Est,nome_Cid)values(7,'ES','Cachoeira do Itapemirim');
select * from tbCidades order by cod_Cid;

insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(1,1,'josé Nogueira','Rua A',1500.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(2,1,'Ângelo Pererira','Rua B',2000.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(3,1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(4,1,'Catarina Souza','Rua D',892.00,'F');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(5,1,'Vagnar Costa','Rua E',950.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(6,2,'Antenor de Costa','Rua F',1582.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(7,2,'Maria AMélia de Souza','Rua G',1152.00,'F');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(8,2,'Paulo Roberto','Rua H',3250.00,'M');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(9,3,'Fátima Souza','Rua I',1632.00,'F');
insert into tbClientes(cod_Cli,cod_Cid,nome_Cli,end_Cli,renda_Cli,sexo_Cli)values(10,3,'Joel da Rocha','Rua J',2000.00,'M');
select * from tbClientes order by cod_Cid;


insert into tbConjuge(cod_Conj,cod_Cli,nome_Conj,renda_Conj,sexo_Conj)values(1,1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(cod_Conj,cod_Cli,nome_Conj,renda_Conj,sexo_Conj)values(2,2,'Emilia Pererira',5500.00,'F');
insert into tbConjuge(cod_Conj,cod_Cli,nome_Conj,renda_Conj,sexo_Conj)values(3,6,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(cod_Conj,cod_Cli,nome_Conj,renda_Conj,sexo_Conj)values(4,7,'Carlos de Souza',3250.00,'M');
select * from tbConjuge order by cod_Conj;

insert into tbFuncionarios(cod_Func,nome_Func,end_Func,sal_Func,sexo_Func)values(1,'Vânia Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(cod_Func,nome_Func,end_Func,sal_Func,sexo_Func)values(2,'Norberto Pererira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(cod_Func,nome_Func,end_Func,sal_Func,sexo_Func)values(3,'Olavo linhares','Rua A',580.00,'M');
insert into tbFuncionarios(cod_Func,nome_Func,end_Func,sal_Func,sexo_Func)values(4,'Paula da Silva','Rua A',3000.00,'F');
insert into tbFuncionarios(cod_Func,nome_Func,end_Func,sal_Func,sexo_Func)values(5,'Rolando Rocha','Rua A',2000.00,'M');
select * from tbFuncionarios order by cod_Func;


insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(1,1,'Ana Pereira','F');
insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(2,1,'Roberto Pererira','M');
insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(3,1,'Celso Pereira','M');
insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(4,3,'Brisa Linhares','F');
insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(5,3,'Mari Sol Linhares','F');
insert into tbDependentes(cod_Dep,cod_Func,nome_Dep,sexo_Dep)values(6,4,'Sonia da Silva','F');
select * from tbDependentes order by cod_Dep;


insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(1,1,1,'Tribalistas',30.00,1500);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(2,1,2,'Tropicália',50.00,500);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(3,1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(4,1,2,'Refazenda',60.00,1000);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(5,1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(6,1,3,'Travessia',55.00,500);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(7,1,2,'Courage',30.00,200);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(8,4,3,'Legião Urbana',20.00,100);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(9,3,2,'The Beatles',30.00,300);
insert into tbTitulos(cod_Tit,cod_Cat,cod_Grav,nome_CD,val_Cd,qtd_estq)values(10,4,1,'Rita Lee',30.00,500);
select * from tbTitulos order by cod_Tit;

insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(1,1,2,'02/05/02',1500.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(2,3,4,'02/05/02',50.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(3,4,5,'02/06/02',100.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(4,1,4,'02/02/03',200.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(5,7,5,'02/03/03',300.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(6,4,4,'02/03/03',100.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(7,5,5,'02/03/03',50.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(8,8,2,'02/03/03',50.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(9,2,2,'02/03/03',2000.00);
insert into tbPedidos(num_Ped,cod_Cli,cod_Func,Data_Ped,val_Ped)values(10,7,1,'02/03/03',3000.00);
select * from tbPedidos order by num_Ped;

insert into tbTitulos_Artista(cod_Tit,cod_Art)values(1,1);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(2,2);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(3,2);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(4,2);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(5,3);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(6,4);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(7,4);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(8,5);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(9,6);
insert into tbTitulos_Artista(cod_Tit,cod_Art)values(10,7);
select * from tbTitulos_Artista order by cod_Tit;


insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(1,1,2,30.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(1,2,3,20.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(2,1,1,50.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(2,2,3,30.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(3,1,2,40.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(4,2,3,20.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(5,1,2,25.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(6,2,3,30.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(6,3,1,35.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(7,4,2,55.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(8,1,4,60.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(9,2,3,15.00);
insert into tbTitulos_Pedidos(num_Ped,cod_Tit,qtd_CD,val_CD)values(10,7,2,15.00);
select * from tbTitulos_Pedidos order by num_Ped;






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
desc tbTitulos_Pedidos;
desc tbTitulos_Artista