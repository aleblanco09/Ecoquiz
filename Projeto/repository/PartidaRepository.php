<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Partida.php';

class PartidaRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function listarPartidas(): array {
        $stmt = $this->pdo->prepare('SELECT * FROM partidas');
        $stmt->execute();

        $lista = [];

        foreach ($stmt->fetchAll() as $dados) {
            $lista[] = new Partida($dados);
        }

        return $lista;
    }
}