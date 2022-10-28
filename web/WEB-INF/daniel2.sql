-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Out-2022 às 00:54
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
CREATE DATABASE IF NOT EXISTS `daniel2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `daniel2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE `candidato` (
  `numero_candidato` int(11) NOT NULL,
  `titulo_eleitoral_eleitor` int(11) NOT NULL,
  `situacao` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`numero_candidato`, `titulo_eleitoral_eleitor`, `situacao`) VALUES
(0, 0, 'A'),
(10, 1234567, 'A');

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
(0, 'Branco', 'admin', '123'),
(1234555, 'gabriel', 'gabriel', '123'),
(1234566, 'caio', 'caio', '123'),
(1234567, 'daniel', 'daniel', '1234567');

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
-- Extraindo dados da tabela `voto`
--

INSERT INTO `voto` (`idvoto`, `titulo_eleitoral_eleitor`, `numero_candidato`) VALUES
(6, 0, 0),
(7, 1234567, 0),
(9, 1234566, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`numero_candidato`),
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
  MODIFY `idvoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
