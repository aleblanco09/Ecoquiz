<?php


require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Usuario.php';

class UsuarioRepository {

    private PDO $pdo;

    public function __construct() {
        $this->pdo = getConexao();
    }

    public function buscarPorEmail(string $email): ?Usuario {
        $stmt = $this->pdo->prepare('SELECT * FROM usuarios WHERE email = :email LIMIT 1');
        $stmt->execute([':email' => $email]);
        $dados = $stmt->fetch();

        if ($dados) {
            return new Usuario($dados);
        }

        return null;
    }
    public function criarUsuario(string $email, string $senha,string $nome){
        $stmt = $this->pdo->prepare('INSERT INTO usuarios (email,senha,nome) VALUES (:email,:senha,:nomeU)');
        $stmt->execute([':email'=>$email,':senha'=>$senha,':nomeU'=>$nome]);
    }
    }
    