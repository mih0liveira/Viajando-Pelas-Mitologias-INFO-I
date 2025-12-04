<?php
session_start();

if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$nome  = $_POST["nome"];
$email = $_POST["email"];
$senha = password_hash($_POST["senha"], PASSWORD_DEFAULT);
$idTipoUsuario = intval($_POST["idTipoUsuario"]);

$sql = "INSERT INTO Usuario (nome, email, senha, idTipoUsuario) VALUES (?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $nome, $email, $senha, $idTipoUsuario);

if ($conn->query($sql)) {
    header("Location: listar_usuarios.php");
    exit;
} else {
    echo "Erro ao cadastrar: " . $conn->error;
}

if ($stmt->execute()) {
    echo "<script>alert('Usuário cadastrado com sucesso!'); window.location='listar_usuarios.php';</script>";
} else {
    echo "<script>alert('Erro: {$conn->error}'); window.history.back();</script>";
}
?>
