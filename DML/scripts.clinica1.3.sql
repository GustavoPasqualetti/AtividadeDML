CREATE DATABASE Clinica

USE Clinica

CREATE TABLE Clinica
(
IdClinica INT PRIMARY KEY IDENTITY,
Nome VARCHAR(30) NOT NULL,
Endereço VARCHAR (40) NOT NULL
)

CREATE TABLE Veterinarios
(
IdVeterinario INT PRIMARY KEY IDENTITY,
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
Nome VARCHAR(30) ,
CRM VARCHAR(10)
)

CREATE TABLE DonoPet
(
IdDono INT PRIMARY KEY IDENTITY,
NomeDono VARCHAR(30),
CPF CHAR(11)
)

CREATE TABLE Raca
(
IdRaca INT PRIMARY KEY IDENTITY,
NomeRaca VARCHAR(30)
)

CREATE TABLE Pet
(
IdPet INT PRIMARY KEY IDENTITY,
IdRaca INT FOREIGN KEY REFERENCES Raca(IdRaca),
IdDono INT FOREIGN KEY REFERENCES DonoPet(IdDono),
DataDeNascimento VARCHAR(15),
Nome VARCHAR(30),
TipoPet VARCHAR(30)
)

CREATE TABLE Atendimento
(
IdAtendimento INT PRIMARY KEY,
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
IdPet INT FOREIGN KEY REFERENCES Pet(IdPet),
IdVeterinario INT FOREIGN KEY REFERENCES Veterinarios(IdVeterinario),
DataConsulta VARCHAR(15),
Descricao VARCHAR(30)
)

INSERT INTO Clinica(Nome, Endereço) VALUES('GuVets','Rua do sol 123')

INSERT INTO Veterinarios(IdClinica,Nome,CRM) VALUES(1, 'Osvaldo','9351947SP'), (1, 'Claudio','361048/SP'), (1, 'Lucas','139423/SP')

INSERT INTO DonoPet(NomeDono, CPF) VALUES('Maria', '15409234893'),('Murilo', '19783440284')

INSERT INTO Raca(NomeRaca) VALUES('Siamês')

INSERT INTO Pet(IdRaca,IdDono,DataDeNascimento,Nome,TipoPet) VALUES(10, 3, '17/03/2021', 'Luci' ,'Gato'), (7, 4, '05/07/2019', 'Mia' ,'Cachorro')

INSERT INTO Atendimento(IdAtendimento,IdClinica, IdPet, IdVeterinario, DataConsulta, Descricao) VALUES(3 ,1, 3 , 1 ,'02/08/2023', 'Cancer'), (4 ,1, 4 , 2 ,  '03/08/2023', 'Fragilidae ossil')


SELECT 
Clinica.Nome as Clinica,
Veterinarios.Nome as Nome ,
Veterinarios.CRM 
FROM Veterinarios , Clinica

SELECT 
Raca.NomeRaca
from
Raca
WHERE
NomeRaca like 's%' or NomeRaca like 'S%'

SELECT 
Pet.TipoPet
FROM
Pet
WHERE
TipoPet like '%o' or TipoPet like '%O'

SELECT
Pet.Nome ,
DonoPet.NomeDono
from
Pet, DonoPet
WHERE
Pet.IdDono = DonoPet.IdDono

select
Veterinarios.Nome as Veterinario ,
Pet.Nome as NomeDoPet,
Raca.NomeRaca as Raca ,
Pet.TipoPet ,
DonoPet.NomeDono as Dono ,
Clinica.Nome as Clinica
from  
Veterinarios , Raca, Pet, DonoPet, Clinica , Atendimento
WHERE
Atendimento.IdPet = Pet.IdPet and
Pet.IdRaca = Raca.IdRaca and 
Atendimento.IdVeterinario = Veterinarios.IdVeterinario and
Pet.IdDono = DonoPet.IdDono

select * from Atendimento