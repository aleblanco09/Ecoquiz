<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';
$nomeUser = $_SESSION['usuario_nome'];
echo "<h1>".$nomeUser."</h1>";
$repo = new TemaRepository();
$temas = $repo->listarTemas();?>
<h2>Temas</h2>
<?php foreach ($temas as $tema): ?>
          
            
            
            
            <a href="responder.php?id=<?= $tema->getIdTema() ?>"><?=$tema->getNomeTema()?></a>
            <?= "<br><br>";?>
        <?php endforeach; ?>
<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página principal</title>
</head>
<body>
<a href="logout.php">Sair</a>
</body>
</html>