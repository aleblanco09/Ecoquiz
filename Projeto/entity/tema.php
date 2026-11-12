
<?php

class Tema {
    private int $id;
    private string $nome;
    private string $capa;

    public function __construct(array $dados) {
        $this->id = (int) ($dados['id'] ?? 0);
        $this->nome = $dados['nome'] ?? '';
        $this->capa = $dados['capa'] ?? '';
    }

    public function getIdTema(): int {
        return $this->id;
    }

    public function getNomeTema(): string {
        return $this->nome;
    }

    public function getCapa(): string {
        return $this->capa;
    }
}
