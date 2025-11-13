<?php
include('conexao.php');

if (!isset($_GET['mitologia'])) {
    die("Nenhuma mitologia selecionada.");
}

$mitologia = $_GET['mitologia'];

// Consulta as perguntas da mitologia
$query = "SELECT * FROM quiz_perguntas WHERE mitologia = ?";

$stmt = $conn->prepare($query);
if (!$stmt) {
    die("Erro ao preparar a consulta: " . $conn->error);
}

$stmt->bind_param("s", $mitologia);
$stmt->execute();

$result = $stmt->get_result();

if (!$result) {
    die("Erro ao executar a consulta: " . $stmt->error);
}

$perguntas = [];
while ($row = $result->fetch_assoc()) {
    $perguntas[] = $row;
}

$stmt->close();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Quiz - <?php echo ucfirst($mitologia); ?></title>
<link rel="stylesheet" href="quiz.css">
</head>
<body>
<nav class="navbar">
    <div class="logo">
        <a href="index.php"><img src="logo.png" alt="Logo"></a>
    </div>
    <div class="menu">
        <a href="index.html">HOME</a>
        <span>|</span>
        <a href="escolher_mitologia.php">MITOLOGIAS</a>
        <span>|</span>
        <a href="testar_conhecimento.php">TESTAR CONHECIMENTO</a>
        <span>|</span>
        <a href="sobre.html">SOBRE</a>
    </div>
</nav>

<div class="container">
    <h1>Quiz - Mitologia <?php echo ucfirst($mitologia); ?></h1>

    <?php if (count($perguntas) > 0): ?>
        <form method="POST" action="resultado.php">
            <?php foreach ($perguntas as $index => $p): ?>
                <div class="pergunta">
                    <h2><?php echo ($index + 1) . ". " . htmlspecialchars($p['pergunta']); ?></h2>
                    <label><input type="radio" name="resposta_<?php echo $p['id']; ?>" value="a" required> <?php echo htmlspecialchars($p['opcao_a']); ?></label><br>
                    <label><input type="radio" name="resposta_<?php echo $p['id']; ?>" value="b"> <?php echo htmlspecialchars($p['opcao_b']); ?></label><br>
                    <label><input type="radio" name="resposta_<?php echo $p['id']; ?>" value="c"> <?php echo htmlspecialchars($p['opcao_c']); ?></label><br>
                    <label><input type="radio" name="resposta_<?php echo $p['id']; ?>" value="d"> <?php echo htmlspecialchars($p['opcao_d']); ?></label><br>
                    <input type="hidden" name="correta_<?php echo $p['id']; ?>" value="<?php echo $p['correta']; ?>">
                    <hr>
                </div>
            <?php endforeach; ?>
            <button type="submit" class="btn">Enviar Respostas</button>
        </form>
    <?php else: ?>
        <p style="font-size:20px;">Ainda não há perguntas cadastradas para esta mitologia.</p>
    <?php endif; ?>
</div>
</body>
</html>
