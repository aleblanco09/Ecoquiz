<?php

class Area
{
    private ?int $id;
    private string $nome;
    private string $localizacao;
    private float $tamanhoHectares;

    public function __construct(?int $id, string $nome, string $localizacao, float $tamanhoHectares)
    {
        $this->id = $id;
        $this->nome = $nome;
        $this->localizacao = $localizacao;
        $this->tamanhoHectares = $tamanhoHectares;
    }

    public function getId(): ?int { return $this->id; }
    public function getNome(): string { return $this->nome; }
    public function getLocalizacao(): string { return $this->localizacao; }
    public function getTamanhoHectares(): float { return $this->tamanhoHectares; }

    public function setNome(string $nome): void { $this->nome = $nome; }
    public function setLocalizacao(string $localizacao): void { $this->localizacao = $localizacao; }
    public function setTamanhoHectares(float $tamanhoHectares): void { $this->tamanhoHectares = $tamanhoHectares; }
}