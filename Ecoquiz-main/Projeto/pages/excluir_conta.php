<?php

require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

$erro = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $senha = $_POST['senha'] ?? '';
    $usuarioId = $_SESSION['usuario_id'];

    if ($senha === '') {
        $erro = 'Digite sua senha para confirmar a exclusão.';
    } else {
        global $pdo;

        $stmt = $pdo->prepare('SELECT senha FROM ambiental_usuarios WHERE id = :id LIMIT 1');
        $stmt->execute([':id' => $usuarioId]);
        $usuario = $stmt->fetch();

        if ($usuario && hash('sha256', $senha) === $usuario['senha']) {
            $delete = $pdo->prepare('DELETE FROM ambiental_usuarios WHERE id = :id');
            $delete->execute([':id' => $usuarioId]);

            session_unset();
            session_destroy();

            header('Location: login.php');
            exit;
        } else {
            $erro = 'Senha incorreta. Não foi possível excluir a conta.';
        }
    }
}

require_once __DIR__ . '/../includes/header.php';
?>

<div class="page-header">
  <h2>Excluir Conta Institucional</h2>
</div>

<div class="form-card" style="max-width: 500px;">
  <div class="alert alert-erro" style="margin-bottom: 20px;">
    <strong>Atenção:</strong> Esta ação é irreversível. Todos os seus dados de acesso serão removidos do sistema.
  </div>

  <?php if ($erro !== ''): ?>
    <div class="alert alert-erro"><?= htmlspecialchars($erro) ?></div>
  <?php endif; ?>

  <form method="POST" action="excluir_conta.php">
    <div class="form-group">
      <label for="senha">Confirme sua Chave de Segurança (Senha)</label>
      <input type="password" id="senha" name="senha" placeholder="Digite sua senha atual" required />
    </div>

    <div style="display: flex; gap: 10px; margin-top: 20px;">
      <button type="submit" class="btn" style="background-color: var(--alert-red); color: #ffffff; border-color: var(--alert-red);" onclick="return confirm('Tem certeza absoluta que deseja excluir sua conta?');">Excluir Minha Conta</button>
      <a href="index.php" class="btn">Cancelar</a>
    </div>
  </form>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>