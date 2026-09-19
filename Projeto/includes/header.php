<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>BioVerde - Gestão Ambiental</title>
  <link rel="stylesheet" href="../assets/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>

<header class="site-header">
  <div class="header-inner">
    <a href="../pages/index.php" class="logo">
      <i class="fa-solid fa-leaf"></i> BioVerde
    </a>

    <nav class="nav">
      <a href="../pages/index.php"><i class="fa-solid fa-tree"></i> Áreas Preservadas</a>
      <a href="../pages/residuos.php"><i class="fa-solid fa-recycle"></i> Resíduos</a>
      <a href="../pages/relatorios.php"><i class="fa-solid fa-chart-line"></i> Relatórios</a>
      <a href="../pages/area_create.php" class="nav-highlight"><i class="fa-solid fa-plus"></i> Nova Área</a>
    </nav>

    <div class="header-user">
      <?php
        // Garante que a sessão está ativa para não dar erro de Notice
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $nomeUser = $_SESSION['usuario_nome'] ?? 'Colaborador';
      ?>
      <span class="user-name">
        <i class="fa-solid fa-user-check"></i> <?= htmlspecialchars($nomeUser) ?>
      </span>
      <a href="../pages/logout.php" class="btn-logout"><i class="fa-solid fa-right-from-bracket"></i> Sair</a>
    </div>
  </div>
</header>

<main class="container">