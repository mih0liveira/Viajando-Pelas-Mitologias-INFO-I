<?php
// Conexão com o banco
$host = "localhost";
$user = "root"; // ajuste para o seu usuário
$pass = "";     // ajuste para a sua senha
$db   = "viajandopelasmitologias"; // nome do seu banco

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

// Buscar todas as questões
$sql = "SELECT * FROM Questoes WHERE idTipoMitologia = 7";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Testar Conhecimento</title>
  <link rel="icon" type="image/png" href="../Img/favicon.ico">
  <link rel="stylesheet" href="../CSS/flashcard.css?v=<?= time() ?>">
</head>

<body>
<header class="navbar">
        <div class="logo">
            <img src="../Img/Logo.png" alt="Logo do site">
        </div>

        <nav class="menu">
            <a href="../Pages/index.html">Home</a>
            <span>|</span>
            <a href="../Pages/mitologia.html">Mitologias</a>
            <span>|</span>
            <a href="testar_conhecimento.php">Testar Conhecimento</a>
            <span>|</span>
            <a href="sobre.html">Sobre</a>
        </nav>
    </header>
  <div class="grid">
  <?php
  if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
          echo '<div class="flashcard">';
          echo '  <div class="card-inner">';
          // Frente do flashcard
          echo '    <div class="card-front">';
          echo "      <div><strong>{$row['enunciado']}</strong></div>";
          echo "      <div>{$row['pergunta']}</div>";
          echo '    </div>';
          // Verso do flashcard
          echo '    <div class="card-back">';
          echo "      <h2>Resposta:</h2>";
          echo "      <p>{$row['correta']}</p>";
          echo '    </div>';
          echo '  </div>';
          echo '</div>';
      }
  } else {
      echo "Nenhuma questão encontrada.";
  }
  $conn->close();
  ?>
  </div>

  <script>
    // Adiciona evento de clique em todos os flashcards
    document.querySelectorAll('.flashcard').forEach(card => {
      card.addEventListener('click', () => {
        card.classList.toggle('flipped');
      });
    });
  </script>
</body>
</html>
