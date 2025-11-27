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
-- CREATE TABLE Quiz (
--     idQuiz INT PRIMARY KEY AUTO_INCREMENT,
--     quiz VARCHAR(45) NOT NULL
-- );

-- Criando tabela TipoMitologia
CREATE TABLE TipoMitologia (
    idTipoMitologia INT PRIMARY KEY AUTO_INCREMENT,
    tipoMitologia VARCHAR(45) NOT NULL
);

-- CREATE TABLE Conteudo (
--     idConteudo INT PRIMARY KEY AUTO_INCREMENT,
--     titulo VARCHAR(45) NOT NULL,
--     resumo VARCHAR(500) NOT NULL,
--     imagem mediumblob,
--     texto VARCHAR(10000) NOT NULL
-- );

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
    idTipoMitologia INT NOT NULL,
    PRIMARY KEY (idQuestoes, idTipoMitologia),
    FOREIGN KEY (idQuestoes) REFERENCES Questoes(idQuestoes),
    FOREIGN KEY (idTipoMitologia) REFERENCES TipoMitologia(idTipoMitologia)
);

-- Criando tabela Placar
-- CREATE TABLE Placar (
--     idPlacar INT PRIMARY KEY AUTO_INCREMENT,
--     respostaUsuario VARCHAR(200) NOT NULL,
--     idRodada_idQuestoes INT NOT NULL,
--     idQuiz INT NOT NULL,
--     idUsuario INT NOT NULL,
--     FOREIGN KEY (idRodada_idQuestoes) REFERENCES Questoes(idQuestoes),
--     FOREIGN KEY (idQuiz) REFERENCES Quiz(idQuiz),
--     FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
-- );



INSERT INTO Usuario (nome, email, senha, idTipoUsuario) VALUES
('Admin', 'admin@email.com', '123456', 1),
('João Silva', 'joao@email.com', 'senha123', 2),
('Maria Souza', 'maria@email.com', 'senha456', 2),
('Mirela', 'mirela@gmail.com', '123456', 2),
('Ana Beatriz', 'anabeatriz@gmail.com', '123456', 2),
('Luan', 'luan@gmail.com', '123456', 2);

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
-- INSERT INTO Conteudo (titulo, resumo, imagem, texto) VALUES
-- ('Zeus - Rei dos Deuses', 'Zeus é o principal deus da mitologia grega, senhor do Olimpo.', NULL, 'Zeus controla os céus e o trovão.'),
-- ('Thor - O Deus do Trovão', 'Thor é uma das figuras mais importantes da mitologia nórdica.', NULL, 'Thor é conhecido por sua força e por portar o martelo Mjölnir.');

-- Quiz
-- INSERT INTO Quiz (quiz) VALUES
-- ('Mitologia Grega'),
-- ('Mitologia Nórdica'),
-- ('Mitologia Egípcia'),
-- ('Mitologia Chinesa'),
-- ('Mitologia Japonesa'),
-- ('Mitologia Hindu'),
-- ('Mitologia Maia'),
-- ('Mitologia Asteca'),
-- ('Mitologia Celta'),
-- ('Mitologia Mesopotâmica'),
-- ('Mitologia Africana'),
-- ('Mitologia Indígena');

-- Questões
INSERT INTO Questoes (enunciado, pergunta, imagem, alternativaA, alternativaB, alternativaC, alternativaD, correta, idTipoMitologia) VALUES
-- Grega
('Zeus era o rei dos deuses do Olimpo e dominava os fenômenos atmosféricos.', 'Qual era o domínio de Zeus?', NULL,
'Guerra', 'Relâmpagos e céu', 'Mares', 'Florestas', 'Relâmpagos e céu', 1),

('Afrodite era vista como a deusa da beleza e das emoções amorosas.', 'Do que Afrodite é deusa?', NULL,
'Caça', 'Sabedoria', 'Amor e beleza', 'Profecia', 'Amor e beleza', 1),

('Hades governava uma região destinada aos mortos.', 'Qual era o domínio de Hades?', NULL,
'Olimpo', 'Submundo', 'Mares', 'Montanhas', 'Submundo', 1),

('Ares era conhecido por sua ferocidade e impulsividade.', 'Ares era o deus de que?', NULL,
'Música', 'Guerra', 'Colheitas', 'Artes', 'Guerra', 1),

('Atena nasceu da cabeça de Zeus e representava a razão e a estratégia.', 'Atena é deusa de:', NULL,
'Amor', 'Sabedoria e estratégia', 'Fogo', 'Tempestades', 'Sabedoria e estratégia', 1),

('Hércules se destacou por realizar tarefas impossíveis.', 'Como ficaram conhecidos seus feitos?', NULL,
'Trabalhos de Hércules', 'Testes do Olimpo', 'Desafios de Zeus', 'Doze provas', 'Trabalhos de Hércules', 1),

('Poseidon segurava um tridente e controlava mares e tempestades.', 'Poseidon era o deus de:', NULL,
'Mares', 'Agricultura', 'Caça', 'Música', 'Mares', 1),

('Apolo possuía vários domínios, sendo um deles a arte musical.', 'Além da música, Apolo também era deus de:', NULL,
'Profecias', 'Guerra', 'Sonhos', 'Caça', 'Profecias', 1),

('Artemis, irmã de Apolo, protegia os animais e as florestas.', 'Artemis era deusa de:', NULL,
'Amor', 'Caça', 'Mar', 'Fogo', 'Caça', 1),

('Hermes era veloz e auxiliava os deuses nas comunicações.', 'Qual era a função principal de Hermes?', NULL,
'Criar ventos', 'Mensageiro dos deuses', 'Curar doenças', 'Proteger navegadores', 'Mensageiro dos deuses', 1);



-- Nordica
('Odin era o deus supremo da mitologia nórdica, associado à sabedoria e à guerra.', 'O que Odin representa?', NULL,
'Sabedoria e guerra', 'Mares', 'Sol', 'Fertilidade', 'Sabedoria e guerra', 2),

('Thor era conhecido por seu martelo mágico, Mjölnir.', 'Thor era o deus de:', NULL,
'Escuridão', 'Amor', 'Colheitas', 'Tempestades e trovões', 'Tempestades e trovões', 2),

('Loki era um deus trapaceiro, habilidoso em causar confusão.', 'Loki é conhecido como:', NULL,
'Senhor da luz', 'Deus trapaceiro', 'Protetor dos reis', 'Guardião dos mares', 'Deus trapaceiro', 2),

('Valhalla era um salão majestoso administrado por Odin.', 'Quem se juntava a Odin em Valhalla?', NULL,
'Ferreiros', 'Pescadores', 'Guerreiros mortos em batalha', 'Magos', 'Guerreiros mortos em batalha', 2),

('Freyja era associada ao amor e também à guerra.', 'Freyja é deusa de:', NULL,
'Amor e guerra', 'Chuva', 'Sonhos', 'Montanhas', 'Amor e guerra', 2),

('Fenrir era um lobo gigante que protagonizaria o Ragnarok.', 'Fenrir era:', NULL,
'Um dragão', 'Um elfo negro', 'Um gigante do gelo', 'Um lobo gigante', 'Um lobo gigante', 2),

('Yggdrasil sustentava os nove mundos da mitologia nórdica.', 'O que é Yggdrasil?', NULL,
'Uma espada', 'Uma constelação', 'Um templo', 'A árvore do mundo', 'A árvore do mundo', 2),

('Jörmungandr era uma serpente marinha que circundava o mundo.', 'Qual criatura era Jörmungandr?', NULL,
'Dragão', 'Serpente gigante', 'Lobo', 'Gigante de fogo', 'Serpente gigante', 2),

('Os berserkers eram guerreiros temidos.', 'O que caracterizava os berserkers?', NULL,
'Combatiam em transe', 'Combatiam com música', 'Eram curandeiros', 'Não usavam armas', 'Combatiam em transe', 2),

('Hel governava o reino dos mortos não honrosos.', 'Hel era responsável por:', NULL,
'Montanhas', 'Reino dos mortos', 'Ventos', 'Caça', 'Reino dos mortos', 2);



-- Egipcia
('Rá era considerado o deus supremo, associado ao sol e à criação.', 'Rá era o deus de:', NULL,
'Guerra', 'Sol', 'Mares', 'Sono', 'B', 3),

('Osíris governava o mundo dos mortos, sendo símbolo de ressurreição.', 'Qual era o domínio de Osíris?', NULL,
'Olimpo', 'Mundo dos mortos', 'Colheitas', 'Mares', 'B', 3),

('Ísis era uma das deusas mais importantes, representando magia e proteção.', 'Ísis era a deusa de:', NULL,
'Morte', 'Magia e proteção', 'Sabedoria', 'Trovões', 'B', 3),

('Anúbis era representado com cabeça de chacal e cuidava das mumificações.', 'Função de Anúbis:', NULL,
'Mares', 'Vida animal', 'Mumificação', 'Guerra', 'C', 3),

('Hórus era filho de Ísis e Osíris e possuía cabeça de falcão.', 'Hórus era associado a:', NULL,
'Céu e realeza', 'Agricultura', 'Sabedoria', 'Doenças', 'A', 3),

('Set era o deus do caos e da desordem.', 'Set representava:', NULL,
'Ordem', 'Caos', 'Caça', 'Música', 'B', 3),

('Maat simbolizava equilíbrio, justiça e verdade.', 'Maat representava:', NULL,
'Violência', 'Justiça e verdade', 'Chuva', 'Escuridão', 'B', 3),

('Bastet era uma deusa com cabeça de felino.', 'Bastet era deusa de:', NULL,
'Fertilidade e proteção doméstica', 'Guerra', 'Fogo', 'Mares', 'A', 3),

('Sobek possuía cabeça de crocodilo e era ligado aos rios.', 'Sobek era deus de:', NULL,
'Serpentes', 'Nilo', 'Montanhas', 'Ar', 'B', 3),

('Thoth era o deus escriba, inventando a escrita.', 'Thoth era associado a:', NULL,
'Luz', 'Trevas', 'Escrita e sabedoria', 'Sonhos', 'C', 3);



-- Chinesa
('O dragão é um ser mitológico que simboliza poder e prosperidade.', 'O dragão chinês representa:', NULL,
'Destruição', 'Poder e sorte', 'Guerra', 'Tristeza', 'B', 4),

('A deusa Nüwa criou a humanidade moldando figuras de barro.', 'O que Nüwa criou?', NULL,
'Os rios', 'Os humanos', 'Os astros', 'Os ventos', 'B', 4),

('O imperador de Jade governa os céus.', 'Quem governa os céus na mitologia chinesa?', NULL,
'Dizang', 'Guanyin', 'Imperador de Jade', 'Huli Jing', 'C', 4),

('Guan Yu é um símbolo de lealdade e coragem.', 'Guan Yu representa:', NULL,
'Traição', 'Medo', 'Lealdade', 'Preguiça', 'C', 4),

('Sun Wukong, o Rei Macaco, possui imenso poder e habilidade.', 'Sun Wukong é conhecido como:', NULL,
'Rei Macaco', 'Rei Tigre', 'Rei Dragão', 'Guardião das montanhas', 'A', 4),

('Dragões controlavam a chuva e a água.', 'Que elemento os dragões controlavam?', NULL,
'Fogo', 'Água e chuva', 'Vento', 'Terra', 'B', 4),

('Chang’e vive na lua após beber um elixir da imortalidade.', 'Onde Chang’e passou a viver?', NULL,
'No mar', 'Na lua', 'No deserto', 'Nos vulcões', 'B', 4),

('Zhu Bajie era um ser meio homem e meio porco.', 'Zhu Bajie é:', NULL,
'Um dragão', 'Um espírito-porco', 'Um monge', 'Um lobo', 'B', 4),

('A tartaruga negra representa longevidade.', 'O que simboliza a tartaruga negra?', NULL,
'Curiosidade', 'Longevidade', 'Velocidade', 'Força física', 'B', 4),

('Fuxi ensinou a agricultura e a caça aos humanos.', 'Fuxi ensinou:', NULL,
'Estrelas', 'Artes', 'Agricultura e caça', 'Cantigas', 'C', 4);




-- Japonesa
('Amaterasu é a deusa do sol e uma das mais importantes do xintoísmo.', 'Amaterasu é deusa de:', NULL,
'Sabedoria', 'Sol', 'Tempestades', 'Agricultura', 'B', 5),

('Susanoo é o deus das tempestades e do mar.', 'Susanoo governa:', NULL,
'Agricultura', 'Tempestades', 'Montanhas', 'Fertilidade', 'B', 5),

('Tsukuyomi é o deus da lua.', 'Tsukuyomi é associado à:', NULL,
'Sorte', 'Fogo', 'Lua', 'Sabedoria', 'C', 5),

('Kitsune são raposas mágicas que podem mudar de forma.', 'O que kitsune podem fazer?', NULL,
'Criar montanhas', 'Voar', 'Mudar de forma', 'Transformar água em ouro', 'C', 5),

('Oni são criaturas geralmente malignas com aparência monstruosa.', 'Oni são:', NULL,
'Anjos', 'Demônios ou ogros', 'Espíritos do vento', 'Sábios', 'B', 5),

('Yokai são espíritos ou criaturas sobrenaturais.', 'O que são yokai?', NULL,
'Monstros tecnológicos', 'Animais comuns', 'Espíritos sobrenaturais', 'Deuses celestiais', 'C', 5),

('Kappa são seres aquáticos travessos.', 'Onde vivem os kappa?', NULL,
'Montanhas', 'Rios e lagos', 'Desertos', 'Céu', 'B', 5),

('Tengu são criaturas aladas ligadas às montanhas.', 'Tengu são:', NULL,
'Criaturas aladas', 'Serpentes', 'Fantasmas', 'Anões', 'A', 5),

('Izanagi participou da criação do mundo.', 'Izanagi é:', NULL,
'Deus criador', 'Deus do caos', 'Guardião das sombras', 'Senhor das chuvas', 'A', 5),

('Izanami governou o mundo dos mortos.', 'Izanami passou a governar:', NULL,
'Céu', 'Mares', 'Mundo dos mortos', 'Trovões', 'C', 5);



-- Hindu
('Brahma é considerado o criador do universo no hinduísmo.', 'Qual é o papel de Brahma?', NULL,
'Criador', 'Destruidor', 'Preservador', 'Mensageiro', 'A', 6),

('Vishnu é responsável por manter o equilíbrio do universo.', 'O que Vishnu representa?', NULL,
'Caos', 'Preservação', 'Guerra', 'Tempestades', 'B', 6),

('Shiva destrói para permitir a regeneração e novos ciclos.', 'Shiva é conhecido como o deus da:', NULL,
'Destruição e renovação', 'Colheita', 'Morte', 'Música', 'A', 6),

('Ganesha possui cabeça de elefante e remove obstáculos.', 'Ganesha é deus de:', NULL,
'Amor', 'Remoção de obstáculos', 'Fogo', 'Mares', 'B', 6),

('Kali é uma deusa poderosa associada à destruição do mal.', 'Kali representa:', NULL,
'Amor', 'Destruição do mal', 'Temporadas', 'Riqueza', 'B', 6),

('Lakshmi simboliza prosperidade e fortuna.', 'Lakshmi é deusa da:', NULL,
'Riqueza', 'Guerra', 'Sabedoria', 'Colheitas', 'A', 6),

('Hanuman é um deus-macaco dotado de força e devoção.', 'Hanuman é famoso por sua:', NULL,
'Fraqueza', 'Velocidade', 'Devoção e força', 'Magia', 'C', 6),

('Saraswati é a deusa da arte, música e conhecimento.', 'Saraswati governa:', NULL,
'Mares', 'Conhecimento e artes', 'Animais', 'Nuvens', 'B', 6),

('Rama é um avatar de Vishnu conhecido por sua bravura.', 'Rama é um:', NULL,
'Demônio', 'Avatar de Vishnu', 'Dragão', 'Rei dos mares', 'B', 6),

('Krishna é um dos deuses hindus mais amados e protetores.', 'Krishna representa:', NULL,
'Trapaça', 'Sabedoria e amor', 'Doenças', 'Medo', 'B', 6);



-- Maia
('Itzamná é considerado um dos principais deuses maias.', 'Itzamná é deus de:', NULL,
'Escrita e sabedoria', 'Mares', 'Guerra', 'Vento', 'A', 7),

('Kukulkan é representado como uma serpente emplumada.', 'Kukulkan é uma:', NULL,
'Serpente emplumada', 'Águia dourada', 'Tartaruga gigante', 'Onça alada', 'A', 7),

('Chaac é o deus da chuva entre os maias.', 'Chaac controla:', NULL,
'Solo', 'Raios', 'Chuva', 'Montanhas', 'C', 7),

('Ah Puch é o deus maia associado à morte.', 'Ah Puch representa:', NULL,
'Vida', 'Morte', 'Fertilidade', 'Sabedoria', 'B', 7),

('Ix Chel é a deusa da lua e da fertilidade.', 'Ix Chel governa:', NULL,
'Fogo', 'Lua e fertilidade', 'Caça', 'Oceano', 'B', 7),

('Os maias acreditavam em vários níveis de mundo espiritual.', 'Qual era a visão maia?', NULL,
'Monoteísta', 'Três mundos espirituais', 'Sem vida após a morte', 'Linear', 'B', 7),

('Hunab Ku é considerado o deus criador supremo.', 'Hunab Ku representa:', NULL,
'Caos', 'Criação', 'Trovão', 'Montanhas', 'B', 7),

('Camazotz é um deus-morcego ligado à noite.', 'Camazotz é associado à:', NULL,
'Guerra', 'Noite', 'Sol', 'Música', 'B', 7),

('Os maias realizavam rituais para pedir chuva.', 'A quem pediam chuva?', NULL,
'Chaac', 'Ah Puch', 'Kukulkan', 'Itzamná', 'A', 7),

('A bola era um esporte ritualístico importante.', 'O jogo de bola simbolizava:', NULL,
'Diversão simples', 'Rituais espirituais', 'Treino militar', 'Economia', 'B', 7);




-- Asteca
('Quetzalcóatl é a serpente emplumada asteca.', 'Quetzalcóatl representa:', NULL,
'Sonhos', 'Serpente emplumada', 'Fogo', 'Terremotos', 'B', 8),

('Huitzilopochtli era o deus do sol e da guerra.', 'Huitzilopochtli é associado a:', NULL,
'Sabedoria', 'Guerra e sol', 'Vento', 'Fertilidade', 'B', 8),

('Tlaloc é o deus da chuva entre os astecas.', 'Tlaloc controla:', NULL,
'Fogo', 'Chuva', 'Terremotos', 'Neve', 'B', 8),

('Tezcatlipoca era um deus poderoso ligado ao destino.', 'Tezcatlipoca representa:', NULL,
'Dança', 'Destino e noite', 'Amor', 'Marés', 'B', 8),

('Coatlicue é a mãe dos deuses e representada com serpentes.', 'Coatlicue é:', NULL,
'Mãe dos deuses', 'Rainha do gelo', 'Deusa do mar', 'Criadora dos ventos', 'A', 8),

('Mictlantecuhtli governa o mundo dos mortos.', 'Quem governa Mictlan?', NULL,
'Huitzilopochtli', 'Quetzalcóatl', 'Mictlantecuhtli', 'Tlaloc', 'C', 8),

('Xipe Totec simboliza renovação e renascimento.', 'Xipe Totec representa:', NULL,
'Doença', 'Renovação', 'Tempo', 'Sono', 'B', 8),

('Chalchiuhtlicue é deusa das águas.', 'Chalchiuhtlicue controla:', NULL,
'Fogo', 'Água', 'Vento', 'Solo', 'B', 8),

('Os astecas realizavam rituais para manter o equilíbrio do cosmos.', 'Por que realizavam rituais?', NULL,
'Lazer', 'Equilíbrio do cosmos', 'Dança', 'Colheitas', 'B', 8),

('A águia representava poder e bravura.', 'O que a águia simbolizava?', NULL,
'Preguiça', 'Bravura', 'Doença', 'Morte', 'B', 8);




-- Celta
('Dagda era um deus poderoso associado à abundância.', 'Dagda representa:', NULL,
'Guerra', 'Abundância', 'Fogo', 'Doenças', 'B', 9),

('Brigid era deusa da poesia e da cura.', 'Brigid é deusa de:', NULL,
'Caça', 'Cura e poesia', 'Tempestades', 'Sombras', 'B', 9),

('Lugh era um deus guerreiro e habilidoso.', 'Lugh era associado a:', NULL,
'Artes e guerra', 'Água', 'Sono', 'Escrita', 'A', 9),

('Morrigan era deusa da guerra e do destino.', 'Morrigan representa:', NULL,
'Amor', 'Guerra', 'Sol', 'Mares', 'B', 9),

('Cernunnos era o deus da fertilidade e dos animais.', 'Cernunnos governa:', NULL,
'Fertilidade', 'Tempestades', 'Fogo', 'Montanhas', 'A', 9),

('Banshees eram espíritos femininos que anunciavam morte.', 'O que anunciavam as banshees?', NULL,
'Riqueza', 'Morte', 'Nobreza', 'Colheitas', 'B', 9),

('Os druidas eram sacerdotes sábios.', 'Quem eram os druidas?', NULL,
'Guerreiros', 'Sacerdotes sábios', 'Artistas', 'Caçadores', 'B', 9),

('Túatha Dé Danann eram povos divinos.', 'O que eram?', NULL,
'Humanos', 'Povos divinos', 'Fadas maldosas', 'Gigantes', 'B', 9),

('A árvore era sagrada para os celtas.', 'A árvore simbolizava:', NULL,
'Morte', 'Vida', 'Doença', 'Guerra', 'B', 9),

('Os celtas acreditavam em outro mundo espiritual.', 'O Outro Mundo era:', NULL,
'Um reino espiritual', 'Um deserto', 'Uma montanha', 'Um oceano', 'A', 9);


-- Mesopotamica
('Anu era o deus do céu na Mesopotâmia.', 'Anu representa:', NULL,
'Terra', 'Céu', 'Fogo', 'Chuvas', 'B', 10),

('Enlil era o deus do vento e das tempestades.', 'Enlil governa:', NULL,
'Fogo', 'Vento', 'Lua', 'Mares', 'B', 10),

('Enki era o deus da água e da sabedoria.', 'Enki representa:', NULL,
'Mares', 'Água e sabedoria', 'Guerra', 'Tempo', 'B', 10),

('Ishtar era a deusa do amor e da guerra.', 'Ishtar é deusa de:', NULL,
'Sombras', 'Amor e guerra', 'Doenças', 'Fogo', 'B', 10),

('Marduk era o deus supremo da Babilônia.', 'Marduk era:', NULL,
'Deus supremo', 'Mensageiro', 'Criatura marinha', 'Deus menor', 'A', 10),

('Tiamat era uma deusa-dragão associada ao caos.', 'Tiamat representa:', NULL,
'Paz', 'Caos', 'Luz', 'Fertilidade', 'B', 10),

('Nergal era o deus dos mortos e da guerra.', 'Nergal é:', NULL,
'Deus da chuva', 'Deus da morte', 'Deus da colheita', 'Deus do sol', 'B', 10),

('Utu/Šamaš era o deus do sol e da justiça.', 'O que Šamaš governava?', NULL,
'Sono', 'Justiça', 'Rios', 'Montanhas', 'B', 10),

('Nanna era o deus da lua.', 'Nanna representava:', NULL,
'Estrelas', 'Lua', 'Montanhas', 'Chuvas', 'B', 10),

('Os mesopotâmicos viam os deuses como controladores da natureza.', 'Qual era sua visão dos deuses?', NULL,
'Não interferiam', 'Controlavam a natureza', 'Apenas observavam', 'Eram humanos', 'B', 10);




-- Africana
('Olorum é o deus supremo em algumas tradições africanas.', 'Olorum representa:', NULL,
'Caos', 'Criador supremo', 'Fogo', 'Vento', 'B', 11),

('Exu é o mensageiro entre os mundos.', 'Exu é:', NULL,
'Criador', 'Mensageiro', 'Guerreiro do mar', 'Senhor da caça', 'B', 11),

('Oxum é a deusa dos rios e do amor.', 'Oxum governa:', NULL,
'Montanhas', 'Rios e amor', 'Tempestades', 'Guerra', 'B', 11),

('Iansã é associada ao vento e às tempestades.', 'Iansã representa:', NULL,
'Vento e tempestades', 'Mares', 'Fogo', 'Sonhos', 'A', 11),

('Xangô é o deus da justiça e dos trovões.', 'Xangô é senhor de:', NULL,
'Gelo', 'Justiça e trovões', 'Rios', 'Florestas', 'B', 11),

('Ogum é o deus do ferro e da guerra.', 'Ogum representa:', NULL,
'Fertilidade', 'Ferro e guerra', 'Música', 'Morte', 'B', 11),

('Oxóssi é o deus da caça e da floresta.', 'Oxóssi governa:', NULL,
'Fogo', 'Caça', 'Tempestades', 'Marés', 'B', 11),

('Nanã é associada à sabedoria antiga.', 'Nanã representa:', NULL,
'Luz', 'Sabedoria', 'Sono', 'Velocidade', 'B', 11),

('Omulu/Obaluaiê é o deus da cura e das doenças.', 'Omulu é:', NULL,
'Deus da cura', 'Deus do mar', 'Deus da música', 'Deus do sol', 'A', 11),

('Os orixás representam forças da natureza.', 'O que representam?', NULL,
'Mundo tecnológico', 'Forças da natureza', 'Planetas', 'Ventos apenas', 'B', 11);




-- Indigena
('Tupã é considerado o deus do trovão entre muitos povos indígenas.', 'Tupã representa:', NULL,
'Chuva', 'Trovão', 'Caça', 'Colheita', 'B', 12),

('Jaci é a deusa da lua nas mitologias indígenas brasileiras.', 'Jaci é:', NULL,
'Criadora dos ventos', 'Deusa da lua', 'Deusa do sol', 'Espírito da caça', 'B', 12),

('Guaraci é o deus do sol.', 'Guaraci governa:', NULL,
'Lua', 'Sol', 'Marés', 'Fogo', 'B', 12),

('Curupira é um protetor das florestas com pés virados para trás.', 'Curupira protege:', NULL,
'Mares', 'Florestas', 'Montanhas', 'Nuvens', 'B', 12),

('Boitatá é uma cobra de fogo que protege campos.', 'Boitatá é:', NULL,
'Cobra de fogo', 'Serpente de gelo', 'Anjo da floresta', 'Demônio do vento', 'A', 12),

('Saci-Pererê é um ser travesso de uma perna só.', 'O saci é conhecido por:', NULL,
'Ser gigante', 'Trapaças', 'Voar', 'Dormir muito', 'B', 12),

('Iara é uma sereia indígena que vive nos rios.', 'Onde vive Iara?', NULL,
'Montanhas', 'Céu', 'Rios', 'Geleiras', 'C', 12),

('Mapinguari é um ser gigantesco que guarda a floresta.', 'O Mapinguari é:', NULL,
'Sereia', 'Guardião da floresta', 'Pequeno duende', 'Espírito das árvores', 'B', 12),

('Anhangá é um espírito protetor dos animais.', 'Anhangá representa:', NULL,
'Caça', 'Proteção dos animais', 'Morte', 'Guerra', 'B', 12),

('Os povos indígenas veem a natureza como algo sagrado.', 'A natureza representa:', NULL,
'Objeto', 'Ser sagrado', 'Inimigo', 'Nada especial', 'B', 12);


-- Rodada (associando questões aos quizzes)
INSERT INTO Rodada (idQuestoes, idTipoMitologia) VALUES
(1, 1), -- Questão 1 no Quiz de Mitologia Grega
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),

-- Nordica
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),

-- Egipcia
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),

-- Chinesa
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),

-- Japonesa
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),

-- Hindu
(51, 6),
(52, 6),
(53, 6),
(54, 6),
(55, 6),
(56, 6),
(57, 6),
(58, 6),
(59, 6),
(60, 6),

-- Maia
(61, 7),
(62, 7),
(63, 7),
(64, 7),
(65, 7),
(66, 7),
(67, 7),
(68, 7),
(69, 7),
(70, 7),

-- Asteca
(71, 8),
(72, 8),
(73, 8),
(74, 8),
(75, 8),
(76, 8),
(77, 8),
(78, 8),
(79, 8),
(80, 8),

-- Celta
(81, 9),
(82, 9),
(83, 9),
(84, 9),
(85, 9),
(86, 9),
(87, 9),
(88, 9),
(89, 9),
(90, 9),

-- Mesopotamica
(91, 10),
(92, 10),
(93, 10),
(94, 10),
(95, 10),
(96, 10),
(97, 10),
(98, 10),
(99, 10),
(100, 10),

-- Africana
(101, 11),
(102, 11),
(103, 11),
(104, 11),
(105, 11),
(106, 11),
(107, 11),
(108, 11),
(109, 11),
(110, 11),

-- Indigena
(111, 12),
(112, 12),
(113, 12),
(114, 12),
(115, 12),
(116, 12),
(117, 12),
(118, 12),
(119, 12),
(120, 12);




-- Placar
-- INSERT INTO Placar (respostaUsuario, idRodada_idQuestoes, idQuiz, idUsuario) VALUES
-- ('Poseidon', 1, 1, 2), -- João respondeu certo
-- ('Loki', 2, 2, 3);     -- Maria respondeu errado

SELECT * FROM Usuario;
SELECT * FROM Quiz;
SELECT * FROM TipoMitologia;
SELECT * FROM Conteudo;
SELECT * FROM Questoes;
SELECT * FROM Rodada;
SELECT * FROM Placar;


