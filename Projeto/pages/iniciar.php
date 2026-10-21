<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';

if (isset($_GET['id'])) {
    $id = (int) $_GET['id'];
}
$repo = new TemaRepository();
$temas = $repo->listarTemas();?>
<?php foreach ($temas as $tema): ?>
        <?php if($tema->getIdTema()==$id){echo "<h2>".$tema->getNomeTema()."</h2>";echo "<br><br>";}?>
        <?php endforeach; ?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de início</title>
</head>
<body>
    <form action="quiz.php" method="post">

        <label>
            Deseja iniciar o quiz sobre <?=$tema->getNomeTema()."?"?>
        </label>
        <br><br>

        <button type="submit">Iniciar</button>
    </form>
</body>
</html>