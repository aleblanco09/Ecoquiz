
<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/UsuarioRepository.php';
require_once __DIR__ . '/../repository/TemaRepository.php';
require_once __DIR__ . '/../includes/header.php';

$temaId = filter_input(INPUT_GET, 'tema_id', FILTER_VALIDATE_INT);

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
    <title>Ranking - Ecoquiz</title>
</head>
<body>

    <h1>Classificação - <?=$tema->getNomeTema()?></h1>

    <?php if (count($ranking) == 0): ?>

        <p>Ainda não existem partidas concluídas nesse tema.</p>

    <?php else: ?>

        <table border="1">

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
                            <?=htmlspecialchars($usuario['nome'], ENT_QUOTES, 'UTF-8')?>
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

    <?php endif; ?>

    <p>
        <a href="index.php">Voltar aos temas</a>
    </p>

</body>
</html>
