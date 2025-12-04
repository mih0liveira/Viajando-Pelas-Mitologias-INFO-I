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
    <link rel="icon" type="image/png" href="../Img/favicon.ico">
    <title>Cadastrar Questão</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            padding: 20px;
        }

        .container {
            width: 60%;
            background: #fff;
            padding: 25px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #aaa;
            border-radius: 6px;
        }

        input[type="file"] {
            padding: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0066cc;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #0052a3;
        }

        .success {
            padding: 10px;
            background: #c0ffc4;
            border: 1px solid #2e8b57;
            color: #1a5f3a;
            margin-bottom: 20px;
        }

        .error {
            padding: 10px;
            background: #ffb6b6;
            border: 1px solid #cc0000;
            color: #7a0000;
            margin-bottom: 20px;
        }
    </style>

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
