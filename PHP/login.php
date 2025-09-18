
<!-- CREATE DATABASE sistema_login;

USE viajandopelasmitologias;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Criar um usuário exemplo (senha: 123456)
INSERT INTO usuarios (nome, email, senha) 
VALUES ('Admin', 'admin@email.com', MD5('123456')); -->


<?php
session_start();
$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$mensagem = "";

// Cadastro
if (isset($_POST["cadastrar"])) {
    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $senha = password_hash($_POST["senha"], PASSWORD_DEFAULT);

    $sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $nome, $email, $senha);

    if ($stmt->execute()) {
        $mensagem = "<div class='alert alert-success'>Usuário cadastrado com sucesso! Faça login.</div>";
    } else {
        $mensagem = "<div class='alert alert-danger'>Erro: " . $conn->error . "</div>";
    }
}

// Login
if (isset($_POST["login"])) {
    $email = $_POST["email"];
    $senha = $_POST["senha"];

    $sql = "SELECT * FROM usuarios WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {
        $usuario = $resultado->fetch_assoc();

        if (password_verify($senha, $usuario["senha"])) {
            $_SESSION["usuario"] = $usuario["nome"];
            header("Location: ../Pages/mitologia.html");
            exit;
        } else {
            $mensagem = "<div class='alert alert-danger'>Senha incorreta!</div>";
        }
    } else {
        $mensagem = "<div class='alert alert-danger'>Usuário não encontrado!</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login & Cadastro</title>
    <link rel="icon" type="image/png" href="../Img/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../CSS/login.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <img src="../Img/Logo.png" alt="Logo do site">
        </div>
        <nav class="menu">
            <a href="../Pages/index.html">Home</a>
            <span>|</span>
            <a href="login.php">Mitologias</a>
            <span>|</span>
            <a href="login.php">Testar Conhecimento</a>
            <span>|</span>
            <a href="login.php">Sobre</a>
        </nav>
    </header>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card p-4 shadow">
                <h3 class="text-center">Sistema de Acesso</h3>
                <?= $mensagem ?>
                <ul class="nav nav-tabs" id="tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="cadastro-tab" data-toggle="tab" href="#cadastro" role="tab">Cadastro</a>
                    </li>
                </ul>
                <div class="tab-content mt-3">
                    <!-- Formulário de Login -->
                    <div class="tab-pane fade show active" id="login" role="tabpanel">
                        <form method="POST">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input type="password" name="senha" class="form-control" required>
                            </div>
                            <button type="submit"  name="login" class="btn btn-primary btn-block">Entrar</button>
                        </form>
                    </div>

                    <!-- Formulário de Cadastro -->
                    <div class="tab-pane fade" id="cadastro" role="tabpanel">
                        <form method="POST">
                            <div class="form-group">
                                <label>Nome</label>
                                <input type="text" name="nome" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input type="password" name="senha" class="form-control" required>
                            </div>
                            <button type="submit" name="cadastrar" class="btn btn-success btn-block">Cadastrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
