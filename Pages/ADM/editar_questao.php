<?php
session_start();
if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
$conn->set_charset("utf8mb4");

$id = intval($_GET["id"]);
$result = $conn->query("SELECT * FROM Questoes WHERE idQuestoes = $id");

$q = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Editar Questão</title>
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
        <a href="listar_usuario.php">Cadastrar Usuários</a>
        <span>|</span>
        <a href="../logout.php">Sair</a>
    </nav>
</header>

<h2>Editar Questão</h2>

<form action="salvar_edicao_questao.php" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="idQuestoes" value="<?= $q['idQuestoes'] ?>">

    <label>Enunciado:</label>
    <textarea name="enunciado" required><?= $q["enunciado"] ?></textarea>

    <label>Pergunta:</label>
    <textarea name="pergunta" required><?= $q["pergunta"] ?></textarea>

    <label>Alternativa A:</label>
    <input type="text" name="alternativaA" value="<?= $q['alternativaA'] ?>">

    <label>Alternativa B:</label>
    <input type="text" name="alternativaB" value="<?= $q['alternativaB'] ?>">

    <label>Alternativa C:</label>
    <input type="text" name="alternativaC" value="<?= $q['alternativaC'] ?>">

    <label>Alternativa D:</label>
    <input type="text" name="alternativaD" value="<?= $q['alternativaD'] ?>">

    <label>Alternativa Correta:</label>
    <select name="correta">
        <option <?= $q["correta"] == $q["alternativaA"] ? "selected" : "" ?> value="A">A</option>
        <option <?= $q["correta"] == $q["alternativaB"] ? "selected" : "" ?> value="B">B</option>
        <option <?= $q["correta"] == $q["alternativaC"] ? "selected" : "" ?> value="C">C</option>
        <option <?= $q["correta"] == $q["alternativaD"] ? "selected" : "" ?> value="D">D</option>
    </select>

    <label>Nova imagem (opcional):</label>
    <input type="file" name="imagem">

    <button type="submit">Salvar Alterações</button>
</form>

</body>
</html>
