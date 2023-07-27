--Ryan de Jesus Cavalcanti

drop database dbClinicaMedica;

-- Criando banco de dados
create database dbClinicaMedica;

-- Acessando o banco de dados;
use dbClinicaMedica;

-- Visualizar o banco de dados
show databases;

-- Criando as tabelas 
create table tbMedicos(
id_Medico int,
nmMedico varchar(45),
telefoneMedico varchar(9)
);

create table tbConsulta(
idConsulta int,
dt_consulta datetime,
medico_idMedico int,
paciente_idPaciente int,
receitaMedicaIdReceita int 
);

create table tbPaciente(
idPaciente int,
nmPaciente varchar(45),
telefonePaciente varchar(9),
convenio varchar(45)
);

create table tbReceitaMedica(
idReceitaMedica int,
descricao varchar(500)
);

-- Visualizar as tabelas criadas

show tables;

-- Visualizar a estrutura da tabela 

desc tbMedicos;
desc tbConsulta;
desc tbPaciente;
desc tbReceitaMedica;













