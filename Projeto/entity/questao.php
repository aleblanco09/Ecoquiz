<?php

class Questao {

    private int    $id;
    private int $temaId;
    private string $enunciado;
    private int $nivel;
    private int $pontos;
    private string $explicacao;

    public function __construct(array $dados) {
        $this->id = (int) ($dados['id'] ?? 0);
        $this->temaId = $dados['temaid'] ?? '';
        $this->enunciado = $dados['enunciado'] ?? '';
        $this->nivel = $dados['nivel'] ?? '';
        $this->pontos = $dados['pontos'] ?? '';
        $this->explicacao = $dados['explicacao'] ?? '';
    }

    public function getId():       int    { return $this->id; }
    public function getTemaId():     int { return $this->temaId; }
    public function getEnunciado():    string { return $this->enunciado; }
    public function getNivel():    int { return $this->nivel; }
    public function getPontos(): int{return $this->enunciado}
    public function getExplicacao(): string{return $this->explicacao}
}