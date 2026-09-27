<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/header.php';

global $pdo;

$stmt = $pdo->prepare("
    SELECT 
        r.*, 
        c.nome AS categoria_nome 
    FROM ambiental_resultados r 
    LEFT JOIN ambiental_categorias c ON r.categoria_id = c.id 
    WHERE r.usuario_id = :usuario_id 
    ORDER BY r.criado_em DESC
");
$stmt->execute([':usuario_id' => $_SESSION['usuario_id']]);
$historico = $stmt->fetchAll();
?>

<div class="page-header">
  <h2>EcoQuiz — Meu Histórico de Desempenho</h2>
  <a href="quiz.php" class="btn btn-primary">
    <i class="fa-solid fa-play"></i> Novo Questionário
  </a>
</div>

<div class="form-card" style="max-width: 900px; margin: 0 auto;">
  <p style="color: var(--muted); margin-bottom: 20px; text-align: center;">
    Acompanhe a sua evolução e os resultados obtidos em todas as avaliações realizadas.
  </p>

  <?php if (empty($historico)): ?>
    <div class="empty-state">
      <p>Ainda não concluiu nenhum questionário. Aceda ao módulo de Quiz para testar os seus conhecimentos!</p>
    </div>
  <?php else: ?>
    <div class="table-wrapper">
      <table class="data-table">
        <thead>
          <tr>
            <th>Data / Hora</th>
            <th>Módulo / Categoria</th>
            <th style="text-align: center;">Acertos</th>
            <th style="text-align: center;">Aproveitamento</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($historico as $item): ?>
            <tr>
              <td>
                <i class="fa-regular fa-calendar" style="color: var(--muted); margin-right: 6px;"></i>
                <?= date('d/m/Y H:i', strtotime($item['criado_em'])) ?>
              </td>
              <td style="font-weight: 600;">
                <?= htmlspecialchars($item['categoria_nome'] ?? 'Quiz Geral') ?>
              </td>
              <td style="text-align: center;">
                <?= $item['acertos'] ?> de <?= $item['total_perguntas'] ?>
              </td>
              <td style="text-align: center; font-weight: 700;">
                <span style="
                  padding: 4px 10px; 
                  border-radius: var(--radius); 
                  background: <?= $item['pontuacao'] >= 70 ? 'var(--moss-soft)' : 'var(--alert-red-soft)' ?>; 
                  color: <?= $item['pontuacao'] >= 70 ? 'var(--forest-green)' : 'var(--alert-red)' ?>;
                ">
                  <?= $item['pontuacao'] ?>%
                </span>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php endif; ?>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>