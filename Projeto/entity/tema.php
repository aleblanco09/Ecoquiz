<?php class Tema {
    private int    $id;
    private string $nome;
    
    public function __construct(array $dados) {
        $this->id = (int) ($dados['id'] ?? 0);
        $this->nome = $dados['nome'] ?? '';
    }

    public function getIdTema(): int { return $this->id; }
    public function getNomeTema(): string { return $this->nome; }
}