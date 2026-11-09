<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';
require_once __DIR__ . '/../includes/header.php';

if (isset($_POST['voltar'])) {
    header('Location: index.php');
    exit;
}

if (isset($_GET['id'])) {
    $id = (int) $_GET['id'];
} else {
    exit("Tema não informado.");
}

$repo = new TemaRepository();
$tema = $repo->buscarPorId($id);

if (!$tema || $tema->getIdTema() != $id) {
    exit("Tema não encontrado.");
}

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de início</title>
    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>
<div class="inicio-quiz">
    <h2><?=$tema->getNomeTema()?></h2>

    <form action="quiz.php" method="post">

        <label>
            Deseja iniciar o quiz sobre <?=$tema->getNomeTema()?>?
</label>
        <br><br>
        <button type="submit" name="iniciar" value="<?=$tema->getIdTema()?>">Iniciar</button></form>
    
<form action="iniciar.php" method="post">
<button type="submit" name="voltar">Voltar</button> </form>
</body>
</div>
</html>