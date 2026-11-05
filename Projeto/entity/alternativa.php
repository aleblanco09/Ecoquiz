<?php

class Alternativa {

    private int    $id;
    private int    $questao_id;
    private string $letra;
    private string $texto;
    private int    $correta;

    public function __construct(array $dados) {
        $this->id         = (int) ($dados['id']         ?? 0);
        $this->questao_id = (int) ($dados['questao_id'] ?? 0);
        $this->letra      =        $dados['letra']      ?? '';
        $this->texto      =        $dados['texto']      ?? '';
        $this->correta    = (int) ($dados['correta']    ?? 0);
    }

    public function getId():         int    { return $this->id; }
    public function getQuestaoId():  int    { return $this->questao_id; }
    public function getLetra():      string { return $this->letra; }
    public function getTexto():      string { return $this->texto; }
    public function getCorreta():    int    { return $this->correta; }
}