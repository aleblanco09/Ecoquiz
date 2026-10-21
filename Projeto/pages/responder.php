<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

global $pdo;

$categoriaId = filter_input(INPUT_GET, 'categoria_id', FILTER_VALIDATE_INT);
$modo = $_GET['modo'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $respostasUsuario = $_POST['respostas'] ?? [];
    $totalPerguntas = count($respostasUsuario);
    $acertos = 0;
    
    if ($totalPerguntas > 0) {
        $ids = array_keys($respostasUsuario);
        $inClause = implode(',', array_fill(0, count($ids), '?'));
        
        $stmt = $pdo->prepare("SELECT id, resposta_correta FROM ambiental_perguntas WHERE id IN ($inClause)");
        $stmt->execute($ids);
        $perguntasGabarito = $stmt->fetchAll(PDO::FETCH_KEY_PAIR);

        foreach ($respostasUsuario as $perguntaId => $opcaoSelecionada) {
            if (isset($perguntasGabarito[$perguntaId]) && $perguntasGabarito[$perguntaId] === $opcaoSelecionada) {
                $acertos++;
            }
        }

        $pontuacao = round(($acertos / $totalPerguntas) * 100);

        $stmtInsert = $pdo->prepare("
            INSERT INTO ambiental_resultados (usuario_id, categoria_id, pontuacao, acertos, total_perguntas, criado_em) 
            VALUES (:usuario_id, :categoria_id, :pontuacao, :acertos, :total_perguntas, NOW())
        ");
        
        $stmtInsert->execute([
            ':usuario_id'     => $_SESSION['usuario_id'],
            ':categoria_id'   => $categoriaId ?: null,
            ':pontuacao'      => $pontuacao,
            ':acertos'        => $acertos,
            ':total_perguntas' => $totalPerguntas
        ]);

        $ultimoId = $pdo->lastInsertId();
        header("Location: resultado.php?id=" . $ultimoId);
        exit;
    }
}

if ($categoriaId) {
    $stmt = $pdo->prepare("SELECT * FROM ambiental_perguntas WHERE categoria_id = :cat_id ORDER BY RAND() LIMIT 10");
    $stmt->execute([':cat_id' => $categoriaId]);
} else {
    $stmt = $pdo->query("SELECT * FROM ambiental_perguntas ORDER BY RAND() LIMIT 10");
}

$perguntas = $stmt->fetchAll();

if (empty($perguntas)) {
    header('Location: quiz.php');
    exit;
}

require_once __DIR__ . '/../includes/header.php';
?>

<div class="page-header">
  <h2>EcoQuiz — Resposta ao Questionário</h2>
</div>

<div class="form-card" style="max-width: 800px;">
  <form method="POST" action="responder.php<?= $categoriaId ? '?categoria_id=' . $categoriaId : '?modo=geral' ?>">
    
    <?php foreach ($perguntas as $index => $pergunta): ?>
      <div style="margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid var(--border-color);">
        <p style="font-weight: 600; font-size: 1.05rem; color: var(--forest-green); margin-bottom: 12px;">
          <?= ($index + 1) ?>. <?= htmlspecialchars($pergunta['enunciado']) ?>
        </p>

        <div style="display: flex; flex-direction: column; gap: 10px;">
          <?php 
            $opcoes = [
                'A' => $pergunta['opcao_a'],
                'B' => $pergunta['opcao_b'],
                'C' => $pergunta['opcao_c'],
                'D' => $pergunta['opcao_d']
            ];
            foreach ($opcoes as $chave => $texto): 
          ?>
            <label style="display: flex; align-items: center; gap: 10px; cursor: pointer; padding: 10px 14px; background: var(--sand-beige); border-radius: var(--radius); border: 1px solid var(--border-color);">
              <input type="radio" name="respostas[<?= $pergunta['id'] ?>]" value="<?= $chave ?>" required style="width: auto;">
              <span><strong><?= $chave ?>)</strong> <?= htmlspecialchars($texto) ?></span>
            </label>
          <?php endforeach; ?>
        </div>
      </div>
    <?php endforeach; ?>

    <button type="submit" class="btn btn-primary btn-full" style="min-height: 48px; font-size: 1rem;">
      Submeter Respostas
    </button>
  </form>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>