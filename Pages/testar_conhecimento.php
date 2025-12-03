<?php
session_start();

// Só entra se estiver logado
if (!isset($_SESSION["idUsuario"])) {
    header("Location: ../Pages/login.php");
    exit;
}

// Verifica se é admin
$isAdmin = ($_SESSION["idTipoUsuario"] == 1);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Testar Conhecimento</title>
<link rel="stylesheet" href="quiz.css"> <!-- usa o CSS padrão que você mandou -->
<style>
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
    justify-content: flex-start;
    padding: 10px 40px;
    position: relative;
    height: 120px;
}

.menu {
    position: absolute;
    left: 50%;
    transform: translateX(-50%); /* truque para centralizar */
    display: flex;
    gap: 100px;
}

.logo img {
    height: 100px;
    margin: -15px;
    margin-left: 10px;
    transition: transform 0.3s;
}
.opcoes {
    display: flex;
    justify-content: center;
    gap: 50px;
    flex-wrap: wrap;
    margin-top: 100px;
}

.opcao {
    background-color: white;
    border-radius: 20px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    padding: 40px;
    text-align: center;
    transition: 0.3s;
    width: 250px;
}
.opcao:hover {
    transform: scale(1.05);
}
.opcao h2 {
    font-size: 24px;
    color: #001f54;
    margin-bottom: 15px;
}
.opcao button {
    background-color: #002c77;
    color: white;
    border: none;
    padding: 10px 25px;
    border-radius: 20px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}
.opcao button:hover {
    background-color: #0044aa;
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
            <a href="testar_conhecimento.php">Testar Conhecimento</a>
            <span>|</span>
            <a href="sobre.html">Sobre</a>
        </nav>
    </header>

    <div class="container">
        <h1>Escolha como deseja testar seu conhecimento</h1>
        <div class="opcoes">
            <div class="opcao">
                <h2>Quiz</h2>
                <p>Responda perguntas e descubra seu nível de conhecimento!</p>
                <button onclick="window.location.href='escolher_quiz.html'">Escolher Mitologia</button>
            </div>
            <div class="opcao">
                <h2>Flashcards</h2>
                <p>Revise conceitos e aprenda de forma divertida!</p>
                <button onclick="window.location.href='escolher_flashcard.html'">Escolher Mitologia</button>
            </div>
        </div>
    </div>
</body>
</html>
