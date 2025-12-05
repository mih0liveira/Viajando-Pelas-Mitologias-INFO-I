<?php
session_start();
include "conexao.php";

// Verifica se o ID da mitologia foi informado
if (!isset($_GET['id_mitologia'])) {
    die("ID da mitologia não informado!");
}

$id_mitologia = intval($_GET['id_mitologia']);

// --- BUSCAR TODAS AS QUESTÕES DO BANCO ---
$sql = "SELECT * FROM Questoes WHERE idTipoMitologia = $id_mitologia";
$result = $conn->query($sql);

$questoes = [];
while ($row = $result->fetch_assoc()) {
    $questoes[] = $row;
}

$total = count($questoes);

if ($total == 0) {
    die("Não há perguntas para esta mitologia.");
}

// ------------------------------------------------------
// CONTROLE DO ÍNDICE DA PERGUNTA ATUAL
// ------------------------------------------------------
$index = isset($_GET['index']) ? intval($_GET['index']) : 0;

// Reinicia acertos ao iniciar o quiz
if (!isset($_SESSION['acertos']) || $index == 0) {
    $_SESSION['acertos'] = 0;
}

// Se terminou o quiz
if ($index >= $total) {
    $acertos = $_SESSION['acertos'];
    session_destroy();

    header("Location: resultados.php?acertos=$acertos&total=$total");
    exit;
}

$pergunta = $questoes[$index];

// ------------------------------------------------------
// QUANDO O USUÁRIO RESPONDE
// ------------------------------------------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['resposta'])) {
        $resposta_letra = $_POST['resposta']; // 'A'|'B'|'C'|'D'

        // Mapeia letra para texto da alternativa selecionada
        $textoSelecionado = '';
        if ($resposta_letra === 'A') $textoSelecionado = $pergunta['alternativaA'];
        if ($resposta_letra === 'B') $textoSelecionado = $pergunta['alternativaB'];
        if ($resposta_letra === 'C') $textoSelecionado = $pergunta['alternativaC'];
        if ($resposta_letra === 'D') $textoSelecionado = $pergunta['alternativaD'];

        // Valor armazenado em 'correta' no banco (pode ser texto ou letra)
        $correta_raw = $pergunta['correta'];

        // Normaliza para comparar: trim e lowercase (UTF-8)
        $sel_norm = mb_strtolower(trim((string)$textoSelecionado), 'UTF-8');
        $cor_norm = mb_strtolower(trim((string)$correta_raw), 'UTF-8');

        $acertou = false;

        // Caso 1: 'correta' armazena a letra (A/B/C/D) --> compara letras
        $cor_letra = strtoupper(trim((string)$correta_raw));
        if (in_array($cor_letra, ['A','B','C','D'])) {
            if ($resposta_letra === $cor_letra) {
                $acertou = true;
            }
        } else {
            // Caso 2: 'correta' armazena o texto da alternativa -> compara textos normalizados
            if ($sel_norm !== '' && $sel_norm === $cor_norm) {
                $acertou = true;
            }
        }

        if ($acertou) {
            $_SESSION['acertos']++;
        }
    }

    $next = $index + 1;
    header("Location: quiz.php?id_mitologia=$id_mitologia&index=$next");
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Quiz — Mitologia</title>

<!-- SEU CSS PRINCIPAL -->
<link rel="stylesheet" href="../CSS/quiz.css">

<style>
/* ESTILO DO CARTÃO DO QUIZ — IGUAL AO DO RESULTADOS */

.quiz-container {
    display: flex;
    justify-content: center;
    margin-top: 130px;
}

.quiz-card {
    background: white;
    width: 900px;
    padding: 40px;
    border-radius: 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
}

.quiz-card h2 {
    font-size: 32px;
    margin-bottom: 25px;
}

.enunciado {
    background: #f4f4f4;
    padding: 25px;
    border-radius: 15px;
    font-size: 20px;
    margin-bottom: 25px;
    line-height: 27px;
    white-space: pre-wrap;
}

.alternativas label {
    display: block;
    padding: 15px;
    background: #eaeaea;
    border-radius: 15px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 18px;
    transition: 0.3s;
}

.alternativas label:hover {
    background: #d8d8d8;
}

button {
    background-color: #002c77;
    color: white;
    border: none;
    padding: 14px 30px;
    border-radius: 25px;
    font-size: 20px;
    cursor: pointer;
    margin-top: 20px;
    transition: 0.3s;
}

button:hover {
    background-color: #0044aa;
    transform: scale(1.08);
}
@import url('https://fonts.googleapis.com/css2?family=Cinzel+Decorative:wght@400;700;900&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Cinzel Decorative", serif;
    background-color: #f8f1df;
    color: #001f54;
}

.navbar {
    background-color: #001f54;
    display: flex;
    align-items: center;
    justify-content: center;  /* centraliza o menu */
    padding: 10px 40px;
    position: relative;
    height: 120px;
}

/* Logo fixa à esquerda */
.logo {
    position: absolute;
    left: 40px;
    top: 50%;
    transform: translateY(-50%);
}

.logo img {
    height: 110px;
    transition: transform 0.3s;
}

.logo img:hover {
    transform: scale(1.05);
}

/* MENU CENTRALIZADO */
.menu {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 50px;
    align-items: center;
}

.menu a {
    color: white;
    text-decoration: none;
    font-size: 30px;
    white-space: nowrap;
}

.menu span {
    color: white;
    font-size: 32px;
}
footer {
            background-color: #001f54;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }

/* Telas grandes (ajuste suave) */
@media (max-width: 1400px) {
    .menu {
        gap: 30px;
    }
    .menu a {
        font-size: 26px;
    }
}

/* Telas médias */
@media (max-width: 1024px) {

    .navbar {
        padding: 10px 20px;
        height: auto;
        flex-direction: column;
    }

    .logo {
        position: static;
        transform: none;
        margin-bottom: 10px;
    }

    .logo img {
        height: 90px;
    }

    .menu {
        position: static;
        transform: none;
        gap: 25px;
        flex-wrap: wrap;
        justify-content: center;
    }

    .menu a {
        font-size: 22px;
    }

    .menu span {
        display: none; /* tira os separadores para não poluir */
    }
}

/* Telas pequenas (celulares) */
@media (max-width: 600px) {

    .navbar {
        padding: 15px;
    }

    .logo img {
        height: 70px;
    }

    .menu {
        gap: 15px;
    }

    .menu a {
        font-size: 18px;
    }

    .container {
        padding: 30px 20px;
        font-size: 18px;
    }

    h1 {
        font-size: 26px;
    }

    h2 {
        font-size: 20px;
    }
}

/* Telas bem pequenas (celulares antigos / mini telas) */
@media (max-width: 400px) {

    .menu a {
        font-size: 16px;
    }

    .logo img {
        height: 60px;
    }
}
/* Ajuste do container para telas médias */
@media (max-width: 1024px) {
    .quiz-container {
        max-width: 90%;
        padding: 40px 30px;
        font-size: 19px;
        line-height: 1.8;
    }
}

/* Ajuste do container para telas pequenas */
@media (max-width: 600px) {
    .quiz-container {
        max-width: 95%;
        width: 100%;
        padding: 30px 20px;
        font-size: 18px;
        line-height: 1.7;
    }
}

/* Ajuste do container para telas muito pequenas */
@media (max-width: 400px) {
    .quiz-container {
        max-width: 98%;
        padding: 25px 15px;
        font-size: 16px;
        line-height: 1.6;
    }
}





        


    

</style>
</head>

<body>

<!-- NAVBAR -->
  <header class="navbar">
        <div class="logo">
            <img src="../Img/Logo.png" alt="Logo do site">
        </div>

        <nav class="menu">
            <a href="../Pages/index.html">Home</a>
            <span>|</span>
            <a href="../Pages/mitologia.html">Mitologias</a>
            <span>|</span>
            <a href="../Pages/testar_conhecimento.php">Testar Conhecimento</a>
            <span>|</span>
            <a href="../Pages/sobre.html">Sobre</a>
        </nav>
    </header>


<div class="quiz-container">
    <div class="quiz-card">

        <h2>Quiz — Mitologia</h2>

        <!-- EXIBE A PERGUNTA ATUAL -->
        <div class="enunciado">
            <strong><?php echo ($index + 1) . ". " . htmlspecialchars($pergunta['enunciado']); ?></strong>
        </div>

        <?php if (!empty($pergunta['imagem'])): ?>
            <img src="<?php echo htmlspecialchars($pergunta['imagem']); ?>" width="300" style="display:block;margin-bottom:20px;">
        <?php endif; ?>

        <!-- FORM DE RESPOSTA -->
        <form method="POST" novalidate>

            <div class="alternativas">

                <label>
                    <input type="radio" name="resposta" value="A" required>
                    <?php echo htmlspecialchars($pergunta['alternativaA']); ?>
                </label>

                <label>
                    <input type="radio" name="resposta" value="B" required>
                    <?php echo htmlspecialchars($pergunta['alternativaB']); ?>
                </label>

                <label>
                    <input type="radio" name="resposta" value="C" required>
                    <?php echo htmlspecialchars($pergunta['alternativaC']); ?>
                </label>

                <label>
                    <input type="radio" name="resposta" value="D" required>
                    <?php echo htmlspecialchars($pergunta['alternativaD']); ?>
                </label>

            </div>

            <button type="submit">
                <?= ($index == $total - 1) ? "Finalizar" : "Enviar" ?>
            </button>

        </form>

    </div>
</div>
<footer>
        <p>&copy; Viajando pelas Mitologias</p>
    </footer>
</body>
</html>
