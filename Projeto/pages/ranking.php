<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/UsuarioRepository.php';
require_once __DIR__ . '/../repository/TemaRepository.php';


$temaId = (int) $_GET['tema_id'];

if (!$temaId || $temaId < 1) {
    exit("Tema não informado.");
}

$repoTema = new TemaRepository();
$tema = $repoTema->buscarPorId($temaId);

if (!$tema) {
    exit("Tema não encontrado.");
}

$repo = new UsuarioRepository();
$ranking = $repo->listarRankingPorTema($temaId);

?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Classificação - Ecoquiz</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>

<body class="classificacao-body">

     

    <main class="classificacao-page">

        <div class="classificacao-card">

            <h1>
                Classificação - <?=htmlspecialchars($tema->getNomeTema())?>
            </h1>

            <?php if (count($ranking) == 0): ?>

                <p class="classificacao-vazio">
                    Ainda não existem partidas concluídas nesse tema.
                </p>

            <?php else: ?>

                <div class="classificacao-tabela-container">

                    <table class="classificacao-tabela">

                        <thead>
                            <tr>
                                <th>Posição</th>
                                <th>Usuário</th>
                                <th>Pontuação</th>
                                <th>Tempo</th>
                            </tr>
                        </thead>

                        <tbody>

                            <?php foreach ($ranking as $i => $usuario): ?>

                                <tr>

                                    <td><?=$i + 1?>º</td>

                                    <td>
                                        <?=htmlspecialchars($usuario['nome'])?>
                                    </td>

                                    <td>
                                        <?=$usuario['pontuacao_total']?> pontos
                                    </td>

                                    <td>
                                        <?=sprintf(
                                            '%02d:%02d',
                                            intdiv((int) $usuario['tempo_segundos'], 60),
                                            (int) $usuario['tempo_segundos'] % 60
                                        )?>
                                    </td>

                                </tr>

                            <?php endforeach; ?>

                        </tbody>

                    </table>

                </div>

            <?php endif; ?>

            <div class="classificacao-acoes">

                <a class="classificacao-voltar" href="index.php">
                    Voltar aos temas
                </a>

            </div>

        </div>

    </main>

</body>
</html>