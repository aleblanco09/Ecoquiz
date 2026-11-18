
<?php
require_once __DIR__ . '/../includes/auth.php';

if (!isset($_SESSION['quiz_resultado'])) {
    header('Location: index.php');
    exit;
}

$resultado = $_SESSION['quiz_resultado'];

$pontuacao = $resultado['pontuacao'];
$acertos = $resultado['acertos'];
$pontuacaoMaxima = $resultado['pontuacao_maxima'];
$totalQuestoes = $resultado['total_questoes'];
$tempo = $resultado['tempo'];
$temaId = $resultado['tema_id'];

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - Ecoquiz</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>

<body class="resultado-body">

    <main class="resultado-page">

        <div class="resultado-card">

            <h1>Quiz finalizado!</h1>

            <h2>Seu resultado</h2>

            <p class="resultado-pontuacao">
                Pontuação:
                <strong><?=$pontuacao?></strong>
                / <?=$pontuacaoMaxima?>
            </p>

            <p class="resultado-detalhe">
                Questões respondidas:
                <?=$totalQuestoes?>
            </p>

            <p class="resultado-detalhe">
                Acertos:
                <?=$acertos?>
            </p>

            <p class="resultado-detalhe">
                Tempo total:
                <?=floor($tempo / 60)?> minutos e
                <?=$tempo % 60?> segundos
            </p>

            <a class="resultado-ranking" href="ranking.php?tema_id=<?=$temaId?>">
                Ver classificação deste tema
            </a>

            <p>
                <a class="resultado-voltar" href="index.php">
                    Voltar aos temas
                </a>
            </p>

        </div>

    </main>

</body>
</html>
