<?php

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../entity/Area.php';

class AreaRepository
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function buscarTodas(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM ambiental_areas ORDER BY nome ASC");
        $dados = $stmt->fetchAll();

        $areas = [];
        foreach ($dados as $d) {
            $areas[] = new Area(
                (int)$d['id'],
                $d['nome'],
                $d['localizacao'],
                (float)$d['tamanho_hectares']
            );
        }

        return $areas;
    }

    public function salvar(Area $area): bool
    {
        if ($area->getId() !== null) {
            $stmt = $this->pdo->prepare("
                UPDATE ambiental_areas 
                SET nome = :nome, localizacao = :localizacao, tamanho_hectares = :tamanho 
                WHERE id = :id
            ");
            return $stmt->execute([
                ':nome' => $area->getNome(),
                ':localizacao' => $area->getLocalizacao(),
                ':tamanho' => $area->getTamanhoHectares(),
                ':id' => $area->getId()
            ]);
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO ambiental_areas (nome, localizacao, tamanho_hectares) 
                VALUES (:nome, :localizacao, :tamanho)
            ");
            return $stmt->execute([
                ':nome' => $area->getNome(),
                ':localizacao' => $area->getLocalizacao(),
                ':tamanho' => $area->getTamanhoHectares()
            ]);
        }
    }

    public function deletar(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM ambiental_areas WHERE id = :id");
        return $stmt->execute([':id' => $id]);
    }
}