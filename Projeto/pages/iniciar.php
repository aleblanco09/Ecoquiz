<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';

if (isset($_GET['id'])) {
    $id = (int) $_GET['id'];
} else {
    exit("Tema não informado.");
}

$repo = new TemaRepository();
$tema = $repo->buscarPorId($id);

if (!$tema) {
    exit("Tema não encontrado.");
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de início</title>
</head>
<body>

    <h2><?=$tema->getNomeTema()?></h2>

    <form action="quiz.php" method="post">

        <label>
            Deseja iniciar o quiz sobre <?=$tema->getNomeTema()?>?
        </label>

        <br><br>

        <input type="hidden" name="id" value="<?=$tema->getIdTema()?>">

        <button type="submit">Iniciar</button>

    </form>

</body>
</html>