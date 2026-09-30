<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Tema.php';

class TemaRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function listarTemas(): array {
        $stmt = $this->pdo->prepare('SELECT * FROM temas');
        $stmt->execute();
        $lista = [];
        foreach ($stmt->fetchAll() as $dados) {
            $lista[] = new Tema($dados);
        }
        return $lista;
    }

        return null;
    }