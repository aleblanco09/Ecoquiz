<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/header.php';

global $pdo;

$stmt = $pdo->query("
    SELECT 
        u.nome,
        COUNT(r.id) AS total_quizzes,
        SUM(r.acertos) AS total_acertos,
        ROUND(AVG(r.pontuacao)) AS media_pontuacao
    FROM ambiental_usuarios u
    INNER JOIN ambiental_resultados r ON u.id = r.usuario_id
    GROUP BY u.id
    ORDER BY media_pontuacao DESC, total_acertos DESC
    LIMIT 20
");

$ranking = $stmt->fetchAll();
?>

<div class="page-header">
  <h2>EcoQuiz — Classificação Geral</h2>
  <a href="quiz.php" class="btn btn-primary">
    <i class="fa-solid fa-play"></i> Jogar Novamente
  </a>
</div>

<div class="form-card" style="max-width: 900px; margin: 0 auto;">
  <p style="color: var(--muted); margin-bottom: 20px; text-align: center;">
    Acompanhe o desempenho dos colaboradores na conscientização e preservação ambiental.
  </p>

  <?php if (empty($ranking)): ?>
    <div class="empty-state">
      <p>Nenhum registo de pontuação encontrado até ao momento. Seja o primeiro a responder ao quiz!</p>
    </div>
  <?php else: ?>
    <div class="table-wrapper">
      <table class="data-table">
        <thead>
          <tr>
            <th style="width: 80px; text-align: center;">Posição</th>
            <th>Colaborador</th>
            <th style="text-align: center;">Quizzes Concluídos</th>
            <th style="text-align: center;">Total de Acertos</th>
            <th style="text-align: center;">Média Geral</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($ranking as $index => $pos): ?>
            <tr>
              <td style="text-align: center; font-weight: 700;">
                <?php if ($index === 0): ?>
                  <i class="fa-solid fa-trophy" style="color: #f1c40f; font-size: 1.1rem;"></i> 1º
                <?php elseif ($index === 1): ?>
                  <i class="fa-solid fa-trophy" style="color: #bdc3c7; font-size: 1.1rem;"></i> 2º
                <?php elseif ($index === 2): ?>
                  <i class="fa-solid fa-trophy" style="color: #e67e22; font-size: 1.1rem;"></i> 3º
                <?php else: ?>
                  <?= ($index + 1) ?>º
                <?php endif; ?>
              </td>
              <td style="font-weight: 600;">
                <?= htmlspecialchars($pos['nome']) ?>
              </td>
              <td style="text-align: center;">
                <?= $pos['total_quizzes'] ?>
              </td>
              <td style="text-align: center;">
                <?= $pos['total_acertos'] ?>
              </td>
              <td style="text-align: center; font-weight: 700; color: var(--forest-green);">
                <?= $pos['media_pontuacao'] ?>%
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php endif; ?>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>