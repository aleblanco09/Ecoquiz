<?php
require_once __DIR__ . '/../config/database.php';

$token = $_GET['token'] ?? '';
$erro = '';
$sucesso = '';

if (empty($token)) {
    die("Token de recuperação ausente.");
}

global $pdo;

$stmt = $pdo->prepare("SELECT id FROM ambiental_usuarios WHERE token_recuperacao = :token AND recuperacao_expira_em > NOW()");
$stmt->execute(['token' => $token]);
$usuario = $stmt->fetch();

if (!$usuario) {
    die("Este link de recuperação expirou ou é inexistente. Solicite uma nova redefinição.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $novaSenha = $_POST['senha'] ?? '';
    
    if (strlen($novaSenha) < 4) {
        $erro = "A nova chave de acesso precisa ter pelo menos 4 caracteres.";
    } else {
        $senhaHash = hash('sha256', $novaSenha);
        
        $update = $pdo->prepare("UPDATE ambiental_usuarios SET senha = :senha, token_recuperacao = NULL, recuperacao_expira_em = NULL WHERE id = :id");
        $update->execute([
            'senha' => $senhaHash,
            'id'    => $usuario['id']
        ]);
        
        $sucesso = "Chave de acesso redefinida com sucesso.";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Redefinir Senha — BioVerde Preservação Ambiental</title>
  <link rel="stylesheet" href="../assets/style.css">
</head>
<body class="login-body">

<div class="login-card">
  <div class="login-logo">BIOVERDE</div>
  <h1 class="login-title">Criar Nova Chave de Acesso</h1>

  <?php if ($erro !== ''): ?>
    <div class="alert alert-erro"><?= htmlspecialchars($erro) ?></div>
  <?php endif; ?>

  <?php if ($sucesso !== ''): ?>
    <div class="alert alert-sucesso">
        <?= $sucesso ?>
    </div>
    <a href="login.php" class="btn btn-primary btn-full" style="text-align:center; display:block; margin-top: 15px;">Acessar a Tela de Login</a>
  <?php else: ?>

  <form method="POST" action="redefinir_senha.php?token=<?= htmlspecialchars($token) ?>">
    <div class="form-group">
      <label for="senha">Nova Senha</label>
      <input type="password" id="senha" name="senha" required placeholder="Digite sua nova senha">
    </div>
    <button type="submit" class="btn btn-primary btn-full">Salvar Nova Senha</button>
  </form>
  <?php endif; ?>
</div>

</body>
</html>