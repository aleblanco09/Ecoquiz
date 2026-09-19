<?php

class Resultado
{
    private ?int $id;
    private int $usuarioId;
    private ?int $categoriaId;
    private int $pontuacao;
    private int $acertos;
    private int $totalPerguntas;
    private ?string $criadoEm;

    public function __construct(
        ?int $id,
        int $usuarioId,
        ?int $categoriaId,
        int $pontuacao,
        int $acertos,
        int $totalPerguntas,
        ?string $criadoEm = null
    ) {
        $this->id = $id;
        $this->usuarioId = $usuarioId;
        $this->categoriaId = $categoriaId;
        $this->pontuacao = $pontuacao;
        $this->acertos = $acertos;
        $this->totalPerguntas = $totalPerguntas;
        $this->criadoEm = $criadoEm;
    }

    public function getId(): ?int { return $this->id; }
    public function getUsuarioId(): int { return $this->usuarioId; }
    public function getCategoriaId(): ?int { return $this->categoriaId; }
    public function getPontuacao(): int { return $this->pontuacao; }
    public function getAcertos(): int { return $this->acertos; }
    public function getTotalPerguntas(): int { return $this->totalPerguntas; }
    public function getCriadoEm(): ?string { return $this->criadoEm; }
}