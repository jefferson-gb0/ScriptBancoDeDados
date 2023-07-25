/*
comantarios em blocos de sql jefferson goncalves dos santos vitoria
*/

-- CRIANDO UM BANCO DE DADOS
CREATE DATABASE BD_Palmirinha

-- comando para usar o banco de dados

use BD_Palmirinha

--criando uma tabela GrauDificuldade

create table GrauDificuldade (
	idGrauDificuldade  int primary key identity,
	Nome varchar (15) not null,
)

select * from GrauDificuldade


create table Receita (
	idReceita int primary key identity,
	idGrauDificuldade int not null foreign key references GrauDificuldade(idGrauDificuldade),/* referindo a tabela graudificuldade*/ 
	Nome varchar (50) not null,
	TempoPreparo int not null,
	ModoPreparo varchar (8000) not null,
	QtdePorcoes tinyint not null,
)

select * from Receita

create table Ingrediente (
	idIngrediente int primary key identity,
	Nome varchar (50) not null,
	PrecoSugerido decimal (10,2) not null,
)

select * from Ingrediente

create table ReceitaIngredinte (
	idReceitaIngredinte int primary key identity,
	idReceita int not null foreign key references Receita(idReceita),
	idIngrediente int not null foreign key references Ingrediente(idIngrediente),
	Qtde int not null
)

select *  from ReceitaIngredinte

create table  Loja(
	idLoja int primary key identity,
	Nome varchar (50) not null,
	Lagradouro varchar (100) not null,
	Numero varchar (10)  not null,
	Complemento varchar (50),
	Bairro varchar (50) not null,
	Cidade varchar(50) not null,
	UF varchar (2) not null,
	Cep varchar (9) not null,
	Cnpj varchar (18) not null,
	Telefone varchar (15) null
)

create table Usuario(
	idUsuario int primary key identity,
	Nome varchar (50) not null,
	Email varchar (100) not null
)


create table UsuarioAcesso (
	idUsuarioAcesso int unique foreign key references Usuario (idUsuario),
	Login varchar (20) not null,
	Senha varchar (50) not null,
	Bloqueado bit default 0
)

create table Avaliacao (
	idAvaliacao int primary key identity,
	idUsuario int not null foreign key references Usuario(idUsuario),
	idReceita int not null foreign key references Receita(idReceita),
	Nota tinyint not null,
	Comentario varchar (8000) not null,
	Data date default getdate()
)

