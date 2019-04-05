CREATE TABLE HistAtividade (
 codPessoa  INT,
 codHistAtiv INT
);


CREATE TABLE Parceiro (
 codParceiro INT
);


CREATE TABLE Pessoa (
 codPessoa INT
);


CREATE TABLE RegistroAtividade (
 codPrograma INT,
 codAluno INT,
 codTipoAtividade INT,
 dt date,
 hrInicio time,
 hrFim time,
 hrTotal time
);


CREATE TABLE TipoAtividade (
 codTipoAtiv INT,
 codSubtipoAtiv INT,
 totalHr INT
);


CREATE TABLE Academico (
 codPessoa INT,
 codAcademico INT
);


CREATE TABLE Aluno (
 codAluno INT,
 codPessoa INT,
 codFormacao INT,
 codInstituicao INT
);


CREATE TABLE Cliente (
 codCliente INT
);


CREATE TABLE DadosComunicacao (
 codDadosCom INT,
 codPessoa INT
);


CREATE TABLE Email (
 codDadosCom INT
);


CREATE TABLE Endereco (
 codDadosCom INT,
 numero INT
);


CREATE TABLE Instituicao (
 codInstituicao INT
);


CREATE TABLE Participante (
 codAtividade INT,
 codPessoa INT,
 papel varchar(25)
);


CREATE TABLE Professor (
 codProfessor INT,
 codPessoa INT,
 codFormacao INT
);


CREATE TABLE Programa (
 codPrograma INT,
 dt date
);


CREATE TABLE SubTipoAtividade (
 codSubTipoAtiv INT,
 totalHr time
);


CREATE TABLE Telefone (
 codDadosCom INT
);


CREATE TABLE AgenciaFomento (
 codAgencia INT
);


CREATE TABLE Atividade (
 codAtividade INT,
 dt date
);


CREATE TABLE Contato (
 codPessoa INT,
 codInstituicao INT
);


CREATE TABLE Evento (
 codEvento INT
);


CREATE TABLE Formacao (
 codAcademico INT,
 codInstituicao INT
);


CREATE TABLE PessoaAtividade (
 codAtividade INT,
 codPessoa INT,
 dtEntrada datetime
);


CREATE TABLE PI (
 codPi INT
);


CREATE TABLE Pos (
 codPos INT,
 codInstituto INT
);


CREATE TABLE Projeto (
 codProjeto INT,
 dtFim date,
 codCliente INT,
 codParceiro INT,
 codAgencia INT
);


CREATE TABLE Publicacao (
 codPublicacao INT
);

CREATE TABLE TCC (
 codTcc INT,
 codProjeto INT
);


CREATE TABLE Curso (
 codCurso INT,
 codProjeto INT
);


CREATE TABLE IC (
 codIc INT,
 codProjeto INT,
 codInstituicao INT
);


CREATE TABLE Palestra (
 codPalestra INT,
 codProjeto INT
);


