<?php
session_start();

// VERIFICA LOGIN
if (!isset($_SESSION["idUsuario"])) {
    header("Location: login.php");
    exit;
}

// VERIFICA SE É ADMIN
if ($_SESSION["idTipoUsuario"] != 1) {
    die("Acesso negado! Apenas administradores podem cadastrar questões.");
}

// Conexão
$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

// RECEBE DADOS DO FORMULÁRIO (faça validações adicionais se desejar)
$enunciado  = isset($_POST["enunciado"]) ? $_POST["enunciado"] : "";
$pergunta   = isset($_POST["pergunta"]) ? $_POST["pergunta"] : "";
$altA       = isset($_POST["alternativaA"]) ? $_POST["alternativaA"] : "";
$altB       = isset($_POST["alternativaB"]) ? $_POST["alternativaB"] : "";
$altC       = isset($_POST["alternativaC"]) ? $_POST["alternativaC"] : "";
$altD       = isset($_POST["alternativaD"]) ? $_POST["alternativaD"] : "";
$corretaLetra = isset($_POST["correta"]) ? $_POST["correta"] : "";
$idTipoMitologia = isset($_POST["idTipoMitologia"]) ? intval($_POST["idTipoMitologia"]) : 0;

// Definir $correta (texto da alternativa correta) baseado na letra
switch ($corretaLetra) {
    case "A": $correta = $altA; break;
    case "B": $correta = $altB; break;
    case "C": $correta = $altC; break;
    case "D": $correta = $altD; break;
    default:  $correta = "";
}

// PROCESSA IMAGEM (opcional)
$imagemNome = null;
$uploadDir = __DIR__ . "/../Uploads/"; // caminho absoluto baseado no arquivo atual

if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

if (isset($_FILES["imagem"]) && $_FILES["imagem"]["error"] === UPLOAD_ERR_OK) {
    $ext = pathinfo($_FILES["imagem"]["name"], PATHINFO_EXTENSION);
    $novoNome = uniqid("img_") . "." . $ext;
    if (move_uploaded_file($_FILES["imagem"]["tmp_name"], $uploadDir . $novoNome)) {
        $imagemNome = $novoNome;
    } else {
        // opcional: tratar erro de upload
        // $imagemNome = null;
    }
}

// PREPARE + BIND + EXECUTE corretamente
$sql = "INSERT INTO Questoes (
            enunciado, pergunta, imagem, 
            alternativaA, alternativaB, alternativaC, alternativaD, 
            correta, idTipoMitologia
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    // erro no prepare
    die("Erro ao preparar declaração: " . $conn->error);
}

// tipos: s=string, i=int -> temos 8 strings e 1 int
if (!$stmt->bind_param(
    "ssssssssi",
    $enunciado,
    $pergunta,
    $imagemNome,
    $altA,
    $altB,
    $altC,
    $altD,
    $correta,
    $idTipoMitologia
)) {
    die("Erro ao vincular parâmetros: " . $stmt->error);
}

if ($stmt->execute()) {
    // Sucesso: redireciona para a listagem
    echo "<script>alert('Questão cadastrada com sucesso!'); window.location='listar_questoes.php';</script>";
    exit;
} else {
    // Erro na execução
    $erro = $stmt->error;
    echo "<script>alert('Erro ao cadastrar a questão!'); window.history.back();</script>";
    exit;
}

