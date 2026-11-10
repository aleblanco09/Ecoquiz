
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

$mostrarResultado = false;

// Verifica se o quiz terminou
if (isset($_GET['fim']) && isset($_SESSION['quiz_resultado'])) {

    $resultado = $_SESSION['quiz_resultado'];
    unset($_SESSION['quiz_resultado']);

    $mostrarResultado = true;
}

// Inicia uma nova partida
if (!$mostrarResultado && !isset($_SESSION['quiz'])) {

    if (!isset($_POST['iniciar'])) {
        exit("Tema não informado.");
    }

    $temaId = (int) $_POST['iniciar'];

    $questoes = $repoQuestao->listarQuestoesPorTema($temaId);

    if (count($questoes) == 0) {
        exit("Não existem questões para esse tema.");
    }

    // Cria a partida no banco
    $partidaId = $repoPartida->criarPartida($usuarioId);

    // Guarda as informações do quiz na sessão
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

// Continua a partida
if (!$mostrarResultado) {

    if (!isset($_SESSION['quiz'])) {
        exit("Partida não encontrada.");
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

            // Registra a resposta no banco
            $repoResposta->registrarResposta(
                $estado['partida_id'],
                $questao->getId(),
                $acertou,
                $pontosGanhos
            );

            // Atualiza a pontuação da sessão
            $estado['pontuacao'] += $pontosGanhos;

            $estado['respondida'] = true;
            $estado['acertou'] = $acertou;
            $estado['pontos_ganhos'] = $pontosGanhos;
            $estado['alternativa_escolhida'] = $idAlternativa;

            header('Location: quiz.php');
            exit;
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

            // Calcula o tempo total da partida
            $tempo = time() - $estado['inicio_timestamp'];

            // Calcula a pontuação máxima possível
            $pontuacaoMaxima = 0;

            foreach ($questoes as $q) {
                $pontuacaoMaxima += $q->getPontos();
            }

            // Finaliza a partida no banco
            $repoPartida->finalizarPartida(
                $estado['partida_id'],
                $estado['pontuacao'],
                $tempo
            );

            // Guarda o resultado para apresentar na tela
            $_SESSION['quiz_resultado'] = [
                'pontuacao' => $estado['pontuacao'],
                'pontuacao_maxima' => $pontuacaoMaxima,
                'total_questoes' => count($questoes),
                'tempo' => $tempo
            ];

            unset($_SESSION['quiz']);

            header('Location: quiz.php?fim=1');
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

            <?php if ($mostrarResultado): ?>

                <h2>Quiz finalizado!</h2>

                <p>
                    Pontuação:
                    <strong><?=$resultado['pontuacao']?></strong>
                    / <?=$resultado['pontuacao_maxima']?>
                </p>

                <p>
                    Questões respondidas:
                    <?=$resultado['total_questoes']?>
                </p>

                <p>
                    Tempo:
                    <?=floor($resultado['tempo'] / 60)?> min e
                    <?=$resultado['tempo'] % 60?> s
                </p>

                <a href="index.php">Voltar aos temas</a>

            <?php else: ?>

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
                            Próxima questão
                        </button>

                    </form>

                <?php endif; ?>

            <?php endif; ?>

        </div>

    </main>

</body>
</html>
