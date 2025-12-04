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
<title>Index do Administrador</title>
<link rel="icon" type="image/png" href="../../Img/favicon.ico">
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
    align-items: center;
    justify-content: center;
    text-align: center;
}



/* ================= NAVBAR ================= */

.navbar {
    background-color: #001f54;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px 40px;
    position: relative;
    height: 120px;
}

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




.opcoes {
    display: flex;
    justify-content: center;
    gap: 50px;
    flex-wrap: wrap;
    margin-top: 100px;
}

.opcao {
    display: flex;
    flex-direction: column;  /* os itens ficam em coluna */
    justify-content: space-between; /* empurra o botão para baixo */
    height: 200px;
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
    margin-top: auto;
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
        <img src="../../Img/Logo.png" alt="Logo do site">
    </div>

    <nav class="menu">
        <a href="indexAdmin.php">Home</a>
        <span>|</span>
        <a href="cadastro_questoes.php">Cadastrar Questões</a>
        <span>|</span>
        <a href="cadastro_usuario.php">Cadastrar Usuários</a>
        <span>|</span>
        <a href="../logout.php">Sair</a>
    </nav>
</header>


    <div class="container">
        <br>
        <h1>Olá ADM! O que deseja fazer?</h1>
        <div class="opcoes">
            <div class="opcao">
                <h2>Cadastrar Questões</h2>
                <button onclick="window.location.href='cadastro_questoes.php'">Vamos lá!</button>
            </div>
            <div class="opcao">
                <h2>Cadastrar Usuário</h2>
                <button onclick="window.location.href='cadastro_usuario.php'">Vamos lá!</button>
            </div>
            <div class="opcao">
                <h2>Visualizar Questões</h2>
                <button onclick="window.location.href='listar_questoes.php'">Vamos lá!</button>
            </div>
            <div class="opcao">
                <h2>Visualizar Usuários</h2>
                <button onclick="window.location.href='listar_usuarios.php'">Vamos lá!</button>
            </div>
        </div>
    </div>
</body>
</html>
