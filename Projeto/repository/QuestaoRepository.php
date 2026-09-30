<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Pergunta.php';

class PerguntaRepository
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function buscarAleatorias(?int $categoriaId = null, int $limite = 10): array
    {
        if ($categoriaId !== null) {
            $stmt = $this->pdo->prepare("
                SELECT * FROM ambiental_perguntas 
                WHERE categoria_id = :categoria_id 
                ORDER BY RAND() LIMIT :limite
            ");
            $stmt->bindValue(':categoria_id', $categoriaId, PDO::PARAM_INT);
        } else {
            $stmt = $this->pdo->prepare("
                SELECT * FROM ambiental_perguntas 
                ORDER BY RAND() LIMIT :limite
            ");
        }

        $stmt->bindValue(':limite', $limite, PDO::PARAM_INT);
        $stmt->execute();
        $dados = $stmt->fetchAll();

        $perguntas = [];
        foreach ($dados as $d) {
            $perguntas[] = new Pergunta(
                (int)$d['id'],
                $d['categoria_id'] ? (int)$d['categoria_id'] : null,
                $d['enunciado'],
                $d['opcao_a'],
                $d['opcao_b'],
                $d['opcao_c'],
                $d['opcao_d'],
                $d['resposta_correta']
            );
        }

        return $perguntas;
    }

    public function buscarGabaritoPorIds(array $ids): array
    {
        if (empty($ids)) {
            return [];
        }

        $inClause = implode(',', array_fill(0, count($ids), '?'));
        $stmt = $this->pdo->prepare("SELECT id, resposta_correta FROM ambiental_perguntas WHERE id IN ($inClause)");
        $stmt->execute($ids);

        return $stmt->fetchAll(PDO::FETCH_KEY_PAIR);
    }
}