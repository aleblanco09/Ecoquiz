<?php
require_once __DIR__ . '/../repository/UsuarioRepository.php';
$repo=new UsuarioRepository();
if(isset($_POST['email']) || isset($_POST['senha']) || isset($_POST['nomeUsuario']))
    {
        $email=$_POST['email'];
        $senhaNormal=$_POST['senha'];
        $senhaHash = hash('sha256', $senhaNormal);
        $nomeUsuario=$_POST['nomeUsuario'];
        $repo->criarUsuario($email,$senhaHash,$nomeUsuario);
        header('Location: index.php');
        exit;
    }
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar conta</title>
</head>
<body>
    <h2>Criar conta:</h2>
    <form action="cadastrar.php" method="POST">
<p>E-mail:</p><input type="text" name="email" required/>
<p>Senha:</p><input type="text" name="senha" required/>
<p>Nome:</p><input type="text" name="nomeUsuario" required/>
<button type="submit">Criar</button>
</form>
</body>
</html>