
create table ambulatorio(
num integer, 
andar integer, 
capacidade integer,
primary key(num));

create table Medico (
CRM integer, 
nome varchar, 
cidade varchar, 
especialidade varchar, 
num integer,
primary key (crm),
foreign key (num) references ambulatorio
);

create table paciente (
RG integer, 
nome varchar, 
cidade varchar, 
doença varchar,
primary key (rg)
);

create table Consulta 
(CRM integer, 
RG integer, 
dataC date, 
hora integer,
primary key (crm, rg, datac, hora),
foreign key (crm) references medico,
foreign key (rg) references paciente
);
create table Funcionario 
(RG integer,  
nome varchar,  
cidade varchar, 
salario float,
primary key (rg)
);

--------------------------------INSERT--------------------------------------

insert into ambulatorio(num,andar,capacidade) values(1,1,70), (2,2,30), (3,3,45), (4,4,50); 


insert into medico(CRM,nome,cidade,especialidade,num) 
values (111,'Maria Souza', 'sao luis', 'ortopedista', 2),
(222, 'Joao Carlos', 'fortaleza', 'clinico geral', 1),
(333, 'Mateus', 'recife', 'ortopedista', 3),
(444, 'Joana', 'sao paulo', 'pediatra', 4);


insert into paciente (RG,nome,cidade,doença) values (12345, 'paciente1', 'sao luis', 'febre'),
(23456, 'paciente2', 'fortaleza', 'pneumonia'),
(34567,'paciente3', 'recife', 'dengue'),
(45678,'paciente4', 'sao luis', 'tosse'),
(56789,'paciente5', 'natal', 'desconhecido');

insert into consulta (CRM, RG, dataC, hora) values (111,45678,'05/21/2017',9),
(222,56789,'05/21/2017',10), (444, 34567,'10/02/2017',13), (111,23456,'04/04/1015',15),(222,23456,'05/05/2016',18),(444,12345,'01/01/2016',11);


insert into Funcionario (RG,nome,cidade,salario)
values(11111,'funcionario1','sao luis', 3000),(22222,'funcionario2','fortaleza',2000),(45678,'paciente4','sao paulo',899),
(5555,'funcionario4', 'sao luis',1000)


--------------------------------RESPOSTAS--------------------------------------

--1)
--select * from consulta where crm <> 123 and crm <> 456
--select * from consulta where crm not in  (123,456)

--2)
--select * from ambulatorio where andar=4 and (capacidade=50 or num>10)

--3)
--select CRM, dataC from consulta where RG=122 or RG=725
--select CRM, dataC from consulta where RG in (122, 725)

--4)
--select num from ambulatorio where capacidade>50 and andar not in (2, 4)

--5)
--select nome, datac from medico m, consulta c where m.crm=c.crm
--select nome, datac from medico m join consulta c on m.crm=c.crm

--6)
--select a.num, capacidade, nome from ambulatorio a join medico m on a.num=m.num and a.andar=1

--7)
--select m.nome as medico, p.nome as paciente, datac from consulta c, medico m, paciente p where c.crm=m.crm and c.rg=p.rg order by m.nome, p.nome
--select m.nome as medico, p.nome as paciente, datac from consulta c join medico m on c.crm=m.crm join paciente p on c.rg=p.rg order by m.nome, p.nome

--8)
--select nome from medico m join consulta c on c.crm=m.crm and lower(especialidade)='ortopedista' and hora between 7 and 12 and datac = '05/21/2017'

--9)
--select distinct p.nome from paciente p join consulta c on p.rg=c.rg join medico m on m.crm=c.crm and (lower(m.nome)='joao carlos' or lower(m.nome)='maria souza') and lower(doença)='pneumonia'

--10)
--select f.nome, f.rg from funcionario f  where salario<900 and f.rg not in (select rg from paciente)

--11)
--select num from ambulatorio where num not in (select num from medico)
--select num from ambulatorio except select num from medico

--12)
--select f.nome, f.rg from funcionario f join paciente p on f.rg=p.rg
--select f.nome, f.rg from funcionario f where f.rg in (select rg from paciente)
--select f.nome, f.rg from funcionario f intersect select p.nome, p.rg from paciente p