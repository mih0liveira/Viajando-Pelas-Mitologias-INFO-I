<!-- <!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Questão</title>
    <link rel="stylesheet" href="../CSS/salvar_questoes.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="../Img/Logo.png" alt="Logo do site">
        </div>

        <nav class="menu">
            <a href="indexAdmin.php">Home</a>
            <span>|</span>
            <a href="../Pages/mitologia.html">Mitologias</a>
            <span>|</span>
            <a href="testar_conhecimento.php">Testar Conhecimento</a>
            <span>|</span>
            <a href="sobre.html">Sobre</a>
        </nav>
    </header> -->

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

$conn = new mysqli("localhost", "root", "", "viajandopelasmitologias");

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// RECEBE DADOS DO FORMULÁRIO
$enunciado  = $_POST["enunciado"];
$pergunta   = $_POST["pergunta"];
$altA       = $_POST["alternativaA"];
$altB       = $_POST["alternativaB"];
$altC       = $_POST["alternativaC"];
$altD       = $_POST["alternativaD"];
$correta    = $_POST["correta"];
$idTipoMitologia = intval($_POST["idTipoMitologia"]);


$corretaLetra = $_POST['correta'];
switch ($corretaLetra) {
    case "A": $correta = $altA; break;
    case "B": $correta = $altB; break;
    case "C": $correta = $altC; break;
    case "D": $correta = $altD; break;
    default:  $correta = "";
}

// PROCESSA IMAGEM (opcional)
$imagemNome = null;
$uploadDir = "../Uploads/";

if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

if (isset($_FILES["imagem"]) && $_FILES["imagem"]["error"] == 0) {
    $ext = pathinfo($_FILES["imagem"]["name"], PATHINFO_EXTENSION);
    $novoNome = uniqid("img_") . "." . $ext;

    if (move_uploaded_file($_FILES["imagem"]["tmp_name"], $uploadDir . $novoNome)) {
        $imagemNome = $novoNome;
    }
}


// SQL PARA SALVAR NO BANCO
$sql = "INSERT INTO Questoes (
            enunciado, pergunta, imagem, 
            alternativaA, alternativaB, alternativaC, alternativaD, 
            correta, idTipoMitologia
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);

$stmt->bind_param("ssssssssi",
    $enunciado,
    $pergunta,
    $imagemNome,
    $altA,
    $altB,
    $altC,
    $altD,
    $correta,
    $idTipoMitologia
);

// FINALIZA
if ($stmt->execute()) {
    echo "<script>alert('Questão cadastrada com sucesso!'); window.location='cadastro_questoes.php';</script>";
} else {
    echo "<script>alert('Erro ao cadastrar a questão!'); window.history.back();</script>";
}

?>
</body>
</html>





