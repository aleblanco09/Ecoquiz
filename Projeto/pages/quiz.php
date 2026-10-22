<?php
// Inclui os arquivos necessários baseados na estrutura do seu projeto
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../repository/QuestaoRepository.php'; // ou o nome correto do seu arquivo de repositório de perguntas

try {
    // Inicializa a conexão usando a sua classe Database
    $database = new Database();
    $pdo = $database->getConnection();

    // Instancia o repositório
    $perguntaRepo = new PerguntaRepository($pdo);

    // Busca as perguntas (por exemplo, 10 perguntas aleatórias)
    $perguntas = $perguntaRepo->buscarAleatorias(null, 10);

} catch (Exception $e) {
    die("Erro ao carregar o quiz: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Quiz - EcoQuiz</title>
    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>
    <div class="quiz-container">
        <h1>Quiz EcoQuiz</h1>
        
        <form action="responder.php" method="POST">
            <?php if (empty($perguntas)): ?>
                <p>Nenhuma pergunta encontrada no momento.</p>
            <?php else: ?>
                <?php foreach ($perguntas as $index => $p): ?>
                    <div class="questao-card">
                        <!-- Exibe o enunciado usando o método da entidade Pergunta -->
                        <p><strong><?php echo ($index + 1); ?>. <?php echo htmlspecialchars($p->getEnunciado()); ?></strong></p>
                        
                        <!-- Opção A -->
                        <label class="alternativa">
                            <input type="radio" name="resposta[<?php echo $p->getId(); ?>]" value="a" required>
                            <strong>A)</strong> <?php echo htmlspecialchars($p->getOpcaoA()); ?>
                        </label>

                        <!-- Opção B -->
                        <label class="alternativa">
                            <input type="radio" name="resposta[<?php echo $p->getId(); ?>]" value="b">
                            <strong>B)</strong> <?php echo htmlspecialchars($p->getOpcaoB()); ?>
                        </label>

                        <!-- Opção C -->
                        <label class="alternativa">
                            <input type="radio" name="resposta[<?php echo $p->getId(); ?>]" value="c">
                            <strong>C)</strong> <?php echo htmlspecialchars($p->getOpcaoC()); ?>
                        </label>

                        <!-- Opção D -->
                        <label class="alternativa">
                            <input type="radio" name="resposta[<?php echo $p->getId(); ?>]" value="d">
                            <strong>D)</strong> <?php echo htmlspecialchars($p->getOpcaoD()); ?>
                        </label>
                    </div>
                    <hr>
                <?php endforeach; ?>
                
                <button type="submit">Enviar Respostas</button>
            <?php endif; ?>
        </form>
    </div>
</body>
</html>