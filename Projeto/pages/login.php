<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login - EcoQuiz</title>
    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>
    <div class="quiz-container login-box">
        <h1>Entrar no EcoQuiz</h1>
        
        <form action="valida_login.php" method="POST">
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="senha">Palavra-passe</label>
                <input type="password" id="senha" name="senha" required>
            </div>

            <button type="submit">Entrar</button>
        </form>
        
        <p class="login-footer">
            Ainda não tem conta? <a href="cadastro.php">Registe-se aqui</a>
        </p>
    </div>
</body>
</html>