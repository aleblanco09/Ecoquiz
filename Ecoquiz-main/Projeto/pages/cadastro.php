<?php

session_start();

if (!empty($_SESSION['usuario_id'])) {
    header('Location: index.php');
    exit;
}

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../repository/UsuarioRepository.php';

$erro = '';
$sucesso = '';
$nomeFormulario = $_POST['nome'] ?? '';
$emailFormulario = $_POST['email'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $senha = $_POST['senha'] ?? '';

    if ($nome === '' || $email === '' || $senha === '') {
        $erro = 'Preencha todos os campos para continuar.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erro = 'Por favor, insira um e-mail válido.';
    } else {
        $repo = new UsuarioRepository();
        
        if ($repo->buscarPorEmail($email)) {
            $erro = 'Este e-mail já está cadastrado na plataforma BioVerde.';
        } else {
            $tokenAtivacao = bin2hex(random_bytes(32));

            if ($repo->cadastrar($nome, $email, $senha, $tokenAtivacao)) {
                $linkSimulado = "verificar.php?token=" . $tokenAtivacao;
                $sucesso = "Cadastro realizado com sucesso! Como este ambiente é de testes, utilize o botão abaixo para confirmar a ativação do seu acesso institucional: <br><br><a href='$linkSimulado' class='btn btn-primary' style='display:inline-block; text-decoration:none;'>Ativar Conta Institucional</a>";
            } else {
                $erro = 'Erro ao processar o cadastro. Tente novamente em instantes.';
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Cadastro de Colaborador — BioVerde Preservação Ambiental</title>
  <link rel="stylesheet" href="../assets/style.css" />
</head>
<body class="login-body">

<div class="login-card">
  <div class="login-logo">BIOVERDE</div>
  <h1 class="login-title">Solicitar Acesso Institucional</h1>

  <?php if ($erro !== ''): ?>
    <div class="alert alert-erro"><?= htmlspecialchars($erro) ?></div>
  <?php endif; ?>

  <?php if ($sucesso !== ''): ?>
    <div class="alert alert-sucesso" style="background: #e6f4ea; border: 1px solid #1e8e3e; padding: 15px; border-radius: 4px; margin-bottom: 25px; font-size: 0.9rem; line-height: 1.4; color: #137333;">
        <?= $sucesso ?>
    </div>
  <?php endif; ?>

  <?php if ($sucesso === ''): ?>
  <form method="POST" action="cadastro.php">
    <div class="form-group">
      <label for="nome">Nome Completo</label>
      <input
        type="text"
        id="nome"
        name="nome"
        placeholder="Ex: Carlos Eduardo Silva"
        value="<?= htmlspecialchars($nomeFormulario) ?>"
        required
      />
    </div>

    <div class="form-group">
      <label for="email">E-mail Institucional</label>
      <input
        type="email"
        id="email"
        name="email"
        placeholder="seu.nome@bioverde.org"
        value="<?= htmlspecialchars($emailFormulario) ?>"
        required
      />
    </div>

    <div class="form-group">
      <label for="senha">Chave de Segurança</label>
      <input
        type="password"
        id="senha"
        name="senha"
        placeholder="Crie uma senha segura"
        required
      />
    </div>

    <button type="submit" class="btn btn-primary btn-full">Finalizar Cadastro</button>
  </form>
  <?php endif; ?>

  <div class="login-hint" style="margin-top: 20px; text-align: center; font-size: 0.85rem;">
    <a href="login.php">Já possui uma conta? Realizar login</a>
  </div>
</div>

</body>
</html>