
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

    public function registrarResposta(
        int $partidaId,
        int $questaoId,
        bool $acertou,
        int $pontosGanhos
    ): void {

        $stmt = $this->pdo->prepare(
            'INSERT INTO respostas_usuario
             (partida_id, questao_id, tentativas, acertou, pontos_ganhos)
             VALUES (:partida_id, :questao_id, 1, :acertou, :pontos)'
        );

        $stmt->bindValue(':partida_id', $partidaId);
$stmt->bindValue(':questao_id', $questaoId);
$stmt->bindValue(':acertou', $acertou ? 1 : 0);
$stmt->bindValue(':pontos', $pontosGanhos);

        $stmt->execute();
    }
}
