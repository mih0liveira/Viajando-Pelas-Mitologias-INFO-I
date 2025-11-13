<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "viajandopelasmitologias";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");
?>
