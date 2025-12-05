<?php
session_start();

if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

$id = intval($_GET["id"]);

$conn->query("DELETE FROM Usuario WHERE idUsuario = $id");

echo "<script>alert('Usuário excluído!'); window.location='listar_usuarios.php';</script>";
?>
