DROP DATABASE IF EXISTS resilia;
CREATE DATABASE resilia CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE resilia;

-- Cria tabela instituição
CREATE TABLE instituicao (
    cnpj_instituicao VARCHAR(14) NOT NULL PRIMARY KEY,
    nome_instituicao VARCHAR(255) NOT NULL,
    endereco_instituicao VARCHAR(255) NOT NULL,
    telefone_instituicao VARCHAR(20) NOT NULL
);

CREATE TABLE docentes (
    id_docente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_docente VARCHAR(255) NOT NULL,
    cpf_docente VARCHAR(11) NOT NULL,
    endereco_docente VARCHAR(255) NOT NULL,
    telefone_docente VARCHAR(20) NOT NULL,
    cnpj_instituicao VARCHAR(14) NOT NULL,
    FOREIGN KEY (cnpj_instituicao) REFERENCES instituicao (cnpj_instituicao)
);

CREATE TABLE cursos (
    id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL,
    duracao_curso INT NOT NULL,
    preco_curso FLOAT NOT NULL,
    cnpj_instituicao VARCHAR(14) NOT NULL,
    FOREIGN KEY (cnpj_instituicao) REFERENCES instituicao(cnpj_instituicao)
);

CREATE TABLE turmas (
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    vagas INT NOT NULL,
    id_curso INT NOT NULL,
    id_docente INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente)
);

CREATE TABLE alunos (
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(255) NOT NULL,
    cpf_aluno VARCHAR(11) NOT NULL,
    telefone_aluno VARCHAR(20) NOT NULL,
    endereco_aluno VARCHAR(255) NOT NULL
);

CREATE TABLE matricula (
    id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);
