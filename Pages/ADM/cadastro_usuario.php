<?php
session_start();

// Verificar se está logado
if (!isset($_SESSION["idUsuario"])) {
    header("Location: login.php");
    exit;
}

// Verificar se é admin
if ($_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado! Apenas administradores podem cadastrar usuários.");
}


?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Usuário</title>
    <link rel="icon" type="image/png" href="../../Img/favicon.ico">
    <link rel="stylesheet" href="../../CSS/salvar_questoes.css">
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

<br>


<div class="container">
<form action="salvar_usuario.php" method="POST">

    <h2>Cadastrar Novo Usuário</h2>


    <label>Nome:</label>
    <input type="text" name="nome" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Senha:</label>
    <input type="password" name="senha" required>

    <label>Tipo de Usuário:</label>
    <select name="idTipoUsuario" required>
        <option value="1">Administrador</option>
        <option value="2">Usuário Comum</option>
    </select>

    <button type="submit">Cadastrar</button>
</form>
</div>

</body>
</html>
