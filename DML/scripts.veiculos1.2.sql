CREATE DATABASE Veiculos

USE Veiculos

CREATE TABLE Marca
(
IdMarca INT PRIMARY KEY IDENTITY,
NomeMarca VARCHAR(100) NOT NULL
)

CREATE TABLE Modelo
(
IdModelo INT PRIMARY KEY IDENTITY,
NomeModelo VARCHAR(100) NOT NULL
)

CREATE TABLE Empresa
(
IdEmpresa INT PRIMARY KEY IDENTITY,
NomeEmpresa VARCHAR(100) NOT NULL
)

CREATE TABLE Clientes
(
IdCliente INT PRIMARY KEY IDENTITY,
Nome VARCHAR(100) NOT NULL,
CPF CHAR(11) NOT NULL
)

CREATE TABLE Veiculos
(
IdVeiculos INT PRIMARY KEY IDENTITY,
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa),
IdMarca INT FOREIGN KEY REFERENCES Marca(IdMarca),
IdModelo INT FOREIGN KEY REFERENCES Modelo(IdModelo),
PLACA VARCHAR(10) NOT NULL
)

CREATE TABLE Aluguel
(
IdAluguel INT PRIMARY KEY IDENTITY,
IdVeiculos INT FOREIGN KEY REFERENCES Veiculos(IdVeiculos),
IdCliente INT FOREIGN KEY REFERENCES Clientes(IdCliente),
DataRetirada VARCHAR(15) NOT NULL,
DataDevolução VARCHAR(15) NOT NULL
)

 INSERT INTO Marca(NomeMarca) VALUES('JEEP')

 INSERT INTO Modelo(NomeModelo) VALUES('Jeep Compass')

 INSERT INTO Empresa(NomeEmpresa) VALUES('GuImports')

 INSERT INTO Clientes(Nome, CPF) VALUES('Sergio','93729337533')

 INSERT INTO Veiculos(IdEmpresa, IdMarca, IdModelo, PLACA) VALUES(1, 4, 4, 'VBR-2J48')

 INSERT INTO Aluguel(IdVeiculos, IdCliente, DataRetirada, DataDevolução) VALUES(3, 2, '24/02/2023', '24/02/2024')

SELECT
Aluguel.DataRetirada as DataRetirada,
Aluguel.DataDevolução as DataDevolucao,
Clientes.Nome as Clientes,
Modelo.NomeModelo as Veiculo
from
Aluguel, Clientes, Veiculos
LEFT JOIN
Modelo ON Veiculos.IdModelo = Modelo.IdModelo
WHERE
Clientes.IdCliente = Aluguel.IdCliente AND
Aluguel.IdVeiculos = Veiculos.IdVeiculos and
Veiculos.IdModelo = Modelo.IdModelo


