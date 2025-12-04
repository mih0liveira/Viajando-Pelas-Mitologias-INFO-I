<?php
session_start();

if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

$id = intval($_GET["id"]);
$result = $conn->query("SELECT * FROM Usuario WHERE idUsuario = $id");

$usuario = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuário</title>
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
<h2>Editar Usuário</h2>

<form action="salvar_edicao_usuario.php" method="POST">
    <input type="hidden" name="idUsuario" value="<?= $usuario["idUsuario"] ?>">

    <label>Nome:</label>
    <input type="text" name="nome" value="<?= $usuario["nome"] ?>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<?= $usuario["email"] ?>" required>

    <label>Tipo:</label>
    <select name="idTipoUsuario">
        <option value="1" <?= $usuario["idTipoUsuario"] == 1 ? "selected" : "" ?>>Administrador</option>
        <option value="2" <?= $usuario["idTipoUsuario"] == 2 ? "selected" : "" ?>>Usuário</option>
    </select>

    <button type="submit">Salvar Alterações</button>
</form>
</div>

</body>
</html>
