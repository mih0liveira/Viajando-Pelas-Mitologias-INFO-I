<?php
include "conexao.php";

$sql = "SHOW COLUMNS FROM Questoes";
$result = $conn->query($sql);

while($row = $result->fetch_assoc()){
    echo $row['Field'] . "<br>";
}
