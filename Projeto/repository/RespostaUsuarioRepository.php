<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/RespostaUsuario.php';

class RespostaUsuarioRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function listarRespostasUsuario(): array {
        $stmt = $this->pdo->prepare('SELECT * FROM respostas_usuario');
        $stmt->execute();

        $lista = [];

        foreach ($stmt->fetchAll() as $dados) {
            $lista[] = new RespostaUsuario($dados);
        }

        return $lista;
    }
}