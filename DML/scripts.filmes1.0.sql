CREATE DATABASE Teste

CREATE TABLE Genero
(
IdGenero INT PRIMARY KEY IDENTITY,
NomeGenero VARCHAR(100)
)

CREATE TABLE Filmes
(
 IdFilme INT PRIMARY KEY IDENTITY,
 IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero),
 Titulo VARCHAR(100)
)

INSERT INTO Genero(NomeGenero)
VALUES('ficao')

UPDATE Genero
SET NomeGenero = 'Comédia' WHERE IdGenero = 2

DELETE FROM Genero
WHERE IdGenero = 5

INSERT INTO Filmes(IdGenero, Titulo) VALUES(6, 'infinito')

