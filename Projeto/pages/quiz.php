<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/header.php';

global $pdo;

$stmtCategorias = $pdo->query("
    SELECT c.*, COUNT(p.id) AS total_perguntas 
    FROM ambiental_categorias c 
    LEFT JOIN ambiental_perguntas p ON c.id = p.categoria_id 
    GROUP BY c.id 
    HAVING total_perguntas > 0 
    ORDER BY c.nome ASC
");
$categorias = $stmtCategorias->fetchAll();

$stmtTotal = $pdo->query("SELECT COUNT(*) FROM ambiental_perguntas");
$totalGeralPerguntas = $stmtTotal->fetchColumn();
?>

<div class="page-header">
  <h2>EcoQuiz — Desafio Ambiental</h2>
</div>

<div class="form-card" style="max-width: 800px; margin-bottom: 30px;">
  <h3 style="color: var(--forest-green); margin-bottom: 10px;">
    <i class="fa-solid fa-leaf"></i> Teste os seus Conhecimentos
  </h3>
  <p style="color: var(--muted); margin-bottom: 20px;">
    Selecione um dos módulos abaixo para iniciar o seu questionário de preservação ambiental. Responda com atenção para pontuar no ranking da instituição.
  </p>

  <?php if ($totalGeralPerguntas == 0): ?>
    <div class="empty-state">
      <p>Nenhuma pergunta cadastrada no sistema no momento. Aguarde o cadastro pelo administrador.</p>
    </div>
  <?php else: ?>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 16px;">
      
      <div class="form-card" style="margin: 0; padding: 20px; text-align: center; border-color: var(--leaf-green);">
        <h4 style="color: var(--forest-green); margin-bottom: 8px;">
          <i class="fa-solid fa-shuffle"></i> Quiz Geral
        </h4>
        <p style="font-size: 0.85rem; color: var(--muted); margin-bottom: 15px;">
          Perguntas aleatórias de todas as categorias ativas.
        </p>
        <a href="responder.php?modo=geral" class="btn btn-primary btn-full">Iniciar Quiz Geral</a>
      </div>

      <?php foreach ($categorias as $cat): ?>
        <div class="form-card" style="margin: 0; padding: 20px; text-align: center;">
          <h4 style="color: var(--forest-green); margin-bottom: 8px;">
            <i class="fa-solid fa-folder"></i> <?= htmlspecialchars($cat['nome']) ?>
          </h4>
          <p style="font-size: 0.85rem; color: var(--muted); margin-bottom: 15px;">
            <?= htmlspecialchars($cat['total_perguntas']) ?> pergunta(s) disponível(eis)
          </p>
          <a href="responder.php?categoria_id=<?= $cat['id'] ?>" class="btn btn-full">Jogar Módulo</a>
        </div>
      <?php endforeach; ?>

    </div>
  <?php endif; ?>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>