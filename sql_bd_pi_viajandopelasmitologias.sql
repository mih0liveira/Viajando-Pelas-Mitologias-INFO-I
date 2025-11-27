CREATE DATABASE viajandopelasmitologias;
USE viajandopelasmitologias;

-- Criando tabela Usuario
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    idTipoUsuario INT(1) NOT NULL
);

-- Criando tabela Quiz
CREATE TABLE Quiz (
    idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    quiz VARCHAR(45) NOT NULL
);

-- Criando tabela TipoMitologia
CREATE TABLE TipoMitologia (
    idTipoMitologia INT PRIMARY KEY AUTO_INCREMENT,
    tipoMitologia VARCHAR(45) NOT NULL
);

CREATE TABLE Conteudo (
    idConteudo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    resumo VARCHAR(500) NOT NULL,
    imagem mediumblob,
    texto VARCHAR(10000) NOT NULL
);

-- Criando tabela Questoes
CREATE TABLE Questoes (
    idQuestoes INT PRIMARY KEY AUTO_INCREMENT,
    enunciado VARCHAR(2000) NOT NULL,
    pergunta VARCHAR(200) NOT NULL,
    imagem mediumblob,
    alternativaA VARCHAR(200) NOT NULL,
    alternativaB VARCHAR(200) NOT NULL,
    alternativaC VARCHAR(200) NOT NULL,
    alternativaD VARCHAR(200) NOT NULL,
    correta VARCHAR(200) NOT NULL,
    idTipoMitologia INT NOT NULL,
    FOREIGN KEY (idTipoMitologia) REFERENCES TipoMitologia(idTipoMitologia)
);



-- Criando tabela Rodada (tabela de relacionamento Perguntas x Quiz)
CREATE TABLE Rodada (
    idQuestoes INT NOT NULL,
    idQuiz INT NOT NULL,
    PRIMARY KEY (idQuestoes, idQuiz),
    FOREIGN KEY (idQuestoes) REFERENCES Questoes(idQuestoes),
    FOREIGN KEY (idQuiz) REFERENCES Quiz(idQuiz)
);

-- Criando tabela Placar
CREATE TABLE Placar (
    idPlacar INT PRIMARY KEY AUTO_INCREMENT,
    respostaUsuario VARCHAR(200) NOT NULL,
    idRodada_idQuestoes INT NOT NULL,
    idQuiz INT NOT NULL,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idRodada_idQuestoes) REFERENCES Questoes(idQuestoes),
    FOREIGN KEY (idQuiz) REFERENCES Quiz(idQuiz),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);



INSERT INTO Usuario (nome, email, senha, idTipoUsuario) VALUES
('Admin', 'admin@email.com', '123456', 1),
('João Silva', 'joao@email.com', 'senha123', 2),
('Maria Souza', 'maria@email.com', 'senha456', 2);

-- Tipos de Mitologia
INSERT INTO TipoMitologia (tipoMitologia) VALUES
('Grega'),
('Nórdica'),
('Egípcia'),
('Chinesa'),
('Japonesa'),
('Hindu'),
('Maia'),
('Asteca'),
('Celta'),
('Mesopotâmica'),
('Africana'),
('Indígena');
    

-- Conteúdo
INSERT INTO Conteudo (titulo, resumo, imagem, texto) VALUES
('Zeus - Rei dos Deuses', 'Zeus é o principal deus da mitologia grega, senhor do Olimpo.', NULL, 'Zeus controla os céus e o trovão.'),
('Thor - O Deus do Trovão', 'Thor é uma das figuras mais importantes da mitologia nórdica.', NULL, 'Thor é conhecido por sua força e por portar o martelo Mjölnir.');

-- Quiz
INSERT INTO Quiz (quiz) VALUES
('Mitologia Grega'),
('Mitologia Nórdica');

-- Questões
INSERT INTO Questoes (enunciado, pergunta, imagem, alternativaA, alternativaB, alternativaC, alternativaD, correta, idTipoMitologia) VALUES
('Na mitologia grega, tinha o deus dos mares.', 'Qual era o deus dos mares?', NULL,
 'Zeus', 'Poseidon', 'Hades', 'Ares', 'Poseidon', 1),
('Na mitologia nórdica, quem era o deus do trovão?', 'Qual deus é conhecido pelo martelo Mjölnir?', NULL,
 'Loki', 'Odin', 'Thor', 'Baldur', 'Thor', 3);

-- Rodada (associando questões aos quizzes)
INSERT INTO Rodada (idQuestoes, idQuiz) VALUES
(1, 1), -- Questão 1 no Quiz de Mitologia Grega
(2, 2); -- Questão 2 no Quiz de Mitologia Nórdica

-- Placar
INSERT INTO Placar (respostaUsuario, idRodada_idQuestoes, idQuiz, idUsuario) VALUES
('Poseidon', 1, 1, 2), -- João respondeu certo
('Loki', 2, 2, 3);     -- Maria respondeu errado

SELECT * FROM Usuario;
SELECT * FROM Quiz;
SELECT * FROM TipoMitologia;
SELECT * FROM Conteudo;
SELECT * FROM Questoes;
SELECT * FROM Rodada;
SELECT * FROM Placar;


