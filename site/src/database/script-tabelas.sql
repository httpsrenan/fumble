-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

create database fumble;

use fumble;

create table conferencia(
id int primary key auto_increment,
conferencia varchar(60) not null unique,
sigla char(3)
);

create table divisao(
id int primary key auto_increment,
divisao varchar(60) not null unique,
sigla char(4),
fk_conferencia int,
constraint fk_conferencia foreign key (fk_conferencia) references conferencia(id)
);

create table times(
id     int primary key auto_increment,
nome   varchar(30) not null,
apelido  varchar(30),
estado   varchar(30),
fk_divisao int,
constraint fk_divisao foreign key (fk_divisao) references divisao(id)
);

create table usuarios(
id    int primary key auto_increment,
email varchar(100) not null unique,
nome varchar(50) not null,
senha varchar(200)
);

create table favoritar(
fk_time int,
fk_usuario int,
primary key (fk_time, fk_usuario),
constraint fk_time foreign key (fk_time) references times(id),
constraint fk_usuario foreign key (fk_usuario) references usuarios(id)
);
