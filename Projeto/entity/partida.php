<?php

class Partida {

    private int    $id;
    private int    $usuario_id;
    private string $inicio;
    private ?string $fim;
    private ?int   $tempo_segundos;
    private int    $pontuacao_total;
    private int    $concluida;

    public function __construct(array $dados) {
        $this->id              = (int) ($dados['id']              ?? 0);
        $this->usuario_id      = (int) ($dados['usuario_id']      ?? 0);
        $this->inicio          =        $dados['inicio']          ?? '';
        $this->fim             =        $dados['fim']             ?? null;
        $this->tempo_segundos  = isset($dados['tempo_segundos']) ? (int) $dados['tempo_segundos'] : null;
        $this->pontuacao_total = (int) ($dados['pontuacao_total'] ?? 0);
        $this->concluida       = (int) ($dados['concluida']       ?? 0);
    }

    public function getId():              int     { return $this->id; }
    public function getUsuarioId():       int     { return $this->usuario_id; }
    public function getInicio():          string  { return $this->inicio; }
    public function getFim():             ?string { return $this->fim; }
    public function getTempoSegundos():   ?int    { return $this->tempo_segundos; }
    public function getPontuacaoTotal():  int     { return $this->pontuacao_total; }
    public function getConcluida():       int     { return $this->concluida; }
}