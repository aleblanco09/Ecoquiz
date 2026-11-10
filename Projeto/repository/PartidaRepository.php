
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

    public function criarPartida(int $usuarioId): int {
        $stmt = $this->pdo->prepare(
            'INSERT INTO partidas (usuario_id, inicio)
             VALUES (:usuario_id, NOW())'
        );

        $stmt->bindValue(':usuario_id', $usuarioId, PDO::PARAM_INT);
        $stmt->execute();

        return (int) $this->pdo->lastInsertId();
    }

    public function finalizarPartida(int $id, int $pontuacao, int $tempo): void {
        $stmt = $this->pdo->prepare(
            'UPDATE partidas
             SET fim = NOW(),
                 tempo_segundos = :tempo,
                 pontuacao_total = :pontuacao,
                 concluida = 1
             WHERE id = :id'
        );

        $stmt->bindValue(':tempo', $tempo, PDO::PARAM_INT);
        $stmt->bindValue(':pontuacao', $pontuacao, PDO::PARAM_INT);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);

        $stmt->execute();
    }
}
