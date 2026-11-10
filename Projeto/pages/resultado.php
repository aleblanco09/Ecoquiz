
<?php

require_once __DIR__ . '/../includes/auth.php';

// Verifica se existe um resultado disponível
if (!isset($_SESSION['quiz_resultado'])) {
    header('Location: index.php');
    exit;
}

$resultado = $_SESSION['quiz_resultado'];

$pontuacao = $resultado['pontuacao'];
$pontuacaoMaxima = $resultado['pontuacao_maxima'];
$totalQuestoes = $resultado['total_questoes'];
$tempo = $resultado['tempo'];

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - EcoQuiz</title>
    
    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>

    <main class="resultado-page">

        <div class="resultado-card">

            <h1>Quiz finalizado!</h1>

            <h2>Seu resultado</h2>

            <p>
                Pontuação:
                <strong><?=$pontuacao?></strong>
                / <?=$pontuacaoMaxima?>
            </p>

            <p>
                Questões respondidas:
                <?=$totalQuestoes?>
            </p>

            <p>
                Tempo total:
                <?=floor($tempo / 60)?> minutos e
                <?=$tempo % 60?> segundos
            </p>

            <a href="index.php">Voltar aos temas</a>
<a href="ranking.php">Ver ranking</a>
        </div>

    </main>

</body>
</html>
