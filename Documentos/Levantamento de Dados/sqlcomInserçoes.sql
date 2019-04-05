-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2018 at 03:12 PM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqlMilleniumFalconST`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicos`
--

CREATE TABLE `academicos` (
  `codPessoa` int(11) DEFAULT NULL,
  `codAcademico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `academicos`
--

INSERT INTO `academicos` (`codPessoa`, `codAcademico`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `agenciasfomento`
--

CREATE TABLE `agenciasfomento` (
  `codAgencia` int(11) NOT NULL,
  `codProjeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agenciasfomento`
--

INSERT INTO `agenciasfomento` (`codAgencia`, `codProjeto`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `codAluno` int(11) DEFAULT NULL,
  `codFormacao` int(11) DEFAULT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `codInstituicao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alunos`
--

INSERT INTO `alunos` (`codAluno`, `codFormacao`, `matricula`, `codInstituicao`) VALUES
(1, 1, '000000000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `atividades`
--

CREATE TABLE `atividades` (
  `codAtividade` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `dt` datetime DEFAULT NULL,
  `codPrograma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atividades`
--

INSERT INTO `atividades` (`codAtividade`, `titulo`, `dt`, `codPrograma`) VALUES
(1, 'inserção de dados', '2018-09-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clientesProjetos`
--

CREATE TABLE `clientesProjetos` (
  `codProjeto` int(11) NOT NULL,
  `codCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientesProjetos`
--

INSERT INTO `clientesProjetos` (`codProjeto`, `codCliente`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contatos`
--

CREATE TABLE `contatos` (
  `codPessoa` int(11) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `codInstituicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contatos`
--

INSERT INTO `contatos` (`codPessoa`, `cargo`, `codInstituicao`) VALUES
(2, 'Professor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `codCurso` int(11) DEFAULT NULL,
  `codProjeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`codCurso`, `codProjeto`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dadoscomunicacao`
--

CREATE TABLE `dadoscomunicacao` (
  `codDadosCom` int(11) DEFAULT NULL,
  `codPessoa` int(11) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dadoscomunicacao`
--

INSERT INTO `dadoscomunicacao` (`codDadosCom`, `codPessoa`, `tipo`) VALUES
(1, 1, 'pessoal');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `codDadosCom` int(11) DEFAULT NULL,
  `Emails` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`codDadosCom`, `Emails`) VALUES
(1, 'lucasconst4ntino@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
--

CREATE TABLE `enderecos` (
  `codDadosCom` int(11) DEFAULT NULL,
  `UF` varchar(45) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `logadouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enderecos`
--

INSERT INTO `enderecos` (`codDadosCom`, `UF`, `CEP`, `cidade`, `bairro`, `logadouro`, `numero`) VALUES
(1, 'ES', '00000-00', 'vitoria', 'inhangueta', 'casa', '1037');

-- --------------------------------------------------------

--
-- Table structure for table `Eventos`
--

CREATE TABLE `Eventos` (
  `codEvento` int(11) NOT NULL,
  `atividades_codAtividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Eventos`
--

INSERT INTO `Eventos` (`codEvento`, `atividades_codAtividade`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `formacoes`
--

CREATE TABLE `formacoes` (
  `codAcademico` int(11) DEFAULT NULL,
  `Cursos` varchar(45) DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `codInstituicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formacoes`
--

INSERT INTO `formacoes` (`codAcademico`, `Cursos`, `nivel`, `codInstituicao`) VALUES
(1, 'tads', 'superior', 1),
(2, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ics`
--

CREATE TABLE `ics` (
  `codInstituicao` int(11) NOT NULL,
  `codAtividade` int(11) NOT NULL,
  `codProjeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Instituicoes`
--

CREATE TABLE `Instituicoes` (
  `codInstituicao` int(11) NOT NULL,
  `nome` varchar(35) DEFAULT NULL,
  `cnpj` varchar(15) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Instituicoes`
--

INSERT INTO `Instituicoes` (`codInstituicao`, `nome`, `cnpj`, `descricao`, `local`) VALUES
(1, 'IFES-ST', '0000000', 'ifes campus santa teresa', 'santa teresa'),
(2, 'ifes-co', '000000', 'ifes campus colatina', 'colatina');

-- --------------------------------------------------------

--
-- Table structure for table `InstituicoesParceiros`
--

CREATE TABLE `InstituicoesParceiros` (
  `codProjeto` int(11) NOT NULL,
  `codInstituicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `InstituicoesParceiros`
--

INSERT INTO `InstituicoesParceiros` (`codProjeto`, `codInstituicao`) VALUES
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `palestras`
--

CREATE TABLE `palestras` (
  `codPalestra` int(11) DEFAULT NULL,
  `codProjeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pessoas`
--

CREATE TABLE `pessoas` (
  `codPessoa` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoas`
--

INSERT INTO `pessoas` (`codPessoa`, `nome`, `cpf`) VALUES
(1, 'Lucas Constantino', '000.000.000-00'),
(2, 'Anderson', '000.000.000-00');

-- --------------------------------------------------------

--
-- Table structure for table `pessoasatividades`
--

CREATE TABLE `pessoasatividades` (
  `papel` varchar(45) DEFAULT NULL,
  `codAtividade` int(11) DEFAULT NULL,
  `codPessoa` int(11) DEFAULT NULL,
  `dtEntrada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoasatividades`
--

INSERT INTO `pessoasatividades` (`papel`, `codAtividade`, `codPessoa`, `dtEntrada`) VALUES
('desenvolvedor', 1, 1, '2018-09-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `PessoasParceiros`
--

CREATE TABLE `PessoasParceiros` (
  `codPessoa` int(11) DEFAULT NULL,
  `codProjeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PessoasParceiros`
--

INSERT INTO `PessoasParceiros` (`codPessoa`, `codProjeto`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PIs`
--

CREATE TABLE `PIs` (
  `codPIs` int(11) NOT NULL,
  `atividades_codAtividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PIs`
--

INSERT INTO `PIs` (`codPIs`, `atividades_codAtividade`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `nivel` varchar(45) DEFAULT NULL,
  `codInstituicao` int(11) NOT NULL,
  `codPos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`nivel`, `codInstituicao`, `codPos`) VALUES
('superior', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `professores`
--

CREATE TABLE `professores` (
  `codProfessor` int(11) DEFAULT NULL,
  `codFormacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professores`
--

INSERT INTO `professores` (`codProfessor`, `codFormacao`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `programas`
--

CREATE TABLE `programas` (
  `codPrograma` int(11) NOT NULL,
  `dt` date DEFAULT NULL,
  `codInstituicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `programas`
--

INSERT INTO `programas` (`codPrograma`, `dt`, `codInstituicao`) VALUES
(1, '2018-09-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projetos`
--

CREATE TABLE `projetos` (
  `codProjeto` int(11) NOT NULL,
  `dtFim` date DEFAULT NULL,
  `situacaoProjeto` varchar(45) DEFAULT NULL,
  `codAgencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projetos`
--

INSERT INTO `projetos` (`codProjeto`, `dtFim`, `situacaoProjeto`, `codAgencia`) VALUES
(1, '2018-09-05', 'em andamento', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Publicacoes`
--

CREATE TABLE `Publicacoes` (
  `codPublicacao` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `atividades_codAtividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Publicacoes`
--

INSERT INTO `Publicacoes` (`codPublicacao`, `tipo`, `local`, `atividades_codAtividade`) VALUES
(2, 'arttigo', 'ifes-stt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registrosTarefas`
--

CREATE TABLE `registrosTarefas` (
  `dt` date DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `hrInicio` time DEFAULT NULL,
  `hrFim` time DEFAULT NULL,
  `codAluno` int(11) NOT NULL,
  `codSubTipoTarefa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registrosTarefas`
--

INSERT INTO `registrosTarefas` (`dt`, `descricao`, `hrInicio`, `hrFim`, `codAluno`, `codSubTipoTarefa`) VALUES
('2018-09-04', 'testando bd', '02:00:00', '08:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SubTiposTarefa`
--

CREATE TABLE `SubTiposTarefa` (
  `codSubTipoTarefa` int(11) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `codTipoTarefa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SubTiposTarefa`
--

INSERT INTO `SubTiposTarefa` (`codSubTipoTarefa`, `Titulo`, `codTipoTarefa`) VALUES
(1, 'testando', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tccs`
--

CREATE TABLE `tccs` (
  `codTCC` int(11) DEFAULT NULL,
  `codProjeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tccs`
--

INSERT INTO `tccs` (`codTCC`, `codProjeto`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `telefones`
--

CREATE TABLE `telefones` (
  `codDadosCom` int(11) DEFAULT NULL,
  `Telefones` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `telefones`
--

INSERT INTO `telefones` (`codDadosCom`, `Telefones`) VALUES
(1, '27998650119');

-- --------------------------------------------------------

--
-- Table structure for table `tiposTarefa`
--

CREATE TABLE `tiposTarefa` (
  `codTipoTarefa` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `codSubTipoTarefa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tiposTarefa`
--

INSERT INTO `tiposTarefa` (`codTipoTarefa`, `titulo`, `codSubTipoTarefa`) VALUES
(2, 'testando bd', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academicos`
--
ALTER TABLE `academicos`
  ADD KEY `fk_Academicos_Pessoas` (`codPessoa`),
  ADD KEY `fk_Academicos_Formacoes1_idx` (`codAcademico`);

--
-- Indexes for table `agenciasfomento`
--
ALTER TABLE `agenciasfomento`
  ADD KEY `fk_agenciasfomento_Instituicoes1_idx` (`codAgencia`),
  ADD KEY `fk_agenciasfomento_projetos1_idx` (`codProjeto`);

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD KEY `fk_Alunos_Pessoas` (`codAluno`),
  ADD KEY `fk_Professores_Formacoes` (`codFormacao`);

--
-- Indexes for table `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`codAtividade`),
  ADD KEY `fk_programas_atividades` (`codPrograma`);

--
-- Indexes for table `clientesProjetos`
--
ALTER TABLE `clientesProjetos`
  ADD KEY `fk_clientes_projetos1_idx` (`codProjeto`),
  ADD KEY `fk_clientes_Instituicoes1_idx` (`codCliente`);

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD KEY `fk_Contatos_Pessoas1` (`codPessoa`),
  ADD KEY `fk_contatos_Instituicoes1_idx` (`codInstituicao`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD KEY `fk_Cursos_Atividade1` (`codCurso`),
  ADD KEY `fk_Cursos_Projetos1` (`codProjeto`);

--
-- Indexes for table `dadoscomunicacao`
--
ALTER TABLE `dadoscomunicacao`
  ADD KEY `fk_DadosComunicacao_idx` (`codDadosCom`),
  ADD KEY `fk_Pessoas_DadosComunicacao1` (`codPessoa`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD KEY `fk_Emails_DadosComunicacao1` (`codDadosCom`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD KEY `fk_Enderecos_DadosComunicacao1` (`codDadosCom`);

--
-- Indexes for table `Eventos`
--
ALTER TABLE `Eventos`
  ADD PRIMARY KEY (`codEvento`),
  ADD KEY `fk_Eventos_atividades1_idx` (`atividades_codAtividade`);

--
-- Indexes for table `formacoes`
--
ALTER TABLE `formacoes`
  ADD KEY `fk_Formacoes_Academicos` (`codAcademico`),
  ADD KEY `fk_formacoes_Instituicoes1_idx` (`codInstituicao`);

--
-- Indexes for table `ics`
--
ALTER TABLE `ics`
  ADD KEY `fk_ics_Instituicoes1_idx` (`codInstituicao`),
  ADD KEY `fk_ics_atividades1_idx` (`codAtividade`),
  ADD KEY `fk_ics_projetos1_idx` (`codProjeto`);

--
-- Indexes for table `Instituicoes`
--
ALTER TABLE `Instituicoes`
  ADD PRIMARY KEY (`codInstituicao`);

--
-- Indexes for table `InstituicoesParceiros`
--
ALTER TABLE `InstituicoesParceiros`
  ADD KEY `fk_InstituicoesParceiros_projetos1_idx` (`codProjeto`),
  ADD KEY `fk_InstituicoesParceiros_Instituicoes1_idx` (`codInstituicao`);

--
-- Indexes for table `palestras`
--
ALTER TABLE `palestras`
  ADD KEY `fk_Palestras_Atividade1` (`codPalestra`),
  ADD KEY `fk_Palestras_Projetos1` (`codProjeto`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`codPessoa`),
  ADD KEY `fk_Pessoas_idx` (`codPessoa`);

--
-- Indexes for table `pessoasatividades`
--
ALTER TABLE `pessoasatividades`
  ADD KEY `fk_PessoasAtividades_Atividades` (`codAtividade`),
  ADD KEY `fk_PessoasAtividades_pessoas` (`codPessoa`);

--
-- Indexes for table `PessoasParceiros`
--
ALTER TABLE `PessoasParceiros`
  ADD KEY `fk_Parceiros_Pessoas1` (`codPessoa`),
  ADD KEY `fk_PessoasParceiros_projetos1_idx` (`codProjeto`);

--
-- Indexes for table `PIs`
--
ALTER TABLE `PIs`
  ADD KEY `fk_PIs_atividades1_idx` (`atividades_codAtividade`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD KEY `fk_pos_Instituicoes1_idx` (`codInstituicao`),
  ADD KEY `fk_pos_atividades1_idx` (`codPos`);

--
-- Indexes for table `professores`
--
ALTER TABLE `professores`
  ADD KEY `fk_Professores_Academicos` (`codProfessor`),
  ADD KEY `fk_Professores_AcademicosForm` (`codFormacao`);

--
-- Indexes for table `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`codPrograma`),
  ADD KEY `fk_programas_Instituicoes1_idx` (`codInstituicao`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`codProjeto`);

--
-- Indexes for table `Publicacoes`
--
ALTER TABLE `Publicacoes`
  ADD PRIMARY KEY (`codPublicacao`),
  ADD KEY `fk_Publicacoes_atividades1_idx` (`atividades_codAtividade`);

--
-- Indexes for table `registrosTarefas`
--
ALTER TABLE `registrosTarefas`
  ADD KEY `fk_registrosatividades_pessoas1_idx` (`codAluno`),
  ADD KEY `fk_registrosTarefas_SubTiposTarefa1_idx` (`codSubTipoTarefa`);

--
-- Indexes for table `SubTiposTarefa`
--
ALTER TABLE `SubTiposTarefa`
  ADD PRIMARY KEY (`codSubTipoTarefa`),
  ADD KEY `fk_SubTiposTarefa_tiposTarefa1_idx` (`codTipoTarefa`);

--
-- Indexes for table `tccs`
--
ALTER TABLE `tccs`
  ADD KEY `fk_TCCs_Atividade1` (`codTCC`),
  ADD KEY `fk_TCCs_Projetos1` (`codProjeto`);

--
-- Indexes for table `telefones`
--
ALTER TABLE `telefones`
  ADD KEY `fk_Telefones_DadosComunicacao1` (`codDadosCom`);

--
-- Indexes for table `tiposTarefa`
--
ALTER TABLE `tiposTarefa`
  ADD PRIMARY KEY (`codTipoTarefa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academicos`
--
ALTER TABLE `academicos`
  ADD CONSTRAINT `fk_Academicos_Pessoas` FOREIGN KEY (`codPessoa`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `agenciasfomento`
--
ALTER TABLE `agenciasfomento`
  ADD CONSTRAINT `fk_agenciasfomento_Instituicoes1` FOREIGN KEY (`codAgencia`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_agenciasfomento_projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk_Alunos_Pessoas` FOREIGN KEY (`codAluno`) REFERENCES `academicos` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Professores_Formacoes` FOREIGN KEY (`codFormacao`) REFERENCES `academicos` (`codAcademico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `fk_programas atividades` FOREIGN KEY (`codPrograma`) REFERENCES `programas` (`codPrograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `clientesProjetos`
--
ALTER TABLE `clientesProjetos`
  ADD CONSTRAINT `fk_clientes_Instituicoes1` FOREIGN KEY (`codCliente`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contatos`
--
ALTER TABLE `contatos`
  ADD CONSTRAINT `fk_Contatos_Pessoas1` FOREIGN KEY (`codPessoa`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contatos_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_Cursos_Atividade1` FOREIGN KEY (`codCurso`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cursos_Projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dadoscomunicacao`
--
ALTER TABLE `dadoscomunicacao`
  ADD CONSTRAINT `fk_Pessoas_DadosComunicacao1` FOREIGN KEY (`codPessoa`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `fk_Emails_DadosComunicacao1` FOREIGN KEY (`codDadosCom`) REFERENCES `dadoscomunicacao` (`codDadosCom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `fk_Enderecos_DadosComunicacao1` FOREIGN KEY (`codDadosCom`) REFERENCES `dadoscomunicacao` (`codDadosCom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Eventos`
--
ALTER TABLE `Eventos`
  ADD CONSTRAINT `fk_Eventos_atividades1` FOREIGN KEY (`atividades_codAtividade`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `formacoes`
--
ALTER TABLE `formacoes`
  ADD CONSTRAINT `fk_Formacoes_Academicos` FOREIGN KEY (`codAcademico`) REFERENCES `academicos` (`codAcademico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formacoes_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ics`
--
ALTER TABLE `ics`
  ADD CONSTRAINT `fk_ics_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ics_atividades1` FOREIGN KEY (`codAtividade`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ics_projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `InstituicoesParceiros`
--
ALTER TABLE `InstituicoesParceiros`
  ADD CONSTRAINT `fk_InstituicoesParceiros_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_InstituicoesParceiros_projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `palestras`
--
ALTER TABLE `palestras`
  ADD CONSTRAINT `fk_Palestras_Atividade1` FOREIGN KEY (`codPalestra`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Palestras_Projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pessoasatividades`
--
ALTER TABLE `pessoasatividades`
  ADD CONSTRAINT `fk_PessoasAtividades_Atividades` FOREIGN KEY (`codAtividade`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PessoasAtividades_pessoas` FOREIGN KEY (`codPessoa`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PessoasParceiros`
--
ALTER TABLE `PessoasParceiros`
  ADD CONSTRAINT `fk_Parceiros_Pessoas1` FOREIGN KEY (`codPessoa`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PessoasParceiros_projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PIs`
--
ALTER TABLE `PIs`
  ADD CONSTRAINT `fk_PIs_atividades1` FOREIGN KEY (`atividades_codAtividade`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `fk_pos_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pos_atividades1` FOREIGN KEY (`codPos`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_Professores_Academicos` FOREIGN KEY (`codProfessor`) REFERENCES `academicos` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Professores_AcademicosForm` FOREIGN KEY (`codFormacao`) REFERENCES `academicos` (`codAcademico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `fk_programas_Instituicoes1` FOREIGN KEY (`codInstituicao`) REFERENCES `Instituicoes` (`codInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Publicacoes`
--
ALTER TABLE `Publicacoes`
  ADD CONSTRAINT `fk_Publicacoes_atividades1` FOREIGN KEY (`atividades_codAtividade`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrosTarefas`
--
ALTER TABLE `registrosTarefas`
  ADD CONSTRAINT `fk_registrosTarefas_SubTiposTarefa1` FOREIGN KEY (`codSubTipoTarefa`) REFERENCES `SubTiposTarefa` (`codSubTipoTarefa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registrosatividades_pessoas1` FOREIGN KEY (`codAluno`) REFERENCES `pessoas` (`codPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `SubTiposTarefa`
--
ALTER TABLE `SubTiposTarefa`
  ADD CONSTRAINT `fk_SubTiposTarefa_tiposTarefa1` FOREIGN KEY (`codTipoTarefa`) REFERENCES `tiposTarefa` (`codTipoTarefa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tccs`
--
ALTER TABLE `tccs`
  ADD CONSTRAINT `fk_TCCs_Atividade1` FOREIGN KEY (`codTCC`) REFERENCES `atividades` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TCCs_Projetos1` FOREIGN KEY (`codProjeto`) REFERENCES `projetos` (`codProjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `telefones`
--
ALTER TABLE `telefones`
  ADD CONSTRAINT `fk_Telefones_DadosComunicacao1` FOREIGN KEY (`codDadosCom`) REFERENCES `dadoscomunicacao` (`codDadosCom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
