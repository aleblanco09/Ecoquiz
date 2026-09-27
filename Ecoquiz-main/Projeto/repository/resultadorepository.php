<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Resultado.php';

class ResultadoRepository
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function salvar(Resultado $resultado): int
    {
        $stmt = $this->pdo->prepare("
            INSERT INTO ambiental_resultados 
            (usuario_id, categoria_id, pontuacao, acertos, total_perguntas, criado_em) 
            VALUES (:usuario_id, :categoria_id, :pontuacao, :acertos, :total_perguntas, NOW())
        ");

        $stmt->execute([
            ':usuario_id'     => $resultado->getUsuarioId(),
            ':categoria_id'   => $resultado->getCategoriaId(),
            ':pontuacao'      => $resultado->getPontuacao(),
            ':acertos'        => $resultado->getAcertos(),
            ':total_perguntas' => $resultado->getTotalPerguntas()
        ]);

        return (int)$this->pdo->lastInsertId();
    }

    public function buscarEstatisticasUsuario(int $usuarioId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT 
                COUNT(id) AS total_quizzes,
                COALESCE(SUM(acertos), 0) AS total_acertos,
                COALESCE(ROUND(AVG(pontuacao)), 0) AS media_aproveitamento
            FROM ambiental_resultados 
            WHERE usuario_id = :usuario_id
        ");
        $stmt->execute([':usuario_id' => $usuarioId]);

        return $stmt->fetch() ?: [
            'total_quizzes' => 0,
            'total_acertos' => 0,
            'media_aproveitamento' => 0
        ];
    }

    public function buscarRankingGeral(int $limite = 20): array
    {
        $stmt = $this->pdo->prepare("
            SELECT 
                u.nome,
                COUNT(r.id) AS total_quizzes,
                SUM(r.acertos) AS total_acertos,
                ROUND(AVG(r.pontuacao)) AS media_pontuacao
            FROM ambiental_usuarios u
            INNER JOIN ambiental_resultados r ON u.id = r.usuario_id
            GROUP BY u.id
            ORDER BY media_pontuacao DESC, total_acertos DESC
            LIMIT :limite
        ");
        $stmt->bindValue(':limite', $limite, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function buscarHistoricoPorUsuario(int $usuarioId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT 
                r.*, 
                c.nome AS categoria_nome 
            FROM ambiental_resultados r 
            LEFT JOIN ambiental_categorias c ON r.categoria_id = c.id 
            WHERE r.usuario_id = :usuario_id 
            ORDER BY r.criado_em DESC
        ");
        $stmt->execute([':usuario_id' => $usuarioId]);

        return $stmt->fetchAll();
    }
}