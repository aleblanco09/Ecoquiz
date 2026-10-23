<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../repository/QuestaoRepository.php';

$questoes = [];
$erro = null;

try {
    $database = new Database();
    $pdo = $database->getConnection();

    $questaoRepo = new QuestaoRepository($pdo);
    $questoes = $questaoRepo->buscarAleatorias(null, 10);

} catch (Throwable $e) {
    error_log($e->getMessage());
    $erro = 'Não foi possível carregar o quiz. Verifique a conexão e a estrutura do banco.';
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Quiz - EcoQuiz</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>

<div class="quiz-container">

    <h1>Quiz EcoQuiz</h1>
    <p>Responda às questões e teste seus conhecimentos ambientais!</p>

    <?php if ($erro !== null): ?>

        <p><?= htmlspecialchars($erro, ENT_QUOTES, 'UTF-8') ?></p>

    <?php elseif (empty($questoes)): ?>

        <p>Nenhuma questão encontrada no momento.</p>

    <?php else: ?>

        <form action="responder.php" method="POST">

            <?php foreach ($questoes as $index => $questao): ?>

                <?php
                $id = $questao->getId();

                // Consulta correta na tabela `alternativas` baseada no ID da questão
                $sql = "SELECT letra, texto 
                        FROM alternativas 
                        WHERE questao_id = :id 
                        ORDER BY letra ASC";

                $stmt = $pdo->prepare($sql);
                $stmt->execute([':id' => $id]);

                $alternativas = $stmt->fetchAll(PDO::FETCH_ASSOC);
                ?>

                <?php if (!empty($alternativas)): ?>

                    <div class="questao-card">

                        <p>
                            <strong>
                                <?= $index + 1 ?>.
                                <?= htmlspecialchars(
                                    $questao->getEnunciado(),
                                    ENT_QUOTES,
                                    'UTF-8'
                                ) ?>
                            </strong>
                        </p>

                        <?php foreach ($alternativas as $alt): ?>

                            <label class="alternativa">
                                <input
                                    type="radio"
                                    name="resposta[<?= $id ?>]"
                                    value="<?= $alt['letra'] ?>"
                                    required
                                >

                                <strong>
                                    <?= strtoupper($alt['letra']) ?>)
                                </strong>

                                <?= htmlspecialchars(
                                    $alt['texto'] ?? '',
                                    ENT_QUOTES,
                                    'UTF-8'
                                ) ?>
                            </label>

                        <?php endforeach; ?>

                    </div>

                    <hr>

                <?php endif; ?>

            <?php endforeach; ?>

            <button type="submit">Enviar respostas</button>

        </form>

    <?php endif; ?>

</div>

</body>
</html>