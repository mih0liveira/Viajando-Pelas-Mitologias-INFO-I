<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Testar Conhecimento</title>
<link rel="stylesheet" href="quiz.css"> <!-- usa o CSS padrão que você mandou -->
<style>
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
    <nav class="navbar">
        <div class="logo">
            <a href="index.php"><img src="logo.png" alt="Logo"></a>
        </div>
        <div class="menu">
            <a href="index.html">HOME</a>
            <span>|</span>
            <a href="#">MITOLOGIAS</a>
            <span>|</span>
            <a href="testar_conhecimento.php">TESTAR CONHECIMENTO</a>
            <span>|</span>
            <a href="sobre.html">SOBRE</a>
        </div>
    </nav>

    <div class="container">
        <h1>Escolha como deseja testar seu conhecimento</h1>
        <div class="opcoes">
            <div class="opcao">
                <h2>Quiz</h2>
                <p>Responda perguntas e descubra seu nível de conhecimento!</p>
                <button onclick="window.location.href='escolher_mitologia.php'">Escolher Mitologia</button>
            </div>
            <div class="opcao">
                <h2>Flashcards</h2>
                <p>Revise conceitos e aprenda de forma divertida!</p>
                <button onclick="window.location.href='escolher_mitologia.php'">Escolher Mitologia</button>
            </div>
        </div>
    </div>
</body>
</html>
