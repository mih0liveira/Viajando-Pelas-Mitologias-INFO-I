<?php
session_start();
if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
$conn->set_charset("utf8mb4");

$result = $conn->query("SELECT * FROM Questoes ORDER BY idQuestoes ASC");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Questões</title>
    <link rel="icon" type="image/png" href="../../Img/favicon.ico">
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
<h2>Lista de Questões</h2>

<button onclick="window.location.href='cadastro_questoes.php'" class="btn btn-primary">
    Cadastrar Nova Questão
</button>

<br><br>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Pergunta</th>
        <th>Correta</th>
        <th>Mitologia</th>
        <th>Ações</th>
    </tr>

    <?php while ($row = $result->fetch_assoc()): ?>
    <tr>
        <td><?= $row["idQuestoes"] ?></td>
        <td><?= $row["pergunta"] ?></td>
        <td><?= $row["correta"] ?></td>
        <td><?= $row["idTipoMitologia"] ?></td>

        <td>
            <a href="editar_questao.php?id=<?= $row['idQuestoes'] ?>">Editar</a> |
            <a href="excluir_questao.php?id=<?= $row['idQuestoes'] ?>" onclick="return confirm('Deseja excluir esta questão?');">Excluir</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
</div>
</body>
</html>
