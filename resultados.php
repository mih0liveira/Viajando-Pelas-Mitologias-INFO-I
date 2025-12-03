<?php
include "conexao.php";

// Recebe os acertos e total via GET
$acertos = isset($_GET['acertos']) ? (int)$_GET['acertos'] : 0;
$total   = isset($_GET['total'])   ? (int)$_GET['total']   : 0;
$erros   = $total - $acertos;

// Mensagem final baseada na performance
if ($acertos == $total) {
    $mensagem = "Parabéns! Você acertou todas!";
} elseif ($acertos >= $total / 2) {
    $mensagem = "Muito bem! Você acertou metade ou mais da metade.";
} else {
    $mensagem = "Que pena! Tente novamente para melhorar.";
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Resultado do Quiz</title>
<link rel="stylesheet" href="quiz.css">
<style>
.result-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 120px;
}

.result-card {
    background-color: white;
    padding: 50px;
    border-radius: 20px;
    max-width: 600px;
    width: 100%;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    transition: transform 0.3s;
}

.result-card:hover {
    transform: scale(1.03);
}

.result-card h1 {
    font-size: 36px;
    margin-bottom: 20px;
}

.result-card p {
    font-size: 22px;
    margin: 15px 0;
}

.resultados {
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0;
}

.result-card button {
    background-color: #002c77;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 25px;
    font-size: 18px;
    cursor: pointer;
    margin: 10px;
    transition: 0.3s;
}

.result-card button:hover {
    background-color: #0044aa;
    transform: scale(1.1);
}
</style>
</head>
<body>

<!-- Barra de navegação -->
<nav class="navbar">
    <div class="logo">
        <a href="index.php"><img src="logo.png" alt="Logo"></a>
    </div>
    <div class="menu">
        <a href="index.html">HOME</a>
        <span>|</span>
        <a href="#">MITOLOGIAS</a>
        <span>|</span>
        <a href="escolher_mitologia.php">TESTAR CONHECIMENTO</a>
        <span>|</span>
        <a href="sobre.html">SOBRE</a>
    </div>
</nav>

<!-- Conteúdo do resultado -->
<div class="result-container">
    <div class="result-card">
        <h1>Resultado do Quiz</h1>
        <p><?php echo $mensagem; ?></p>

        <div class="resultados">
            Acertos: <?php echo $acertos; ?><br>
            Erros:   <?php echo $erros; ?><br>
            Total de perguntas: <?php echo $total; ?>
        </div>

        <a href="index.html"><button>Ir para página inicial</button></a>
        <a href="escolher_mitologia.php"><button>Tentar novamente</button></a>
    </div>
</div>

</body>
</html>
