
<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/QuestaoRepository.php';
require_once __DIR__ . '/../repository/AlternativaRepository.php';
require_once __DIR__ . '/../repository/PartidaRepository.php';
require_once __DIR__ . '/../repository/RespostaUsuarioRepository.php';

$repoQuestao = new QuestaoRepository();
$repoAlternativa = new AlternativaRepository();
$repoPartida = new PartidaRepository();
$repoResposta = new RespostaUsuarioRepository();

$usuarioId = (int) $_SESSION['usuario_id'];

// Inicia uma nova partida
if (!isset($_SESSION['quiz'])) {

    if (!isset($_POST['iniciar'])) {
        exit("Tema não informado.");
    }

    $temaId = (int) $_POST['iniciar'];

    $questoes = $repoQuestao->listarQuestoesPorTema($temaId);

    if (count($questoes) == 0) {
        exit("Não existem questões para esse tema.");
    }

    $partidaId = $repoPartida->criarPartida($usuarioId);

    $_SESSION['quiz'] = [
        'partida_id' => $partidaId,
        'tema_id' => $temaId,
        'indice' => 0,
        'pontuacao' => 0,
        'inicio_timestamp' => time(),
        'respondida' => false
    ];

    unset($_SESSION['quiz_resultado']);

    header('Location: quiz.php');
    exit;
}

$estado = &$_SESSION['quiz'];

$questoes = $repoQuestao->listarQuestoesPorTema($estado['tema_id']);

if (empty($questoes)) {
    exit("Não existem questões para esse tema.");
}

$indice = $estado['indice'];

if (!isset($questoes[$indice])) {
    exit("Questão não encontrada.");
}

$questao = $questoes[$indice];

$alternativas = $repoAlternativa->listarAlternativasPorQuestao(
    $questao->getId()
);

if (empty($alternativas)) {
    exit("Essa questão não possui alternativas.");
}

$erro = '';

// Recebe a resposta do usuário
if (isset($_POST['responder']) && !$estado['respondida']) {

    $idAlternativa = filter_var(
        $_POST['alternativa'] ?? null,
        FILTER_VALIDATE_INT
    );

    $alternativaEscolhida = null;

    foreach ($alternativas as $alternativa) {

        if ($alternativa->getId() === $idAlternativa) {
            $alternativaEscolhida = $alternativa;
            break;
        }
    }

    if (!$alternativaEscolhida) {

        $erro = "Selecione uma alternativa válida.";

    } else {

        $acertou = $alternativaEscolhida->getCorreta() === 1;

        $pontosGanhos = $acertou ? $questao->getPontos() : 0;

        $repoResposta->registrarResposta(
            $estado['partida_id'],
            $questao->getId(),
            $acertou,
            $pontosGanhos
        );

        $estado['pontuacao'] += $pontosGanhos;

        $estado['respondida'] = true;
        $estado['acertou'] = $acertou;
        $estado['pontos_ganhos'] = $pontosGanhos;
        $estado['alternativa_escolhida'] = $idAlternativa;

        header('Location: quiz.php');
        exit;
    }
}

// Identifica a alternativa correta
$alternativaCorreta = null;

foreach ($alternativas as $alternativa) {

    if ($alternativa->getCorreta() === 1) {
        $alternativaCorreta = $alternativa;
        break;
    }
}

// Avança para a próxima questão
if (isset($_POST['proxima']) && $estado['respondida']) {

    if ($indice + 1 < count($questoes)) {

        $estado['indice']++;

        $estado['respondida'] = false;

        unset(
            $estado['acertou'],
            $estado['pontos_ganhos'],
            $estado['alternativa_escolhida']
        );

        header('Location: quiz.php');
        exit;

    } else {

        // Calcula a pontuação máxima
        $pontuacaoMaxima = 0;

        foreach ($questoes as $q) {
            $pontuacaoMaxima += $q->getPontos();
        }

        // Calcula o tempo da partida
        $tempo = time() - $estado['inicio_timestamp'];

        // Finaliza a partida no banco
        $repoPartida->finalizarPartida(
            $estado['partida_id'],
            $estado['pontuacao'],
            $tempo
        );

        // Guarda os dados para a página de resultado
        $_SESSION['quiz_resultado'] = [
            'pontuacao' => $estado['pontuacao'],
            'pontuacao_maxima' => $pontuacaoMaxima,
            'total_questoes' => count($questoes),
            'tempo' => $tempo
        ];

        unset($_SESSION['quiz']);

        header('Location: resultado.php');
        exit;
    }
}

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoQuiz - Quiz</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>

    <main class="quiz-page">

        <div class="quiz-card">

            <p>
                Questão <?=$indice + 1?> de <?=count($questoes)?>
            </p>

            <h2>
                <?=htmlspecialchars($questao->getEnunciado(), ENT_QUOTES, 'UTF-8')?>
            </h2>

            <p>
                Valor: <?=$questao->getPontos()?> pontos
            </p>

            <?php if (!$estado['respondida']): ?>

                <?php if ($erro != ''): ?>
                    <p><?=$erro?></p>
                <?php endif; ?>

                <form action="quiz.php" method="POST">

                    <?php foreach ($alternativas as $alternativa): ?>

                        <label>

                            <input
                                type="radio"
                                name="alternativa"
                                value="<?=$alternativa->getId()?>"
                                required
                            >

                            <?=strtoupper($alternativa->getLetra())?>)

                            <?=htmlspecialchars($alternativa->getTexto(), ENT_QUOTES, 'UTF-8')?>

                        </label>

                        <br>

                    <?php endforeach; ?>

                    <button type="submit" name="responder">
                        Responder
                    </button>

                </form>

            <?php else: ?>

                <?php if ($estado['acertou']): ?>

                    <p>Você acertou! Parabéns!</p>

                    <p>
                        Você ganhou <?=$estado['pontos_ganhos']?> pontos.
                    </p>

                <?php else: ?>

                    <p>Resposta incorreta!</p>

                    <?php if ($alternativaCorreta): ?>

                        <p>
                            Resposta correta:

                            <?=strtoupper($alternativaCorreta->getLetra())?>)

                            <?=htmlspecialchars($alternativaCorreta->getTexto(), ENT_QUOTES, 'UTF-8')?>
                        </p>

                    <?php endif; ?>

                <?php endif; ?>

                <p>
                    <?=htmlspecialchars($questao->getExplicacao(), ENT_QUOTES, 'UTF-8')?>
                </p>

                <p>
                    Pontuação atual: <?=$estado['pontuacao']?>
                </p>

                <form action="quiz.php" method="POST">

                    <button type="submit" name="proxima">
                        <?=($indice + 1 == count($questoes)) ? 'Finalizar quiz' : 'Próxima questão'?>
                    </button>

                </form>

            <?php endif; ?>

        </div>

    </main>

</body>
</html>
