<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

global $pdo;

$resultadoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$resultadoId) {
    header('Location: quiz.php');
    exit;
}

$stmt = $pdo->prepare("
    SELECT r.*, c.nome AS categoria_nome 
    FROM ambiental_resultados r 
    LEFT JOIN ambiental_categorias c ON r.categoria_id = c.id 
    WHERE r.id = :id AND r.usuario_id = :usuario_id
");
$stmt->execute([
    ':id' => $resultadoId,
    ':usuario_id' => $_SESSION['usuario_id']
]);
$resultado = $stmt->fetch();

if (!$resultado) {
    header('Location: quiz.php');
    exit;
}

require_once __DIR__ . '/../includes/header.php';
?>

<div class="page-header">
  <h2>EcoQuiz — Resultado da Avaliação</h2>
</div>

<div class="form-card" style="max-width: 600px; text-align: center;">
  <div style="margin-bottom: 24px;">
    <i class="fa-solid fa-award" style="font-size: 3.5rem; color: var(--leaf-green);"></i>
  </div>

  <h3 style="color: var(--forest-green); margin-bottom: 8px;">
    Questionário Concluído!
  </h3>
  
  <p style="color: var(--muted); margin-bottom: 24px;">
    Módulo: <strong><?= htmlspecialchars($resultado['categoria_nome'] ?? 'Quiz Geral') ?></strong>
  </p>

  <div style="background: var(--sand-beige); border-radius: var(--radius); padding: 24px; margin-bottom: 24px; border: 1px solid var(--border-color);">
    <span style="font-size: 0.9rem; color: var(--muted); text-transform: uppercase; letter-spacing: 0.05em; font-weight: 600;">Desempenho Geral</span>
    <div style="font-size: 3rem; font-weight: 800; color: var(--forest-green); margin: 8px 0;">
      <?= $resultado['pontuacao'] ?>%
    </div>
    <p style="margin: 0; color: var(--ink-soft); font-weight: 500;">
      Acertou em <strong><?= $resultado['acertos'] ?></strong> de <strong><?= $resultado['total_perguntas'] ?></strong> perguntas.
    </p>
  </div>

  <div style="display: flex; gap: 12px; justify-content: center;">
    <a href="quiz.php" class="btn btn-primary">Novo Questionário</a>
    <a href="ranking.php" class="btn">Ver Ranking</a>
  </div>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>