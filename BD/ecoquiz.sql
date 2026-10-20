-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/10/2026 às 03:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecoquiz`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alternativas`
--

CREATE TABLE `alternativas` (
  `id` int(11) NOT NULL,
  `questao_id` int(11) NOT NULL,
  `letra` char(1) NOT NULL,
  `texto` text NOT NULL,
  `correta` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alternativas`
--

INSERT INTO `alternativas` (`id`, `questao_id`, `letra`, `texto`, `correta`) VALUES
(1, 1, 'a', 'Dinossauro Argentinosaurus', 0),
(2, 1, 'b', 'Elefante-africano', 0),
(3, 1, 'c', 'Baleia-azul', 1),
(4, 1, 'd', 'Tubarão-megalodonte', 0),
(5, 2, 'a', 'Girassol', 0),
(6, 2, 'b', 'Vênus-captura-moscas', 1),
(7, 2, 'c', 'Cacto', 0),
(8, 2, 'd', 'Vitória-régia', 0),
(9, 3, 'a', 'Lagostas', 0),
(10, 3, 'b', 'Polvos', 1),
(11, 3, 'c', 'Medusas', 0),
(12, 3, 'd', 'Anêmonas', 0),
(13, 4, 'a', 'Seiva das árvores', 0),
(14, 4, 'b', 'Pólen puro', 0),
(15, 4, 'c', 'Néctar das flores', 1),
(16, 4, 'd', 'Água da chuva', 0),
(17, 5, 'a', 'Esquilo-voador', 0),
(18, 5, 'b', 'Lêmure-voador', 0),
(19, 5, 'c', 'Morcego', 1),
(20, 5, 'd', 'Pterodáctilo', 0),
(21, 6, 'a', 'Absorção de radiação UV do sol durante o dia', 0),
(22, 6, 'b', 'Fenômeno químico chamado bioluminescência', 1),
(23, 6, 'c', 'Reflexão da luz da lua em suas escamas', 0),
(24, 6, 'd', 'Presença de eletricidade estática acumulada', 0),
(25, 7, 'a', 'Através de uma rede micorrízica de fungos associados às raízes', 1),
(26, 7, 'b', 'Por meio de impulsos magnéticos nas rochas', 0),
(27, 7, 'c', 'Pela secreção de líquidos ácidos pelo caule', 0),
(28, 7, 'd', 'Por vibrações mecânicas emitidas pelas raízes', 0),
(29, 8, 'a', 'Iguana-verde', 0),
(30, 8, 'b', 'Camaleão', 1),
(31, 8, 'c', 'Dragão-de-komodo', 0),
(32, 8, 'd', 'Gecko', 0),
(33, 9, 'a', 'Poluição por óleo em alto-mar', 0),
(34, 9, 'b', 'Erupção vulcânica subaquática', 0),
(35, 9, 'c', 'Proliferação excessiva de certas microalgas tóxicas', 1),
(36, 9, 'd', 'Aquecimento repentino das correntes marítimas', 0),
(37, 10, 'a', 'Beija-flor', 1),
(38, 10, 'b', 'Andorinha', 0),
(39, 10, 'c', 'Pica-pau', 0),
(40, 10, 'd', 'Martim-pescador', 0),
(41, 11, 'a', 'Visão infravermelha', 0),
(42, 11, 'b', 'Percepção de campos elétricos pela pele', 0),
(43, 11, 'c', 'Olfato aguçado a longas distâncias', 0),
(44, 11, 'd', 'Ecolocalização (emissão de ondas sonoras)', 1),
(45, 12, 'a', 'Seu metabolismo reduz drasticamente para economizar energia', 1),
(46, 12, 'b', 'Eles mudam de pele e trocam de pelos diariamente', 0),
(47, 12, 'c', 'Entram em estado de decomposição temporária', 0),
(48, 12, 'd', 'Mantêm o mesmo consumo de calorias com reservas armazenadas na toca', 0),
(49, 13, 'a', 'Consegue regenerar o cérebro inteiro em menos de 24 horas', 0),
(50, 13, 'b', 'Consegue sobreviver no vácuo do espaço e a temperaturas próximas ao zero absoluto através da criptobiose', 1),
(51, 13, 'c', 'Tem a capacidade de reverter seu ciclo biológico e ser biologicamente imortal', 0),
(52, 13, 'd', 'Produz veneno capaz de neutralizar qualquer outro veneno conhecido', 0),
(53, 14, 'a', 'Ser a criatura mais venenosa dos oceanos', 0),
(54, 14, 'b', 'Viver exclusivamente em água doce congelada', 0),
(55, 14, 'c', 'Não possuir DNA em suas células', 0),
(56, 14, 'd', 'Conseguir retornar ao estágio de pólipo jovem, atingindo uma espécie de \"imortalidade biológica\"', 1),
(57, 15, 'a', 'A alteração de comportamento reprodutivo para enganar predadores', 0),
(58, 15, 'b', 'A capacidade de um animal se parecer com folhas ou pedras', 0),
(59, 15, 'c', 'Quando duas ou mais espécies nocivas/tóxicas compartilham sinais de advertência semelhantes para reforçar a eficácia do padrão', 1),
(60, 15, 'd', 'Quando uma espécie inofensiva imita a aparência de uma espécie perigosa', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `partidas`
--

CREATE TABLE `partidas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  `tempo_segundos` int(11) DEFAULT NULL,
  `pontuacao_total` int(11) DEFAULT 0,
  `concluida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `questoes`
--

CREATE TABLE `questoes` (
  `id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL,
  `enunciado` text NOT NULL,
  `nivel` enum('facil','medio','dificil') NOT NULL,
  `pontos` int(11) NOT NULL,
  `explicacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `questoes`
--

INSERT INTO `questoes` (`id`, `tema_id`, `enunciado`, `nivel`, `pontos`, `explicacao`) VALUES
(1, 1, 'Qual é o maior animal que já existiu na Terra?', 'facil', 1, 'A baleia-azul é o maior animal conhecido que já existiu, podendo atingir dimensões superiores às dos maiores dinossauros.'),
(2, 1, 'Qual destas plantas é carnívora e captura insetos fechando suas folhas rapidamente?', 'facil', 1, 'A Vênus-captura-moscas possui folhas modificadas que se fecham rapidamente quando um inseto estimula seus pelos sensoriais.'),
(3, 1, 'Qual é o grupo de animais invertebrados conhecido por possuir oito tentáculos?', 'facil', 1, 'Os polvos são moluscos cefalópodes que possuem oito tentáculos.'),
(4, 1, 'O que as abelhas utilizam principalmente para fabricar o mel?', 'facil', 1, 'As abelhas coletam o néctar das flores e o transformam em mel por meio de processos enzimáticos e da redução de água.'),
(5, 1, 'Qual é o único mamífero capaz de voar de forma ativa?', 'facil', 1, 'O morcego é o único mamífero capaz de realizar voo ativo, usando suas asas para gerar sustentação e se deslocar pelo ar.'),
(6, 1, 'Por que alguns fungos e organismos marinhos brilham no escuro?', 'medio', 5, 'Eles produzem luz por meio de reações químicas chamadas de bioluminescência.'),
(7, 1, 'Como as árvores de uma floresta conseguem \"comunicar-se\" e trocar nutrientes entre si sob o solo?', 'medio', 5, 'As árvores podem se conectar por meio de redes micorrízicas formadas por fungos associados às suas raízes, permitindo a troca de nutrientes e sinais químicos.'),
(8, 1, 'Qual réptil é famoso por mudar de cor para se camuflar, se comunicar e regular a temperatura corpórea?', 'medio', 5, 'O camaleão consegue alterar sua coloração por meio de células especializadas da pele, auxiliando na comunicação, camuflagem e regulação térmica.'),
(9, 1, 'O que é o fenômeno da \"Maré Vermelha\"?', 'medio', 5, 'É a proliferação excessiva de certas microalgas, algumas das quais produzem toxinas que podem prejudicar organismos marinhos.'),
(10, 1, 'Qual pássaro é famoso por conseguir voar para trás e bater as asas dezenas de vezes por segundo?', 'medio', 5, 'O beija-flor possui asas adaptadas para movimentos extremamente rápidos, permitindo inclusive que ele voe para trás.'),
(11, 1, 'Como os golfinhos e morcegos navegam e encontram suas presas na escuridão?', 'medio', 5, 'Eles utilizam a ecolocalização, emitindo sons e analisando os ecos para identificar obstáculos e localizar presas.'),
(12, 1, 'O que acontece com os ursos e alguns mamíferos no inverno durante o processo de hibernação?', 'medio', 5, 'Durante a hibernação, o metabolismo é reduzido drasticamente, diminuindo o gasto de energia durante o período de baixa disponibilidade de alimento.'),
(13, 1, 'O animal conhecido como Tardígrado (ou urso-d’água) é famoso por qual característica extrema?', 'dificil', 10, 'O tardígrado consegue sobreviver a condições extremas, como temperaturas próximas de zero absoluto e o vácuo do espaço, entrando em um estado chamado criptobiose.'),
(14, 1, 'A água-viva da espécie Turritopsis dohrnii é biologicamente notável por:', 'dificil', 10, 'Essa espécie consegue retornar ao estágio de pólipo jovem por meio de um processo de rejuvenescimento, podendo reiniciar seu ciclo de vida.'),
(15, 1, 'O que é a \"mimetização mulleriana\" observada no reino animal?', 'dificil', 10, 'É quando duas ou mais espécies perigosas ou nocivas compartilham padrões de aparência semelhantes para reforçar o sinal de advertência aos predadores.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas_usuario`
--

CREATE TABLE `respostas_usuario` (
  `id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `questao_id` int(11) NOT NULL,
  `tentativas` int(11) DEFAULT 0,
  `acertou` tinyint(1) DEFAULT 0,
  `pontos_ganhos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `temas`
--

CREATE TABLE `temas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `temas`
--

INSERT INTO `temas` (`id`, `nome`) VALUES
(1, 'Curiosidades da Natureza'),
(2, 'Energias Renováveis'),
(3, 'Água Doce e Oceanos'),
(4, 'Consumo Consciente e Pegada de Carbono'),
(5, 'Reciclagem'),
(6, 'Desastres Ambientais'),
(7, 'Mudanças Climáticas'),
(8, 'Biomas do Brasil'),
(9, 'Animais em Extinção'),
(10, 'Cálculos de Impacto Ambiental');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `criado_em`, `senha`) VALUES
(1, 'adm', 'adm@email.com', '2026-09-29 01:15:44', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questao_id` (`questao_id`);

--
-- Índices de tabela `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `questoes`
--
ALTER TABLE `questoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tema_id` (`tema_id`);

--
-- Índices de tabela `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partida_id` (`partida_id`),
  ADD KEY `questao_id` (`questao_id`);

--
-- Índices de tabela `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questoes`
--
ALTER TABLE `questoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `temas`
--
ALTER TABLE `temas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `alternativas_ibfk_1` FOREIGN KEY (`questao_id`) REFERENCES `questoes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `partidas`
--
ALTER TABLE `partidas`
  ADD CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `questoes`
--
ALTER TABLE `questoes`
  ADD CONSTRAINT `questoes_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `temas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  ADD CONSTRAINT `respostas_usuario_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respostas_usuario_ibfk_2` FOREIGN KEY (`questao_id`) REFERENCES `questoes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
