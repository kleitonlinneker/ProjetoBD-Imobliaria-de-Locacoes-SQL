create table PAIS(
cod_pais serial,
nome varchar,
primary key (cod_pais));


create table AUTOMOVEIS (
cod_auto serial, 
fabricante varchar, 
modelo varchar, 
ano integer, 
cod_pais integer, 
preco float,
primary key(cod_auto),
foreign key (cod_pais) references pais
);

create table ESTADO(
cod_estado integer,
nome varchar,
primary key (cod_estado));

create table CIDADE(
cod_cidade integer,
nome varchar, 
cod_estado integer,
primary key(cod_cidade),
foreign key (cod_estado) references estado
);

create table REVENDEDORAS (
cnpj bigint, 
nome varchar, 
cod_cidade integer,
primary key (cnpj),
foreign key (cod_cidade) references cidade
);


create table CONSUMIDORES (
cpf bigint, 
nome varchar, 
sobrenome varchar,
cod_cidade integer,
primary key(cpf),
foreign key (cod_cidade) references cidade
);

create table VENDAS (
cpf bigint, 
cnpj bigint, 
cod_auto integer, 
datac date, 
preco float,
primary key(cpf,cnpj,cod_auto,datac),
foreign key (cpf) references consumidores,
foreign key (cnpj) references revendedoras,
foreign key (cod_auto) references automoveis
);

-----------------------------------------------INSERT--------------------------------------------------
insert into estado (nome, cod_estado) values ('maranhao', 1),('sao paulo',2),('rio de janeiro',3),('ceara',4);

insert into cidade(nome, cod_cidade, cod_estado) values('sao luis',1,1), ('imperatriz', 2,1), ('sao paulo',3,2),('rio de janeiro',4,3),('fortaleza',5,4);

insert into pais(nome) values ('Brasil'), ('Franca'), ('Alemanha'), ('Italia');

insert into automoveis(fabricante, modelo, ano, cod_pais, preco)
values ('Renault', 'sandero', 2020,2, 40.000), ('Citroen', 'C3', 2020, 2, 45.000), ('Fiat', 'uno', 2019, 4, 39.000), ('Fiat', 'palio', 2020, 4, 39.500), ('Volkswagen', 'gol', 2019,3,40.000);

insert into revendedoras(cnpj, nome, cod_cidade) values (12345, 'CarMais', 1), (13456, 'MaisVeiculos', 2),(21345,'SuperCar', 3),(34567,'SoCarros',4),(67890,'Vemqtem' ,5);
insert into consumidores values (1111, 'Joana', 'Silva', 1), (2222,'Maria', 'Souza', 2), (3333, 'Pedro', 'Ferreira', 3), (4444, 'Paulo', 'lopes', 4), (5555,'Lia', 'lopes',5);

insert into vendas (cpf, cnpj, cod_auto, datac, preco) values (1111,67890,5,'10/05/2020',42.000),(2222,34567,4,'01/04/2019',45.000),(3333,21345,3,'05/25/2020',38.500),
(4444,13456,2,'09/09/2019',54.000),(1111,12345,5,'11/05/2020',48.000),(4444,13456,3,'09/09/2019',38.500);

-----------------------------------------------RESPOSTAS--------------------------------------------------
