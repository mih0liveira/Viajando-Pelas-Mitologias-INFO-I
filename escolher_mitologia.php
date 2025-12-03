<?php
include "conexao.php";
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Escolher Mitologia</title>
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
            <a href="#">MITOLOGIAS</a>
            <span>|</span>
            <a href="testar_conhecimento.php">TESTAR CONHECIMENTO</a>
            <span>|</span>
            <a href="sobre.html">SOBRE</a>
        </div>
    </nav>

    <div class="container">
        <h1>Escolha uma Mitologia</h1>
        <div class="cards">

            <?php
            // IDs oficiais para o quiz.php
            $mitologias = [
              [1, "Mitologia Grega", "imagens/imggrega.png"],
                [2, "Mitologia Romana", "imagens/romana.png"],
                [3, "Mitologia Egípcia", "imagens/imgegipcia.png"],
                [4, "Mitologia Nórdica", "imagens/imgnordica.png"],
                [5, "Mitologia Japonesa", "imagens/japonesa.png"],
                [6, "Mitologia Chinesa", "imagens/imgchinesa.png"],
                [7, "Mitologia Indígena", "imagens/indigena.png"],
                [8, "Mitologia Africana", "imagens/imgafricana.png"],
                [9, "Mitologia Mesopotâmica", "imagens/mesopotamica.jpg"],
                [10, "Mitologia Celta", "imagens/celta.jpg"],
                [11, "Mitologia Hindu", "imagens/hindu.jpg"],
                [12, "Mitologia Maia", "imagens/maia.jpg"]
            ];

            foreach ($mitologias as $m) {
                echo "
                <div class='card'>
                    <p>{$m[1]}</p>
                    <img src='{$m[2]}' alt='{$m[1]}'>

                    <!-- Corrigido: adicionando index=0 -->
                    <button onclick=\"window.location.href='quiz.php?id_mitologia={$m[0]}&index=0'\">
                        Iniciar Quiz
                    </button>
                </div>
                ";
            }
            ?>

        </div>
    </div>
</body>
</html>
