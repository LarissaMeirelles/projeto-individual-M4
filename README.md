A Resilia está pensando em lançar um novo sistema de
acompanhamento e para isso precisa de ajuda para modelar um
banco de dados que vai armazenar seus cursos, turmas e alunos.

Para apoiar nesse sistema recebemos a tarefa de realizar essa modelagem
e responder algumas perguntas com nosso modelo:

![print-modelo](https://user-images.githubusercontent.com/113534712/218621124-c361d4ae-260e-4ff8-b471-30ed0eb0f3bc.PNG)

1- Existem outras entidades além dessas três?

Sim, pensando e analisando as três entidades apresentadas pude pensar em mais três, sendo estas: Instituição, Docentes e Matrícula.

2- Quais são os principais campos e tipos?

- Instituição

cnpj_instituicao (VARCHAR, tamanho 13)
nome_instituicao (VARCHAR, tamanho variável)
endereço_instituicao (VARCHAR, tamanho variável)
telefone_instituicao (VARCHAR, tamanho 12)

- Cursos

id_curso (INT)
nome_curso (VARCHAR, tamanho variável)
duracao_curso (INT)
preco_curso (DECIMAL)
fk_instituicao (INT, chave estrangeira para Instituição)

- Turmas

id_turma (INT)
data_inicio (DATE)
data_termino (DATE)
vagas (INT)
fk_curso (INT, chave estrangeira para Cursos)
fk_docente (INT, chave estrangeira para Docentes)

- Alunos

id_aluno (INT)
nome_aluno (VARCHAR, tamanho variável)
cpf_aluno (VARCHAR, tamanho 11)
telefone_aluno (VARCHAR, tamanho 12)
endereco_aluno (VARCHAR, tamanho variável)

- Docentes

id_docente (INT)
nome_docente (VARCHAR, tamanho variável)
cpf_docente (VARCHAR, tamanho 11)
endereco_docente (VARCHAR, tamanho variável)
telefone_docente (VARCHAR, tamanho 12)
fk_instituicao: int (VARCHAR, tamanho 13, chave estrangeira, relacionada com a tabela "instituicoes")

- Matrícula

id_matricula (INT)
fk_aluno (INT, chave estrangeira para Alunos)
fk_turma (INT, chave estrangeira para Turmas)

3- Como essas entidades estão relacionadas?

A tabela "docentes" tem uma chave estrangeira que aponta para o atributo "cnpj_instituicao" da tabela "instituicao". Isso significa que cada docente só pode trabalhar para uma instituição, e cada instituição pode ter vários docentes.

A tabela "cursos" tem uma chave estrangeira que aponta para o atributo "cnpj_instituicao" da tabela "instituicao". Isso significa que cada curso é oferecido por uma única instituição, e cada instituição pode oferecer vários cursos.

A tabela "turmas" tem uma chave estrangeira que aponta para o atributo "id_curso" da tabela "cursos". Isso significa que cada turma é oferecida de um único curso, e cada curso pode ter várias turmas.

A tabela "alunos" não tem relação direta com as outras tabelas, mas as informações sobre as turmas e cursos que eles estão matriculados podem ser obtidas através da tabela "matricula".

E a tabela "matricula" tem chaves estrangeiras que apontam para os atributos "id_aluno" da tabela "alunos" e "id_turma" da tabela "turmas". Isso significa que cada matrícula relaciona uma turma com um aluno.
