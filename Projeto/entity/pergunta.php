<?php

class Pergunta
{
    private ?int $id;
    private ?int $categoriaId;
    private string $enunciado;
    private string $opcaoA;
    private string $opcaoB;
    private string $opcaoC;
    private string $opcaoD;
    private string $respostaCorreta;

    public function __construct(
        ?int $id,
        ?int $categoriaId,
        string $enunciado,
        string $opcaoA,
        string $opcaoB,
        string $opcaoC,
        string $opcaoD,
        string $respostaCorreta
    ) {
        $this->id = $id;
        $this->categoriaId = $categoriaId;
        $this->enunciado = $enunciado;
        $this->opcaoA = $opcaoA;
        $this->opcaoB = $opcaoB;
        $this->opcaoC = $opcaoC;
        $this->opcaoD = $opcaoD;
        $this->respostaCorreta = $respostaCorreta;
    }

    public function getId(): ?int { return $this->id; }
    public function getCategoriaId(): ?int { return $this->categoriaId; }
    public function getEnunciado(): string { return $this->enunciado; }
    public function getOpcaoA(): string { return $this->opcaoA; }
    public function getOpcaoB(): string { return $this->opcaoB; }
    public function getOpcaoC(): string { return $this->opcaoC; }
    public function getOpcaoD(): string { return $this->opcaoD; }
    public function getRespostaCorreta(): string { return $this->respostaCorreta; }
}