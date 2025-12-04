<?php
session_start();

if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
$conn->set_charset("utf8mb4");

$result = $conn->query("SELECT * FROM Usuario ORDER BY idUsuario ASC");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Usuários Cadastrados</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
<h2>Lista de Usuários</h2>
<button onclick="window.location.href='cadastro_usuario.php'" class="btn btn-primary">
    Cadastrar Novo Usuário
</button>

<br><br>

<table class="table" border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Tipo</th>
        <th>Ações</th>
    </tr>

    <?php while ($row = $result->fetch_assoc()): ?>
    <tr>
        <td><?= $row["idUsuario"] ?></td>
        <td><?= $row["nome"] ?></td>
        <td><?= $row["email"] ?></td>
        <td><?= $row["idTipoUsuario"] == 1 ? "Admin" : "Usuário" ?></td>
        <td>
            <a href="editar_usuario.php?id=<?= $row['idUsuario'] ?>">Editar</a> |
            <a href="excluir_usuario.php?id=<?= $row['idUsuario'] ?>" onclick="return confirm('Tem certeza que deseja excluir?');">Excluir</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
</div>

</body>
</html>
