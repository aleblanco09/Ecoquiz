<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../repository/TemaRepository.php';

if (isset($_GET['tema'])) {
    $nome = (int) $_GET['id'];
}
echo $nome;
