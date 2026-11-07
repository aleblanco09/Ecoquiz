<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Questao.php';

class QuestaoRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function listarQuestoes(): array {
        $stmt = $this->pdo->prepare('SELECT * FROM questoes');
        $stmt->execute();

        $lista = [];

        foreach ($stmt->fetchAll() as $dados) {
            $lista[] = new Questao($dados);
        }

        return $lista;
    }
    public function listarQuestoesPorTema(int $temaId): array {
    $stmt = $this->pdo->prepare(
        'SELECT * FROM questoes WHERE tema_id = :tema_id'
    );

    $stmt->bindValue(':tema_id', $temaId, PDO::PARAM_INT);
    $stmt->execute();

    $lista = [];

    foreach ($stmt->fetchAll() as $dados) {
        $lista[] = new Questao($dados);
    }

    return $lista;
}
}