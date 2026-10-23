<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/questao.php';

class QuestaoRepository
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function buscarAleatorias(?int $temaId = null, int $limite = 10): array
    {
        if ($temaId !== null) {
            $stmt = $this->pdo->prepare("
                SELECT * FROM questoes 
                WHERE tema_id = :tema_id 
                ORDER BY RAND() LIMIT :limite
            ");
            $stmt->bindValue(':tema_id', $temaId, PDO::PARAM_INT);
        } else {
            $stmt = $this->pdo->prepare("
                SELECT * FROM questoes 
                ORDER BY RAND() LIMIT :limite
            ");
        }

        $stmt->bindValue(':limite', $limite, PDO::PARAM_INT);
        $stmt->execute();
        $dados = $stmt->fetchAll();

        $questoes = [];
        foreach ($dados as $d) {
            $questoes[] = new Questao($d);
        }

        return $questoes;
    }

    public function buscarAlternativasPorQuestao(int $questaoId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT * FROM alternativas 
            WHERE questao_id = :questao_id 
            ORDER BY letra ASC
        ");
        $stmt->bindValue(':questao_id', $questaoId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}