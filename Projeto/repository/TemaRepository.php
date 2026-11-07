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
    public function buscarPorId(int $id): ?Tema {
    $stmt = $this->pdo->prepare(
        'SELECT * FROM temas WHERE id = :id'
    );

    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $dados = $stmt->fetch();

    if (!$dados) {
        return null;
    }

    return new Tema($dados);
}
}