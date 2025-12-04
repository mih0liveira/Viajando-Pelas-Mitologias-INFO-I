<?php
session_start();

// Só entra se estiver logado
if (!isset($_SESSION["idUsuario"])) {
    header("Location: ../Pages/login.php");
    exit;
}

// Verifica se é admin
$isAdmin = ($_SESSION["idTipoUsuario"] == 1);
if (!$isAdmin) {
    die("Acesso negado! Esta página é somente para administradores.");
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../CSS/salvar_questoes.css">
    <title>Cadastrar Questão</title>

    <script>
        function validar() {
            const pergunta = document.getElementById("pergunta").value;
            const enunciado = document.getElementById("enunciado").value;

            if (enunciado.trim() === "" || pergunta.trim() === "") {
                alert("Preencha o enunciado e a pergunta!");
                return false;
            }
            return true;
        }
    </script>
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
    <h2>Cadastrar Nova Questão</h2>

    <form action="salvar_questoes.php" method="POST" enctype="multipart/form-data" onsubmit="return validar();">

        <label>Enunciado:</label>
        <textarea name="enunciado" id="enunciado" rows="4" required></textarea>

        <label>Pergunta:</label>
        <input type="text" name="pergunta" id="pergunta" required>

        <label>Imagem (opcional):</label>
        <input type="file" name="imagem" accept="image/*">

        <label>Alternativa A:</label>
        <input type="text" name="alternativaA" required>

        <label>Alternativa B:</label>
        <input type="text" name="alternativaB" required>

        <label>Alternativa C:</label>
        <input type="text" name="alternativaC" required>

        <label>Alternativa D:</label>
        <input type="text" name="alternativaD" required>

        <label>Alternativa Correta:</label>
        <select name="correta" required>
            <option value="">Selecione...</option>
            <option value="A">Alternativa A</option>
            <option value="B">Alternativa B</option>
            <option value="C">Alternativa C</option>
            <option value="D">Alternativa D</option>
        </select>

        <label>Tipo de Mitologia:</label>
        <select name="idTipoMitologia" required>
            <option value="">Selecione...</option>
            <option value="1">Grega</option>
            <option value="2">Nórdica</option>
            <option value="3">Egípcia</option>
            <option value="4">Chinesa</option>
            <option value="5">Japonesa</option>
            <option value="6">Hindu</option>
            <option value="7">Maia</option>
            <option value="8">Asteca</option>
            <option value="9">Celta</option>
            <option value="10">Mesopotâmica</option>
            <option value="11">Africana</option>
            <option value="12">Indígena</option>
        </select>

        <button type="submit">Cadastrar Questão</button>

    </form>
</div>

</body>
</html>
