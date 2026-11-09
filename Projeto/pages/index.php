<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';
require_once __DIR__ . '/../includes/header.php';

$nomeUser = $_SESSION['usuario_nome'];

$repo = new TemaRepository();
$temas = $repo->listarTemas();
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página principal</title>

    <link rel="stylesheet" href="../assets/style.css">
</head>
<body>

    

    <h2>Temas</h2>

    <div class="temas">

        <?php foreach ($temas as $tema): ?>

            <a class="tema" href="iniciar.php?id=<?=$tema->getIdTema()?>">

                <img src="<?=$tema->getCapa()?>" 
                     alt="<?=$tema->getNomeTema()?>">

                <p><?=$tema->getNomeTema()?></p>

            </a>

        <?php endforeach; ?>

    </div>

    <a href="logout.php">Sair</a>

</body>
</html>
