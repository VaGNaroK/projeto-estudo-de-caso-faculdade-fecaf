-- Tabela para armazenar informações de professores
CREATE TABLE tbl_professor (
    id_professor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_professor)
);

-- Tabela para armazenar informações de cursos
CREATE TABLE tbl_curso (
    id_curso INT NOT NULL AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    tbl_professor_id_professor INT NOT NULL,
    PRIMARY KEY (id_curso),
    FOREIGN KEY (tbl_professor_id_professor) REFERENCES tbl_professor(id_professor)
);

-- Tabela para armazenar informações de matérias
CREATE TABLE tbl_materia (
    id_materia INT NOT NULL AUTO_INCREMENT,
    nome_materia VARCHAR(100) NOT NULL,
    tbl_curso_id_curso INT NOT NULL,
    PRIMARY KEY (id_materia),
    FOREIGN KEY (tbl_curso_id_curso) REFERENCES tbl_curso(id_curso)
);

-- Tabela para armazenar informações de turmas
CREATE TABLE tbl_turma (
    id_turma INT NOT NULL AUTO_INCREMENT,
    turma VARCHAR(50),
    semestre VARCHAR(10) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    tbl_materia_id_materia INT NOT NULL,
    PRIMARY KEY (id_turma),
    FOREIGN KEY (tbl_materia_id_materia) REFERENCES tbl_materia(id_materia)
);

-- Tabela para armazenar informações de matrículas
CREATE TABLE tbl_matricula (
    id_matricula INT NOT NULL AUTO_INCREMENT,
    status VARCHAR(20),
    tbl_turma_id_turma INT NOT NULL,
    PRIMARY KEY (id_matricula),
    FOREIGN KEY (tbl_turma_id_turma) REFERENCES tbl_turma(id_turma)
);

-- Tabela para armazenar informações de alunos
CREATE TABLE tbl_aluno (
    id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    registro_academico VARCHAR(20) NOT NULL,
    tbl_matricula_id_matricula INT NOT NULL,
    PRIMARY KEY (id_aluno),
    UNIQUE (registro_academico),
    FOREIGN KEY (tbl_matricula_id_matricula) REFERENCES tbl_matricula(id_matricula)
);

-- Tabela para armazenar informações de avaliações
CREATE TABLE avaliacao (
    id_avaliacao INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    data_limite DATE,
    PRIMARY KEY (id_avaliacao)
);

-- Tabela para armazenar informações de notas
CREATE TABLE tbl_nota (
    id_nota INT NOT NULL AUTO_INCREMENT,
    valor_nota DECIMAL(5,2),
    tbl_matricula_id_matricula INT NOT NULL,
    avaliacao_id_avaliacao INT NOT NULL,
    PRIMARY KEY (id_nota),
    FOREIGN KEY (tbl_matricula_id_matricula) REFERENCES tbl_matricula(id_matricula),
    FOREIGN KEY (avaliacao_id_avaliacao) REFERENCES avaliacao(id_avaliacao)
);

-- Tabela para armazenar informações de avisos
CREATE TABLE tbl_aviso (
    id_aviso INT NOT NULL AUTO_INCREMENT,
    mensagem MEDIUMTEXT,
    data_envio DATE,
    tbl_curso_id_curso INT NOT NULL,
    PRIMARY KEY (id_aviso),
    FOREIGN KEY (tbl_curso_id_curso) REFERENCES tbl_curso(id_curso)
);

-- Feito por: Gilberto vagner ferreira cavalcante.
