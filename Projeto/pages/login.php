<?php

session_start();

if (!empty($_SESSION['usuario_id'])) {
    header('Location: index.php');
    exit;
}

require_once __DIR__ . '/../config/database.php'; 
require_once __DIR__ . '/../repository/UsuarioRepository.php';

$erro = '';
$emailFormulario = $_POST['email'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $senha = $_POST['senha'] ?? '';

    if ($email === '' || $senha === '') {
        $erro = 'Preencha todos os campos para continuar.';
    } else {
        $repo    = new UsuarioRepository();
        $usuario = $repo->buscarPorEmail($email);

        if ($usuario && hash('sha256', $senha) === $usuario->getSenha()) {
            
            if ($usuario->getContaAtiva() === 0) {
                $erro = 'Sua conta ainda não foi ativada. Verifique as instruções enviadas para o seu e-mail.';
            } else {
                $_SESSION['usuario_id']   = $usuario->getId();
                $_SESSION['usuario_nome'] = $usuario->getNome();

                header('Location: index.php');
                exit;
            }
            
        } else {
            $erro = 'E-mail ou senha incorretos.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Acesso ao Sistema — BioVerde Preservação Ambiental</title>
  <link rel="stylesheet" href="../assets/style.css" />
</head>
<body class="login-body">

<div class="login-card">
  <div class="login-logo">BIOVERDE</div>
  <h1 class="login-title">Portal Ambiental — Autenticação</h1>

  <?php if ($erro !== ''): ?>
    <div class="alert alert-erro"><?= htmlspecialchars($erro) ?></div>
  <?php endif; ?>

  <form method="POST" action="login.php">
    <div class="form-group">
      <label for="email">E-mail Institucional</label>
      <input type="email" id="email" name="email" value="<?= htmlspecialchars($emailFormulario) ?>" placeholder="seu.nome@bioverde.org" required />
    </div>

    <div class="form-group">
      <label for="senha">Chave de Segurança</label>
      <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required />
    </div>

    <button type="submit" class="btn btn-primary btn-full">Acessar Painel</button>
  </form>

  <div class="login-hint" style="margin-top: 20px; display: flex; justify-content: space-between; font-size: 0.85rem;">
    <a href="cadastro.php">Solicitar Cadastro</a>
    <a href="esqueci_senha.php" style="color: var(--ink-soft);">Recuperar Acesso</a>
  </div>
</div>

</body>
</html>