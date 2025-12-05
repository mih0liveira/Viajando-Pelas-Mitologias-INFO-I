<?php
session_start();
if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

$id = intval($_GET["id"]);

$conn->query("DELETE FROM Questoes WHERE idQuestoes = $id");

echo "<script>alert('Questão excluída!'); window.location='listar_questoes.php';</script>";
?>
