<?php
require_once __DIR__ . '/../config/database.php';

$erro = '';
$sucesso = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');

    if ($email !== '') {
        global $pdo;
        
        $stmt = $pdo->prepare("SELECT id FROM ambiental_usuarios WHERE email = :email");
        $stmt->execute(['email' => $email]);
        $usuario = $stmt->fetch();

        if ($usuario) {
            $token = bin2hex(random_bytes(32));
            $expira = date('Y-m-d H:i:s', strtotime('+30 minutes'));

            $update = $pdo->prepare("UPDATE ambiental_usuarios SET token_recuperacao = :token, recuperacao_expira_em = :expira WHERE id = :id");
            $update->execute([
                'token' => $token,
                'expira' => $expira,
                'id' => $usuario['id']
            ]);

            $link = "redefinir_senha.php?token=" . $token;
            $sucesso = "Instruções geradas! Utilize o botão abaixo para prosseguir com a redefinição de acesso: <br><br><a href='$link' class='btn btn-primary'>Redefinir Chave de Acesso</a>";
        } else {
            $erro = "E-mail não localizado na base de colaboradores.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Recuperar Acesso — BioVerde Preservação Ambiental</title>
  <link rel="stylesheet" href="../assets/style.css">
</head>
<body class="login-body">

<div class="login-card">
  <div class="login-logo">BIOVERDE</div>
  <h1 class="login-title">Recuperação de Acesso Institucional</h1>

  <?php if ($erro !== ''): ?>
    <div class="alert alert-erro"><?= htmlspecialchars($erro) ?></div>
  <?php endif; ?>

  <?php if ($sucesso !== ''): ?>
    <div class="alert alert-sucesso">
        <?= $sucesso ?>
    </div>
  <?php endif; ?>

  <?php if ($sucesso === ''): ?>
  <form method="POST" action="esqueci_senha.php">
    <div class="form-group">
      <label for="email">E-mail Institucional</label>
      <input type="email" id="email" name="email" required placeholder="seu.nome@bioverde.org">
    </div>
    <button type="submit" class="btn btn-primary btn-full">Solicitar Redefinição</button>
  </form>
  <?php endif; ?>

  <div class="login-hint" style="margin-top: 20px; text-align: center; font-size: 0.85rem;">
    <a href="login.php" style="color: var(--ink-soft);">← Voltar para o Login</a>
  </div>
</div>

</body>
</html>