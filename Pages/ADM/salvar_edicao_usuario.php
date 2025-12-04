<?php
session_start();

if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
$conn->set_charset("utf8mb4");

$id    = $_POST["idUsuario"];
$nome  = $_POST["nome"];
$email = $_POST["email"];
$tipo  = intval($_POST["idTipoUsuario"]);

$sql = "UPDATE Usuario SET nome=?, email=?, idTipoUsuario=? WHERE idUsuario=?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssii", $nome, $email, $tipo, $id);

if ($conn->query($sql)) {
    header("Location: listar_usuarios.php");
    exit;
} else {
    echo "Erro ao cadastrar: " . $conn->error;
}

if ($stmt->execute()) {
    echo "<script>alert('Usuário atualizado!'); window.location='listar_usuarios.php';</script>";
} else {
    echo "<script>alert('Erro: {$conn->error}'); window.history.back();</script>";
}
?>
