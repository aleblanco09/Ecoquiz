<?php
require_once __DIR__ . '/../config/database.php';

$token = $_GET['token'] ?? '';

if (empty($token)) {
    die("Token de validação ausente.");
}

global $pdo;

$stmt = $pdo->prepare("SELECT id FROM ambiental_usuarios WHERE token_ativacao = :token");
$stmt->execute(['token' => $token]);
$usuario = $stmt->fetch();

require_once __DIR__ . '/../includes/header.php';
?>

<div class="container" style="max-width: 600px; margin: 50px auto; text-align: center;">
    <div class="form-card" style="align-items: center; display: flex; flex-direction: column;">
        <?php if ($usuario): ?>
            <?php
            $update = $pdo->prepare("UPDATE ambiental_usuarios SET conta_ativa = 1, token_ativacao = NULL WHERE id = :id");
            $update->execute(['id' => $usuario['id']]);
            ?>
            <h2 style="font-family: inherit; color: var(--forest-green, #137333);">Conta Ativada com Sucesso</h2>
            <p style="margin: 15px 0;">Sua solicitação de acesso ao Portal BioVerde foi confirmada.</p>
            <a href="login.php" class="btn btn-primary">Acessar a Tela de Login</a>
        <?php else: ?>
            <h2 style="font-family: inherit; color: var(--ink, #202124);">Link Inválido ou Expirado</h2>
            <p style="margin: 15px 0;">Este código de validação já foi utilizado, expirou ou é inexistente.</p>
            <a href="cadastro.php" class="btn btn-ghost">Solicitar Novo Cadastro</a>
        <?php endif; ?>
    </div>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>