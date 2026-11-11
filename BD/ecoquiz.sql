-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/11/2026 às 21:47
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
(60, 15, 'd', 'Quando uma espécie inofensiva imita a aparência de uma espécie perigosa', 0),
(61, 16, 'a', 'Solar', 0),
(62, 16, 'b', 'Eólica', 1),
(63, 16, 'c', 'Geotérmica', 0),
(64, 16, 'd', 'Biomassa', 0),
(65, 17, 'a', 'A força das marés', 0),
(66, 17, 'b', 'O calor do núcleo da Terra', 0),
(67, 17, 'c', 'O vento das montanhas', 0),
(68, 17, 'd', 'A luz do sol', 1),
(69, 18, 'a', 'Energia Nuclear', 0),
(70, 18, 'b', 'Biomassa', 1),
(71, 18, 'c', 'Maremotriz', 0),
(72, 18, 'd', 'Geotérmica', 0),
(73, 19, 'a', 'Usinas Hidrelétricas', 1),
(74, 19, 'b', 'Usinas Termelétricas a carvão', 0),
(75, 19, 'c', 'Usinas Nucleares', 0),
(76, 19, 'd', 'Painéis Solares', 0),
(77, 20, 'a', 'Sol', 0),
(78, 20, 'b', 'Vento', 0),
(79, 20, 'c', 'Petróleo', 1),
(80, 20, 'd', 'Água em movimento', 0),
(81, 21, 'a', 'O movimento das ondas do mar', 0),
(82, 21, 'b', 'O calor interno contido no interior da Terra', 1),
(83, 21, 'c', 'A queima de resíduos de madeira', 0),
(84, 21, 'd', 'A diferença de temperatura entre a atmosfera e o oceano', 0),
(85, 22, 'a', 'Intermitência (dependência de condições climáticas para gerar energia contínua)', 1),
(86, 22, 'b', 'Alta emissão de dióxido de carbono durante a operação', 0),
(87, 22, 'c', 'Esgotamento rápido dos recursos na natureza', 0),
(88, 22, 'd', 'Geração de resíduos radioativos de longa vida', 0),
(89, 23, 'a', 'Um gás extraído de poços profundos de petróleo', 0),
(90, 23, 'b', 'Uma mistura gasosa rica em metano produzida pela decomposição anaeróbica de matéria orgânica', 1),
(91, 23, 'c', 'Hidrogênio obtido pela quebra de moléculas de água com carvão', 0),
(92, 23, 'd', 'Gás sintetizado artificialmente em usinas nucleares', 0),
(93, 24, 'a', 'Utiliza o calor da superfície do oceano para evaporar água', 0),
(94, 24, 'b', 'Capta a radiação solar refletida pelas águas marítimas', 0),
(95, 24, 'c', 'Aproveita o movimento de subida e descida das marés para girar turbinas', 1),
(96, 24, 'd', 'Extrai gás natural do leito oceânico', 0),
(97, 25, 'a', 'Hidrogênio extraído diretamente de plantas e árvores', 0),
(98, 25, 'b', 'Hidrogênio produzido via eletrólise da água usando eletricidade de fontes 100% renováveis', 1),
(99, 25, 'c', 'Gás natural colorido quimicamente para indicar baixa toxicidade', 0),
(100, 25, 'd', 'Combustível fóssil refinado com adição de biocombustíveis', 0),
(101, 26, 'a', 'Emissão massiva de fuligem e enxofre na atmosfera', 0),
(102, 26, 'b', 'Contaminação por radiação na bacia hidrográfica', 0),
(103, 26, 'c', 'Destruição da camada de ozônio regional', 0),
(104, 26, 'd', 'Alagamento de grandes áreas, alterando ecossistemas e deslocando comunidades', 1),
(105, 27, 'a', 'Biocombustível', 1),
(106, 27, 'b', 'Combustível fóssil renovado', 0),
(107, 27, 'c', 'Derivado direto do petróleo', 0),
(108, 27, 'd', 'Minério energético', 0),
(109, 28, 'a', 'Efeito fotovoltaico direto nas células de silício', 0),
(110, 28, 'b', 'Espelhos (helióstatos) concentram a luz solar para aquecer um fluido que gera vapor para acionar uma turbina', 1),
(111, 28, 'c', 'Reações eletroquímicas induzidas por fótons de alta frequência', 0),
(112, 28, 'd', 'Absorção magnética de elétrons da atmosfera aquecida', 0),
(113, 29, 'a', 'A quantidade máxima de energia que ela pode armazenar em baterias', 0),
(114, 29, 'b', 'O custo financeiro por megawatt-hora produzido', 0),
(115, 29, 'c', 'A razão entre a energia efetivamente gerada em um período e a capacidade máxima teórica se operasse em potência total continuamente', 1),
(116, 29, 'd', 'O percentual de eficiência na conversão do recurso primário em calor', 0),
(117, 30, 'a', 'O custo elevado dos eletrodos/catalisadores e a perda de eficiência energética no ciclo de conversão e compressão', 1),
(118, 30, 'b', 'A inexistência de fontes de água doce suficientes', 0),
(119, 30, 'c', 'A impossibilidade de armazenar hidrogênio em tanques metálicos', 0),
(120, 30, 'd', 'O fato de a reação liberar gases estufa nocivos', 0),
(121, 31, 'a', '50%', 0),
(122, 31, 'b', '70%', 0),
(123, 31, 'c', '97%', 1),
(124, 31, 'd', '10%', 0),
(125, 32, 'a', 'Nas geleiras e calotas polares', 1),
(126, 32, 'b', 'Nos rios e lagos superficiais', 0),
(127, 32, 'c', 'Na atmosfera em forma de vapor', 0),
(128, 32, 'd', 'Nos aquíferos do deserto', 0),
(129, 33, 'a', 'Oceano Atlântico', 0),
(130, 33, 'b', 'Oceano Índico', 0),
(131, 33, 'c', 'Oceano Pacífico', 1),
(132, 33, 'd', 'Oceano Ártico', 0),
(133, 34, 'a', 'Condensação', 0),
(134, 34, 'b', 'Evaporação', 1),
(135, 34, 'c', 'Transpiração', 0),
(136, 34, 'd', 'Infiltração', 0),
(137, 35, 'a', 'Manguezal seco', 0),
(138, 35, 'b', 'Fossa abissal', 0),
(139, 35, 'c', 'Duna costeira', 0),
(140, 35, 'd', 'Recife de corais', 1),
(141, 36, 'a', 'Adição de sais minerais na água mineral engarrafada', 0),
(142, 36, 'b', 'Processo químico ou físico que retira o sal da água do mar para torná-la potável', 1),
(143, 36, 'c', 'Mistura de água doce dos rios com a água do oceano nos estuários', 0),
(144, 36, 'd', 'Congelamento da água marinha nas regiões polares', 0),
(145, 37, 'a', 'Reservatórios subterrâneos de água formados em rochas porosas e permeáveis', 1),
(146, 37, 'b', 'Rios superficiais que cortam áreas desertas', 0),
(147, 37, 'c', 'Tanques artificiais construídos para irrigação agrícola', 0),
(148, 37, 'd', 'Nuvens densas que não conseguem precipitar', 0),
(149, 38, 'a', 'Vazamento de produtos químicos agrícolas nos rios', 0),
(150, 38, 'b', 'Aumento do despejo de plásticos na costa', 0),
(151, 38, 'c', 'Absorção do excesso de dióxido de carbono (CO2) atmosférico pelas águas oceânicas', 1),
(152, 38, 'd', 'Aquecimento global reduzindo o sal da água', 0),
(153, 39, 'a', 'São locais sem vida que impedem o avanço das marés', 0),
(154, 39, 'b', 'Funcionam como berçários para diversas espécies marinhas e protegem a costa contra erosão', 1),
(155, 39, 'c', 'Filtram o sal convertendo água do mar em água doce naturalmente para a população', 0),
(156, 39, 'd', 'Impedem a formação de furacões no oceano', 0),
(157, 40, 'a', 'A camada de água logo abaixo da superfície onde ocorre a fotossíntese', 0),
(158, 40, 'b', 'A faixa de areia que fica exposta durante a maré baixa', 0),
(159, 40, 'c', 'A área onde os rios deságuam no mar', 0),
(160, 40, 'd', 'Regiões profundas dos oceanos (abaixo de 2.000 metros) caracterizadas por ausência total de luz e altas pressões', 1),
(161, 41, 'a', 'Excesso de nutrientes (como nitrogênio e fósforo) vindos de esgoto ou fertilizantes, gerando proliferação de algas e falta de oxigênio', 1),
(162, 41, 'b', 'Queda na temperatura da água que congela o fundo do lago', 0),
(163, 41, 'c', 'Redução do nível de salinidade em épocas de seca', 0),
(164, 41, 'd', 'Presença excessiva de peixes carnívoros', 0),
(165, 42, 'a', 'Restos de navios afundados', 0),
(166, 42, 'b', 'Microplásticos e detritos plásticos acumulados por correntes marítimas circulantes', 1),
(167, 42, 'c', 'Esgoto orgânico não tratado', 0),
(168, 42, 'd', 'Barris de resíduos radioativos', 0),
(169, 43, 'a', 'O movimento diário das marés impulsionado pela gravidade da Lua', 0),
(170, 43, 'b', 'A circulação global de água impulsionada por diferenças de densidade, controladas por temperatura (termo) e salinidade (halina)', 1),
(171, 43, 'c', 'O fluxo de correntes superficiais geradas unicamente pela ação dos ventos alísios', 0),
(172, 43, 'd', 'O deslocamento de água quente expelida pelas fontes hidrotermais do fundo do mar', 0),
(173, 44, 'a', 'Os corais absorvem calcário da água e ficam brancos por estresse', 0),
(174, 44, 'b', 'Bactericidas despejados no mar corroem a camada externa do tecido do coral', 0),
(175, 44, 'c', 'O estresse térmico (aumento da temperatura da água) faz com que os corais expulsem suas zooxantelas simbiontes, perdendo cor e fonte primária de energia', 1),
(176, 44, 'd', 'A falta de luz solar faz os corais acumularem sal sobre suas estruturas', 0),
(177, 45, 'a', 'Ser o maior aquífero em volume de água doce do planeta', 1),
(178, 45, 'b', 'Ser uma reserva subterrânea de água exclusivamente salobra', 0),
(179, 45, 'c', 'Estar localizado sob o bioma do Semiárido Caatinga', 0),
(180, 45, 'd', 'Possuir água a temperaturas superiores a 90°C em toda sua extensão', 0),
(181, 46, 'a', 'Comprar o máximo de produtos possível para ajudar a economia', 0),
(182, 46, 'b', 'Levar em consideração os impactos ambientais e sociais na hora de adquirir e usar produtos', 1),
(183, 46, 'c', 'Consumir apenas produtos importados de alta qualidade', 0),
(184, 46, 'd', 'Deixar de comprar alimentos frescos', 0),
(185, 47, 'a', 'Reduzir, Reutilizar e Reciclar', 1),
(186, 47, 'b', 'Reutilizar, Reclamar e Resolver', 0),
(187, 47, 'c', 'Repensar, Restaurar e Reformar', 0),
(188, 47, 'd', 'Recolher, Repartir e Reter', 0),
(189, 48, 'a', 'O tamanho da área de terra ocupada pela sua moradia', 0),
(190, 48, 'b', 'O consumo total de litros de água potável por dia', 0),
(191, 48, 'c', 'O volume de lixo plástico jogado nos oceanos', 0),
(192, 48, 'd', 'A quantidade total de gases de efeito estufa emitidos direta ou indiretamente por suas atividades', 1),
(193, 49, 'a', 'Usar o carro particular para viagens muito curtas', 0),
(194, 49, 'b', 'Optar por caminhadas, bicicleta ou transporte público', 1),
(195, 49, 'c', 'Deixar lâmpadas acesas em cômodos vazios', 0),
(196, 49, 'd', 'Comprar roupas novas semanalmente', 0),
(197, 50, 'a', 'A marca deixada pelos pés molhados no chão', 0),
(198, 50, 'b', 'O volume total de água doce utilizado para produzir os bens e serviços consumidos', 1),
(199, 50, 'c', 'A medição do sal presente na água do mar', 0),
(200, 50, 'd', 'A quantidade de chuva que cai em uma determinada região', 0),
(201, 51, 'a', 'Programas governamentais para atualizar eletrônicos antigos', 0),
(202, 51, 'b', 'A reciclagem automática de eletrodomésticos no final da vida útil', 0),
(203, 51, 'c', 'A fabricação deliberada de produtos com vida útil curta ou difícil reparo para forçar nova compra', 1),
(204, 51, 'd', 'O treinamento de consumidores para consertar seus próprios aparelhos', 0),
(205, 52, 'a', 'Legumes e hortaliças de época', 0),
(206, 52, 'b', 'Carne bovina', 1),
(207, 52, 'c', 'Arroz integral', 0),
(208, 52, 'd', 'Frutas locais', 0),
(209, 53, 'a', 'Produção rápida e de baixa qualidade de vestuário, estimulando o descarte precoce e alto consumo de recursos', 1),
(210, 53, 'b', 'Roupas térmicas de secagem rápida feitas com materiais biodegradáveis', 0),
(211, 53, 'c', 'Feiras de troca sustentável de roupas usadas em grandes cidades', 0),
(212, 53, 'd', 'Confecção de uniformes ecológicos para atletas', 0),
(213, 54, 'a', 'Descontos oferecidos em supermercados para quem leva sacola retornável', 0),
(214, 54, 'b', 'Certificados negociáveis onde cada unidade representa a não emissão ou remoção de uma tonelada de CO2', 1),
(215, 54, 'c', 'Moedas digitais emitidas por ONGs ambientais para compras locais', 0),
(216, 54, 'd', 'Impostos cobrados de pessoas físicas que consomem muita energia', 0),
(217, 55, 'a', 'Superávit ecológico', 0),
(218, 55, 'b', 'Equilíbrio de biomassa', 0),
(219, 55, 'c', 'Efeito estufa nulo', 0),
(220, 55, 'd', 'Déficit ecológico (ou overshoot)', 1),
(221, 56, 'a', 'Pois alimentos locais não utilizam água em seu cultivo', 0),
(222, 56, 'b', 'Porque reduz a necessidade de transporte de longa distância, diminuindo a emissão de gases poluentes', 1),
(223, 56, 'c', 'Porque garantem que o alimento seja 100% livre de calorias', 0),
(224, 56, 'd', 'Porque elimina totalmente a necessidade de embalagens de papel', 0),
(225, 57, 'a', 'Estratégia de marketing que cria uma falsa imagem de sustentabilidade sobre produtos ou empresas', 1),
(226, 57, 'b', 'Prática de lavar embalagens antes de enviar para a reciclagem', 0),
(227, 57, 'c', 'Reflorestamento de áreas urbanas usando tintas não tóxicas', 0),
(228, 57, 'd', 'Limpeza ecológica de oceanos usando enzimas naturais', 0),
(229, 58, 'a', 'Escopo 1 são emissões da natureza; Escopo 3 são emissões humanas', 0),
(230, 58, 'b', 'Escopo 1 são emissões diretas de fontes próprias/controladas; Escopo 3 são emissões indiretas ao longo de toda a cadeia de valor', 1),
(231, 58, 'c', 'Escopo 1 refere-se ao gás metano; Escopo 3 refere-se ao vapor de água', 0),
(232, 58, 'd', 'Escopo 1 é medido em quilos; Escopo 3 é medido em megawatts', 0),
(233, 59, 'a', 'Apenas o tempo que o produto leva para estragar na prateleira do mercado', 0),
(234, 59, 'b', 'O custo financeiro de produção dividido pelo número de funcionários da empresa', 0),
(235, 59, 'c', 'O impacto ambiental acumulado de todas as etapas, desde a extração da matéria-prima até o descarte final (do berço ao túmulo)', 1),
(236, 59, 'd', 'A quantidade de vezes que o produto pode ser vendido em brechós', 0),
(237, 60, 'a', 'Um sistema focado em eliminar resíduos e poluição desde o design, mantendo produtos e materiais em uso', 1),
(238, 60, 'b', 'Um sistema que proíbe o uso de moedas físicas para evitar desperdício de papel', 0),
(239, 60, 'c', 'Uma estratégia de mercado onde os preços dos produtos sobem e descem conforme a estação do ano', 0),
(240, 60, 'd', 'O comércio exclusivo feito entre países do mesmo hemisfério', 0),
(241, 61, 'a', 'Vermelho', 0),
(242, 61, 'b', 'Azul', 1),
(243, 61, 'c', 'Amarelo', 0),
(244, 61, 'd', 'Verde', 0),
(245, 62, 'a', 'Amarelo', 0),
(246, 62, 'b', 'Marrom', 0),
(247, 62, 'c', 'Vermelho', 1),
(248, 62, 'd', 'Cinza', 0),
(249, 63, 'a', 'Garrafas de refrigerante', 0),
(250, 63, 'b', 'Potes de conserva', 0),
(251, 63, 'c', 'Espelhos e lâmpadas', 1),
(252, 63, 'd', 'Frascos de perfume de vidro transparente', 0),
(253, 64, 'a', 'Lixeira vermelha de plástico', 0),
(254, 64, 'b', 'Lixeira marrom de orgânicos', 0),
(255, 64, 'c', 'Enterrado no quintal', 0),
(256, 64, 'd', 'Ponto de entrega voluntária (PEV) ou coleta especial de eletroeletrônicos', 1),
(257, 65, 'a', 'Queima controlada de plásticos para gerar energia', 0),
(258, 65, 'b', 'Processo biológico de decomposição de matéria orgânica que a transforma em adubo natural', 1),
(259, 65, 'c', 'Trituração de vidros para fabricação de areia sintética', 0),
(260, 65, 'd', 'Lavagem industrial de latas de alumínio', 0),
(261, 66, 'a', 'Pode ser reciclado infinitas vezes sem perder suas propriedades e economiza cerca de 95% de energia em relação à produção primária', 1),
(262, 66, 'b', 'Transforma-se em plástico biodegradável após derretido', 0),
(263, 66, 'c', 'Não precisa de calor para ser derretido novamente', 0),
(264, 66, 'd', 'Dissolve-se naturalmente na água em poucos dias', 0),
(265, 67, 'a', 'Cinza', 0),
(266, 67, 'b', 'Roxo', 0),
(267, 67, 'c', 'Marrom', 1),
(268, 67, 'd', 'Laranja', 0),
(269, 68, 'a', 'Pequenos recipientes plásticos usados em laboratórios', 0),
(270, 68, 'b', 'Partículas de plástico menores que 5 milímetros resultantes da degradação de plásticos maiores ou produtos sintéticos', 1),
(271, 68, 'c', 'Plásticos biodegradáveis feitos de amido de milho', 0),
(272, 68, 'd', 'Fios plásticos usados na sutura de cirurgias médicas', 0),
(273, 69, 'a', 'Porque eles rasgam muito fácil na máquina', 0),
(274, 69, 'b', 'Porque fibras contaminadas com óleos/dejetos inviabilizam a reciclagem química do papel e contaminam o lote', 1),
(275, 69, 'c', 'Porque eles mudam de cor ao entrar em contato com a água', 0),
(276, 69, 'd', 'Porque já são feitos de plástico', 0),
(277, 70, 'a', 'Três árvores verde-escuro em círculo', 0),
(278, 70, 'b', 'Uma gota d’água dentro de um sol', 0),
(279, 70, 'c', 'Três setas que formam um triângulo no ciclo de Möbius', 1),
(280, 70, 'd', 'Uma mão segurando o planeta Terra', 0),
(281, 71, 'a', 'Apenas fiscalizar a contaminação nos aterros sanitários', 0),
(282, 71, 'b', 'Coletar, triar e destinar a maior parte dos resíduos recicláveis do país, atuando como agentes centrais da logística reversa', 1),
(283, 71, 'c', 'Fabricar os maquinários de trituração de vidros', 0),
(284, 71, 'd', 'Cobrar impostos sobre as indústrias poluidoras', 0),
(285, 72, 'a', 'Transportar mercadorias apenas durante a noite para evitar trânsito', 0),
(286, 72, 'b', 'O envio de lixo reciclável para outros países de continente diferente', 0),
(287, 72, 'c', 'A troca de embalagens plásticas por papel no momento da venda', 0),
(288, 72, 'd', 'Instrumento que responsabiliza fabricantes, importadores e distribuidores pelo recolhimento e destinação adequada dos produtos pós-consumo', 1),
(289, 73, 'a', 'O plástico ganha peso a cada ciclo de derretimento', 0),
(290, 73, 'b', 'Ocorre a degradação térmica e mecânica das cadeias poliméricas, reduzindo a qualidade e resistência do material (downcycling)', 1),
(291, 73, 'c', 'O plástico reciclado torna-se altamente inflamável à temperatura ambiente', 0),
(292, 73, 'd', 'Torna-se impossível tingir o plástico com cores diferentes', 0),
(293, 74, 'a', 'Processos industriais (como pirólise ou despolimerização) que quebram os polímeros plásticos de volta aos seus monômeros básicos', 1),
(294, 74, 'b', 'Misturar plástico com detergente para remover o cheiro ruim', 0),
(295, 74, 'c', 'O uso de bactérias para comer metal em aterros', 0),
(296, 74, 'd', 'A dissolução do vidro em ácidos fortes para fazer tinta', 0),
(297, 75, 'a', 'Ser o mais fácil e barato de ser reciclado em qualquer cooperativa', 0),
(298, 75, 'b', 'Ser composto 100% por alumínio prensado', 0),
(299, 75, 'c', 'Ser uma mistura de diferentes resinas ou polímeros complexos, tornando a sua reciclagem mecânica muito difícil ou inviável comercialmente', 1),
(300, 75, 'd', 'Dissolver-se completamente na água do mar em poucas horas', 0),
(301, 76, 'a', 'Plataformas de petróleo', 0),
(302, 76, 'b', 'Barragens de rejeitos', 1),
(303, 76, 'c', 'Aquedutos de água potável', 0),
(304, 76, 'd', 'Usinas nucleares', 0),
(305, 77, 'a', 'Nuclear/Radioativo', 1),
(306, 77, 'b', 'Com vazamento de óleo no oceano', 0),
(307, 77, 'c', 'De rompimento de barragem hidrelétrica', 0),
(308, 77, 'd', 'De queimada florestal descontrolada', 0),
(309, 78, 'a', 'Chuva ácida no continente', 0),
(310, 78, 'b', 'Derramamento de petróleo no mar', 1),
(311, 78, 'c', 'Nuvem tóxica de gás cloro', 0),
(312, 78, 'd', 'Tsunami artificial', 0),
(313, 79, 'a', 'Tsunami', 0),
(314, 79, 'b', 'Maremoto', 0),
(315, 79, 'c', 'Terremoto', 0),
(316, 79, 'd', 'Incêndio florestal', 1),
(317, 80, 'a', 'Aves migratórias', 0),
(318, 80, 'b', 'Peixes e organismos aquáticos', 1),
(319, 80, 'c', 'Mamíferos terrestres de grande porte', 0),
(320, 80, 'd', 'Insetos voadores das caatingas', 0),
(321, 81, 'a', 'Explosão de um reator nuclear de pesquisas', 0),
(322, 81, 'b', 'Descarte e manipulação inadequados de um aparelho médico de radioterapia abandonado', 1),
(323, 81, 'c', 'Vazamento de gás em uma fábrica de fertilizantes', 0),
(324, 81, 'd', 'Queda de um satélite com material radioativo', 0),
(325, 82, 'a', 'Isótopos de urânio enriquecido', 0),
(326, 82, 'b', 'Mercúrio líquido no rio principal da cidade', 0),
(327, 82, 'c', 'Isocianato de metila (gás extremamente tóxico) de uma fábrica de pesticidas', 1),
(328, 82, 'd', 'Esgoto sem tratamento no lençol freático', 0),
(329, 83, 'a', 'Chumbo', 0),
(330, 83, 'b', 'Mercúrio', 1),
(331, 83, 'c', 'Cobre', 0),
(332, 83, 'd', 'Lítio', 0),
(333, 84, 'a', 'Arsênio', 0),
(334, 84, 'b', 'Radiação gama', 0),
(335, 84, 'c', 'Defensivos agrícolas à base de fósforo', 0),
(336, 84, 'd', 'Metilmercúrio despejado no mar por uma indústria química', 1),
(337, 85, 'a', 'Desertos costeiros', 0),
(338, 85, 'b', 'Recifes de corais e manguezais', 1),
(339, 85, 'c', 'Matas de Araucária', 0),
(340, 85, 'd', 'Floresta de Coníferas', 0),
(341, 86, 'a', 'Aumento da fertilidade da terra para plantio de trigo', 0),
(342, 86, 'b', 'Degradação da terra em regiões áridas e semiáridas, com perda de produtividade biológica e econômica', 1),
(343, 86, 'c', 'Transformação do solo em floresta tropical densa', 0),
(344, 86, 'd', 'Acúmulo de neve durante as noites', 0),
(345, 87, 'a', 'Um forte terremoto seguido por um tsunami que interrompeu a energia dos sistemas de resfriamento', 1),
(346, 87, 'b', 'Erro humano operacional durante um teste de segurança', 0),
(347, 87, 'c', 'Um ataque de mísseis durante um conflito', 0),
(348, 87, 'd', 'Queda de um meteoro sobre o reator', 0),
(349, 88, 'a', 'O solo seca rapidamente e vira pó com o vento', 0),
(350, 88, 'b', 'Um solo saturado com água perde sua resistência ao cisalhamento devido a tensões rápidas, comportando-se temporariamente como um fluido denso', 1),
(351, 88, 'c', 'Rochas subterrâneas entram em fusão devido ao calor vulcânico', 0),
(352, 88, 'd', 'A água do mar evapora deixando crostas de sal espessas', 0),
(353, 89, 'a', 'Explosões subterrâneas de testes nucleares soviéticos', 0),
(354, 89, 'b', 'Aquecimento vulcânico do leito do mar que evaporou a água', 0),
(355, 89, 'c', 'Desvio massivo dos rios que o alimentavam para projetos de irrigação intensiva de algodão', 1),
(356, 89, 'd', 'Vazamento contínuo de oleodutos no fundo do lago', 0),
(357, 90, 'a', 'A explosão de um petroleiro próximo a uma cidade turística', 0),
(358, 90, 'b', 'O enterro clandestino de milhares de toneladas de resíduos tóxicos sob um bairro residencial e uma escola', 1),
(359, 90, 'c', 'A contaminação da atmosfera por chuva de fuligem de carvão', 0),
(360, 90, 'd', 'O colapso de uma montanha sobre um reservatório de água doce', 0),
(361, 91, 'a', 'Oxigênio (O_2)', 0),
(362, 91, 'b', 'Dióxido de Carbono (CO_2)', 1),
(363, 91, 'c', 'Nitrogênio (N_2)', 0),
(364, 91, 'd', 'Hélio (He)', 0),
(365, 92, 'a', 'Mantém o planeta aquecido e em temperaturas adequadas para a vida', 1),
(366, 92, 'b', 'Deve ser totalmente eliminado para salvar o planeta', 0),
(367, 92, 'c', 'Provoca o resfriamento das águas dos oceanos', 0),
(368, 92, 'd', 'Destrói a camada de ozônio diariamente', 0),
(369, 93, 'a', 'Fabricação de computadores', 0),
(370, 93, 'b', 'Pesca artesanal', 0),
(371, 93, 'c', 'Pecuária (digestão entérica do gado)', 1),
(372, 93, 'd', 'Produção de painéis solares', 0),
(373, 94, 'a', 'A diminuição das chuvas no mundo', 0),
(374, 94, 'b', 'A elevação do nível do mar', 1),
(375, 94, 'c', 'O aumento da salinidade dos oceanos', 0),
(376, 94, 'd', 'O resfriamento do núcleo da Terra', 0),
(377, 95, 'a', 'Um grupo de empresas que vende créditos de carbono', 0),
(378, 95, 'b', 'Uma ONG que resgata animais em áreas de queimada', 0),
(379, 95, 'c', 'O órgão da ONU encarregado de avaliar a ciência relacionada às mudanças climáticas', 1),
(380, 95, 'd', 'Um tribunal para julgar crimes contra o meio ambiente', 0),
(381, 96, 'a', 'Reduzir a temperatura do planeta em 5°C até 2030', 0),
(382, 96, 'b', 'Manter o aumento da temperatura média global bem abaixo de 2°C acima dos níveis pré-industriais, buscando limitá-lo a 1,5°C', 1),
(383, 96, 'c', 'Congelar todas as geleiras que estão derretendo', 0),
(384, 96, 'd', 'Proibir o uso de ar-condicionado em todos os países', 0),
(385, 97, 'a', 'Mitigação é aceitar os impactos; Adaptação é tentar evitar os impactos', 0),
(386, 97, 'b', 'Mitigação são ações para reduzir/prevenir emissões de gases estufa; Adaptação são ações para se ajustar aos impactos já inevitáveis', 1),
(387, 97, 'c', 'Mitigação é voltada para países ricos; Adaptação é voltada para países pobres', 0),
(388, 97, 'd', 'Não há diferença, são termos sinônimos', 0),
(389, 98, 'a', 'Diminui o espaço para construção de usinas eólicas', 0),
(390, 98, 'b', 'Libera o carbono armazenado nas árvores na forma de CO_2 e reduz a capacidade de absorção do gás pela fotossíntese', 1),
(391, 98, 'c', 'Aumenta a quantidade de oxigênio que esfria a atmosfera', 0),
(392, 98, 'd', 'Faz com que o solo reflita mais luz do sol para o espaço', 0),
(393, 99, 'a', 'Resfriamento anormal das águas do Oceano Atlântico Norte', 0),
(394, 99, 'b', 'Formação de congelamento permanente na costa do Brasil', 0),
(395, 99, 'c', 'Aquecimento anormal das águas superficiais do Oceano Pacífico Equatorial, alterando padrões globais de chuva e vento', 1),
(396, 99, 'd', 'Queda na emissão de radiação pelo Sol', 0),
(397, 100, 'a', 'O derretimento do solo congelado no Ártico libera grandes quantidades de metano e CO_2, intensificando ainda mais o aquecimento global', 1),
(398, 100, 'b', 'O congelamento de rios que absorve gás carbônico', 0),
(399, 100, 'c', 'O crescimento de árvores gigantes no polo norte que esfriam o planeta', 0),
(400, 100, 'd', 'O bloqueio da luz solar pela poeira do solo congelado', 0),
(401, 101, 'a', 'Mofo atmosférico', 0),
(402, 101, 'b', 'Clorofluorcarboneto (CFC)', 1),
(403, 101, 'c', 'Gás Metano', 0),
(404, 101, 'd', 'Monóxido de Carbono', 0),
(405, 102, 'a', 'Todos os seres humanos emitem exatamente a mesma quantidade de poluentes', 0),
(406, 102, 'b', 'As populações mais vulneráveis sofrem desproporcionalmente os piores impactos do clima, apesar de terem contribuído menos para as emissões', 1),
(407, 102, 'c', 'Países ricos devem parar totalmente de usar eletricidade', 0),
(408, 102, 'd', 'Os tribunais devem proibir chuvas intensas nas cidades', 0),
(409, 103, 'a', 'O momento do dia em que a Terra atinge a maior temperatura', 0),
(410, 103, 'b', 'Um limite crítico no qual uma pequena alteração nas condições globais pode empurrar o sistema para um estado irreversível de mudança drástica', 1),
(411, 103, 'c', 'O momento em que o consumo de petróleo for superado pelo consumo de energia solar', 0),
(412, 103, 'd', 'A data limite estabelecida pela ONU para o fim dos combustíveis fósseis', 0),
(413, 104, 'a', 'O gelo tem alto albedo (reflete muita luz solar); com o derretimento, o oceano escuro exposto absorve mais radiação solar, acelerando o aquecimento', 1),
(414, 104, 'b', 'O gelo tem baixo albedo; quando derrete, o oceano reflete toda a luz, resfriando o planeta', 0),
(415, 104, 'c', 'O albedo mede a pressão do ar nos polos e não tem relação com a luz solar', 0),
(416, 104, 'd', 'A perda de gelo aumenta o albedo global, gerando uma nova era glacial', 0),
(417, 105, 'a', 'O mesmo (GWP = 1)', 0),
(418, 105, 'b', '1000 vezes menor', 0),
(419, 105, 'c', 'Cerca de 28 a 36 vezes maior', 1),
(420, 105, 'd', 'Exatamente metade', 0),
(421, 106, 'a', 'Mata Atlântica', 0),
(422, 106, 'b', 'Amazônia', 1),
(423, 106, 'c', 'Cerrado', 0),
(424, 106, 'd', 'Pantanal', 0),
(425, 107, 'a', 'Neve constante e clima polar', 0),
(426, 107, 'b', 'Clima semiárido, vegetação adaptada à seca (xerófitas) e presença de cactos', 1),
(427, 107, 'c', 'Grandes florestas de pinheiros (Araucárias)', 0),
(428, 107, 'd', 'Solo encharcado o ano inteiro', 0),
(429, 108, 'a', 'Pampa', 0),
(430, 108, 'b', 'Caatinga', 0),
(431, 108, 'c', 'Cerrado', 0),
(432, 108, 'd', 'Pantanal', 1),
(433, 109, 'a', 'Mata Atlântica', 0),
(434, 109, 'b', 'Cerrado', 1),
(435, 109, 'c', 'Pampa', 0),
(436, 109, 'd', 'Amazônia', 0),
(437, 110, 'a', 'Bahia', 0),
(438, 110, 'b', 'Mato Grosso', 0),
(439, 110, 'c', 'Rio Grande do Sul', 1),
(440, 110, 'd', 'Minas Gerais', 0),
(441, 111, 'a', 'Amazônia', 0),
(442, 111, 'b', 'Mata Atlântica', 1),
(443, 111, 'c', 'Pantanal', 0),
(444, 111, 'd', 'Caatinga', 0),
(445, 112, 'a', 'Porque nele nascem importantes nascentes e aquíferos que alimentam grandes bacias hidrográficas do país', 1),
(446, 112, 'b', 'Porque chove 365 dias por ano na região', 0),
(447, 112, 'c', 'Porque possui a maior quantidade de lagos de água doce da América do Sul', 0),
(448, 112, 'd', 'Porque é o único bioma onde não ocorrem secas', 0),
(449, 113, 'a', 'Caatinga', 0),
(450, 113, 'b', 'Amazônia', 0),
(451, 113, 'c', 'Mata Atlântica', 1),
(452, 113, 'd', 'Pantanal', 0),
(453, 114, 'a', 'Perder as folhas na estação seca para reduzir a perda de água por evapotranspiração', 1),
(454, 114, 'b', 'Manter as folhas verdes e úmidas através da absorção de orvalho noturno', 0),
(455, 114, 'c', 'Florescer apenas durante a noite para evitar o sol', 0),
(456, 114, 'd', 'Produzir frutos espinhosos que repelem herbívoros', 0),
(457, 115, 'a', 'Tipos de vegetação exclusivos do bioma Cerrado', 0),
(458, 115, 'b', 'Ecossistemas associados e zonais do bioma Mata Atlântica localizados ao longo da zona costeira', 1),
(459, 115, 'c', 'Áreas de deserto de dunas no interior do Pampa', 0),
(460, 115, 'd', 'Plantações artificiais de eucalipto para celulose', 0),
(461, 116, 'a', 'O congelamento do solo no inverno', 0),
(462, 116, 'b', 'A poluição por chuva ácida vinda dos oceanos', 0),
(463, 116, 'c', 'A expansão desordenada da fronteira agrícola (monoculturas) e pecuária extensiva', 1),
(464, 116, 'd', 'A extração de petróleo em águas profundas', 0),
(465, 117, 'a', 'Florestas densas e fechadas com grandes árvores', 0),
(466, 117, 'b', 'Campos nativos formados por gramíneas e herbáceas', 1),
(467, 117, 'c', 'Cactos e plantas espinhosas de pequeno porte', 0),
(468, 117, 'd', 'Manguais com raízes aéreas', 0),
(469, 118, 'a', 'Temperaturas médias acima de 40°C e presença de vulcões ativos', 0),
(470, 118, 'b', 'Elevada biodiversidade e alto grau de endemismo, mas que já perdeu pelo menos 70% de sua vegetação original', 1),
(471, 118, 'c', 'Grande quantidade de espécies marinhas migratórias em sua costa', 0),
(472, 118, 'd', 'Presença de gelo fóssil e espécies vegetais gigantescas', 0),
(473, 119, 'a', 'O tipo de solo: arenoso, argiloso ou rochoso', 0),
(474, 119, 'b', 'O regime de inundação: Igapó é permanentemente inundada; Várzea é periodicamente inundada; Terra Firme nunca é inundada', 1),
(475, 119, 'c', 'A altitude: montanha, planalto ou depressão', 0),
(476, 119, 'd', 'A temperatura: fria, temperada ou quente', 0),
(477, 120, 'a', 'Fluxos aéreos de massas de ar carregadas de vapor de água proveniente da evapotranspiração da floresta rumo ao Centro-Sul', 1),
(478, 120, 'b', 'Migração de espécies de peixes voadores ao longo dos rios amazônicos', 0),
(479, 120, 'c', 'Poluição atmosférica que viaja pelas nuvens de queimadas', 0),
(480, 120, 'd', 'Evaporação rápida de rios menores durante o verão forte', 0),
(481, 121, 'a', 'Lobo-guará', 0),
(482, 121, 'b', 'Mico-leão-dourado', 1),
(483, 121, 'c', 'Arara-azul-grande', 0),
(484, 121, 'd', 'Tamanduá-bandeira', 0),
(485, 122, 'a', 'Hipopótamo', 0),
(486, 122, 'b', 'Girafa', 0),
(487, 122, 'c', 'Rinoceronte', 1),
(488, 122, 'd', 'Zebra', 0),
(489, 123, 'a', 'O envelhecimento natural dos animais', 0),
(490, 123, 'b', 'A destruição e fragmentação de seus habitats naturais pelas atividades humanas', 1),
(491, 123, 'c', 'O aumento de tempestades de vento nas florestas', 0),
(492, 123, 'd', 'A falta de alimentos artificiais na natureza', 0),
(493, 124, 'a', 'Derramamento de lixo em cavernas', 0),
(494, 124, 'b', 'Caça excessiva para consumo de sua carne', 0),
(495, 124, 'c', 'Ataque de peixes carnívoros no mar', 0),
(496, 124, 'd', 'Derretimento do gelo marinho no Ártico devido às mudanças climáticas', 1),
(497, 125, 'a', 'Espécies Exóticas', 0),
(498, 125, 'b', 'Espécies Endêmicas', 1),
(499, 125, 'c', 'Espécies Invasoras', 0),
(500, 125, 'd', 'Espécies Domésticas', 0),
(501, 126, 'a', 'Um inventário mundial de animais considerados perigosos para os seres humanos', 0),
(502, 126, 'b', 'O sistema global mais abrangente de avaliação do status de risco de extinção das espécies', 1),
(503, 126, 'c', 'Uma lista de animais que podem ser caçados legalmente em qualquer país', 0),
(504, 126, 'd', 'Um registro de animais vendidos em pet shops internacionais', 0),
(505, 127, 'a', 'Competem por recursos, predam espécies locais e não possuem predadores naturais na nova área', 1),
(506, 127, 'b', 'Transmitem vacinas para a fauna local', 0),
(507, 127, 'c', 'Cruzam com animais nativos gerando novas espécies mais fortes', 0),
(508, 127, 'd', 'Alteram a temperatura do clima regional em poucos dias', 0),
(509, 128, 'a', 'Extinta completamente da Terra sem restar nenhum indivíduo', 0),
(510, 128, 'b', 'Extinta na Natureza (sobrevivendo apenas em cativeiro para reintrodução)', 1),
(511, 128, 'c', 'Abundante em todos os biomas do país', 0),
(512, 128, 'd', 'Invasora de áreas urbanas', 0),
(513, 129, 'a', 'Permitir a extração de madeira e minérios sob fiscalização', 0),
(514, 129, 'b', 'Preservar a natureza, admitindo apenas o uso indireto dos seus recursos naturais (pesquisa e ecoturismo)', 1),
(515, 129, 'c', 'Servir de área para pastagem de gado no inverno', 0),
(516, 129, 'd', 'Permitir a caça esportiva de animais não ameaçados', 0),
(517, 130, 'a', 'Perda de habitat para o agronegócio e atropelamentos frequentes em rodovias', 1),
(518, 130, 'b', 'Falta de água nos rios durante o inverno', 0),
(519, 130, 'c', 'Caça comercial para extração de couro fino', 0),
(520, 130, 'd', 'Ataques de aves de rapina gigantes', 0),
(521, 131, 'a', 'Faixas de terra contínuas que conectam fragmentos de floresta, permitindo o trânsito livre e fluxo gênico', 1),
(522, 131, 'b', 'Caminhos pavimentados dentro de parques para visitantes caminharem', 0),
(523, 131, 'c', 'Túneis subterrâneos construídos para escoar água de rios', 0),
(524, 131, 'd', 'Gaiolas gigantes usadas para transportar animais entre zoológicos', 0),
(525, 132, 'a', 'Poluição por plásticos no mar, pesca acidental e destruição das praias de desova', 1),
(526, 132, 'b', 'Ataques de tubarões em praias rasas', 0),
(527, 132, 'c', 'Excesso de algas na superfície do oceano', 0),
(528, 132, 'd', 'Mudança na cor da areia das praias', 0),
(529, 133, 'a', 'Aumento súbito da imunidade dos sobreviventes a qualquer vírus', 0),
(530, 133, 'b', 'Redução severa da variabilidade genética da população, aumentando consanguinidade e vulnerabilidade', 1),
(531, 133, 'c', 'Aceleração do crescimento do tamanho dos indivíduos da espécie', 0),
(532, 133, 'd', 'Mudança do hábito alimentar de carnívoro para herbívoro', 0),
(533, 134, 'a', '\"Em Perigo\" significa que o animal já foi extinto; \"Criticamente em Perigo\" significa que há muitos indivíduos', 0),
(534, 134, 'b', '\"Criticamente em Perigo\" indica um risco extremamente elevado de extinção na natureza em futuro imediato, superior ao nível da categoria \"Em Perigo\"', 1),
(535, 134, 'c', '\"Em Perigo\" aplica-se apenas a plantas; \"Criticamente em Perigo\" aplica-se apenas a mamíferos', 0),
(536, 134, 'd', 'Apenas a categoria \"Em Perigo\" é reconhecida por órgãos governamentais', 0),
(537, 135, 'a', 'Diminuição da população de herbívoros na floresta', 0),
(538, 135, 'b', 'Aumento descontrolado da população de herbívoros médios, levando ao sobrepastoreio e à degradação da vegetação local', 1),
(539, 135, 'c', 'Surgimento imediato de um novo superpredador de outra região', 0),
(540, 135, 'd', 'Aumento imediato da biodiversidade de plantas na área', 0),
(541, 136, 'a', '45 litros', 0),
(542, 136, 'b', '90 litros', 1),
(543, 136, 'c', '100 litros', 0),
(544, 136, 'd', '35 litros', 0),
(545, 137, 'a', '52 kg', 0),
(546, 137, 'b', '104 kg', 1),
(547, 137, 'c', '200 kg', 0),
(548, 137, 'd', '80 kg', 0),
(549, 138, 'a', '10.000 litros', 0),
(550, 138, 'b', '50.000 litros', 0),
(551, 138, 'c', '100.000 litros', 1),
(552, 138, 'd', '20.000 litros', 0),
(553, 139, 'a', '400 kWh', 0),
(554, 139, 'b', '480 kWh', 1),
(555, 139, 'c', '520 kWh', 0),
(556, 139, 'd', '600 kWh', 0),
(557, 140, 'a', '1.380 litros', 1),
(558, 140, 'b', '1.200 litros', 0),
(559, 140, 'c', '900 litros', 0),
(560, 140, 'd', '2.000 litros', 0),
(561, 141, 'a', '3 kg de CO_2', 0),
(562, 141, 'b', '15 kg de CO_2', 1),
(563, 141, 'c', '1,5 kg de CO_2', 0),
(564, 141, 'd', '150 kg de CO_2', 0),
(565, 142, 'a', '5 árvores', 0),
(566, 142, 'b', '10 árvores', 1),
(567, 142, 'c', '20 árvores', 0),
(568, 142, 'd', '100 árvores', 0),
(569, 143, 'a', '7.500 litros', 0),
(570, 143, 'b', '15.000 litros', 0),
(571, 143, 'c', '30.000 litros', 1),
(572, 143, 'd', '60.000 litros', 0),
(573, 144, 'a', '510 Wh', 1),
(574, 144, 'b', '600 Wh', 0),
(575, 144, 'c', '90 Wh', 0),
(576, 144, 'd', '300 Wh', 0),
(577, 145, 'a', '2 árvores', 0),
(578, 145, 'b', '5 árvores', 1),
(579, 145, 'c', '8 árvores', 0),
(580, 145, 'd', '10 árvores', 0),
(581, 146, 'a', '7,5 toneladas', 1),
(582, 146, 'b', '15 toneladas', 0),
(583, 146, 'c', '25 toneladas', 0),
(584, 146, 'd', '5 toneladas', 0),
(585, 147, 'a', '200 vezes mais rápido', 0),
(586, 147, 'b', '800 vezes mais rápido', 1),
(587, 147, 'c', '400 vezes mais rápido', 0),
(588, 147, 'd', '100 vezes mais rápido', 0),
(589, 148, 'a', '72 kg de CO_2', 0),
(590, 148, 'b', '720 kg de CO_2', 1),
(591, 148, 'c', '60 kg de CO_2', 0),
(592, 148, 'd', '6000 kg de CO_2', 0),
(593, 149, 'a', '183,5 toneladas', 1),
(594, 149, 'b', '50 toneladas', 0),
(595, 149, 'c', '18,35 toneladas', 0),
(596, 149, 'd', '500 toneladas', 0),
(597, 150, 'a', '390 kg de CO_2', 1),
(598, 150, 'b', '1170 kg de CO_2', 0),
(599, 150, 'c', '150 kg de CO_2', 0),
(600, 150, 'd', '260 kg de CO_2', 0);

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

--
-- Despejando dados para a tabela `partidas`
--

INSERT INTO `partidas` (`id`, `usuario_id`, `inicio`, `fim`, `tempo_segundos`, `pontuacao_total`, `concluida`) VALUES
(1, 1, '2026-11-10 16:17:44', '2026-11-10 16:20:30', 166, 17, 1),
(2, 1, '2026-11-10 16:35:39', '2026-11-10 16:37:06', 87, 30, 1),
(3, 3, '2026-11-10 16:38:47', '2026-11-10 16:39:37', 50, 14, 1),
(4, 3, '2026-11-10 16:46:07', '2026-11-10 16:47:16', 69, 5, 1),
(5, 1, '2026-11-10 21:54:37', '2026-11-10 21:56:31', 114, 20, 1),
(6, 3, '2026-11-10 22:18:19', NULL, NULL, 0, 0),
(7, 1, '2026-11-10 22:50:17', NULL, NULL, 0, 0);

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
(15, 1, 'O que é a \"mimetização mulleriana\" observada no reino animal?', 'dificil', 10, 'É quando duas ou mais espécies perigosas ou nocivas compartilham padrões de aparência semelhantes para reforçar o sinal de advertência aos predadores.'),
(16, 2, 'Qual fonte de energia renovável utiliza a força dos ventos para girar turbinas?', 'facil', 1, 'A energia eólica utiliza a força dos ventos para movimentar as pás das turbinas, que acionam geradores de eletricidade.'),
(17, 2, 'A energia solar fotovoltaica transforma o quê em eletricidade?', 'facil', 1, 'Os painéis fotovoltaicos utilizam células que convertem diretamente a luz solar em energia elétrica.'),
(18, 2, 'Qual fonte renovável é obtida a partir da queima ou decomposição de matéria orgânica (como bagaço de cana e lixo orgânico)?', 'facil', 1, 'A biomassa utiliza matéria orgânica como fonte de energia, podendo gerar eletricidade e calor por meio da queima ou decomposição.'),
(19, 2, 'O Brasil produz a maior parte de sua energia elétrica a partir de qual fonte?', 'facil', 1, 'As usinas hidrelétricas aproveitam a força da água em movimento para girar turbinas e produzir eletricidade.'),
(20, 2, 'Qual destas é uma fonte de energia NÃO renovável?', 'facil', 1, 'O petróleo é um combustível fóssil formado ao longo de milhões de anos e possui reservas limitadas na natureza.'),
(21, 2, 'A energia geotérmica aproveita qual recurso para gerar eletricidade ou calor?', 'medio', 5, 'A energia geotérmica utiliza o calor interno da Terra, que pode ser aproveitado para aquecimento e geração de eletricidade.'),
(22, 2, 'Qual é uma das principais desvantagens das fontes eólica e solar fotovoltaica?', 'medio', 5, 'Essas fontes dependem de condições naturais, como a presença de vento e luz solar, fazendo com que a geração de energia possa variar.'),
(23, 2, 'O que é o combustível chamado Biogás?', 'medio', 5, 'O biogás é uma mistura gasosa rica em metano, produzida pela decomposição de matéria orgânica na ausência de oxigênio.'),
(24, 2, 'Como funciona a usina maremotriz?', 'medio', 5, 'A usina maremotriz aproveita a subida e a descida das marés para movimentar turbinas e gerar eletricidade.'),
(25, 2, 'O que é o chamado \"Hidrogênio Verde\"?', 'medio', 5, 'O hidrogênio verde é produzido pela eletrólise da água utilizando eletricidade de fontes renováveis, reduzindo as emissões associadas à sua produção.'),
(26, 2, 'Qual é o principal impacto ambiental associado à construção de grandes Usinas Hidrelétricas?', 'medio', 5, 'A construção de grandes hidrelétricas pode alagar extensas áreas, destruir habitats naturais e provocar o deslocamento de comunidades.'),
(27, 2, 'O etanol produzido no Brasil a partir da cana-de-açúcar é considerado um:', 'medio', 5, 'O etanol é um biocombustível porque é produzido a partir de matéria orgânica renovável, como a cana-de-açúcar.'),
(28, 2, 'Na energia solar heliotérmica (CSP - Concentrated Solar Power), a eletricidade é gerada por qual mecanismo?', 'dificil', 10, 'A energia heliotérmica utiliza espelhos para concentrar a luz solar e aquecer um fluido. O calor produz vapor que movimenta uma turbina conectada a um gerador.'),
(29, 2, 'O que define o fator de capacidade de uma usina geradora de energia?', 'dificil', 10, 'O fator de capacidade representa a relação entre a energia realmente produzida em determinado período e a quantidade máxima que poderia ser gerada se a usina operasse continuamente em sua potência máxima.'),
(30, 2, 'Qual é o desafio técnico do processo conhecido como \"Eletrólise da Água\" para armazenamento de energia renovável excedente?', 'dificil', 10, 'A eletrólise exige equipamentos e catalisadores que podem ter custo elevado, além de ocorrerem perdas de energia durante a produção, compressão e armazenamento do hidrogênio.'),
(31, 3, 'Qual a porcentagem aproximada de água salgada no planeta Terra em relação ao total de água?', 'facil', 1, 'Aproximadamente 97% da água do planeta é salgada e está presente principalmente nos oceanos.'),
(32, 3, 'Onde se encontra a maior parte da água doce do nosso planeta?', 'facil', 1, 'A maior parte da água doce da Terra está armazenada nas geleiras e calotas polares.'),
(33, 3, 'Qual é o maior oceano do planeta Terra?', 'facil', 1, 'O Oceano Pacífico é o maior oceano do planeta, ocupando uma extensa área entre a Ásia, a Oceania e as Américas.'),
(34, 3, 'Como se chama o processo em que a água passa do estado líquido para o gasoso devido ao calor do Sol?', 'facil', 1, 'Esse processo é chamado de evaporação, quando a água líquida passa para o estado gasoso.'),
(35, 3, 'Qual é o nome da estrutura natural marinha formada por organismos vivos que abriga grande biodiversidade?', 'facil', 1, 'Os recifes de corais são estruturas formadas por organismos vivos e servem de abrigo para muitas espécies marinhas.'),
(36, 3, 'O que é o fenômeno da dessalinização?', 'medio', 5, 'A dessalinização é o processo de retirada dos sais da água do mar, permitindo que ela possa ser utilizada como água potável.'),
(37, 3, 'O que são os aquíferos?', 'medio', 5, 'Aquíferos são reservatórios subterrâneos de água armazenada em rochas porosas e permeáveis.'),
(38, 3, 'O fenômeno da \"acidificação dos oceanos\" é causado principalmente por:', 'medio', 5, 'A acidificação ocorre principalmente porque os oceanos absorvem parte do excesso de dióxido de carbono presente na atmosfera.'),
(39, 3, 'Qual a importância ecológica dos manguezais para o ambiente marinho e costeiro?', 'medio', 5, 'Os manguezais funcionam como berçários para diversas espécies e ajudam a proteger a costa contra a erosão.'),
(40, 3, 'O que é a \"Zona Abissal\" dos oceanos?', 'medio', 5, 'A zona abissal corresponde às regiões muito profundas dos oceanos, caracterizadas pela ausência de luz solar e por altas pressões.'),
(41, 3, 'O que causa a eutrofização em corpos d\'água doce (como lagos e lagoas)?', 'medio', 5, 'A eutrofização é causada pelo excesso de nutrientes, como nitrogênio e fósforo, que favorece a proliferação de algas e pode reduzir o oxigênio da água.'),
(42, 3, 'A Grande Porção de Lixo do Pacífico (Pacific Garbage Patch) é composta majoritariamente por:', 'medio', 5, 'Essa região concentra principalmente microplásticos e outros detritos plásticos acumulados pelas correntes marítimas.'),
(43, 3, 'O que é a Circulação Termohalina profunda nos oceanos?', 'dificil', 10, 'É uma circulação global das águas oceânicas impulsionada por diferenças de densidade relacionadas à temperatura e à salinidade.'),
(44, 3, 'Como o branqueamento dos corais ocorre do ponto de vista fisiológico?', 'dificil', 10, 'O estresse térmico pode fazer os corais expulsarem suas zooxantelas simbiontes, perdendo sua coloração e uma importante fonte de energia.'),
(45, 3, 'O Aquífero Alter do Chão, localizado na Região Norte do Brasil, destaca-se por:', 'dificil', 10, 'De acordo com o material, o Aquífero Alter do Chão destaca-se por ser a maior reserva de água doce subterrânea do planeta em volume.'),
(46, 4, 'O que significa o conceito de \"Consumo Consciente\"?', 'facil', 1, 'Consumo consciente significa considerar os impactos ambientais e sociais antes de comprar e utilizar produtos, evitando desperdícios.'),
(47, 4, 'A regra dos \"3 Rs\" da sustentabilidade corresponde a:', 'facil', 1, 'Os 3 Rs são Reduzir, Reutilizar e Reciclar. Essas práticas ajudam a diminuir o desperdício e a quantidade de resíduos produzidos.'),
(48, 4, 'O que mede a chamada \"Pegada de Carbono\" de uma pessoa ou empresa?', 'facil', 1, 'A pegada de carbono mede a quantidade total de gases de efeito estufa emitidos direta ou indiretamente pelas atividades de uma pessoa ou empresa.'),
(49, 4, 'Qual destas atitudes reduz diretamente a pegada de carbono individual?', 'facil', 1, 'Caminhar, andar de bicicleta ou utilizar transporte público reduz o uso de veículos particulares e, consequentemente, a emissão de gases poluentes.'),
(50, 4, 'O que é a \"Pegada Hídrica\"?', 'facil', 1, 'A pegada hídrica representa o volume total de água doce utilizado na produção dos bens e serviços que consumimos.'),
(51, 4, 'O conceito de \"Obsolescência Programada\" refere-se a:', 'medio', 5, 'A obsolescência programada acontece quando produtos são planejados para durar pouco ou apresentar dificuldades de reparo, incentivando a compra de novos produtos.'),
(52, 4, 'Qual das seguintes escolhas alimentares geralmente possui a maior pegada de carbono por quilo produzido?', 'medio', 5, 'A produção de carne bovina geralmente emite mais gases de efeito estufa por quilo do que a produção de alimentos vegetais, devido à criação dos animais e aos recursos utilizados.'),
(53, 4, 'O que significa o termo \"Fast Fashion\" e qual seu impacto ambiental?', 'medio', 5, 'Fast Fashion é um modelo de produção rápida e frequente de roupas, geralmente de baixa qualidade, que estimula o consumo excessivo, o descarte precoce e o uso de muitos recursos naturais.'),
(54, 4, 'O que são os \"Créditos de Carbono\"?', 'medio', 5, 'Créditos de carbono são certificados negociáveis que representam a não emissão ou a remoção de uma tonelada de dióxido de carbono equivalente.'),
(55, 4, 'A pegada ecológica de um país que consome mais recursos do que seus ecossistemas conseguem regenerar gera o chamado:', 'medio', 5, 'O déficit ecológico ocorre quando o consumo de recursos naturais ultrapassa a capacidade dos ecossistemas de regenerá-los.'),
(56, 4, 'Por que preferir alimentos produzidos localmente (\"alimentos km zero\") ajuda o meio ambiente?', 'medio', 5, 'Alimentos produzidos localmente percorrem distâncias menores até chegar ao consumidor, reduzindo a necessidade de transporte e as emissões de gases poluentes.'),
(57, 4, 'O termo \"Greenwashing\" (Maquiagem Verde) refere-se a:', 'medio', 5, 'Greenwashing é uma estratégia de marketing que apresenta uma empresa ou produto como sustentável sem que suas práticas realmente correspondam a essa imagem.'),
(58, 4, 'Qual é a diferença entre emissões de carbono de \"Escopo 1\" e \"Escopo 3\" no inventário de emissões de uma empresa?', 'dificil', 10, 'O Escopo 1 considera as emissões diretas de fontes controladas pela empresa, enquanto o Escopo 3 inclui outras emissões indiretas relacionadas à sua cadeia de valor.'),
(59, 4, 'O conceito de \"Análise do Ciclo de Vida\" (ACV) de um produto avalia:', 'dificil', 10, 'A Análise do Ciclo de Vida considera os impactos ambientais de todas as etapas de um produto, desde a extração da matéria-prima até seu descarte final.'),
(60, 4, 'O que é o fenômeno da \"Economia Circular\" em contraste com a \"Economia Linear\"?', 'dificil', 10, 'A economia circular busca reduzir resíduos e poluição desde o desenvolvimento dos produtos, mantendo materiais e recursos em uso pelo maior tempo possível.'),
(61, 5, 'Qual é a cor padronizada da lixeira de coleta seletiva para o descarte de PAPEL no Brasil?', 'facil', 1, 'A cor azul é utilizada na coleta seletiva para identificar os resíduos de papel.'),
(62, 5, 'Qual cor de lixeira é destinada ao descarte de PLÁSTICO?', 'facil', 1, 'A cor vermelha identifica a lixeira destinada ao descarte de resíduos plásticos.'),
(63, 5, 'Qual dos seguintes materiais NÃO pode ser reciclado no processo comum de coleta de vidro?', 'facil', 1, 'Espelhos e lâmpadas não são aceitos na reciclagem comum de vidro, pois possuem composição diferente das embalagens de vidro.'),
(64, 5, 'Para onde deve ser levado o Lixo Eletrônico (pilhas, baterias e celulares velhos)?', 'facil', 1, 'O lixo eletrônico deve ser levado a pontos de entrega voluntária ou locais de coleta especial, que realizam a destinação adequada desses materiais.'),
(65, 5, 'O que é a Compostagem?', 'facil', 1, 'A compostagem é um processo biológico que transforma matéria orgânica em adubo natural por meio da decomposição.'),
(66, 5, 'O alumínio é considerado um dos materiais mais vantajosos para reciclagem porque:', 'medio', 5, 'O alumínio pode ser reciclado diversas vezes sem perder suas propriedades e sua reciclagem economiza cerca de 95% de energia em comparação à produção primária.'),
(67, 5, 'Qual é a cor da lixeira de coleta seletiva destinada aos resíduos ORGÂNICOS no Brasil?', 'medio', 5, 'A cor marrom é utilizada para identificar os resíduos orgânicos na coleta seletiva.'),
(68, 5, 'O que são os \"Microplásticos\"?', 'medio', 5, 'Microplásticos são partículas de plástico menores que 5 milímetros, originadas da degradação de plásticos maiores ou de produtos sintéticos.'),
(69, 5, 'Por que o papel higiênico e guardanapos engordurados NÃO devem ir para a coleta seletiva de papel reciclável?', 'medio', 5, 'Esses materiais possuem fibras contaminadas por óleos ou dejetos, o que prejudica o processo de reciclagem e pode contaminar outros papéis.'),
(70, 5, 'O símbolo internacional da reciclagem é composto por:', 'medio', 5, 'O símbolo é formado por três setas que se conectam em um triângulo, representando o ciclo de reciclagem.'),
(71, 5, 'Qual é o papel fundamental dos Catadores de Materiais Recicláveis na cadeia de reciclagem no Brasil?', 'medio', 5, 'Os catadores coletam, separam e encaminham materiais recicláveis, tendo um papel central no funcionamento da cadeia de reciclagem.'),
(72, 5, 'O que é o conceito de Logística Reversa previsto na Política Nacional de Resíduos Sólidos?', 'medio', 5, 'A logística reversa responsabiliza fabricantes, importadores e distribuidores pelo recolhimento e pela destinação adequada dos produtos após o consumo.'),
(73, 5, 'Qual é a principal limitação técnica da reciclagem mecânica do Plástico do tipo PET ou PEAD ao longo dos ciclos?', 'dificil', 10, 'A reciclagem mecânica pode degradar as cadeias poliméricas do plástico, reduzindo sua qualidade e resistência a cada ciclo.'),
(74, 5, 'O que é a Reciclagem Química?', 'dificil', 10, 'A reciclagem química utiliza processos industriais, como pirólise e despolimerização, para quebrar os polímeros plásticos em seus componentes básicos.'),
(75, 5, 'O plástico do tipo 7 (Outros / Policarbonato / PLA) presente em embalagens é geralmente caracterizado por:', 'dificil', 10, 'Esse tipo de plástico pode reunir diferentes resinas ou polímeros complexos, dificultando ou inviabilizando sua reciclagem mecânica.'),
(76, 6, 'O vazamento de rejeitos de mineração ocorrido em Mariana (2015) e Brumadinho (2019) no Brasil foi causado pelo rompimento de quê?', 'facil', 1, 'Os dois desastres foram causados pelo rompimento de barragens que armazenavam rejeitos da atividade de mineração.'),
(77, 6, 'O desastre de Chernobyl (1986) na Ucrânia ficou mundialmente conhecido por ser um acidente:', 'facil', 1, 'Chernobyl foi um acidente nuclear que provocou a liberação de material radioativo no ambiente.'),
(78, 6, 'O vazamento da plataforma Deepwater Horizon em 2010 no Golfo do México provocou qual tipo de desastre ambiental?', 'facil', 1, 'O acidente provocou um grande derramamento de petróleo no mar, prejudicando os ecossistemas marinhos.'),
(79, 6, 'Grandes queimadas não controladas em florestas e savanas causam qual destes desastres ambientais?', 'facil', 1, 'Queimadas descontroladas podem se espalhar e provocar incêndios florestais, destruindo a vegetação e afetando os animais.'),
(80, 6, 'O despejo inadequado de produtos químicos em rios pode causar a mortandade em massa de qual grupo animal?', 'facil', 1, 'Os produtos químicos podem contaminar a água e prejudicar a sobrevivência de peixes e outros organismos aquáticos.'),
(81, 6, 'O acidente de Goiânia em 1987, envolvendo o Césio-137, ocorreu devido a:', 'medio', 5, 'O acidente aconteceu após o descarte e a manipulação inadequados de um aparelho de radioterapia abandonado, que continha material radioativo.'),
(82, 6, 'O desastre industrial de Bhopal (1984), na Índia, considerado um dos piores da história, envolveu o vazamento de:', 'medio', 5, 'O desastre ocorreu devido ao vazamento de isocianato de metila, um gás extremamente tóxico, em uma fábrica de pesticidas.'),
(83, 6, 'Qual minério pesado foi amplamente utilizado no garimpo ilegal na Amazônia, provocando grave contaminação dos rios e da população indígena?', 'medio', 5, 'O mercúrio é utilizado na separação do ouro e pode contaminar rios, peixes e populações que dependem desses recursos.'),
(84, 6, 'O desastre da Baía de Minamata na década de 1950 no Japão deu nome a uma doença neurológica causada por contaminação por:', 'medio', 5, 'A doença de Minamata foi causada pela contaminação por metilmercúrio, despejado no mar por uma indústria química.'),
(85, 6, 'O derramamento de óleo cru no litoral do Nordeste brasileiro em 2019 afetou drasticamente qual ecossistema frágil da costa?', 'medio', 5, 'O óleo atingiu recifes de corais e manguezais, ecossistemas importantes para a biodiversidade marinha e costeira.'),
(86, 6, 'Qual a consequência do fenômeno da \"Desertificação\" em áreas atingidas por mau uso do solo e secas severas?', 'medio', 5, 'A desertificação provoca a degradação da terra em regiões áridas e semiáridas, reduzindo sua produtividade biológica e econômica.'),
(87, 6, 'A usina nuclear de Fukushima, no Japão, sofreu um grave acidente em 2011 decorrente de:', 'medio', 5, 'Um forte terremoto seguido por um tsunami interrompeu a energia dos sistemas de resfriamento da usina, causando o acidente nuclear.'),
(88, 6, 'O fenômeno da \"Liquefação do Solo\", frequentemente associado a falhas em barragens de rejeitos de mineração montadas a montante, ocorre quando:', 'dificil', 10, 'A liquefação ocorre quando um solo saturado de água perde sua resistência ao cisalhamento devido a tensões rápidas, passando temporariamente a se comportar como um fluido denso.'),
(89, 6, 'O desastre do Mar de Aral, na Ásia Central, considerado uma das maiores catástrofes ambientais do século XX, foi provocado por:', 'dificil', 10, 'O desvio dos rios que alimentavam o Mar de Aral para projetos de irrigação intensiva de algodão reduziu drasticamente o volume de água do lago.'),
(90, 6, 'O desastre ecológico de Love Canal (EUA, década de 1970) tornou-se um marco legislativo ambiental porque envolveu:', 'dificil', 10, 'O caso envolveu o enterro clandestino de grandes quantidades de resíduos tóxicos sob um bairro residencial e uma escola, causando preocupação com a contaminação ambiental.'),
(91, 7, 'Qual é o principal gás de efeito estufa emitido pelas atividades humanas (como a queima de combustíveis fósseis)?', 'facil', 1, 'O dióxido de carbono (CO2) é liberado principalmente pela queima de combustíveis fósseis, contribuindo para o aumento do efeito estufa.'),
(92, 7, 'O \"Efeito Estufa\" natural da Terra é um processo que:', 'facil', 1, 'O efeito estufa natural retém parte do calor na atmosfera, mantendo o planeta aquecido e em temperaturas adequadas para a vida.'),
(93, 7, 'Qual setor econômico é um dos maiores emissores do gás Metano (CH4) no planeta?', 'facil', 1, 'A pecuária é uma importante fonte de metano, principalmente por causa da digestão dos animais ruminantes, como o gado.'),
(94, 7, 'O derretimento das geleiras continentais (como na Groenlândia e Antártida) contribui diretamente para:', 'facil', 1, 'O derretimento das geleiras continentais acrescenta água aos oceanos, contribuindo para a elevação do nível do mar.'),
(95, 7, 'O que é o Painel Intergovernamental sobre Mudanças Climáticas (IPCC)?', 'facil', 1, 'O IPCC é um órgão da ONU responsável por avaliar e reunir informações científicas sobre as mudanças climáticas.'),
(96, 7, 'O principal objetivo do Acordo de Paris (2015) em relação à temperatura média global é:', 'medio', 5, 'O Acordo de Paris busca manter o aumento da temperatura média global bem abaixo de 2°C em relação aos níveis pré-industriais, procurando limitá-lo a 1,5°C.'),
(97, 7, 'Qual é a diferença entre os conceitos de \"Mitigação\" e \"Adaptação\" no contexto das mudanças climáticas?', 'medio', 5, 'Mitigação envolve ações para reduzir ou prevenir as emissões de gases de efeito estufa, enquanto adaptação consiste em se ajustar aos impactos das mudanças climáticas.'),
(98, 7, 'Como o desmatamento das florestas tropicais contribui para o agravamento do aquecimento global?', 'medio', 5, 'O desmatamento libera o carbono armazenado nas árvores na forma de CO2 e reduz a capacidade das florestas de absorver esse gás pela fotossíntese.'),
(99, 7, 'O fenômeno climático periódico conhecido como El Niño caracteriza-se por:', 'medio', 5, 'O El Niño é caracterizado pelo aquecimento anormal das águas superficiais do Oceano Pacífico Equatorial, alterando padrões de chuva e vento.'),
(100, 7, 'O que é o efeito de Feedback (ou Retroalimentação) do Permafrost no clima?', 'medio', 5, 'O derretimento do solo congelado no Ártico libera metano e CO2, gases que intensificam o aquecimento global e podem provocar ainda mais derretimento.'),
(101, 7, 'Qual gás sintético (usado antigamente em refrigeradores e aerossóis) foi o principal responsável pela destruição da Camada de Ozônio?', 'medio', 5, 'Os clorofluorcarbonetos (CFCs) liberam substâncias que destroem moléculas de ozônio na atmosfera, prejudicando a camada que protege a Terra da radiação ultravioleta.'),
(102, 7, 'O conceito de \"Justiça Climática\" argumenta que:', 'medio', 5, 'A justiça climática destaca que populações mais vulneráveis sofrem impactos climáticos desproporcionais, mesmo tendo contribuído menos para as emissões.'),
(103, 7, 'O conceito de \"Ponto de Virada\" (Tipping Point) no sistema climático terrestre refere-se a:', 'dificil', 10, 'Um ponto de virada é um limite crítico em que uma pequena alteração pode levar o sistema climático a mudanças drásticas e potencialmente irreversíveis.'),
(104, 7, 'Qual é o efeito do albedo na regulação térmica do planeta e como ele é afetado pelo derretimento do gelo marinho no Ártico?', 'dificil', 10, 'O gelo possui alto albedo e reflete muita luz solar. Quando derrete, expõe o oceano escuro, que absorve mais radiação e acelera o aquecimento.'),
(105, 7, 'O potencial de aquecimento global (GWP - Global Warming Potential) do gás Metano (CH4) em comparação ao CO2 em um horizonte de 100 anos é aproximadamente:', 'dificil', 10, 'O metano possui potencial de aquecimento global cerca de 28 a 36 vezes maior que o CO2 em um período de 100 anos.'),
(106, 8, 'Qual é o maior bioma do Brasil em extensão territorial?', 'facil', 1, 'A Amazônia é o maior bioma brasileiro, ocupando a maior extensão territorial do país.'),
(107, 8, 'O bioma Caatinga é caracterizado principalmente por:', 'facil', 1, 'A Caatinga possui clima semiárido e vegetação adaptada à seca, com presença de cactos e outras plantas xerófitas.'),
(108, 8, 'Qual bioma brasileiro é considerado a maior planície de inundação contínua do mundo?', 'facil', 1, 'O Pantanal é conhecido por ser a maior planície de inundação contínua do mundo.'),
(109, 8, 'A vegetação de Savana brasileira, caracterizada por árvores de troncos retorcidos e casca grossa, pertence a qual bioma?', 'facil', 1, 'O Cerrado apresenta vegetação semelhante à savana, com árvores de troncos retorcidos e casca grossa.'),
(110, 8, 'O bioma Pampa está localizado exclusivamente em qual estado brasileiro?', 'facil', 1, 'O Pampa brasileiro está localizado exclusivamente no Rio Grande do Sul.'),
(111, 8, 'Qual bioma brasileiro teve a maior porcentagem de sua área original destruída devido à ocupação histórica e urbanização no litoral do país?', 'medio', 5, 'A Mata Atlântica sofreu grande destruição ao longo da história devido à ocupação do litoral e à urbanização.'),
(112, 8, 'O Cerrado é frequentemente chamado de \"A caixa d\'água do Brasil\". Por quê?', 'medio', 5, 'O Cerrado abriga importantes nascentes e aquíferos que alimentam grandes bacias hidrográficas brasileiras.'),
(113, 8, 'A Floresta de Ombrófila Mista, marcada pela presença da Araucaria angustifolia (pinheiro-do-paraná), faz parte de qual bioma?', 'medio', 5, 'A Floresta de Ombrófila Mista, conhecida pela presença da araucária, faz parte do bioma Mata Atlântica.'),
(114, 8, 'As plantas \"Caducifólias\" (ou decíduas), muito comuns na Caatinga, têm como estratégia de sobrevivência:', 'medio', 5, 'Essas plantas perdem suas folhas durante a estação seca para reduzir a perda de água por evapotranspiração.'),
(115, 8, 'O que são as formações conhecidas como \"Restingas\" e \"Manguezais\"?', 'medio', 5, 'São ecossistemas associados à Mata Atlântica, localizados ao longo da zona costeira.'),
(116, 8, 'Qual é a principal ameaça atual à biodiversidade do bioma Cerrado?', 'medio', 5, 'A expansão desordenada da fronteira agrícola e da pecuária extensiva ameaça a biodiversidade do Cerrado.'),
(117, 8, 'O bioma Pampa é predominantemente composto por qual tipo de vegetação?', 'medio', 5, 'O Pampa é formado principalmente por campos nativos, com gramíneas e plantas herbáceas.'),
(118, 8, 'O Cerrado e a Mata Atlântica são classificados mundialmente como Hotspots de Biodiversidade. Essa classificação exige:', 'dificil', 10, 'Um hotspot apresenta elevada biodiversidade e alto grau de endemismo, mas já perdeu pelo menos 70% de sua vegetação original.'),
(119, 8, 'Na Amazônia, a diferença fundamental entre as matas de \"Igapó\", \"Várzea\" e \"Terra Firme\" é:', 'dificil', 10, 'A principal diferença está no regime de inundação: o Igapó fica permanentemente inundado, a Várzea é inundada periodicamente e a Terra Firme nunca é inundada.'),
(120, 8, 'O fenômeno dos \"Rios Voadores\" originado na Amazônia consiste em:', 'dificil', 10, 'São fluxos de massas de ar carregadas de vapor de água, proveniente da evapotranspiração da floresta, que se deslocam em direção ao Centro-Sul do Brasil.'),
(121, 9, 'Qual destas espécies brasileiras é um símbolo da luta pela conservação da Mata Atlântica e estampado na nota de 20 reais?', 'facil', 1, 'O mico-leão-dourado é um símbolo da conservação da Mata Atlântica e aparece na nota de 20 reais.'),
(122, 9, 'A caça ilegal para retirar o chifre (composto de queratina) coloca em grave risco de extinção qual grande mamífero africano?', 'facil', 1, 'O rinoceronte é ameaçado pela caça ilegal, principalmente pela retirada de seu chifre, que é composto de queratina.'),
(123, 9, 'Qual é a maior causa global do aumento do risco de extinção de espécies animais?', 'facil', 1, 'A destruição e a fragmentação dos habitats naturais pelas atividades humanas são as principais causas do aumento do risco de extinção.'),
(124, 9, 'O Urso-polar está ameaçado de extinção principalmente por causa de qual impacto ambiental?', 'facil', 1, 'O derretimento do gelo marinho no Ártico, provocado pelas mudanças climáticas, reduz o habitat natural do urso-polar.'),
(125, 9, 'Qual é a denominação dada às espécies de animais ou plantas que existem APENAS em uma determinada região geográfica?', 'facil', 1, 'Espécies endêmicas são aquelas que existem naturalmente apenas em uma determinada região geográfica.'),
(126, 9, 'O que é a Lista Vermelha de Espécies Ameaçadas mantida pela UICN?', 'medio', 5, 'A Lista Vermelha da UICN é o sistema global mais abrangente de avaliação do risco de extinção das espécies.'),
(127, 9, 'A introdução de espécies exóticas invasoras ameaça espécies nativas porque:', 'medio', 5, 'As espécies invasoras podem competir por recursos e predar espécies locais, muitas vezes sem encontrar predadores naturais na nova região.'),
(128, 9, 'A Ararinha-azul (Cyanopsitta spixii) ficou famosa na conservação ambiental brasileira por ter atingido qual status na natureza?', 'medio', 5, 'A ararinha-azul foi considerada extinta na natureza, sobrevivendo em cativeiro para programas de reintrodução.'),
(129, 9, 'Qual a função das chamadas \"Unidades de Conservação de Proteção Integral\" (como os Parques Nacionais)?', 'medio', 5, 'Essas unidades têm como objetivo preservar a natureza, permitindo apenas o uso indireto dos recursos naturais, como pesquisa e ecoturismo.'),
(130, 9, 'O Lobo-guará e o Tamanduá-bandeira sofrem forte ameaça no bioma Cerrado devido a:', 'medio', 5, 'A perda de habitat causada pelo agronegócio e os atropelamentos frequentes em rodovias ameaçam essas espécies.'),
(131, 9, 'O que são os \"Corredores Ecológicos\"?', 'medio', 5, 'São faixas de terra que conectam fragmentos de floresta, permitindo o deslocamento dos animais e o fluxo gênico entre populações.'),
(132, 9, 'A Tartaruga-de-pente e a Tartaruga-de-couro, que desovam no litoral brasileiro, são seriamente ameaçadas por:', 'medio', 5, 'A poluição por plásticos, a pesca acidental e a destruição das praias de desova são ameaças importantes para essas tartarugas.'),
(133, 9, 'O conceito genético conhecido como \"Efeito Gargalo\" (Bottleneck Effect) em populações reduzidas implica:', 'dificil', 10, 'O efeito gargalo provoca uma redução severa da variabilidade genética, aumentando a consanguinidade e a vulnerabilidade da população.'),
(134, 9, 'Qual é a diferença entre a classificação \"Em Perigo\" (EN) e \"Criticamente em Perigo\" (CR) na metodologia da UICN?', 'dificil', 10, 'A categoria Criticamente em Perigo indica um risco de extinção na natureza extremamente elevado e superior ao da categoria Em Perigo.'),
(135, 9, 'O efeito cascata ecológico conhecido como \"Trofismo Top-Down\", resultante da extinção local de um superpredador (como a Onça-pintada), causa tipicamente:', 'dificil', 10, 'A extinção de um superpredador pode provocar o aumento descontrolado de herbívoros médios, causando sobrepastoreio e degradação da vegetação local.'),
(136, 10, 'Se um banho de 15 minutos gasta cerca de 135 litros de água, quantos litros de água uma pessoa economizará por dia se reduzir o tempo do seu banho diário para 5 minutos?', 'facil', 1, 'Cada minuto de banho consome aproximadamente 9 litros. Em 5 minutos são gastos 45 litros. Portanto, a economia é de 135 - 45 = 90 litros por dia.'),
(137, 10, 'Uma família gera 2 kg de resíduos plásticos por semana. Se essa família reciclar todo esse plástico, quantos quilos de resíduo plástico ela deixará de mandar para o aterro sanitário ao final de 1 ano (considere 52 semanas no ano)?', 'facil', 1, 'Multiplicando 2 kg por semana pelas 52 semanas do ano, temos 2 × 52 = 104 kg de plástico reciclado.'),
(138, 10, 'Para produzir 1 kg de papel novo são necessários aproximadamente 2000 litros de água. Se uma empresa reciclar papel e economizar 50 kg de papel novo, quantos litros de água ela terá evitado consumir?', 'facil', 1, 'Cada quilo de papel exige aproximadamente 2000 litros de água. Assim, 50 × 2000 = 100.000 litros de água economizados.'),
(139, 10, 'Um painel solar residencial gera 40 kWh de energia limpa por mês. Quantos kWh essa placa gera em um ano (12 meses)?', 'facil', 1, 'Multiplicando a produção mensal pelos 12 meses do ano, temos 40 × 12 = 480 kWh.'),
(140, 10, 'Uma torneira gotejando desperdiça cerca de 46 litros de água por dia. Quanto essa torneira desperdiçará em um mês de 30 dias?', 'facil', 1, 'Multiplicando o desperdício diário pelos 30 dias, temos 46 × 30 = 1.380 litros de água.'),
(141, 10, 'Um carro a gasolina emite cerca de 150 gramas de CO2 por quilômetro rodado. Se uma pessoa percorre 20 km por dia para ir e voltar do trabalho, qual é a massa de CO2 emitida por esse veículo em 5 dias de trabalho na semana?', 'medio', 5, 'A distância semanal é de 20 × 5 = 100 km. Multiplicando por 150 gramas por quilômetro, temos 15.000 gramas, equivalentes a 15 kg de CO2.'),
(142, 10, 'Estima-se que uma árvore adulta absorva cerca de 120 kg de CO2 ao longo de 1 ano. Quantas árvores adultas seriam necessárias para neutralizar as emissões de uma pessoa que emite 1,2 tonelada (1200 kg) de CO2 por ano?', 'medio', 5, 'Dividindo as emissões anuais pelos 120 kg absorvidos por árvore, temos 1200 ÷ 120 = 10 árvores.'),
(143, 10, 'A pegada hídrica para a produção de 1 kg de carne bovina é de aproximadamente 15.000 litros de água. Se uma pessoa reduzir o consumo de carne bovina em 500 gramas (0,5 kg) por semana, quanta água ela ajudará a economizar indiretamente em um mês (4 semanas)?', 'medio', 5, 'A redução mensal é de 0,5 × 4 = 2 kg. Multiplicando por 15.000 litros por quilo, temos 2 × 15.000 = 30.000 litros de água.'),
(144, 10, 'Uma lâmpada incandescente antiga consome 60 W de potência, enquanto uma lâmpada LED equivalente consome apenas 9 W. Se mantidas acesas por 10 horas ao dia, qual é a economia de energia diária (em Watt-hora, Wh) ao substituir a incandescente pela LED?', 'medio', 5, 'A diferença de potência é de 60 - 9 = 51 W. Multiplicando pelas 10 horas de uso, temos 51 × 10 = 510 Wh economizados por dia.'),
(145, 10, 'A reciclagem de 1 tonelada (1000 kg) de papel evita o corte de aproximadamente 20 árvores adultas. Se uma escola arrecadou 250 kg de papel usado para reciclagem, quantas árvores adultas foram salvas proporcionalmente?', 'medio', 5, '250 kg representam um quarto de 1000 kg. Portanto, 20 ÷ 4 = 5 árvores salvas.'),
(146, 10, 'Uma fábrica produz 50 toneladas de resíduos por mês e enviava tudo para o aterro. Após um programa de gestão ambiental, passou a reciclar 60% e compostar 25% do total. Quantas toneladas de resíduos AINDA são enviadas ao aterro sanitário mensalmente?', 'medio', 5, 'A fábrica reaproveita 60% + 25% = 85% dos resíduos. Restam 15% para o aterro. Calculando 15% de 50 toneladas, temos 7,5 toneladas.'),
(147, 10, 'Se uma sacola plástica comum demora 400 anos para se decompor no meio ambiente e uma sacola bioplástica biodegradável leva 0,5 ano (6 meses), quantas vezes mais rápido a sacola bioplástica se decompõe em relação à comum?', 'medio', 5, 'Dividindo o tempo de decomposição da sacola comum pelo da bioplástica, temos 400 ÷ 0,5 = 800 vezes mais rápido.'),
(148, 10, 'Um sistema fotovoltaico de 5 kWp produz 600 kWh por mês. Sabendo que o fator de emissão da rede elétrica local é de 0,1 kg de CO2 por kWh consumido, qual é a quantidade de emissões de CO2 evitada por esse sistema ao longo de 1 ano de operação?', 'dificil', 10, 'A produção anual é de 600 × 12 = 7.200 kWh. Multiplicando pelo fator de emissão de 0,1 kg de CO2 por kWh, temos 720 kg de CO2 evitados.'),
(149, 10, 'Uma área de floresta de 10 hectares sequestra cerca de 5 toneladas de carbono (C) por hectare/ano. Para converter massa de Carbono (C) em dióxido de carbono (CO2), multiplica-se por 3,67. Quantas toneladas de CO2 essa floresta remove da atmosfera por ano?', 'dificil', 10, 'A floresta sequestra 10 × 5 = 50 toneladas de carbono. Convertendo para CO2, temos 50 × 3,67 = 183,5 toneladas de CO2 por ano.'),
(150, 10, 'Um caminhão de carga a diesel consome 1 litro de combustível a cada 3 km e emite 2,6 kg de CO2 por litro queimado. Em um trajeto de entrega de 450 km, qual será a pegada de carbono total referente ao combustível queimado nessa viagem?', 'dificil', 10, 'O caminhão consome 450 ÷ 3 = 150 litros de diesel. Multiplicando por 2,6 kg de CO2 por litro, temos 150 × 2,6 = 390 kg de CO2 emitidos.');

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

--
-- Despejando dados para a tabela `respostas_usuario`
--

INSERT INTO `respostas_usuario` (`id`, `partida_id`, `questao_id`, `tentativas`, `acertou`, `pontos_ganhos`) VALUES
(1, 1, 31, 1, 0, 0),
(2, 1, 32, 1, 1, 1),
(3, 1, 33, 1, 1, 1),
(4, 1, 34, 1, 0, 0),
(5, 1, 35, 1, 0, 0),
(6, 1, 36, 1, 0, 0),
(7, 1, 37, 1, 0, 0),
(8, 1, 38, 1, 0, 0),
(9, 1, 39, 1, 1, 5),
(10, 1, 40, 1, 0, 0),
(11, 1, 41, 1, 0, 0),
(12, 1, 42, 1, 0, 0),
(13, 1, 43, 1, 1, 10),
(14, 1, 44, 1, 0, 0),
(15, 1, 45, 1, 0, 0),
(16, 2, 76, 1, 0, 0),
(17, 2, 77, 1, 0, 0),
(18, 2, 78, 1, 0, 0),
(19, 2, 79, 1, 0, 0),
(20, 2, 80, 1, 0, 0),
(21, 2, 81, 1, 0, 0),
(22, 2, 82, 1, 0, 0),
(23, 2, 83, 1, 0, 0),
(24, 2, 84, 1, 1, 5),
(25, 2, 85, 1, 1, 5),
(26, 2, 86, 1, 0, 0),
(27, 2, 87, 1, 0, 0),
(28, 2, 88, 1, 0, 0),
(29, 2, 89, 1, 1, 10),
(30, 2, 90, 1, 1, 10),
(31, 3, 76, 1, 1, 1),
(32, 3, 77, 1, 1, 1),
(33, 3, 78, 1, 0, 0),
(34, 3, 79, 1, 1, 1),
(35, 3, 80, 1, 1, 1),
(36, 3, 81, 1, 0, 0),
(37, 3, 82, 1, 0, 0),
(38, 3, 83, 1, 0, 0),
(39, 3, 84, 1, 0, 0),
(40, 3, 85, 1, 0, 0),
(41, 3, 86, 1, 0, 0),
(42, 3, 87, 1, 0, 0),
(43, 3, 88, 1, 1, 10),
(44, 3, 89, 1, 0, 0),
(45, 3, 90, 1, 0, 0),
(46, 4, 61, 1, 0, 0),
(47, 4, 62, 1, 0, 0),
(48, 4, 63, 1, 0, 0),
(49, 4, 64, 1, 0, 0),
(50, 4, 65, 1, 0, 0),
(51, 4, 66, 1, 1, 5),
(52, 4, 67, 1, 0, 0),
(53, 4, 68, 1, 0, 0),
(54, 4, 69, 1, 0, 0),
(55, 4, 70, 1, 0, 0),
(56, 4, 71, 1, 0, 0),
(57, 4, 72, 1, 0, 0),
(58, 4, 73, 1, 0, 0),
(59, 4, 74, 1, 0, 0),
(60, 4, 75, 1, 0, 0),
(61, 5, 61, 1, 0, 0),
(62, 5, 62, 1, 0, 0),
(63, 5, 63, 1, 0, 0),
(64, 5, 64, 1, 0, 0),
(65, 5, 65, 1, 0, 0),
(66, 5, 66, 1, 0, 0),
(67, 5, 67, 1, 1, 5),
(68, 5, 68, 1, 0, 0),
(69, 5, 69, 1, 0, 0),
(70, 5, 70, 1, 1, 5),
(71, 5, 71, 1, 0, 0),
(72, 5, 72, 1, 0, 0),
(73, 5, 73, 1, 0, 0),
(74, 5, 74, 1, 1, 10),
(75, 5, 75, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `temas`
--

CREATE TABLE `temas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `capa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `temas`
--

INSERT INTO `temas` (`id`, `nome`, `capa`) VALUES
(1, 'Curiosidades da Natureza', '../uploads/tema1.jpg'),
(2, 'Energias Renováveis', '../uploads/tema2.jpg'),
(3, 'Água Doce e Oceanos', '../uploads/tema3.jpg'),
(4, 'Consumo Consciente e Pegada de Carbono', '../uploads/tema4.jpg'),
(5, 'Reciclagem', '../uploads/tema5.jpg'),
(6, 'Desastres Ambientais', '../uploads/tema6.jpg'),
(7, 'Mudanças Climáticas', '../uploads/tema7.jpg'),
(8, 'Biomas do Brasil', '../uploads/tema8.jpg'),
(9, 'Animais em Extinção', '../uploads/tema9.jpg'),
(10, 'Cálculos de Impacto Ambiental', '../uploads/tema10.jpg');

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
(1, 'adm', 'adm@email.com', '2026-09-29 01:15:44', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 'Teste', 'teste@email.com', '2026-10-24 21:44:21', '16b2027f8f3bd5615ff9af70655aa51d9a535f595d4981b9978661293f5d9c92'),
(3, 'Zezin', 'zezin@email.com', '2026-11-10 19:38:34', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(4, 'Guest', 'Teste definitivo', '2026-11-11 01:58:59', '39746bf6458974659ea632a8f5b03f0be3f9a15c4a7db25c1c0493dc9397a9e8'),
(5, 'Guest', 'abc@email.com', '2026-11-11 02:00:16', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT de tabela `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `questoes`
--
ALTER TABLE `questoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de tabela `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `temas`
--
ALTER TABLE `temas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
