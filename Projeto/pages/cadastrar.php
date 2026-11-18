<?php
require_once __DIR__ . '/../repository/UsuarioRepository.php';

$repo = new UsuarioRepository();
$erro="";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (empty($_POST['email']) || empty($_POST['senha']) || empty($_POST['nomeUsuario'])) {
        $erro = "Preencha todos os campos!";
    }
    else if (strlen($_POST['senha']) < 4) {
        $erro = "A senha deve ter pelo menos 4 caracteres!";
    }
    else if (strlen($_POST['nomeUsuario']) < 2) {
        $erro = "Nome de usuário muito curto!";
    }
    else if ($repo->buscarPorNome($_POST['nomeUsuario']) !== null) {
    $erro = "Este nome de usuário já está em uso!";
}
    else if ($repo->buscarPorEmail($_POST['email']) !== null) {
    $erro = "Este e-mail já está cadastrado!";}
    else {

        $email = $_POST['email'];
        $senhaNormal = $_POST['senha'];
        $senhaHash = hash('sha256', $senhaNormal);
        $nomeUsuario = $_POST['nomeUsuario'];

        $repo->criarUsuario($email, $senhaHash, $nomeUsuario);

        header('Location: index.php');
        exit;
    }
}

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar conta - Ecoquiz</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>

<body class="cadastro-body">

    <main class="cadastro-page">

        <div class="cadastro-card">

            <h2>Criar conta</h2>

            <form action="cadastrar.php" method="POST">

                <label for="email">E-mail:</label>
                <input type="email" id="email" name="email">

                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha">

                <label for="nomeUsuario">Nome:</label>
                <input type="text" id="nomeUsuario" name="nomeUsuario">

                <button type="submit">Criar conta</button>
                <a href="login.php" class="cadastro-voltar">Voltar para o login</a>

            </form>
<?php if ($erro != ""): ?>
    <p><?=$erro?></p>
<?php endif; ?>
        </div>

    </main>

</body>
</html>