<?php
require_once __DIR__ . '/../repository/UsuarioRepository.php';

$repo = new UsuarioRepository();

if (isset($_POST['email']) || isset($_POST['senha']) || isset($_POST['nomeUsuario'])) {

    $email = $_POST['email'];
    $senhaNormal = $_POST['senha'];
    $senhaHash = hash('sha256', $senhaNormal);
    $nomeUsuario = $_POST['nomeUsuario'];

    $repo->criarUsuario($email, $senhaHash, $nomeUsuario);

    header('Location: index.php');
    exit;
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
                <input type="email" id="email" name="email" required>

                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>

                <label for="nomeUsuario">Nome:</label>
                <input type="text" id="nomeUsuario" name="nomeUsuario" required>

                <button type="submit">Criar conta</button>

            </form>

        </div>

    </main>

</body>
</html>