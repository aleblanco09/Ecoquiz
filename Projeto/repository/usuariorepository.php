
<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Usuario.php';

class UsuarioRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function buscarPorEmail(string $email): ?Usuario {

        $stmt = $this->pdo->prepare(
            'SELECT * FROM usuarios WHERE email = :email LIMIT 1'
        );

        $stmt->execute([':email' => $email]);

        $dados = $stmt->fetch();

        if ($dados) {
            return new Usuario($dados);
        }

        return null;
    }

    public function criarUsuario(string $email, string $senha, string $nome) {

        $stmt = $this->pdo->prepare(
            'INSERT INTO usuarios (email, senha, nome)
             VALUES (:email, :senha, :nomeU)'
        );

        $stmt->execute([
            ':email' => $email,
            ':senha' => $senha,
            ':nomeU' => $nome
        ]);
    }

    public function listarRankingPorTema(int $temaId): array {

        $stmt = $this->pdo->prepare(
            'SELECT
                usuarios.id AS usuario_id,
                usuarios.nome,
                partidas.id AS partida_id,
                partidas.pontuacao_total,
                partidas.tempo_segundos

             FROM partidas

             INNER JOIN usuarios
                ON usuarios.id = partidas.usuario_id

             WHERE partidas.concluida = 1
             AND partidas.tempo_segundos IS NOT NULL

             AND EXISTS (
                SELECT 1
                FROM respostas_usuario

                INNER JOIN questoes
                    ON questoes.id = respostas_usuario.questao_id

                WHERE respostas_usuario.partida_id = partidas.id
                AND questoes.tema_id = :tema_id
             )

             ORDER BY
                partidas.pontuacao_total DESC,
                partidas.tempo_segundos ASC,
                usuarios.nome ASC,
                partidas.id ASC'
        );

        $stmt->bindValue(':tema_id', $temaId, PDO::PARAM_INT);
        $stmt->execute();

        $partidas = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $ranking = [];
        $usuariosAdicionados = [];

        foreach ($partidas as $partida) {

            $id = (int) $partida['usuario_id'];

            // Adiciona somente a melhor partida de cada usuário
            if (!isset($usuariosAdicionados[$id])) {

                $ranking[] = $partida;

                $usuariosAdicionados[$id] = true;
            }
        }

        return $ranking;
    }
}
