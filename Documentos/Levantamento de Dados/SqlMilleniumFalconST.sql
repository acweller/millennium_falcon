SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sqlMilleniumFalconST` DEFAULT CHARACTER SET utf8 ;
USE `sqlMilleniumFalconST` ;

-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`Instituicoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`Instituicoes` (
  `codInstituicao` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(35) NOT NULL,
  `cnpj` VARCHAR(15) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `local` VARCHAR(45) NULL,
  PRIMARY KEY (`codInstituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`pessoas` (
  `codPessoa` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NOT NULL,
  INDEX `fk_Pessoas_idx` (`codPessoa` ASC),
  PRIMARY KEY (`codPessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`academicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`academicos` (
  `codInstituicao` INT NOT NULL,
  `codAcademico` INT(11) NOT NULL,
  `pessoas_codPessoa` INT(11) NOT NULL,
  INDEX `fk_academicos_Instituicoes1_idx` (`codInstituicao` ASC),
  PRIMARY KEY (`codAcademico`),
  INDEX `fk_academicos_pessoas1_idx` (`pessoas_codPessoa` ASC),
  CONSTRAINT `fk_academicos_Instituicoes1`
    FOREIGN KEY (`codInstituicao`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_academicos_pessoas1`
    FOREIGN KEY (`pessoas_codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`tiposProjetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`tiposProjetos` (
  `codTipo` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`programas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`programas` (
  `codPrograma` INT(11) NOT NULL AUTO_INCREMENT,
  `dt` DATE NULL,
  `codInstituicao` INT(11) NOT NULL,
  INDEX `fk_programas_Instituicoes1_idx` (`codInstituicao` ASC),
  PRIMARY KEY (`codPrograma`),
  CONSTRAINT `fk_programas_Instituicoes1`
    FOREIGN KEY (`codInstituicao`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`projetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`projetos` (
  `titulo` VARCHAR(45) NOT NULL,
  `situacaoProjeto` VARCHAR(45) NOT NULL,
  `dtInicio` DATE NOT NULL,
  `dtFim` DATE NULL DEFAULT NULL,
  `nivelPos` VARCHAR(45) NULL,
  `tipoPublicacao` INT(11) NULL,
  `localPublicacao` VARCHAR(45) NULL,
  `codInstFormadora` INT(11) NOT NULL,
  `tipoProjeto` INT(11) NOT NULL,
  `codPrograma` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL AUTO_INCREMENT,
  `projetos_codProjeto` INT(11) NOT NULL,
  INDEX `fk_projetos_Instituicoes1_idx` (`codInstFormadora` ASC),
  INDEX `fk_projetos_tiposProjetos1_idx` (`tipoProjeto` ASC),
  INDEX `fk_projetos_programas1_idx` (`codPrograma` ASC),
  PRIMARY KEY (`codProjeto`),
  INDEX `fk_projetos_projetos1_idx` (`projetos_codProjeto` ASC),
  CONSTRAINT `fk_projetos_Instituicoes1`
    FOREIGN KEY (`codInstFormadora`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projetos_tiposProjetos1`
    FOREIGN KEY (`tipoProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`tiposProjetos` (`codTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projetos_programas1`
    FOREIGN KEY (`codPrograma`)
    REFERENCES `sqlMilleniumFalconST`.`programas` (`codPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projetos_projetos1`
    FOREIGN KEY (`projetos_codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`agenciasFomento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`agenciasFomento` (
  `codAgencia` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  `valor` DOUBLE NULL,
  INDEX `fk_agenciasfomento_Instituicoes1_idx` (`codAgencia` ASC),
  INDEX `fk_agenciasFomento_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_agenciasfomento_Instituicoes1`
    FOREIGN KEY (`codAgencia`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenciasFomento_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`alunos` (
  `matricula` VARCHAR(45) NOT NULL,
  `codAluno` INT(11) NOT NULL,
  INDEX `fk_alunos_academicos1_idx` (`codAluno` ASC),
  CONSTRAINT `fk_alunos_academicos1`
    FOREIGN KEY (`codAluno`)
    REFERENCES `sqlMilleniumFalconST`.`academicos` (`codAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`clientesProjetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`clientesProjetos` (
  `codCliente` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  INDEX `fk_clientes_Instituicoes1_idx` (`codCliente` ASC),
  INDEX `fk_clientesProjetos_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_clientes_Instituicoes1`
    FOREIGN KEY (`codCliente`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientesProjetos_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`contatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`contatos` (
  `codPessoa` INT(11) NOT NULL,
  `cargo` VARCHAR(45) NULL DEFAULT NULL,
  `codInstituicao` INT(11) NOT NULL,
  INDEX `fk_Contatos_Pessoas1` (`codPessoa` ASC),
  INDEX `fk_contatos_Instituicoes1_idx` (`codInstituicao` ASC),
  CONSTRAINT `fk_Contatos_Pessoas1`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contatos_Instituicoes1`
    FOREIGN KEY (`codInstituicao`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`dadoscomunicacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`dadoscomunicacao` (
  `codDadosCom` INT(11) NOT NULL AUTO_INCREMENT,
  `codPessoa` INT(11) NOT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_DadosComunicacao_idx` (`codDadosCom` ASC),
  INDEX `fk_Pessoas_DadosComunicacao1` (`codPessoa` ASC),
  PRIMARY KEY (`codDadosCom`),
  CONSTRAINT `fk_Pessoas_DadosComunicacao1`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`emails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`emails` (
  `codDadosCom` INT(11) NOT NULL,
  `Emails` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_Emails_DadosComunicacao1` (`codDadosCom` ASC),
  CONSTRAINT `fk_Emails_DadosComunicacao1`
    FOREIGN KEY (`codDadosCom`)
    REFERENCES `sqlMilleniumFalconST`.`dadoscomunicacao` (`codDadosCom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`enderecos` (
  `codDadosCom` INT(11) NOT NULL,
  `UF` VARCHAR(45) NULL DEFAULT NULL,
  `CEP` VARCHAR(9) NULL DEFAULT NULL,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `bairro` VARCHAR(45) NULL DEFAULT NULL,
  `logadouro` VARCHAR(45) NULL DEFAULT NULL,
  `numero` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_Enderecos_DadosComunicacao1` (`codDadosCom` ASC),
  CONSTRAINT `fk_Enderecos_DadosComunicacao1`
    FOREIGN KEY (`codDadosCom`)
    REFERENCES `sqlMilleniumFalconST`.`dadoscomunicacao` (`codDadosCom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`formacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`formacoes` (
  `codAcademico` INT(11) NULL DEFAULT NULL,
  `codInstituicao` INT(11) NOT NULL,
  `Cursos` VARCHAR(45) NULL DEFAULT NULL,
  `nivel` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_formacoes_Instituicoes1_idx` (`codInstituicao` ASC),
  CONSTRAINT `fk_formacoes_Instituicoes1`
    FOREIGN KEY (`codInstituicao`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`PessoasParceiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`PessoasParceiros` (
  `codPessoa` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  INDEX `fk_Parceiros_Pessoas1` (`codPessoa` ASC),
  INDEX `fk_PessoasParceiros_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_Parceiros_Pessoas1`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PessoasParceiros_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`pessoasProjetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`pessoasProjetos` (
  `dtEntrada` DATETIME NULL DEFAULT NULL,
  `codPessoa` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  `papel` VARCHAR(45) NULL,
  INDEX `fk_pessoasatividades_pessoas1_idx` (`codPessoa` ASC),
  INDEX `fk_pessoasProjetos_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_pessoasatividades_pessoas1`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoasProjetos_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`professores` (
  `SIAPE` INT(11) NOT NULL,
  `codProfessor` INT(11) NOT NULL,
  INDEX `fk_professores_academicos1_idx` (`codProfessor` ASC),
  CONSTRAINT `fk_professores_academicos1`
    FOREIGN KEY (`codProfessor`)
    REFERENCES `sqlMilleniumFalconST`.`academicos` (`codAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`tiposAtividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`tiposAtividades` (
  `codTipoAtiv` INT(11) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codTipoAtiv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`SubTiposAtividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`SubTiposAtividades` (
  `codSubTipoAtiv` INT(11) NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `codTipoAtiv` INT(11) NOT NULL,
  PRIMARY KEY (`codSubTipoAtiv`),
  INDEX `fk_SubTiposTarefa_tiposTarefa1_idx` (`codTipoAtiv` ASC),
  CONSTRAINT `fk_SubTiposTarefa_tiposTarefa1`
    FOREIGN KEY (`codTipoAtiv`)
    REFERENCES `sqlMilleniumFalconST`.`tiposAtividades` (`codTipoAtiv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`registrosAtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`registrosAtividade` (
  `codPessoa` INT(11) NOT NULL,
  `codSubTipoAtiv` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  `dt` DATE NULL DEFAULT NULL,
  `descricao` VARCHAR(45) NULL,
  `hrInicio` TIME NOT NULL,
  `hrFim` TIME NULL,
  INDEX `fk_registrosatividades_pessoas1_idx` (`codPessoa` ASC),
  INDEX `fk_registrosTarefas_SubTiposTarefa1_idx` (`codSubTipoAtiv` ASC),
  INDEX `fk_registrosAtividade_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_registrosatividades_pessoas1`
    FOREIGN KEY (`codPessoa`)
    REFERENCES `sqlMilleniumFalconST`.`pessoas` (`codPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registrosTarefas_SubTiposTarefa1`
    FOREIGN KEY (`codSubTipoAtiv`)
    REFERENCES `sqlMilleniumFalconST`.`SubTiposAtividades` (`codSubTipoAtiv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registrosAtividade_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`telefones` (
  `codDadosCom` INT(11) NOT NULL,
  `Telefones` VARCHAR(14) NULL DEFAULT NULL,
  INDEX `fk_Telefones_DadosComunicacao1` (`codDadosCom` ASC),
  CONSTRAINT `fk_Telefones_DadosComunicacao1`
    FOREIGN KEY (`codDadosCom`)
    REFERENCES `sqlMilleniumFalconST`.`dadoscomunicacao` (`codDadosCom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`InstituicoesParceiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`InstituicoesParceiros` (
  `codInstituicao` INT(11) NOT NULL,
  `codProjeto` INT(11) NOT NULL,
  INDEX `fk_InstituicoesParceiros_Instituicoes1_idx` (`codInstituicao` ASC),
  INDEX `fk_InstituicoesParceiros_projetos1_idx` (`codProjeto` ASC),
  CONSTRAINT `fk_InstituicoesParceiros_Instituicoes1`
    FOREIGN KEY (`codInstituicao`)
    REFERENCES `sqlMilleniumFalconST`.`Instituicoes` (`codInstituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InstituicoesParceiros_projetos1`
    FOREIGN KEY (`codProjeto`)
    REFERENCES `sqlMilleniumFalconST`.`projetos` (`codProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sqlMilleniumFalconST`.`academicosProgramas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sqlMilleniumFalconST`.`academicosProgramas` (
  `ativo` TINYINT(1) NULL,
  `codPrograma` INT(11) NOT NULL,
  `codAcademico` INT(11) NOT NULL,
  INDEX `fk_academicosProgramas_programas1_idx` (`codPrograma` ASC),
  INDEX `fk_academicosProgramas_academicos1_idx` (`codAcademico` ASC),
  CONSTRAINT `fk_academicosProgramas_programas1`
    FOREIGN KEY (`codPrograma`)
    REFERENCES `sqlMilleniumFalconST`.`programas` (`codPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_academicosProgramas_academicos1`
    FOREIGN KEY (`codAcademico`)
    REFERENCES `sqlMilleniumFalconST`.`academicos` (`codAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
