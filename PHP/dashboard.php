<?php
session_start();
if (!isset($_SESSION["usuario"])) {
    header("Location: index.html");
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Área Restrita</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card p-4 shadow">
        <h3>Bem-vindo, <?= $_SESSION["usuario"] ?>!</h3>
        <p>Você está logado no sistema.</p>
        <a href="logout.php" class="btn btn-danger">Sair</a>
    </div>
</div>
</body>
</html>
