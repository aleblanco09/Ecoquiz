<?php

class RespostaUsuario {

    private int $id;
    private int $partida_id;
    private int $questao_id;
    private int $tentativas;
    private int $acertou;
    private int $pontos_ganhos;

    public function __construct(array $dados) {
        $this->id            = (int) ($dados['id']            ?? 0);
        $this->partida_id    = (int) ($dados['partida_id']    ?? 0);
        $this->questao_id    = (int) ($dados['questao_id']    ?? 0);
        $this->tentativas    = (int) ($dados['tentativas']    ?? 0);
        $this->acertou       = (int) ($dados['acertou']       ?? 0);
        $this->pontos_ganhos = (int) ($dados['pontos_ganhos'] ?? 0);
    }

    public function getId():           int { return $this->id; }
    public function getPartidaId():    int { return $this->partida_id; }
    public function getQuestaoId():    int { return $this->questao_id; }
    public function getTentativas():   int { return $this->tentativas; }
    public function getAcertou():      int { return $this->acertou; }
    public function getPontosGanhos(): int { return $this->pontos_ganhos; }
}