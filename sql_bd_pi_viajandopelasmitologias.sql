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
    idUsuario INT NOT NULL,
    idQuestoes INT NOT NULL,
    idTipoMitologia INT NOT NULL,
    PRIMARY KEY (idUsuario, idQuestoes, idTipoMitologia),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
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
-- MITOLOGIA GREGA (1)
('Zeus era conhecido não apenas como soberano do Olimpo, mas também como responsável por manter a ordem entre deuses e mortais, punindo aqueles que quebravam juramentos.', 'Além de governar os céus, que outro papel importante Zeus desempenhava?', NULL, 'Guardião das artes', 'Protetor das colheitas', 'Fiscalizador dos juramentos', 'Senhor dos mares', 'Fiscalizador dos juramentos', 1),
('Afrodite, apesar de associada à beleza, exercia influência direta em conflitos, pois suas bênçãos podiam alterar alianças e paixões humanas.', 'Além da beleza, que impacto Afrodite tinha na vida dos mortais?', NULL, 'Influência em decisões amorosas e políticas', 'Habilidades de caça', 'Controle sobre tempestades', 'Domínio sobre os sonhos', 'Influência em decisões amorosas e políticas', 1),
('Hades governava o submundo e mantinha rígida separação entre vivos e mortos, garantindo a ordem do ciclo funerário.', 'O governo de Hades estava ligado principalmente a quê?', NULL, 'Criação das constelações', 'Organização do reino dos mortos', 'Navegação dos mares', 'Proteção das montanhas', 'Organização do reino dos mortos', 1),
('Ares era visto como a personificação da violência impetuosa da guerra, contrastando com a estratégia representada por Atena.', 'Qual é a principal característica associada a Ares?', NULL, 'Disciplina e lógica', 'Violência e impulsividade', 'Sabedoria e equilíbrio', 'Magia e cura', 'Violência e impulsividade', 1),
('Atena era procurada por heróis e cidades que buscavam conselhos racionais e estratégias precisas em tempos de crise.', 'Por que Atena era valorizada pelos gregos?', NULL, 'Domínio sobre tempestades', 'Força física', 'Sabedoria estratégica', 'Poder sobre as paixões', 'Sabedoria estratégica', 1),
('Os famosos Trabalhos de Hércules testavam tanto sua força quanto sua engenhosidade para cumprir tarefas impostas como expiação.', 'O que os Trabalhos demonstravam sobre Hércules?', NULL, 'Domínio sobre a magia', 'Resistência e inteligência', 'Controle sobre os mares', 'Capacidade musical', 'Resistência e inteligência', 1),
('Poseidon era reverenciado como senhor dos mares e também temido como causador de terremotos — por isso o epíteto "Abalador da Terra".', 'Além dos mares, qual fenômeno Poseidon podia provocar?', NULL, 'Criar ilhas', 'Tempestades de areia', 'Provocar terremotos', 'Controlar o fogo', 'Provocar terremotos', 1),
('Apolo era patrono da música, das artes e da profecia, sendo ligado ao famoso oráculo de Delfos.', 'Que aspecto de Apolo reforça seu papel espiritual?', NULL, 'Guerra', 'Profecias e oráculos', 'Comércio', 'Agricultura', 'Profecias e oráculos', 1),
('Ártemis era deusa da caça, protetora dos animais e símbolo de independência feminina, preservando territórios selvagens.', 'A ligação de Ártemis com a natureza é percebida principalmente em qual aspecto?', NULL, 'Domínio sobre mares', 'Proteção dos animais e florestas', 'Controle dos ventos', 'Gestão das colheitas', 'Proteção dos animais e florestas', 1),
('Hermes, além de mensageiro, atuava como guia de viajantes e conduzidor de almas ao submundo, combinando astúcia e rapidez.', 'Além de mensageiro, qual outra função Hermes desempenhava?', NULL, 'Criar tempestades', 'Conduzir almas ao submundo', 'Proteger reis', 'Fabricar armas divinas', 'Conduzir almas ao submundo', 1),

-- MITOLOGIA NÓRDICA (2)
('Odin buscava conhecimento através de sacrifícios pessoais, inclusive cedendo um olho para obter sabedoria maior.', 'Qual gesto extremo Odin realizou para obter sabedoria?', NULL, 'Ofereceu seu martelo', 'Perdeu um olho', 'Renunciou ao trono', 'Transformou-se em corvo', 'Perdeu um olho', 2),
('Thor, portador do martelo Mjölnir, era tanto protetor dos homens quanto um símbolo do poder contra gigantes.', 'Por que Mjölnir era importante para Thor?', NULL, 'Era sua arma contra gigantes', 'Era um objeto decorativo', 'Servia para semear', 'Era moeda de troca', 'Era sua arma contra gigantes', 2),
('Loki era um deus trapaceiro cujo papel ambíguo afetava tanto mitos de criação quanto de destruição, causando reviravoltas.', 'Como se descreve melhor Loki?', NULL, 'Deus da fertilidade', 'Deus trapaceiro com papel ambíguo', 'Deus das colheitas', 'Senhor do mar', 'Deus trapaceiro com papel ambíguo', 2),
('Valhalla era o salão onde guerreiros mortos com honra se reuniam para banquetes eternos, treinando para o Ragnarok.', 'Quem habitava Valhalla?', NULL, 'Camponeses', 'Guerreiros mortos com honra', 'Profetas', 'São sacerdotes', 'Guerreiros mortos com honra', 2),
('Freyja era associada ao amor, à beleza e também às artes da guerra, possuindo influência política entre deuses e humanos.', 'Que combinação de atributos define Freyja?', NULL, 'Agricultura e paz', 'Amor e guerra', 'Ganância e fome', 'Lua e mar', 'Amor e guerra', 2),
('Fenrir, lobo profetizado para quebrar seus grilhões, representa forças catastróficas no fim dos tempos (Ragnarok).', 'Qual papel Fenrir desempenha na profecia nórdica?', NULL, 'Guardião do mundo', 'Lobo que causará destruição no Ragnarok', 'Deus do mar', 'Protetor das colheitas', 'Lobo que causará destruição no Ragnarok', 2),
('Yggdrasil era a árvore do mundo que conectava os nove reinos, sendo central na cosmologia nórdica.', 'O que Yggdrasil representa?', NULL, 'Uma espada', 'Uma cidade perdida', 'A árvore que sustenta os mundos', 'Uma montanha sagrada', 'A árvore que sustenta os mundos', 2),
('Jörmungandr, serpente que circunda Midgard, e Thor estão destinados a um confronto mortal durante o Ragnarok.', 'Qual é a relação entre Jörmungandr e o mundo?', NULL, 'É um rio sagrado', 'Circunda o mundo e ameaça os deuses', 'É apenas uma constelação', 'É um espírito benevolente', 'Circunda o mundo e ameaça os deuses', 2),
('Os berserkers eram guerreiros que entravam em transe de batalha e eram temidos por sua ferocidade desenfreada.', 'O que caracterizava os berserkers?', NULL, 'Erudição filosófica', 'Combate em transe e fúria', 'Paz e cura', 'Habilidade com instrumentos', 'Combate em transe e fúria', 2),
('Hel governava os mortos não honrados em um reino sombrio, distinto do salão guerreiro de Valhalla.', 'Qual reino Hel governava?', NULL, 'Salão dos heróis', 'Reino dos mortos não honrados', 'Região dos deuses', 'Terra dos imortais', 'Reino dos mortos não honrados', 2),

-- MITOLOGIA EGÍPCIA (3)
('Rá era cultuado como centelha criadora que atravessava o céu em sua barca, simbolizando renascimento diário do sol.', 'Qual símbolo central está ligado a Rá?', NULL, 'Lua crescente', 'Barca solar e renascimento', 'Tridente', 'Arco e flecha', 'Barca solar e renascimento', 3),
('Osíris representava a passagem, a ressurreição e a agricultura ciclo; seus mistérios garantiam continuidade social e agrícola.', 'Qual aspecto principal Osíris encarna?', NULL, 'Guerra eterna', 'Mundo dos mortos e ressurreição', 'Tempestades', 'Comércio', 'Mundo dos mortos e ressurreição', 3),
('Ísis era deusa-mãe cuja magia e devoção reparavam destinos, sendo exemplar na proteção familiar e rituaIs funerários.', 'Qual era a função cultural de Ísis?', NULL, 'Caçadora de monstros', 'Símbolo de magia e proteção familiar', 'Deusa da noite', 'Senhora das tempestades', 'Símbolo de magia e proteção familiar', 3),
('Anúbis, com cabeça de chacal, presidia ritos funerários e a pesagem do coração para avaliar a alma.', 'Qual tarefa ritual Anúbis realizava?', NULL, 'Controlar o Nilo', 'Mumificação e ritos funerários', 'Cultivar cereais', 'Guiar guerreiros', 'Mumificação e ritos funerários', 3),
('Hórus era associado ao céu e à realeza e frequentemente representado como falcão que vencia as forças do caos.', 'Hórus simbolizava principalmente:', NULL, 'Marés e rios', 'Céu e realeza', 'Colheitas', 'Doenças', 'Céu e realeza', 3),
('Set representava a desordem e, apesar de antagonista, tinha papéis complexos nas lendas de poder.', 'Qual característica descreve Set?', NULL, 'Harmonia', 'Caos e conflito', 'Agricultura', 'Sabedoria', 'Caos e conflito', 3),
('Maat personificava ordem, verdade e justiça e era essencial no julgamento pós-morte.', 'Qual conceito Maat representa?', NULL, 'Vingança', 'Justiça, verdade e ordem', 'Esquecimento', 'Fúria', 'Justiça, verdade e ordem', 3),
('Bastet, frequentemente com traços felinos, protegia o lar e estava ligada à fertilidade e ao bem-estar doméstico.', 'Qual esfera Bastet protegia?', NULL, 'Guerra', 'Fertilidade e proteção doméstica', 'Tempestades', 'Morte', 'Fertilidade e proteção doméstica', 3),
('Sobek, com cabeça de crocodilo, estava ligado ao Nilo e ao poder régio derivado do rio.', 'Com o que Sobek estava associado?', NULL, 'Desertos', 'Nilo e poder aquático', 'Céu', 'Montanhas', 'Nilo e poder aquático', 3),
('Thoth era o escriba divino, inventor da escrita e patrono da sabedoria e dos cálculos do além.', 'Thoth era particularmente o deus de:', NULL, 'Música', 'Escrita e sabedoria', 'Tempestades', 'Guerra', 'Escrita e sabedoria', 3),

-- MITOLOGIA CHINESA (4)
('O dragão chinês simboliza poder imperial, prosperidade e ligação com as águas e as chuvas que sustentam a agricultura.', 'O dragão chinês representa principalmente:', NULL, 'Destruição', 'Poder e sorte', 'Guerra', 'Tristeza', 'Poder e sorte', 4),
('Nüwa, a criadora mitológica, moldou seres humanos e reparou o céu após desastres cósmicos.', 'Qual papel Nüwa desempenha na criação?', NULL, 'Criou animais marinhos', 'Modelou os humanos e reparou o céu', 'Controlou as marés', 'Deu nomes às estrelas', 'Modelou os humanos e reparou o céu', 4),
('O Imperador de Jade é figura suprema que organiza o céu e as hierarquias divinas, similar a um imperador terrestre.', 'Quem governa o céu na cosmologia chinesa tradicional?', NULL, 'Guanyin', 'Imperador de Jade', 'Dizang', 'Huli Jing', 'Imperador de Jade', 4),
('Guan Yu é reverenciado como modelo de lealdade e honra, sendo depois cultuado quase como divindade de proteção.', 'Guan Yu simboliza principalmente:', NULL, 'Traição', 'Medo', 'Lealdade e coragem', 'Preguiça', 'Lealdade e coragem', 4),
('Sun Wukong, o Rei Macaco, é herói travesso com poderosos feitos no épico Jornada ao Oeste.', 'Pelo que Sun Wukong é conhecido?', NULL, 'Rei Dragão', 'Rei Tigre', 'Rei Macaco com poderes extraordinários', 'Guardião das montanhas', 'Rei Macaco com poderes extraordinários', 4),
('Dragões na tradição chinesa são também controladores do ciclo das chuvas e das águas que irrigam a terra.', 'Que elemento os dragões regem?', NULL, 'Fogo', 'Água e chuva', 'Vento', 'Terra', 'Água e chuva', 4),
('Chang''e subiu à lua depois de beber um elixir; sua lenda explica festivais lunares e a solidão da deusa lunar.', 'Onde Chang''e passou a viver segundo a lenda?', NULL, 'No mar', 'Na lua', 'No deserto', 'Nos vulcões', 'Na lua', 4),
('Zhu Bajie é personagem com características humanas e animalescas que retrata fraquezas e comicidade na jornada.', 'Zhu Bajie é descrito como:', NULL, 'Um dragão', 'Um espírito-porco meia-humana', 'Um monge iluminado', 'Um lobo', 'Um espírito-porco meia-humana', 4),
('A tartaruga negra está ligada à longevidade, estabilidade e ao eixo cósmico na cosmologia tradicional.', 'A tartaruga negra simboliza:', NULL, 'Curiosidade', 'Longevidade e estabilidade', 'Velocidade', 'Força física', 'Longevidade e estabilidade', 4),
('Fuxi é culturalmente atribuído ao ensino de técnicas básicas como caça, pesca e agricultura aos primeiros humanos.', 'O que Fuxi ensinou à humanidade?', NULL, 'Artes', 'Agricultura e caça', 'Contar estrelas', 'Fazer música', 'Agricultura e caça', 4),

-- MITOLOGIA JAPONESA (5)
('Amaterasu, deusa do sol, foi central ao xintoísmo e sua retirada para uma caverna explica eclipses e rituais de reconciliação.', 'Amaterasu é principalmente deusa do que?', NULL, 'Sabedoria', 'Sol', 'Tempestades', 'Agricultura', 'Sol', 5),
('Susanoo, irmão de Amaterasu, é figura tempestuosa cujo mito inclui derrotar uma serpente de múltiplas cabeças.', 'Susanoo é associado a qual domínio?', NULL, 'Agricultura', 'Tempestades e mar', 'Montanhas', 'Fertilidade', 'Tempestades e mar', 5),
('Tsukuyomi é a divindade lunar e seu conflito com Amaterasu explica a separação dos ciclos solar e lunar.', 'Tsukuyomi é o deus da:', NULL, 'Sorte', 'Fogo', 'Lua', 'Sabedoria', 'Lua', 5),
('Kitsune são raposas sobrenaturais que mudam de forma; algumas lendas mostram-nas como mensageiras ou tricksters.', 'O que as kitsune costumam fazer nas lendas?', NULL, 'Construir templos', 'Mudar de forma e enganar', 'Fazer chuva', 'Semear colheitas', 'Mudar de forma e enganar', 5),
('Oni são demônios ou ogros que personificam perigos e provações morais nos contos populares.', 'Oni geralmente representam:', NULL, 'Anjos', 'Demônios ou ogros', 'Espíritos do vento', 'Sábios', 'Demônios ou ogros', 5),
('Yokai é um termo amplo para espíritos e criaturas sobrenaturais com variadas origens e intenções.', 'O que são os yokai?', NULL, 'Monstros tecnológicos', 'Animais comuns', 'Espíritos sobrenaturais variados', 'Deuses celestiais', 'Espíritos sobrenaturais variados', 5),
('Kappa são espíritos aquáticos travessos que vivem em rios e lagoas e testam a vigilância humana.', 'Onde residem os kappa?', NULL, 'Montanhas', 'Rios e lagos', 'Desertos', 'Céu', 'Rios e lagos', 5),
('Tengu são seres alados ligados às montanhas, frequentemente retratados como protetores ou provocadores de guerreiros.', 'Tengu são descritos como:', NULL, 'Criaturas aladas', 'Serpentes', 'Fantasmas', 'Anões', 'Criaturas aladas', 5),
('Izanagi participou da criação do mundo e seu mito inclui ritos de purificação que originam práticas xintoístas.', 'Izanagi é conhecido como:', NULL, 'Deus do caos', 'Deus criador ligado a ritos de purificação', 'Guardião das sombras', 'Senhor das chuvas', 'Deus criador ligado a ritos de purificação', 5),
('Izanami governou o mundo dos mortos após a separação inicial do casal criador, ilustrando ligação entre nascimento e morte.', 'Izanami passou a governar:', NULL, 'Céu', 'Mares', 'Mundo dos mortos', 'Trovões', 'Mundo dos mortos', 5),

-- MITOLOGIA HINDU (6)
('Brahma é tipicamente identificado como o criador dentro da tríade que regula criação, preservação e destruição.', 'Qual é o papel de Brahma na tríade hindu?', NULL, 'Destruidor', 'Criador', 'Preservador', 'Mensageiro', 'Criador', 6),
('Vishnu é o preservador que aparece em múltiplos avatares para restaurar o dharma em épocas de crise.', 'Qual função Vishnu cumpre?', NULL, 'Causar caos', 'Preservação através de avatares', 'Criar o universo', 'Ser apenas um mensageiro', 'Preservação através de avatares', 6),
('Shiva incorpora destruição e regeneração, sendo reverenciado tanto por ascetas quanto por devotos tântricos.', 'Shiva é grande por sua associação a:', NULL, 'Colheitas', 'Destruição e renovação', 'Música popular', 'Comércio', 'Destruição e renovação', 6),
('Ganesha, identificado pela cabeça de elefante, é invocado para remover obstáculos antes de empreendimentos importantes.', 'Por que Ganesha é invocado antes de começos importantes?', NULL, 'Para trazer tempestades', 'Para remover obstáculos', 'Para causar guerras', 'Para prever o futuro', 'Para remover obstáculos', 6),
('Kali é deusa poderosa que destrói forças do mal e representa, paradoxalmente, proteção e terror.', 'Kali é frequentemente associada a:', NULL, 'Comércio', 'Destruição do mal e proteção', 'Fertilidade agrícola', 'Música', 'Destruição do mal e proteção', 6),
('Lakshmi simboliza fortuna, prosperidade e boa sorte, sendo venerada em ritos domésticos por riqueza e bem-estar.', 'O que Lakshmi representa?', NULL, 'Guerra', 'Prosperidade e fortuna', 'Sabedoria filosófica', 'Oceano', 'Prosperidade e fortuna', 6),
('Hanuman é herói devoto famoso por força, lealdade e papel central no épico Ramayana.', 'Hanuman é admirado por sua:', NULL, 'Covardia', 'Devoção e força', 'Astúcia política', 'Riqueza', 'Devoção e força', 6),
('Saraswati é patrona das artes, música e conhecimento, cultuada por estudantes e artistas.', 'Saraswati governa principalmente:', NULL, 'Forças militares', 'Conhecimento e artes', 'Energia sísmica', 'Tempestades', 'Conhecimento e artes', 6),
('Rama é um avatar de Vishnu cuja história reflete ideais de dever, honra e liderança no épico Ramayana.', 'Rama é reconhecido como:', NULL, 'Um demônio', 'Avatar de Vishnu e rei ideal', 'Dragão mítico', 'Senhor dos mares', 'Avatar de Vishnu e rei ideal', 6),
('Krishna é figura complexa associada à devoção, moralidade e ensinamentos do Bhagavad Gita sobre ação e dever.', 'Que papel Krishna ocupa nas tradições devocionais?', NULL, 'Senhor do esquecimento', 'Fonte de ensinamentos sobre dever e amor', 'Ser demoníaco', 'Força das tempestades', 'Fonte de ensinamentos sobre dever e amor', 6),

-- MITOLOGIA MAIA (7)
('Itzamná é divindade criadora ligada ao conhecimento, agricultura e à autoridade ritual entre os maias.', 'Itzamná é principalmente deus de:', NULL, 'Guerra', 'Escrita e sabedoria', 'Mares', 'Caça', 'Escrita e sabedoria', 7),
('Kukulkan, serpente emplumada, simboliza união entre terra e céu e aparece em arquitetura ritualística.', 'Kukulkan é representado como:', NULL, 'Onça alada', 'Serpente emplumada', 'Tartaruga gigante', 'Águia dourada', 'Serpente emplumada', 7),
('Chaac era o deus da chuva cujo favor era vital para colheitas e rituais agrícolas.', 'Chaac controlava principalmente:', NULL, 'Solo', 'Raios', 'Chuva', 'Montanhas', 'Chuva', 7),
('Ah Puch era associado à morte e ao mundo subterrâneo, com imagens que evocavam decadência e transformação.', 'Ah Puch representava:', NULL, 'Vida e luz', 'Morte e o submundo', 'Fertilidade', 'Sabedoria', 'Morte e o submundo', 7),
('Ix Chel era deusa da lua, da fertilidade e da cura, influenciando práticas médicas e rituais femininos.', 'Ix Chel é deusa de:', NULL, 'Guerra', 'Lua e fertilidade', 'Caça', 'Construção', 'Lua e fertilidade', 7),
('A cosmologia maia incluía múltiplos níveis spirituais interconectados que orientavam cerimônias públicas e privadas.', 'Como era a visão maia do mundo espiritual?', NULL, 'Monoteísta', 'Três mundos espirituais interconectados', 'Sem vida após a morte', 'Linear e única camada', 'Três mundos espirituais interconectados', 7),
('Hunab Ku é identificado em interpretações modernas como princípio criador e central na ordem cósmica maia.', 'Hunab Ku é considerado:', NULL, 'Deus do mar', 'Força do acaso', 'O princípio criador supremo', 'Um herói cultural', 'O princípio criador supremo', 7),
('Camazotz, o morcego noturno, está ligado à morte, escuridão e ritos noturnos em mitos maias.', 'Camazotz é associado a qual esfera?', NULL, 'Música', 'Noite e morte', 'Sol', 'Tesouros', 'Noite e morte', 7),
('Os maias realizavam rituais comunitários complexos para assegurar chuvas e boas colheitas, envolvendo jogos e sacrifícios simbólicos.', 'Por que os rituais agrícolas eram realizados?', NULL, 'Lazer apenas', 'Para pedir chuva e fertilidade', 'Treino militar', 'Comércio', 'Para pedir chuva e fertilidade', 7),
('O jogo de bola maia tinha significados religiosos e políticos, simbolizando renovação e ordem cósmica.', 'O jogo de bola simbolizava principalmente:', NULL, 'Diversão simples', 'Rituais e ordem cósmica', 'Treino militar', 'Economia', 'Rituais e ordem cósmica', 7),

-- MITOLOGIA ASTECA (8)
('Quetzalcóatl, a serpente emplumada, é figura de dupla natureza: criador civilizacional e portador de saberes.', 'Quetzalcóatl representa:', NULL, 'Fogo destruidor', 'Serpente emplumada e saber', 'Forças do caos', 'Senhor do gelo', 'Serpente emplumada e saber', 8),
('Huitzilopochtli exigia sacrifícios e era patrono da guerra e do sol, sustentando a expansão política asteca.', 'Qual domínio é associado a Huitzilopochtli?', NULL, 'Paz e cultura', 'Guerra e sol', 'Artes', 'Agricultura', 'Guerra e sol', 8),
('Tlaloc era divindade da chuva e das águas, venerado para garantir chuvas e evitar secas desastrosas.', 'Tlaloc controlava:', NULL, 'Ventos', 'Terremotos', 'Chuva', 'Sol', 'Chuva', 8),
('Tezcatlipoca era deus associado ao destino, ao espelho fumegante e às forças ambíguas que testam o homem.', 'Tezcatlipoca representa:', NULL, 'Dança', 'Destino e noite', 'Agricultura', 'Marés', 'Destino e noite', 8),
('Coatlicue é descrita como mãe de deuses e simboliza fertilidade e aspectos mortíferos da criação.', 'Coatlicue é principalmente:', NULL, 'Deusa do gelo', 'Mãe dos deuses e figura ambivalente', 'Protetora das crianças', 'Deusa das estrelas', 'Mãe dos deuses e figura ambivalente', 8),
('Mictlantecuhtli governava o reino dos mortos e era retratado com iconografia que lembrava decomposição e sacralidade.', 'Quem preside o mundo dos mortos entre os astecas?', NULL, 'Huitzilopochtli', 'Quetzalcóatl', 'Mictlantecuhtli', 'Tlaloc', 'Mictlantecuhtli', 8),
('Xipe Totec simbolizava renovação por meio do desprendimento de pele, ligado a ciclos agrícolas e ritos de passagem.', 'O que Xipe Totec simboliza?', NULL, 'Eterno repouso', 'Renovação e renascimento', 'Guerra constante', 'Fome', 'Renovação e renascimento', 8),
('Chalchiuhtlicue era deusa das águas doces e associada à fertilidade e aos rios que sustentavam comunidades.', 'Chalchiuhtlicue está ligada a:', NULL, 'Fogo', 'Água doce e fertilidade', 'Ar', 'Terra árida', 'Água doce e fertilidade', 8),
('Os rituais astecas buscavam manter o equilíbrio cósmico e evitar catástrofes por meio de oferendas e cerimônias públicas.', 'Por que realizavam rituais públicos?', NULL, 'Entretenimento', 'Manter o equilíbrio do cosmos', 'Distribuir alimentos', 'Treinar guerreiros', 'Manter o equilíbrio do cosmos', 8),
('A águia era símbolo de poder e legitimidade para guerrear e governar, integrando ícones de status militar.', 'O que a águia simbolizava?', NULL, 'Preguiça', 'Bravura e poder', 'Medos coletivos', 'Fome', 'Bravura e poder', 8),

-- MITOLOGIA CELTA (9)
('Dagda é grande figura associada à abundância, música e autoridade mítica entre os povos celtas.', 'Dagda é comumente ligado a:', NULL, 'Doenças', 'Abundância e música', 'Guerra indiscriminada', 'Ventos', 'Abundância e música', 9),
('Brigid era deusa relacionada à poesia, cura e fogo doméstico, conectando saberes profanos e sagrados.', 'Brigid é deusa de:', NULL, 'Caça', 'Cura e poesia', 'Sombras', 'Tempestades', 'Cura e poesia', 9),
('Lugh, deus habilidoso, era patrono das artes e também guerreiro, simbolizando versatilidade cultural.', 'Lugh representava sobretudo:', NULL, 'Sono profundo', 'Artes e guerra', 'Escrita apenas', 'Inanição', 'Artes e guerra', 9),
('Morrigan aparece como figura da guerra e do destino, influenciando batalhas e presságios trágicos.', 'Morrigan está associada a qual esfera?', NULL, 'Amor romântico', 'Guerra e destino', 'Marés', 'Colheitas', 'Guerra e destino', 9),
('Cernunnos é ligado à fertilidade, animais e ao mundo selvagem, frequentemente representado com chifres.', 'Cernunnos governa:', NULL, 'Fertilidade e animais', 'Tempestades', 'Fogo urbano', 'Montanhas', 'Fertilidade e animais', 9),
('Banshees eram espíritos que anunciavam morte através de lamentos e presságios, parte da tradição oral sobre destino.', 'O que as banshees faziam?', NULL, 'Anunciavam riqueza', 'Anunciavam a morte', 'Curavam feridos', 'Cantavam no campo', 'Anunciavam a morte', 9),
('Druidas eram líderes rituais e sábios que mediavam entre comunidades e o mundo sagrado.', 'Quem eram os druidas?', NULL, 'Guerreiros comuns', 'Sacerdotes sábios e conselheiros', 'Artistas itinerantes', 'Caçadores', 'Sacerdotes sábios e conselheiros', 9),
('Túatha Dé Danann são povos divinos da mitologia celta, associados a habilidades sobrenaturais e reinados míticos.', 'O que eram os Túatha Dé Danann?', NULL, 'Humanos históricos', 'Povos divinos com poderes', 'Fadas maléficas exclusivamente', 'Criaturas marinhas', 'Povos divinos com poderes', 9),
('A árvore sagrada nas tradições celtas simbolizava ligação entre os mundos e era objeto de culto comunitário.', 'O que a árvore simbolizava para os celtas?', NULL, 'Morte', 'Vida e ligação entre mundos', 'Doença', 'Guerra', 'Vida e ligação entre mundos', 9),
('O conceito do Outro Mundo na mitologia celta descreve um reino paralelo repleto de maravilhas e perigos.', 'Como é descrito o Outro Mundo?', NULL, 'Deserto espiritual', 'Reino espiritual paralelo', 'Uma montanha real', 'Um lago físico', 'Reino espiritual paralelo', 9),

-- MITOLOGIA MESOPOTÂMICA (10)
('Anu era divindade celeste que presidia o panteão e personificava a autoridade do céu.', 'Anu representava principalmente:', NULL, 'Terra', 'Céu e autoridade suprema', 'Mar', 'Colheita', 'Céu e autoridade suprema', 10),
('Enlil detinha poder sobre ventos e tempestades e era central no equilíbrio entre cidades-estado e deuses.', 'Enlil governava:', NULL, 'Fogo', 'Vento e tempestades', 'Lua', 'Mares', 'Vento e tempestades', 10),
('Enki era senhor das águas doces e da sabedoria, responsável por técnicas úteis à humanidade segundo mitos.', 'Enki é associado a:', NULL, 'Guerra', 'Água e sabedoria', 'Tempestades', 'Céu', 'Água e sabedoria', 10),
('Ishtar era deusa do amor e da guerra, manifestando-se em múltiplas dimensões sociais e políticas.', 'Ishtar simbolizava:', NULL, 'Silêncio', 'Amor e guerra', 'Agricultura', 'Justiça', 'Amor e guerra', 10),
('Marduk ascendeu como campeão de Babilônia e consolidou status de divindade suprema nas narrativas de criação.', 'Marduk era reconhecido como:', NULL, 'Deus menor', 'Deus supremo de Babilônia', 'Ser humano', 'Espírito do vento', 'Deus supremo de Babilônia', 10),
('Tiamat, como dragão primordial, encarna caos gerador e inimigo que é submetido na ordenação do cosmos.', 'Tiamat representa:', NULL, 'Ordem civil', 'Caos primordial', 'Saúde pública', 'Justiça', 'Caos primordial', 10),
('Nergal é figura vinculada à morte e à guerra, com funções tanto devastadoras quanto rituais.', 'Nergal é sobretudo:', NULL, 'Deus da chuva', 'Deus da morte e guerra', 'Senhor da música', 'Deus da colheita', 'Deus da morte e guerra', 10),
('Utu/Šamaš era divindade solar que também presidia justiça, influenciando códigos legais antigos.', 'Šamaš governava:', NULL, 'Sono e sonhos', 'Justiça e sol', 'Mares', 'Festas', 'Justiça e sol', 10),
('Nanna era deus lunar cuja observação orientava calendários e cultos agrícolas.', 'Nanna corresponde à esfera da:', NULL, 'Montanhas', 'Lua e calendário', 'Guerras', 'Rios', 'Lua e calendário', 10),
('Os mesopotâmicos entendiam deuses como controladores das forças naturais e sociais, exigindo ritos e ofertas.', 'Como viam os deuses os mesopotâmicos?', NULL, 'Figuras simbólicas sem ação', 'Controladores da natureza e da sociedade', 'Pura ficção', 'Heróis só humanos', 'Controladores da natureza e da sociedade', 10),

-- MITOLOGIA AFRICANA (11)
('Olorum, em algumas tradições iorubás, é concebido como princípio criador supremo, anterior a manifestações locais.', 'Olorum é visto como:', NULL, 'Deus menor', 'Criador supremo', 'Deus das tempestades', 'Senhor das montanhas', 'Criador supremo', 11),
('Exu é mensageiro e intermediário entre humanos e orixás, responsável por encruzilhadas e comunicação ritual.', 'Qual papel exerce Exu?', NULL, 'Criador do mundo', 'Mensageiro e intermediário', 'Deus do mar', 'Guardião das florestas', 'Mensageiro e intermediário', 11),
('Oxum é deusa dos rios, do amor e da doçura, associada a nascimentos e prosperidade doméstica.', 'Oxum governa principalmente:', NULL, 'Guerras', 'Rios e amor', 'Montanhas', 'Fogo', 'Rios e amor', 11),
('Iansã é poderosa senhora dos ventos e tempestades, ligada também à coragem e transformação.', 'Iansã está associada a:', NULL, 'Calmaria', 'Vento e tempestades', 'Colheitas', 'Sonhos', 'Vento e tempestades', 11),
('Xangô é reconhecido como árbitro da justiça e senhor do raio e trovão nas tradições afro-brasileiras e iorubás.', 'Xangô é senhor de:', NULL, 'Águas calmas', 'Justiça e trovões', 'Agricultura', 'Festas', 'Justiça e trovões', 11),
('Ogum é orixá do ferro, da tecnologia ancestral e da guerra, patrono de ferreiros e estradas.', 'Ogum representa:', NULL, 'Artes e música', 'Ferro e guerra', 'Lua', 'Água', 'Ferro e guerra', 11),
('Oxóssi é caçador divino, senhor das florestas e protetor dos que dependem da caça e do conhecimento da mata.', 'Oxóssi governa:', NULL, 'Montanhas nevadas', 'Caça e floresta', 'Mares', 'Tempestades', 'Caça e floresta', 11),
('Nanã é associada à sabedoria ancestral, às águas estagnadas e aos ciclos de vida e morte.', 'Nanã simboliza:', NULL, 'Velocidade', 'Sabedoria ancestral', 'Fortuna', 'Destruição', 'Sabedoria ancestral', 11),
('Omulu/Obaluaiê é ligado à cura, às doenças e aos ritos de saúde pública, sendo figura ambivalente entre cura e praga.', 'Omulu é divindade de:', NULL, 'Música', 'Cura e doenças', 'Marinheiros', 'Colheitas', 'Cura e doenças', 11),
('Os orixás representam forças da natureza e aspectos da vida humana, mediando relações sociais e rituais.', 'O que representam os orixás?', NULL, 'Forças políticas', 'Forças da natureza e aspectos humanos', 'Riqueza material apenas', 'Instrumentos musicais', 'Forças da natureza e aspectos humanos', 11),

-- MITOLOGIA INDÍGENA (12)
('Tupã é frequentemente identificado entre povos do Brasil como divindade do trovão e do relâmpago, agente criador em algumas narrativas.', 'Tupã representa:', NULL, 'Somente a chuva', 'Trovão e fenômenos celestes', 'Colheitas', 'Rios', 'Trovão e fenômenos celestes', 12),
('Jaci é deusa da lua em muitas tradições indígenas brasileiras, ligada a calendários e ritos femininos.', 'Jaci é principalmente a deusa da:', NULL, 'Terra', 'Lua', 'Sol', 'Vento', 'Lua', 12),
('Guaraci é figura solar cujo ciclo e movimento orientam calendários e atividades agrícolas de diversas etnias.', 'Guaraci governa:', NULL, 'Lua', 'Sol', 'Mares', 'Fogo', 'Sol', 12),
('Curupira, protetor das florestas, usa pés virados para trás para confundir caçadores e preservar ecossistemas.', 'Que característica física distingue o Curupira?', NULL, 'Olhos vermelhos', 'Pés virados para trás', 'Asas', 'Cauda de peixe', 'Pés virados para trás', 12),
('Boitatá é serpente de fogo que protege plantações e afugenta queimadas e incêndios criminosos segundo algumas lendas.', 'O que é o Boitatá?', NULL, 'Uma sereia', 'Uma cobra de fogo protetora', 'Um pássaro', 'Um ancestral', 'Uma cobra de fogo protetora', 12),
('Saci-Pererê é personagem travesso que prega peças, simbolizando ambivalência entre malícia e aprendizagem cultural.', 'Qual traço define o Saci-Pererê?', NULL, 'Ser gigante', 'Trapaças e travessuras', 'Ser imortal', 'Ter asas', 'Trapaças e travessuras', 12),
('Iara é figura das águas, muitas vezes retratada como sereia que encanta e atrai navegantes para o rio.', 'Onde vive a Iara?', NULL, 'Montanhas', 'Rios', 'Céu', 'Florestas secas', 'Rios', 12),
('Mapinguari é ser amazônico que protege a floresta e pode ser entendido como manifestação do cuidado ecológico ancestral.', 'Qual é a função do Mapinguari nas lendas?', NULL, 'Caçar crianças', 'Guardar e proteger a floresta', 'Trazer chuva', 'Criar incêndios', 'Guardar e proteger a floresta', 12),
('Anhangá é espírito protetor da fauna que pune caçadores cruéis e mantém o equilíbrio entre humanos e animais.', 'Anhangá é conhecido por:', NULL, 'Predizer colheitas', 'Proteger os animais', 'Trazer doenças', 'Ensinar agricultura', 'Proteger os animais', 12),
('Os povos indígenas frequentemente concebem a natureza como sagrada, em que plantas, rios e animais têm valor espiritual.', 'Como os povos indígenas veem a natureza?', NULL, 'Como recurso apenas econômico', 'Como ser sagrado e inter-relacionado', 'Como inimiga do humano', 'Como fonte de metal', 'Como ser sagrado e inter-relacionado', 12);


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
SELECT * FROM TipoMitologia;
SELECT * FROM Questoes;
SELECT * FROM Rodada;
