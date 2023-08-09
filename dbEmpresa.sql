drop database dbEmpresaABC;

create database dbEmpresaABC;

use dbEmpresaABC

CREATE TABLE PRODUTOS 
( 
 CODIGO INT, 
 NOME VARCHAR(50), 
 TIPO VARCHAR(25), 
 QUANTIDADE INT, 
 VALOR DECIMAL(10,2) 
);

INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(1,'IMPRESSORA', 'INFORMATICA', 200, 600.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(2,'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(3,'DVD PLAYER', 'ELETRONICOS', 250, 500.00 );
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(4,'MONITOR', 'INFORMATICA', 400, 900.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(5,'TELEVISOR', 'ELETRONICOS', 350, 650.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(6,'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(7,'CELULAR', 'TELEFONE', 450, 850.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(8,'TECLADO', 'INFORMATICA', 300, 450.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(9,'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 ); 
INSERT INTO PRODUTOS(CODIGO,NOME,TIPO,QUANTIDADE,VALOR)VALUES(10,'MOUSE', 'INFORMATICA', 400, 60.00 );

 select codigo, nome, tipo from produtos where tipo = 'informatica';

 update produtos set valor = valor * 1.15 where tipo = 'informatica';
 select * from produtos where tipo = 'informatica';


 select * from produtos where tipo = 'eletronicos';
 update produtos set valor = valor * 1.05 where tipo = 'eletronicos' and valor < 600.00;

 select * from produtos where tipo = 'digitais' or valor > 1000;
 update produtos set valor = valor * 0.80 where tipo = 'digitais' or valor > 1000;

select * from produtos where tipo in('informatica','digitais');
select * from produtos where tipo  not in('informatica','digitais');


 select * from produtos where valor between 400 and 600;
 select * from produtos where valor not between 400 and 600;

 
 select * from produtos where nome like 'd%';
 select * from produtos where nome like '%d';
 select * from produtos where nome like '%d%';
