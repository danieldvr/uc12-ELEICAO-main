-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Out-2022 às 02:50
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `daniel2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `numero_candidato` int(11) NOT NULL,
  `titulo_eleitoral_eleitor` int(11) NOT NULL,
  `imagem` varbinary(8000) DEFAULT NULL,
  `situacao` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`numero_candidato`, `titulo_eleitoral_eleitor`, `imagem`, `situacao`) VALUES
(0, 0, NULL, 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eleitor`
--

CREATE TABLE `eleitor` (
  `titulo_eleitoral_eleitor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `eleitor`
--

INSERT INTO `eleitor` (`titulo_eleitoral_eleitor`, `nome`, `usuario`, `senha`) VALUES
(0, 'Branco', 'admin', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto`
--

CREATE TABLE `voto` (
  `idvoto` int(11) NOT NULL,
  `titulo_eleitoral_eleitor` int(11) NOT NULL,
  `numero_candidato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`numero_candidato`),
  ADD UNIQUE KEY `imagens_UNIQUE` (`imagem`) USING HASH,
  ADD KEY `fk_candidato_eleitor1_idx` (`titulo_eleitoral_eleitor`);

--
-- Índices para tabela `eleitor`
--
ALTER TABLE `eleitor`
  ADD PRIMARY KEY (`titulo_eleitoral_eleitor`),
  ADD UNIQUE KEY `titulo_eleitoral_UNIQUE` (`titulo_eleitoral_eleitor`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Índices para tabela `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`idvoto`),
  ADD KEY `fk_voto_eleitor_idx` (`titulo_eleitoral_eleitor`),
  ADD KEY `fk_voto_candidato1_idx` (`numero_candidato`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `voto`
--
ALTER TABLE `voto`
  MODIFY `idvoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `fk_candidato_eleitor1` FOREIGN KEY (`titulo_eleitoral_eleitor`) REFERENCES `eleitor` (`titulo_eleitoral_eleitor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `fk_voto_candidato1` FOREIGN KEY (`numero_candidato`) REFERENCES `candidato` (`numero_candidato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_voto_eleitor` FOREIGN KEY (`titulo_eleitoral_eleitor`) REFERENCES `eleitor` (`titulo_eleitoral_eleitor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
