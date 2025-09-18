<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "viajandopelasmitologias";

// Conexão
$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Recebe os acertos e total via GET
$acertos = isset($_GET['acertos']) ? (int)$_GET['acertos'] : 0;
$total = isset($_GET['total']) ? (int)$_GET['total'] : 0;
$erros = $total - $acertos;

// Mensagem final baseada na performance
if($acertos == $total){
    $mensagem = "Parabéns! Você acertou todas!";
} elseif($acertos >= $total/2){
    $mensagem = "Muito bem! Você acertou mais da metade.";
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
@import url('https://fonts.googleapis.com/css2?family=Cinzel+Decorative:wght@400;700;900&display=swap');

body {
    font-family: "Cinzel Decorative", serif;
    background: linear-gradient(to right, #f8f1df, #ffe8c5);
    color: #001f54;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.card {
    background-color: white;
    padding: 50px;
    border-radius: 20px;
    max-width: 600px;
    width: 100%;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    transition: transform 0.3s;
}

.card:hover {
    transform: scale(1.03);
}

h1 {
    font-size: 36px;
    margin-bottom: 20px;
}

p {
    font-size: 22px;
    margin: 15px 0;
}

.resultados {
    font-size: 24px;
    font-weight: bold;
    margin: 20px 0;
}

button {
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

button:hover {
    background-color: #0044aa;
    transform: scale(1.1);
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">
                <img src="foto_nordica.png" alt="Logo" width="50">
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">MITOLOGIAS</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">TESTAR CONHECIMENTO</a></li>
                    <li class="nav-item"><a class="nav-link" href="quiz.php">SOBRE</a></li>
                </ul>
            </div>
        </div>
    </nav>
<div class="card">
    <h1>Resultado do Quiz</h1>
    <p><?php echo $mensagem; ?></p>
    <div class="resultados">
        Acertos: <?php echo $acertos; ?> <br>
        Erros: <?php echo $erros; ?> <br>
        Total de perguntas: <?php echo $total; ?>
    </div>
    <a href="index.php"><button>Ir para página inicial</button></a>
    <a href="quiz.php"><button>Tentar novamente</button></a>
</div>

</body>
</html>
