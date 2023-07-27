-- Ryan de Jesus Cavalcanti

drop database dbEscola;

-- Criando banco de dados
create database dbEscola;

-- Acessando banco de dados
use dbEscola;

-- Vizualisar o banco de dados
show databases;

-- Criando as tabelas
create table tbAtividade(
id int,
atividade varchar(45)
);

create table tbTurma(
id int,
quant_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);

create table tbRegistro(
id_Aluno int,
id_Turma int,
ausencia int,
id_Registro int
);

create table tbAluno(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento date,
altura float,
peso float,
id_Turma int
);

create table tbMonitor(
id_Aluno int
);

create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(45)
);

-- Visualizar a estrutura da tabela 

desc tbAtividade;
desc tbTurma;
desc tbRegistro;
desc tbAluno;
desc tbMonitor;
desc tbInstrutor;






