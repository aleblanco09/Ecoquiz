<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/QuestaoRepository.php';

if (isset($_POST['id'])) {
    $id = (int) $_POST['id'];
} else {
    exit("Tema não informado.");
}

$repo = new QuestaoRepository();
$questoes = $repo->listarQuestoesPorTema($id);

if (count($questoes) == 0) {
    exit("Não existem questões para esse tema.");
}

$questao = $questoes[0];
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
</head>
<body>

    <h2><?=$questao->getEnunciado()?></h2>

</body>
</html>