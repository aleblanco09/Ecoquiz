<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/header.php';

global $pdo;

$usuarioId = $_SESSION['usuario_id'];
$nomeUsuario = $_SESSION['usuario_nome'] ?? 'Colaborador';

$stmtUserStats = $pdo->prepare("
    SELECT 
        COUNT(id) AS total_quizzes,
        COALESCE(SUM(acertos), 0) AS total_acertos,
        COALESCE(ROUND(AVG(pontuacao)), 0) AS media_aproveitamento
    FROM ambiental_resultados 
    WHERE usuario_id = :usuario_id
");
$stmtUserStats->execute([':usuario_id' => $usuarioId]);
$minhasEstatisticas = $stmtUserStats->fetch();

$stmtPosicao = $pdo->query("
    SELECT u.id, ROUND(AVG(r.pontuacao)) AS media
    FROM ambiental_usuarios u
    INNER JOIN ambiental_resultados r ON u.id = r.usuario_id
    GROUP BY u.id
    ORDER BY media DESC, SUM(r.acertos) DESC
");
$rankingGeral = $stmtPosicao->fetchAll();

$posicaoRanking = '-';
foreach ($rankingGeral as $index => $pos) {
    if ($pos['id'] == $usuarioId) {
        $posicaoRanking = ($index + 1) . 'º';
        break;
    }
}
?>

<div class="page-header">
  <div>
    <h2>Painel do Colaborador</h2>
    <p style="color: var(--muted); font-size: 0.95rem; margin-top: 4px;">
      Bem-vindo de volta, <strong><?= htmlspecialchars($nomeUsuario) ?></strong>!
    </p>
  </div>
  <a href="quiz.php" class="btn btn-primary">
    <i class="fa-solid fa-play"></i> Iniciar EcoQuiz
  </a>
</div>

<div class="card-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; margin-bottom: 32px;">
  
  <div class="form-card" style="margin: 0; padding: 20px; text-align: center;">
    <i class="fa-solid fa-gamepad" style="font-size: 2rem; color: var(--leaf-green); margin-bottom: 10px;"></i>
    <span style="display: block; font-size: 0.85rem; color: var(--muted); text-transform: uppercase; font-weight: 600;">Quizzes Concluídos</span>
    <div style="font-size: 2.2rem; font-weight: 800; color: var(--forest-green); margin-top: 4px;">
      <?= $minhasEstatisticas['total_quizzes'] ?>
    </div>
  </div>

  <div class="form-card" style="margin: 0; padding: 20px; text-align: center;">
    <i class="fa-solid fa-circle-check" style="font-size: 2rem; color: var(--leaf-green); margin-bottom: 10px;"></i>
    <span style="display: block; font-size: 0.85rem; color: var(--muted); text-transform: uppercase; font-weight: 600;">Média de Acertos</span>
    <div style="font-size: 2.2rem; font-weight: 800; color: var(--forest-green); margin-top: 4px;">
      <?= $minhasEstatisticas['media_aproveitamento'] ?>%
    </div>
  </div>

  <div class="form-card" style="margin: 0; padding: 20px; text-align: center;">
    <i class="fa-solid fa-trophy" style="font-size: 2rem; color: var(--leaf-green); margin-bottom: 10px;"></i>
    <span style="display: block; font-size: 0.85rem; color: var(--muted); text-transform: uppercase; font-weight: 600;">Posição no Ranking</span>
    <div style="font-size: 2.2rem; font-weight: 800; color: var(--forest-green); margin-top: 4px;">
      <?= $posicaoRanking ?>
    </div>
  </div>

</div>

<h3 style="color: var(--forest-green); margin-bottom: 16px;">Módulos e Gestão</h3>

<div class="card-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px;">
  
  <div class="form-card" style="margin: 0; max-width: 100%;">
    <h4 style="color: var(--forest-green); margin-bottom: 8px;">
      <i class="fa-solid fa-tree"></i> Áreas Preservadas
    </h4>
    <p style="margin-bottom: 16px; color: var(--muted); font-size: 0.9rem;">
      Gerencie o registo e a monitorização de unidades de conservação ambiental.
    </p>
    <a href="areas.php" class="btn btn-full">Gerir Áreas</a>
  </div>

  <div class="form-card" style="margin: 0; max-width: 100%;">
    <h4 style="color: var(--forest-green); margin-bottom: 8px;">
      <i class="fa-solid fa-ranking-star"></i> Ranking de Preservação
    </h4>
    <p style="margin-bottom: 16px; color: var(--muted); font-size: 0.9rem;">
      Acompanhe a pontuação geral dos colaboradores no quiz institucional.
    </p>
    <a href="ranking.php" class="btn btn-full">Ver Classificação</a>
  </div>

  <div class="form-card" style="margin: 0; max-width: 100%;">
    <h4 style="color: var(--forest-green); margin-bottom: 8px;">
      <i class="fa-solid fa-clock-rotate-left"></i> Histórico do Quiz
    </h4>
    <p style="margin-bottom: 16px; color: var(--muted); font-size: 0.9rem;">
      Consulte as suas tentativas passadas, pontuações e datas de conclusão.
    </p>
    <a href="historico.php" class="btn btn-full">Acessar Histórico</a>
  </div>

</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>