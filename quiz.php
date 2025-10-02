<?php
header("Content-Type: text/html; charset=UTF-8");
$host = "localhost";
$user = "root";
$pass = "";
$db   = "viajandopelasmitologias";

// Conexão
 $conn = new mysqli($host, $user, $pass, $db);
 if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
 }
 $conn->set_charset("utf8mb4");

// Inicializa sessão para contar acertos
session_start();
if(!isset($_SESSION['acertos'])) {
    $_SESSION['acertos'] = 0;
}

// Define a pergunta atual
$pergunta_id = isset($_GET['pergunta_id']) ? (int)$_GET['pergunta_id'] : 1;

// Pega a pergunta
$sql = "SELECT * FROM perguntas WHERE id = $pergunta_id";
$result = $conn->query($sql);

// Verifica se acabou o quiz
$sql_total = "SELECT COUNT(*) as total FROM perguntas";
$res_total = $conn->query($sql_total);
$row_total = $res_total->fetch_assoc();
$total_perguntas = $row_total['total'];

if($result->num_rows == 0){
    $acertos = $_SESSION['acertos'];
    session_destroy();
    header("Location: resultados.php?acertos=$acertos&total=$total_perguntas");
    exit;
}

$pergunta = $result->fetch_assoc();

// Pega as respostas
$sql2 = "SELECT * FROM respostas WHERE pergunta_id = $pergunta_id ORDER BY RAND()";
$respostas = $conn->query($sql2);

// Verifica se o usuário respondeu
if(isset($_POST['resposta_id'])){
    $resposta_id = (int)$_POST['resposta_id'];
    $sqlCheck = "SELECT correta FROM respostas WHERE id = $resposta_id";
    $resCheck = $conn->query($sqlCheck);
    $row = $resCheck->fetch_assoc();
    $msg = $row['correta'] == 1 ? "" : "";

    if($row['correta'] == 1){
        $_SESSION['acertos']++;
    }

    $next_id = $pergunta_id + 1;
    header("Location: ?pergunta_id=$next_id&msg=$msg");
    exit;
}

$msg = isset($_GET['msg']) ? $_GET['msg'] : "";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Quiz Mitológico</title>
<link rel="stylesheet" href="quiz.css">
<style>
.quiz-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 120px;
}

.quiz-card {
    background-color: white;
    padding: 40px;
    border-radius: 15px;
    max-width: 600px;
    width: 100%;
    text-align: center;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}

.quiz-card h2 {
    font-size: 28px;
    margin-bottom: 20px;
}

.quiz-card form label {
    display: block;
    margin: 15px 0;
    font-size: 20px;
}

.quiz-card button {
    background-color: #002c77;
    color: white;
    border: none;
    padding: 10px 25px;
    border-radius: 20px;
    font-size: 18px;
    cursor: pointer;
    margin-top: 20px;
    transition: 0.3s;
}

.quiz-card button:hover {
    background-color: #0044aa;
    transform: scale(1.05);
}

</style>
</head>
<body>
    <!-- Barra de navegação -->
    <nav class="navbar">
        <div class="logo">
            <a href="index.php"><img src="logo.png" alt="Logo"></a>
        </div>
        <div class="menu">
            <a href="index.html">HOME</a>
            <span>|</span>
            <a href="#">MITOLOGIAS</a>
            <span>|</span>
            <a href="quiz.php">TESTAR CONHECIMENTO</a>
            <span>|</span>
            <a href="sobre.html">SOBRE</a>
            
        </div>
    </nav>

    <!-- Conteúdo Quiz -->
    <div class="quiz-container">
        <div class="quiz-card">
            <h2>Quiz Mitológico</h2>
            <?php if($msg): ?>
                <div class="msg"><?php echo $msg; ?></div>
            <?php endif; ?>
            <p><?php echo $pergunta['pergunta']; ?></p>
            <form method="POST">
                <?php while($r = $respostas->fetch_assoc()): ?>
                    <label>
                        <input type="radio" name="resposta_id" value="<?php echo $r['id']; ?>" required>
                        <?php echo $r['resposta']; ?>
                    </label>
                <?php endwhile; ?>
                <button type="submit">
                    <?php echo ($pergunta_id == $total_perguntas) ? "Finalizar" : "Enviar"; ?>
                </button>
            </form>
        </div>
    </div>
</body>
</html>
