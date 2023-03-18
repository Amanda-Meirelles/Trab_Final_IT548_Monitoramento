-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18/03/2023 às 15:30
-- Versão do servidor: 8.0.31
-- Versão do PHP: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `monitoramento`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `analista`
--

CREATE TABLE `analista` (
  `id` int NOT NULL,
  `crea` varchar(45) NOT NULL,
  `funcionarios_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `analista`
--

INSERT INTO `analista` (`id`, `crea`, `funcionarios_id`) VALUES
(1, '202155', 1),
(2, '256389', 2),
(3, '698521', 3),
(4, '995826', 4),
(5, '85412633', 5),
(6, '841120', 6),
(7, '745120', 7),
(8, '102030', 8),
(9, '258693', 9),
(10, '415520', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `chefe_de_campo`
--

CREATE TABLE `chefe_de_campo` (
  `id` int NOT NULL,
  `cnh` varchar(45) DEFAULT NULL,
  `funcionarios_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `chefe_de_campo`
--

INSERT INTO `chefe_de_campo` (`id`, `cnh`, `funcionarios_id`) VALUES
(1, '40415596', 11),
(2, '52698874', 12),
(3, '10587460', 13),
(4, '85967432', 14),
(5, '88712203', 15),
(6, '', 16),
(7, '54102203', 17),
(8, NULL, 18),
(9, '10224894', 19),
(10, NULL, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `classificacao`
--

CREATE TABLE `classificacao` (
  `id` int NOT NULL,
  `tipo` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `classificacao`
--

INSERT INTO `classificacao` (`id`, `tipo`) VALUES
(1, 'Queimada'),
(2, 'Edificação'),
(3, 'Retirada de Edificação'),
(4, 'Solo Exposto'),
(5, 'Retirada de Cobertura Florestal'),
(6, 'Edificações Múltiplas'),
(7, 'Abertura de vias'),
(8, 'Reservatório'),
(9, 'Erosão'),
(10, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura para tabela `deteccao`
--

CREATE TABLE `deteccao` (
  `id` int NOT NULL,
  `poligonos` varchar(45) NOT NULL,
  `area` varchar(45) DEFAULT NULL,
  `centroide` varchar(45) DEFAULT NULL,
  `classificacao_id` int NOT NULL,
  `analista_id` int NOT NULL,
  `localizacao_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `deteccao`
--

INSERT INTO `deteccao` (`id`, `poligonos`, `area`, `centroide`, `classificacao_id`, `analista_id`, `localizacao_id`) VALUES
(1, '\'POLYGON((42 21,48 28,42 28,34 50))\',0', '240', '48, 28', 2, 1, 85),
(2, '\'POLYGON((38 21,58 28,42 28,34 80))\',0', '56', '38, 32', 9, 1, 70),
(3, '\'POLYGON((25 40,44 28,42 28,25 32))\',0', '90', NULL, 5, 1, 105),
(4, '\'POLYGON((88 21,98 28,102 28,84 80))\',0', '138', '86, 44', 4, 1, 78),
(5, '\'POLYGON((30 40,35 28,42 28,40 32))\',0', '75', '35, 42', 4, 1, 85),
(6, '\'POLYGON((150 90,120 85,132 99,182 90))\',0', '249', NULL, 5, 1, 90),
(7, '\'POLYGON((75 40,84 28,72 28,65 32))\',0', '168', NULL, 5, 1, 86),
(8, '\'POLYGON((35 40,34 28,32 28,35 25))\',0', '53', NULL, 3, 1, 96),
(9, '\'POLYGON((56 21,21 28,62 28,34 31))\',0', '60', NULL, 2, 2, 69),
(10, '\'POLYGON((14 21,21 28,22 28,16 20))\',0', '105', NULL, 6, 1, 75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `deteccao_imagem_de_satélite_ia`
--

CREATE TABLE `deteccao_imagem_de_satélite_ia` (
  `deteccoes_id` int NOT NULL,
  `imagem_de_satélite_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deteccao_imagem_de_satélite_ir`
--

CREATE TABLE `deteccao_imagem_de_satélite_ir` (
  `deteccoes_id` int NOT NULL,
  `imagem_de_satélite_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `razao_social` varchar(45) DEFAULT NULL,
  `pessoa_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `empresa`
--

INSERT INTO `empresa` (`id`, `cnpj`, `razao_social`, `pessoa_id`) VALUES
(1, '2085210001', 'Light Distribuidora de Energia', 1),
(2, '4085210001', 'Distribuidora Energimax ES', 4),
(3, '8569210001', 'Eletro Minas Transmissoes', 5),
(4, '5095210001', 'Enel Energia Eletrica', 11),
(5, '2448210001', 'Minas Distribuidora de Energias LTDA', 12),
(6, '2569410001', 'Maxi Energias e Eletrica Distr.', 13),
(7, '20225860001', 'Transmissoes Eletro São Paulo', 14),
(8, '2942270001', 'Eletrix Distribuidora LTDA', 15),
(9, '2675220001', 'Light Distribuidora de Energia Espírito Santo', 16),
(10, '4275210001', 'Luz&Cia Energias LTDA', 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `empresa_id` int NOT NULL,
  `pessoa_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `cpf`, `genero`, `empresa_id`, `pessoa_id`) VALUES
(1, '1438885463', 'Feminino', 1, 2),
(2, '14475298871', 'Feminino', 1, 3),
(3, '15266632145', 'Masculino', 2, 6),
(4, '15885269321', 'Feminino', 5, 7),
(5, '14475362984', '', 7, 8),
(6, '1523369512', 'Masculino', 10, 9),
(7, '1568867485', 'Feminino', 4, 10),
(8, '1652220410', '', 3, 18),
(9, '1952204105', 'Masculino', 9, 19),
(10, '185226910', 'Feminino', 2, 20),
(11, '1852044209', '', 8, 21),
(12, '15475298871', 'Feminino', 1, 22),
(13, '1526885463', 'Masculino', 10, 23),
(14, '14167985231', 'Feminino', 1, 24),
(15, '15589364671', 'Masculino', 4, 25),
(16, '18525298871', 'Feminino', 6, 26),
(17, '1886485463', NULL, 5, 27),
(18, '12375298871', 'Feminino', 5, 28),
(19, '1463332178', '', 7, 29),
(20, '1425582069', 'Masculino', 1, 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem_de_satélite`
--

CREATE TABLE `imagem_de_satélite` (
  `id` int NOT NULL,
  `sensor` varchar(45) DEFAULT NULL,
  `data` date NOT NULL,
  `resolucao` decimal(10,0) DEFAULT NULL,
  `caminho_do_arquivo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `imagem_de_satélite`
--

INSERT INTO `imagem_de_satélite` (`id`, `sensor`, `data`, `resolucao`, `caminho_do_arquivo`) VALUES
(1, 'WV01', '2020-03-05', 50, 'area_de_interesse.tiff'),
(2, 'WV02', '2023-03-01', 15, 'area_de_interesse.tiff'),
(3, 'WV01', '2022-09-07', 40, 'area_de_interesse.tiff'),
(4, 'WV03', '2022-07-04', 15, 'area_de_interesse.tiff'),
(5, NULL, '2021-05-06', 40, 'area_de_interesse.tiff'),
(6, 'GE1', '2022-03-04', 50, 'area_de_interesse.tiff'),
(7, 'GE01', '2023-01-05', 50, 'area_de_interesse.tiff'),
(8, 'WV03', '2022-11-06', 15, 'area_de_interesse.tiff'),
(9, 'GE02', '2022-11-10', 50, 'area_de_interesse.tiff'),
(10, 'WV01', '2020-04-25', 40, 'area_de_interesse.tiff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linha_transmissao`
--

CREATE TABLE `linha_transmissao` (
  `id` int NOT NULL,
  `poligono` polygon NOT NULL,
  `empresa_id` int NOT NULL,
  `localizacao_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linha_transmissao`
--

INSERT INTO `linha_transmissao` (`id`, `poligono`, `empresa_id`, `localizacao_id`) VALUES
(60, 0xe61000000103000000010000000500000003d09494d49945c08a327d3411f236c003d09434ad9945c0ddb54d66e0f236c003d094b43c9945c09452f799acf236c003d094f4749945c045926a53bef136c003d09494d49945c08a327d3411f236c0, 1, 56),
(61, 0xe61000000103000000010000000500000003d0949432b445c0e5ce8d9d170137c003d0945454b445c059009e342f0237c003d094f4a5b345c03d98d67e1a0237c003d094748fb345c0bf4b37756a0137c003d0949432b445c0e5ce8d9d170137c0, 1, 57),
(62, 0xe6100000010300000001000000050000001f5ac18fa7a145c0896a106d64ef36c01f5ac10f72a245c0bbf2b199a5f036c01f5ac16fe5a145c0e0a2fb8f1af236c01f5ac1af0fa145c0759183716af136c01f5ac18fa7a145c0896a106d64ef36c0, 1, 58),
(63, 0xe610000001030000000100000005000000b74f17259cc445c0b00f7992650437c0b74f17259cc445c041917507ef0537c0b74f1745d7c345c0745fb8364c0637c0b74f17059fc345c0267050fd8e0437c0b74f17259cc445c0b00f7992650437c0, 1, 59),
(64, 0xe6100000010300000001000000050000002ea630b1aadf45c0cff848828ad736c02ea630719fdf45c094058c0659db36c02ea63031b3de45c05b6208a0dcda36c02ea630f14dde45c0f622a0dc59d836c02ea630b1aadf45c0cff848828ad736c0, 4, 60),
(65, 0xe6100000010300000001000000050000007c0beca5c7d945c062edab2149c036c07c0bec25b1d945c00c5e60ba30c236c07c0bec053bd945c00b79f3be37c136c07c0bec053bd945c00b09cd80a6c036c07c0beca5c7d945c062edab2149c036c0, 4, 61),
(66, 0xe6100000010300000001000000050000003c59d8775bcb45c0d31df77c0dbb36c03c59d8576ccb45c01ee0a202ddbb36c03c59d877d4ca45c0b3b5cbbe4bbb36c03c59d8f717cb45c0e837592e3cbb36c03c59d8775bcb45c0d31df77c0dbb36c0, 4, 62),
(67, 0xe610000001030000000100000005000000b12a178848c145c08daebe0d33b736c0b12a17b872c145c089cc5ef5b9b736c0b12a17682cc145c0738ce3a7e8b736c0b12a173802c145c0b63bbdf066b736c0b12a178848c145c08daebe0d33b736c0, 4, 63),
(69, 0xe610000001030000000100000005000000e0ba794479ec45c0b154b3a820eb36c0e0ba79c462ec45c0b9830cb423ec36c0e0ba793411ec45c06884e83e33ec36c0e0ba793411ec45c0396e124788eb36c0e0ba794479ec45c0b154b3a820eb36c0, 1, 65),
(70, 0xe610000001030000000100000005000000acc58af75a0446c0fdf5d220caf236c0acc58a17a40446c0790a6ce900f436c0acc58ab74f0446c0512640b534f436c0acc58ad7110446c053cc86f58ef336c0acc58af75a0446c0fdf5d220caf236c0, 1, 66),
(71, 0xe610000001030000000100000005000000382ef8414b2b46c03bb585fcf00037c0382ef8a1182b46c008a104e7a30237c0382ef8c1262a46c02b3273d6840237c0382ef881482a46c0ade846d4430137c0382ef8414b2b46c03bb585fcf00037c0, 1, 67),
(72, 0xe610000001030000000100000005000000916b8208615e46c0bdf4d052c73337c0916b8248205f46c07d5f56a2b73537c0916b82c8a15d46c0d32d4dbe713637c0916b82c8745d46c065084c33123537c0916b8208615e46c0bdf4d052c73337c0, 1, 68),
(73, 0xe61000000103000000010000000500000044d0542df50945c0f5558b24b2e436c044d054ad380a45c0599b210495e836c044d0542d330845c00d3b135e11e936c044d0542d330845c0c14a5e53d4e536c044d0542df50945c0f5558b24b2e436c0, 8, 69),
(74, 0xe610000001030000000100000004000000f6e25cb4483a45c0c1637052cde636c0f6e25cb4fc3a45c0664612bebee836c0f6e25cb4483a45c078a0dd173be936c0f6e25cb4483a45c0c1637052cde636c0, 8, 70),
(75, 0xe610000001030000000100000006000000e01c87f3632545c0ff1f6c81d0d536c0e01c87b3772445c0b187412c24d336c0e01c87738e2045c05279168f7dd536c0e01c87739c2145c07a43e7ed0dd936c0e01c8733612445c059f0d29ab4d636c0e01c87f3632545c0ff1f6c81d0d536c0, 8, 71),
(76, 0xe610000001030000000100000005000000bc46dc2bcef844c0332de1857ec536c0bc46dcab6bf944c0cff9f3d881c636c0bc46dc6bd9f844c00741fc0b66c736c0bc46dc6b7ff844c065d80e1a6dc636c0bc46dc2bcef844c0332de1857ec536c0, 8, 72),
(77, 0xe610000001030000000100000005000000d832b13b73a344c003c5db31aeb735c0d832b1fbcfa444c0fe6ef8c0b8b935c0d832b13b27a444c09826b8c75abb35c0d832b13b92a244c03a998a3e50b935c0d832b13b73a344c003c5db31aeb735c0, 6, 73),
(78, 0xe6100000010300000001000000050000002596b43b7ec544c0d3fb6904213535c02596b4fb26c644c0cc6107ae463635c02596b4db83c544c0dd16beeb223735c02596b43b24c544c0c165bbc0073635c02596b43b7ec544c0d3fb6904213535c0, 6, 74),
(79, 0xe610000001030000000100000005000000e883255d45b044c0a8be5b5e4e4f35c0e883255d26b144c0247ec6abc75035c0e883257d8eb044c0ec0a88adcd5135c0e883251db3af44c0d634ac12fc5035c0e883255d45b044c0a8be5b5e4e4f35c0, 6, 75),
(80, 0xe6100000010300000001000000050000003f9950c4b1aa44c01e28aa32438f35c03f9950a4d0ab44c018a2019e729035c03f9950e454ab44c0a1172fbb7d9235c03f99500490aa44c083cd8890979135c03f9950c4b1aa44c01e28aa32438f35c0, 6, 76),
(81, 0xe6100000010300000001000000050000009fe4b33ba2c644c0b66fd6df0e1935c09fe4b3bb12c744c07c6d70a71b1b35c09fe4b3bb7dc544c0d45d5996ae1b35c09fe4b3bb7dc544c0f5ce73d94d1935c09fe4b33ba2c644c0b66fd6df0e1935c0, 6, 77),
(82, 0xe6100000010300000001000000050000007f07e27f99ad44c0b0a334cf16f034c07f07e27ff3ad44c0aa67cdfd27f134c07f07e23f61ad44c07850ce2d4ef234c07f07e27fb8ac44c01284bf0b7cf134c07f07e27f99ad44c0b0a334cf16f034c0, 2, 78),
(83, 0xe61000000103000000010000000500000048257b322e9144c0d07a3389fedb34c048257b52fe9144c0e81b767259dd34c048257b521d9144c0e186fa8247df34c048257b520f9044c04e11828baddd34c048257b322e9144c0d07a3389fedb34c0, 2, 79),
(84, 0xe610000001030000000100000005000000877b8501626e44c001bbbb73ba0c35c0877b85e1456e44c09e1389e6d10e35c0877b8561216d44c06c3a9d6a490e35c0877b8521436d44c043855b73cf0c35c0877b8501626e44c001bbbb73ba0c35c0, 9, 80),
(85, 0xe6100000010300000001000000050000006a051189e86544c0dff190807ae934c06a051169806644c07431ff3881ea34c06a051169536644c0a024dfccdfea34c06a051189bb6544c055f351b261ea34c06a051189e86544c0dff190807ae934c0, 9, 81),
(86, 0xe61000000103000000010000000500000060f30745d95d44c066096077aad534c060f30765145d44c0b2fddcbf0cd534c060f307a5795d44c0e8d0e8e105d434c060f30725175e44c09ea548be54d434c060f30745d95d44c066096077aad534c0, 9, 82),
(87, 0xe6100000010300000001000000050000006221b3e9c25144c03ee4a2ff71cc34c06221b329ce5144c05c5773b441cd34c06221b3314e5144c0f41efabc56cd34c06221b3314e5144c07f28263962cc34c06221b3e9c25144c03ee4a2ff71cc34c0, 9, 83),
(88, 0xe610000001030000000100000005000000907f85589e4244c0eda48c2770aa34c0907f8578e74244c0400b34c808ab34c0907f85589e4244c0ff5727aa0aac34c0907f8548364244c000e47cd51dab34c0907f85589e4244c0eda48c2770aa34c0, 9, 84),
(89, 0xe6100000010300000001000000050000008749337ecb2b44c006400efd5b4e34c08749331ed12b44c085e3a1a74e4f34c08749330e0f2b44c0f0492861494f34c0874933de112b44c070af15a47b4e34c08749337ecb2b44c006400efd5b4e34c0, 9, 85),
(90, 0xe610000001030000000100000004000000a21d0941a20d46c05d82af4508d533c0a21d0941cc1046c0fceac251a3dc33c0a21d0941560e46c0460af53442e233c0a21d0941a20d46c05d82af4508d533c0, 3, 86),
(91, 0xe610000001030000000100000005000000a21d09410cc245c0a27d67bf0b6a34c0a21d09c122c245c0b4d5cae3f96f34c0a21d09c117be45c03a7010a6db6b34c0a21d094188be45c0054b4b18606a34c0a21d09410cc245c0a27d67bf0b6a34c0, 3, 87),
(92, 0xe6100000010300000001000000050000001ce8c7828a1446c01c75dca37b2135c01ce8c742f81346c0fe42890ac71e35c01ce8c782c81246c021dba8ca7f2035c01ce8c702661346c0f72b096ae02235c01ce8c7828a1446c01c75dca37b2135c0, 3, 88),
(93, 0xe6100000010300000001000000050000001e1cc4a05eb846c0949d1243a68435c01e1cc4a031b846c01b39b9ecec7e35c01e1cc4a0adb446c01b39b9ecec7e35c01e1cc4a0dab446c0a05920f1d48335c01e1cc4a05eb846c0949d1243a68435c0, 3, 89),
(94, 0xe610000001030000000100000005000000b3e97aee587846c0a63fa95e6b2534c0b3e97aee2b7846c03b63e723a22034c0b3e97a6e047a46c055fc4d62232034c0b3e97aeea17a46c0f236d3e26d2434c0b3e97aee587846c0a63fa95e6b2534c0, 3, 90),
(95, 0xe6100000010300000001000000050000004045a7edf9b645c02fcb28d085cd35c04045a7ed56b445c07fc8df35bacb35c04045a7edebb545c0763385b94cc835c04045a76d1eb845c0e91cd0ccc4c935c04045a7edf9b645c02fcb28d085cd35c0, 3, 91),
(96, 0xe610000001030000000100000005000000a21a4555e50b47c0fd9917e8fa9b36c0a21a45d5a40847c0da25bdab389936c0a21a4555c90947c040f9f9a2a69536c0a21a45d5bd0d47c0c22d11da159836c0a21a4555e50b47c0fd9917e8fa9b36c0, 8, 92),
(97, 0xe610000001030000000100000005000000645e34b2614147c0528e9d200e9d36c0645e34721b4047c0a283955e229a36c0645e3432d53e47c0c84ced2b459b36c0645e3432e33f47c03f4d5f71689f36c0645e34b2614147c0528e9d200e9d36c0, 8, 93),
(98, 0xe610000001030000000100000005000000645e34f2db2c47c0a7365c79239d36c0645e34f2272c47c06e2bed5fc29b36c0645e3432d92b47c0d50455055b9e36c0645e34b2762c47c0e299d767ec9e36c0645e34f2db2c47c0a7365c79239d36c0, 8, 94),
(99, 0xe61000000103000000010000000500000073f1be88ba5647c0047a40588cab36c073f1be88ba5647c0ed9de56bcaa836c073f1bec88a5547c03eca7ea8b5a836c073f1be88ac5547c02006358924ab36c073f1be88ba5647c0047a40588cab36c0, 8, 95),
(100, 0xe610000001030000000100000005000000255ea1462e8e47c06c24f34ab58637c0255ea146998c47c06ae614fe007e37c0255ea1460f8f47c021083b5e097d37c0255ea146779047c0f6891af3318237c0255ea1462e8e47c06c24f34ab58637c0, 7, 96),
(101, 0xe610000001030000000100000005000000c3b3d4986e7e47c0e0d3fbc878e536c0c3b3d4989e7b47c053862dd25fdd36c0c3b3d498988147c0140f08ad05de36c0c3b3d498798247c0c17bdb928ee236c0c3b3d4986e7e47c0e0d3fbc878e536c0, 7, 97),
(102, 0xe61000000103000000010000000500000046a5095a1a1847c056463ecc459137c046a5095ac01747c09d2b50cb788b37c046a5095ab51347c0bb1f2fd1c28c37c046a5095a961447c09de1dd40e29237c046a5095a1a1847c056463ecc459137c0, 7, 98),
(103, 0xe610000001030000000100000005000000980dcb26797647c0cef48199503d37c0980dcb26227347c0907d317dda3637c0980dcb26687847c0c10564dff93237c0980dcb26497947c0c0f44ac1ca3837c0980dcb26797647c0cef48199503d37c0, 7, 99),
(104, 0xe610000001030000000100000005000000054b6de8a6c447c035e12d4f659137c0054b6de83ec347c0c3f66917038e37c0054b6d6817c547c052dd7e93668c37c0054b6de83bc647c0e8a47015f28f37c0054b6de8a6c447c035e12d4f659137c0, 7, 100),
(105, 0xe610000001030000000100000005000000b85437442aec47c0b76e73871c6337c0b85437442de947c058578c9ea06237c0b85437442de947c0467f376ee25f37c0b854374449eb47c0d33b69f6b06037c0b85437442aec47c0b76e73871c6337c0, 7, 101),
(106, 0xe61000000103000000010000000500000098e1ab70d2cc47c07e374a9b75b738c098e1abf09fca47c0f52e6818d2b638c098e1abf09fca47c048410ca807b238c098e1ab7078cc47c04d7d0d41f2b338c098e1ab70d2cc47c07e374a9b75b738c0, 7, 102),
(107, 0xe6100000010300000001000000050000005c1146e0c28247c0a81f79a5a95838c05c114660ea8047c0d72b00a6f05538c05c1146e0688247c073f1cf98605338c05c1146e0848447c00a229ca2fa5438c05c1146e0c28247c0a81f79a5a95838c0, 7, 103),
(108, 0xe6100000010300000001000000050000005b735555ed2e47c0ff8b963c7df637c05b735595af2c47c08e6326ebbaf637c05b7355d5ba2c47c0f36846c2fdf137c05b735555392e47c0ed61669364f237c05b735555ed2e47c0ff8b963c7df637c0, 7, 104),
(109, 0xe6100000010300000001000000050000007aecd2dd688e46c06ef758cd927337c07aecd2fdef8c46c0e3b6c8b4ce7237c07aecd23dfb8c46c082e83e80467137c07aecd25d7f8e46c08f5887d2507137c07aecd2dd688e46c06ef758cd927337c0, 7, 105),
(110, 0xe610000001030000000100000005000000f69c277daab746c070ba815ecad037c0f69c27bd0fb846c0374d06c172cc37c0f69c273d15ba46c03365d9f0e7cf37c0f69c27bd4ab946c075396933a1d037c0f69c277daab746c070ba815ecad037c0, 7, 106);

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `id` int NOT NULL,
  `municipio` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `regional` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `localizacao`
--

INSERT INTO `localizacao` (`id`, `municipio`, `estado`, `regional`) VALUES
(56, 'Rio de Janeiro', 'RJ', 'RJ C1 LT'),
(57, 'Rio de Janeiro', 'RJ', 'RJ C2 LT'),
(58, 'Rio de Janeiro', 'RJ', 'RJ C3 LT'),
(59, 'Rio de Janeiro', 'RJ', 'RJ C4 LT'),
(60, 'Itaguaí', 'RJ', 'Baixada Fluminense LT'),
(61, 'Seropédica', 'RJ', 'Baixada Fluminense LT'),
(62, 'Queimados', 'RJ', 'Baixada Fluminense LT'),
(63, 'Nova Iguaçu', 'RJ', 'Baixada Fluminense LT'),
(65, 'Itaguaí', 'RJ', 'Costa Verde LT'),
(66, 'Mangaratiba', 'RJ', 'Costa Verde LT'),
(67, 'Angra dos Reis', 'RJ', 'Costa Verde LT'),
(68, 'Paraty', 'RJ', 'Costa Verde LT'),
(69, 'Cabo Frio', 'RJ', 'Costa Azul LT'),
(70, 'Saquarema', 'RJ', 'Costa Azul LT'),
(71, 'Araruama', 'RJ', 'Costa Azul LT'),
(72, 'Búzios', 'RJ', 'Costa Azul LT'),
(73, 'Campos dos Goytacazes', 'RJ', 'Conexão Rio ES'),
(74, 'Mutum', 'RJ', 'Conexão Rio ES'),
(75, 'São Roque', 'RJ', 'Conexão Rio ES'),
(76, 'Guandu', 'RJ', 'Conexão Rio ES'),
(77, 'Rio Doce', 'ES', 'Conexão Rio ES'),
(78, 'Muqui', 'ES', 'Muqui LT'),
(79, 'Cachoeiro de Itapemirim', 'ES', 'Cachoeiro LT'),
(80, 'Marataízes', 'ES', 'Costa ES LT'),
(81, 'Itaipava', 'ES', 'Costa ES LT'),
(82, 'Piúma', 'ES', 'Costa ES LT'),
(83, 'Anchieta', 'ES', 'Costa ES LT'),
(84, 'Guarapari', 'ES', 'Costa ES LT'),
(85, 'Vitória', 'ES', 'Costa ES LT'),
(86, 'Belo Horizonte', 'MG', 'MG LT'),
(87, 'Ouro Preto', 'MG', 'MG LT'),
(88, 'Tiradentes', 'MG', 'MG LT'),
(89, 'Varginha', 'MG', 'MG LT'),
(90, 'Divinópolis', 'MG', 'MG LT'),
(91, 'Juiz de Fora', 'MG', 'MG LT'),
(92, 'Cambuí', 'MG', 'SP_MG LT'),
(93, 'Socorro', 'SP', 'SP_MG LT'),
(94, 'Munhoz', 'MG', 'SP_MG LT'),
(95, 'Ibiti', 'SP', 'SP_MG LT'),
(96, 'São Roque', 'SP', 'LT Central_SP'),
(97, 'Campinas', 'SP', 'LT Central_SP'),
(98, 'Mogi das Cruzes', 'SP', 'LT Central_SP'),
(99, 'Jundiaí', 'SP', 'LT Central_SP'),
(100, 'Sorocaba', 'SP', 'Sorocaba LT'),
(101, 'Tatuí', 'SP', 'Tatui C1_C2'),
(102, 'Iguape', 'SP', 'LT Costa_SP'),
(103, 'Peruíbe', 'SP', 'LT Costa_SP'),
(104, 'Santos', 'SP', 'LT Costa_SP'),
(105, 'Ubatuba', 'SP', 'LT Costa_SP'),
(106, 'São Sebastião', 'SP', 'LT Costa_SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `email`, `telefone`) VALUES
(1, 'Light', 'light@gmail.com', '996825691'),
(2, 'Amanda Meirelles', 'amanda@gmail.com', '21987542136'),
(3, 'Lara Marinho', 'lara@gmail.com', '985201697'),
(4, 'Energimax', 'Energimax@gmail.com', '2198745268'),
(5, 'Eletrominas', 'eletrominas@hotmail.com', '21963524982'),
(6, 'Pedro Mendonça', 'pedromendonca@ufrrj.com', '21965562341'),
(7, 'Giovana Santos', 'giosantos@outlook.com', '21984756988'),
(8, 'Luana Cardoso', 'luanac@gmail.com', '2185415696'),
(9, 'Mauro Cipriano', 'ciprianomauro@outlook.com', '21966528744'),
(10, 'Mariana Moura', 'marimoura@gmail.com', '21954885210'),
(11, 'Enel', 'enel@enel.com.br', '2826815226'),
(12, 'Transmissoes LTDA', 'transmissoes.minas@gmail.com', '2452698763'),
(13, 'Maxi Energias', 'maxienergias@outlook.com', '2426986654'),
(14, 'Eletro SP', 'eletrosp@gmail.com', '2163589532'),
(15, 'Eletrix Minas', 'eletrix@eletrix.com.br', '2626889042'),
(16, 'Light ES', 'eslight@gmail.com', '2826996541'),
(17, 'Luz & Cia', 'luzecia@outlook.com', '21965542369'),
(18, 'Ana Florêncio', 'anaflorencio@gmail.com', '21965478523'),
(19, 'Ricardo Vasconcelos', 'ricardvasconcelos@hotmail.com', '21985263100'),
(20, 'Michele Matos', 'matos.michele@gmail.com', '28963257740'),
(21, 'Gabriel Mendes', 'gabrielmendes@gmail.com', '2155636980'),
(22, 'Silvana Costa', 'silcosta@outlook.com', '21984612000'),
(23, 'Enrique Silva', 'enrisilva@hotmail.com', '2455687907'),
(24, 'Yolanda Rezende', 'yo.rezende@gmail.com', '21985216366'),
(25, 'Leonardo Amaral', 'leoamaral@hotmail.com', '265263699'),
(26, 'Paula Miranda', 'miranda.paula@gmail.com', '21966589980'),
(27, 'Carlos Nunes', 'carlinhos@hotmail.com', '2455608290'),
(28, 'Rafaela Fernandes', 'rafafernandes@gmail.com', '21985665041'),
(29, 'Fernanda Gonçalves', 'fe.goncalves@hotmail.com', '21952001044'),
(30, 'Diego Alves', 'alves.diego', '2852669088');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `id` int NOT NULL,
  `data` date NOT NULL,
  `pdf` varchar(45) NOT NULL,
  `imagens` varchar(45) NOT NULL,
  `engenheiro_responsavel` varchar(90) NOT NULL,
  `chefe_de_Campo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorio_deteccao`
--

CREATE TABLE `relatorio_deteccao` (
  `relatorio_id` int NOT NULL,
  `deteccao_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `analista`
--
ALTER TABLE `analista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_analista_funcionarios1_idx` (`funcionarios_id`);

--
-- Índices de tabela `chefe_de_campo`
--
ALTER TABLE `chefe_de_campo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Equipe_de_Campo_funcionarios1_idx` (`funcionarios_id`);

--
-- Índices de tabela `classificacao`
--
ALTER TABLE `classificacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `deteccao`
--
ALTER TABLE `deteccao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_deteccoes_classificacao1_idx` (`classificacao_id`),
  ADD KEY `fk_deteccoes_analista1_idx` (`analista_id`),
  ADD KEY `fk_deteccoes_localizacao1_idx` (`localizacao_id`);

--
-- Índices de tabela `deteccao_imagem_de_satélite_ia`
--
ALTER TABLE `deteccao_imagem_de_satélite_ia`
  ADD PRIMARY KEY (`deteccoes_id`),
  ADD KEY `fk_deteccoes_has_imagens_de_satélite_imagens_de_satélite1_idx` (`imagem_de_satélite_id`),
  ADD KEY `fk_deteccoes_has_imagens_de_satélite_deteccoes1_idx` (`deteccoes_id`);

--
-- Índices de tabela `deteccao_imagem_de_satélite_ir`
--
ALTER TABLE `deteccao_imagem_de_satélite_ir`
  ADD PRIMARY KEY (`deteccoes_id`),
  ADD KEY `fk_deteccoes_has_imagens_de_satélite1_imagens_de_satélite_idx` (`imagem_de_satélite_id`),
  ADD KEY `fk_deteccoes_has_imagens_de_satélite1_deteccoes1_idx` (`deteccoes_id`);

--
-- Índices de tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empresa_pessoa1_idx` (`pessoa_id`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`,`empresa_id`),
  ADD KEY `fk_funcionarios_Empresa1_idx` (`empresa_id`),
  ADD KEY `fk_funcionarios_pessoa1_idx` (`pessoa_id`);

--
-- Índices de tabela `imagem_de_satélite`
--
ALTER TABLE `imagem_de_satélite`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `linha_transmissao`
--
ALTER TABLE `linha_transmissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Faixa_de_Servidao_Empresa1_idx` (`empresa_id`),
  ADD KEY `fk_linha_transmissao_localizacao1_idx` (`localizacao_id`);

--
-- Índices de tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_relatorio_Equipe_de_Campo1_idx` (`chefe_de_Campo_id`);

--
-- Índices de tabela `relatorio_deteccao`
--
ALTER TABLE `relatorio_deteccao`
  ADD KEY `fk_relatorio_has_deteccoes_deteccoes1_idx` (`deteccao_id`),
  ADD KEY `fk_relatorio_has_deteccoes_relatorio1_idx` (`relatorio_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `linha_transmissao`
--
ALTER TABLE `linha_transmissao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `analista`
--
ALTER TABLE `analista`
  ADD CONSTRAINT `fk_analista_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionario` (`id`);

--
-- Restrições para tabelas `chefe_de_campo`
--
ALTER TABLE `chefe_de_campo`
  ADD CONSTRAINT `fk_Equipe_de_Campo_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionario` (`id`);

--
-- Restrições para tabelas `deteccao`
--
ALTER TABLE `deteccao`
  ADD CONSTRAINT `fk_deteccoes_analista1` FOREIGN KEY (`analista_id`) REFERENCES `analista` (`id`),
  ADD CONSTRAINT `fk_deteccoes_classificacao1` FOREIGN KEY (`classificacao_id`) REFERENCES `classificacao` (`id`),
  ADD CONSTRAINT `fk_deteccoes_localizacao1` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacao` (`id`);

--
-- Restrições para tabelas `deteccao_imagem_de_satélite_ia`
--
ALTER TABLE `deteccao_imagem_de_satélite_ia`
  ADD CONSTRAINT `fk_deteccoes_has_imagens_de_satélite_deteccoes1` FOREIGN KEY (`deteccoes_id`) REFERENCES `deteccao` (`id`),
  ADD CONSTRAINT `fk_deteccoes_has_imagens_de_satélite_imagens_de_satélite1` FOREIGN KEY (`imagem_de_satélite_id`) REFERENCES `imagem_de_satélite` (`id`);

--
-- Restrições para tabelas `deteccao_imagem_de_satélite_ir`
--
ALTER TABLE `deteccao_imagem_de_satélite_ir`
  ADD CONSTRAINT `fk_deteccoes_has_imagens_de_satélite1_deteccoes1` FOREIGN KEY (`deteccoes_id`) REFERENCES `deteccao` (`id`),
  ADD CONSTRAINT `fk_deteccoes_has_imagens_de_satélite1_imagens_de_satélite1` FOREIGN KEY (`imagem_de_satélite_id`) REFERENCES `imagem_de_satélite` (`id`);

--
-- Restrições para tabelas `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionarios_Empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_funcionarios_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`);

--
-- Restrições para tabelas `linha_transmissao`
--
ALTER TABLE `linha_transmissao`
  ADD CONSTRAINT `fk_Faixa_de_Servidao_Empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_linha_transmissao_localizacao1` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacao` (`id`);

--
-- Restrições para tabelas `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_relatorio_Equipe_de_Campo1` FOREIGN KEY (`chefe_de_Campo_id`) REFERENCES `chefe_de_campo` (`id`);

--
-- Restrições para tabelas `relatorio_deteccao`
--
ALTER TABLE `relatorio_deteccao`
  ADD CONSTRAINT `fk_relatorio_has_deteccoes_deteccoes1` FOREIGN KEY (`deteccao_id`) REFERENCES `deteccao` (`id`),
  ADD CONSTRAINT `fk_relatorio_has_deteccoes_relatorio1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
