1. Tabela de Temas
CREATE TABLE temas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Tabela de Questões
CREATE TABLE questoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tema_id INT NOT NULL,
    enunciado TEXT NOT NULL,
    nivel ENUM('facil', 'medio', 'dificil') NOT NULL,
    pontos INT NOT NULL, -- 5 para fácil, 10 para médio, 20 para difícil
    explicacao TEXT NOT NULL,
    FOREIGN KEY (tema_id) REFERENCES temas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Tabela de Alternativas (A, B, C, D, E)
CREATE TABLE alternativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    questao_id INT NOT NULL,
    letra CHAR(1) NOT NULL, -- 'A', 'B', 'C', 'D', 'E'
    texto TEXT NOT NULL,
    correta BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (questao_id) REFERENCES questoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Tabela de Usuários / Jogadores
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. Tabela de Partidas (Acompanha o tempo total de 20 min)
CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    inicio DATETIME NOT NULL,
    fim DATETIME NULL,
    tempo_segundos INT NULL, -- Usado para o critério de desempate
    pontuacao_total INT DEFAULT 0,
    concluida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. Tabela de Respostas do Usuário (Controla as 2 tentativas por questão)
CREATE TABLE respostas_usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partida_id INT NOT NULL,
    questao_id INT NOT NULL,
    tentativas INT DEFAULT 0, -- Máximo 2
    acertou BOOLEAN DEFAULT FALSE,
    pontos_ganhos INT DEFAULT 0,
    FOREIGN KEY (partida_id) REFERENCES partidas(id) ON DELETE CASCADE,
    FOREIGN KEY (questao_id) REFERENCES questoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserindo os 10 Temas
INSERT INTO temas (nome) VALUES 
('Curiosidades da Natureza'),
('Energias Renováveis'),
('Água Doce e Oceanos'),
('Consumo Consciente e Pegada de Carbono'),
('Reciclagem'),
('Desastres Ambientais'),
('Mudanças Climáticas'),
('Biomas do Brasil'),
('Animais em Extinção'),
('Cálculos de Impacto Ambiental');