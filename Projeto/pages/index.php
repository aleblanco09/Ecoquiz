
<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';

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
</head>
<body>

    <h1><?=$nomeUser?></h1>

    <h2>Temas</h2>

    <?php foreach ($temas as $tema): ?>

        <a href="iniciar.php?id=<?=$tema->getIdTema()?>">

            <img src="<?=$tema->getCapa()?>" 
                 alt="<?=$tema->getNomeTema()?>" 
                 width="200">

            <br>

            <?=$tema->getNomeTema()?>

        </a>

        <br><br>

    <?php endforeach; ?>

    <a href="logout.php">Sair</a>

</body>
</html>
