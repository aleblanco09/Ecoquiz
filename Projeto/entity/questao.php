<?php

class Questao {

    private int $id;
    private int $temaId;
    private string $enunciado;
    private string $nivel; 
    private int $pontos;
    private string $explicacao;

    public function __construct(array $dados) {
        $this->id = (int) ($dados['id'] ?? 0);
        $this->temaId = (int) ($dados['tema_id'] ?? 0);
        $this->enunciado = $dados['enunciado'] ?? '';
        $this->nivel = $dados['nivel'] ?? '';
        $this->pontos = (int) ($dados['pontos'] ?? 0);
        $this->explicacao = $dados['explicacao'] ?? '';
    }

    public function getId(): int { return $this->id; }
    public function getTemaId(): int { return $this->temaId; }
    public function getEnunciado(): string { return $this->enunciado; }
    public function getNivel(): string { return $this->nivel; }
    public function getPontos(): int { return $this->pontos; } 
    public function getExplicacao(): string { return $this->explicacao; } 
}