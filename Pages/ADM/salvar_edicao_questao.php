<?php
session_start();
if (!isset($_SESSION["idUsuario"]) || $_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado!");
}

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
$conn->set_charset("utf8mb4");

$id  = $_POST["idQuestoes"];
$enunciado = $_POST["enunciado"];
$pergunta = $_POST["pergunta"];
$altA = $_POST["alternativaA"];
$altB = $_POST["alternativaB"];
$altC = $_POST["alternativaC"];
$altD = $_POST["alternativaD"];
$corretaLetra = $_POST["correta"];

switch ($corretaLetra) {
    case "A": $correta = $altA; break;
    case "B": $correta = $altB; break;
    case "C": $correta = $altC; break;
    case "D": $correta = $altD; break;
}

if ($conn->query($sql)) {
    header("Location: listar_questoes.php");
    exit;
} else {
    echo "Erro ao cadastrar: " . $conn->error;
}

// Upload de imagem (opcional)
$imagemNome = null;

if (isset($_FILES["imagem"]) && $_FILES["imagem"]["error"] == 0) {
    $ext = pathinfo($_FILES["imagem"]["name"], PATHINFO_EXTENSION);
    $novoNome = uniqid("img_") . "." . $ext;
    move_uploaded_file($_FILES["imagem"]["tmp_name"], "../Uploads/" . $novoNome);
    $imagemNome = $novoNome;
}

if ($imagemNome !== null) {
    $sql = "UPDATE Questoes SET 
            enunciado=?, pergunta=?, imagem=?,
            alternativaA=?, alternativaB=?, alternativaC=?, alternativaD=?,
            correta=?
            WHERE idQuestoes=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssi", $enunciado, $pergunta, $imagemNome,
                      $altA, $altB, $altC, $altD, $correta, $id);
} else {
    $sql = "UPDATE Questoes SET 
            enunciado=?, pergunta=?,
            alternativaA=?, alternativaB=?, alternativaC=?, alternativaD=?,
            correta=?
            WHERE idQuestoes=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssssi", $enunciado, $pergunta,
                      $altA, $altB, $altC, $altD, $correta, $id);
}

if ($stmt->execute()) {
    echo "<script>alert('Questão atualizada!'); window.location='listar_questoes.php';</script>";
} else {
    echo "<script>alert('Erro ao atualizar!'); window.history.back();</script>";
}
?>
