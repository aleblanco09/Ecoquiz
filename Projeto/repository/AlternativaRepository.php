<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Alternativa.php';

class AlternativaRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function listarAlternativas(): array {
        $stmt = $this->pdo->prepare('SELECT * FROM alternativas');
        $stmt->execute();

        $lista = [];

        foreach ($stmt->fetchAll() as $dados) {
            $lista[] = new Alternativa($dados);
        }

        return $lista;
    }


public function listarAlternativasPorQuestao(int $questaoId): array {
    $stmt = $this->pdo->prepare(
        'SELECT * FROM alternativas WHERE questao_id = :questao_id ORDER BY letra ASC'
    );

    $stmt->bindValue(':questao_id', $questaoId, PDO::PARAM_INT);
    $stmt->execute();

    $lista = [];

    foreach ($stmt->fetchAll() as $dados) {
        $lista[] = new Alternativa($dados);
    }

    return $lista;
}

}