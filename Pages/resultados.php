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
<link rel="stylesheet" href="../CSS/quiz.css">
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
    .result-container {
        max-width: 90%;
        padding: 40px 30px;
        font-size: 19px;
        line-height: 1.8;
    }
}

/* Ajuste do container para telas pequenas */
@media (max-width: 600px) {
    .result-container {
        max-width: 95%;
        width: 100%;
        padding: 30px 20px;
        font-size: 18px;
        line-height: 1.7;
    }
}

/* Ajuste do container para telas muito pequenas */
@media (max-width: 400px) {
    .result-container {
        max-width: 98%;
        padding: 25px 15px;
        font-size: 16px;
        line-height: 1.6;
    }
}





        


    
</style>
</head>
<body>

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
        <a href="escolher_quiz.html"><button>Tentar novamente</button></a>
    </div>
</div>
<footer>
        <p>&copy; Viajando pelas Mitologias</p>
    </footer>
</body>
</html>
