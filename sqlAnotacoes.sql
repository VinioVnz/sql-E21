SQL = STRUCTURED QUERY LANGUAGE - linguagem de consulta estrutura

CREATE - cria alguma coisa
ALTER - altera alguma coisa
DROP - deleta alguma coisa

na modelagem usamos 
CREATE TABLE - cria uma tabela
ALTER TABLE - altera uma tabela
DROP TABLE - deleta uma tabela

TIPOS DE RESTRIÇÃO NO FOREIGN KEY

NO ACTION - SEM EFEITO IMEDIATO E PODE GERAR ERRO NO BANCO DE DADOS CASO A ESTRTURUA
ESTEJA FEITA PARA A RESTRIÇÃO DE INTEGRIDADE DE DADOS

CASCADE - SE O REGISTRO DA TABELA REFERENCIADA FOR DELETADO, OS REGISTROS DEPENDENTES
TAMBÉM SERÃO AUTOMATICAMENTE DELETADOS

SET NULL - SE O REGISTRO DA TABELA REFERENCIADA FOR DELETADO, OS REGISTROS DEPENDENTES
TERÃO O CAMPO DE CHAVE ESTRANHEIRA MARCADOS COMO NULL (NAO FUNCIOONA EM CAMPOS COM MARCAÇÃO
NOT NULL )

RESTRICT - IMPEDE A EXCLUSÃO DE REGISTROS DA TABELA REFERENCIADA SE HOUVER REGISTROS
DEPENDENTES

COMANDOS BÁSICOS (INSTRUÇÕES) DE SQL

DIVIDIMOS AS INSTRUÇÕES EM ALGUMAS CATEGORIAS, SÃO ELAS:
DDL, DML, DQL, DCL E TCL

DDL -> DATA DEFINITION LANGUAGE (LINGAUGEM DE DEFINIÇÃO DE DADOS)
    CONTÉM COMANDOS UTILIZADOS PARA CRIAR, MODIFICAR OU EXCLUIT ESTRUTURAS DE BANCO DE 
    DADOS. ESTES COMANDOS NÃO MANIPULAM DADOS, APENAS A ESTRUTURA
COMANDOS RELACIONADOS: CREATE, ALTER, DROP, TRUNCATE
EXEMPLOS: 
CREATE TABLE nome_tabela
ALTER TABLE nome_tabela  ADD campo INT 
DROP TABLE nome_tabela
TRUNCATE TABLE nome_tabela

-----------------------------------------

DML -> DATA MANIPULATION LANGUAGE (LINGAGUEM DE MANIPULAÇÃO DE DADOS)
    CONTÉM COMANDOS UTILIZADOS PARA MANIPULAR DADOS NAS TABELAS INCLUINDO INSERÇÃO,
    ATUALIZAÇÃO E REMOÇÃO DE REGISTROS. 
    COMANDOS RELACIONADOS: INSERT, UPDATE, DELETE 
    EXEMPLOS:
    INSERT INTO nome_tabela 
    UPDATE nome_tabela
    DELETE from nome_tabela

INSERT INTO categorias 
(titulo, ativo, ordem) 
VALUES
('Eletrônicos', 0, null),
('Móveis', 1, 1);

UPDATE categorias SET titulo = 'Eletrônicos' WHERE id = 1;
UPDATE categorias SET titulo = 'Mercearia', ordem = 0 WHERE id = 2;

DELETE FROM categorias WHERE id = 1;
DELETE FROM categorias WHERE ativo = 0 LIMIT 2;
DELETE FROM categorias WHERE id IN(2,4,6,8,9);
-----------------------------------------

DQL -> DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
    CONTÉM UM COMANDO UTILIZADO PARA CONSULTAR OS DADOS NO VANCO DE DADOSOU SEJA,
    PARA FAZER QUERIES (CONSULTAS) 
    COMANDOS RELACIONADOS: SELECT

    EXEMPLO : SELECT * FROM nome_tabela ( * = TODAS AS COLUNAS DE UMA TABELA. É POSSIVEL TAMBÉM INFROMAR O NOME DE COLUNAS
    SEPARANDO-AS POR VÍRGULA)


SELECT * FROM produtos
WHERE
-- id  = 1
-- id > 10
-- id < 10
-- id >= 50
-- id != 10
 preco > 10 AND preco < 100


SELECT id, nome FROM produtos
WHERE
 preco > 10 AND preco < 100


SELECT * FROM produtos
WHERE
 (preco > 500 AND preco < 1000) OR preco = 50


SELECT * FROM produtos
WHERE
id IN(2,3,15,26,40) 

SELECT * FROM produtos
WHERE
preco BETWEEN 100 AND 500 -- usa isso pra data
ORDER BY preco DESC -- use ASC para ordenar crescente 
LIMIT 5 -- limita em 5 registros
-- LIMIT 10,5 (limita do decimo registro até o 15)

---------------- LIKE ---------------------

SELECT * FROM produtos
WHERE
nome like '% para %'

SELECT * FROM produtos
WHERE
nome like 'Ca__teira%'


-----------------------------------------

--FUNÇÕES AGREGADAS

SELECT 
COUNT(*) AS total -- soma a quantidade de linhas n nulas
SUM(preco) AS soma, -- soma todos os itens de uma coluna especifica
AVG(preco) AS media, -- calcula a media dos valores de uma coluna especifica
MIN(preco) AS minimo, -- mostra o valor minimo de uma coluna especifica
MAX(preco) as maximo -- mostra o valor maximo de uma coluna especifica
FROM 
produtos

SELECT 
COUNT(*) AS total,
from_categorias
FROM 
produtos
GROUP BY from_categorias


SELECT
produtos.id,
produtos.nome,
produtos.preco,
categorias.titulo
FROM 
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id



-----------------------------------------

DCL -> DATA CONTROL LANGUAGE (LINGUAGEM DE CONTROLE DE DADOS)
    CONTÉM COMANDOS QUE CONTROLAM O ACESSO E PERMISSÕES DE USUÁRIOS SOBRE OBJETOS DE 
    BANCO DE DADOS COMO TABELAS, VIEWS E ETC.
    COMANDOS RELACIONADOS: GRANT, REVOKE 
    EXEMPLOS:
    GRANT SELECT, INSERT ON nome_tabela
    REVOKE INSERT ON nome_tabela

-----------------------------------------

TCL -> TRANSCRITION CONTROL LANGUAGE (LINUGUGAEM DE CONTROLE DE TRANSAÇÕES)
    CONTÉM COMANDOS QUE GERENCIAM AS TRANSAÇÕES DE BANCO DE DADOS. TRANSAÇÕES SÃO BLOCOS
    DE OPERAÇÕES QUE DEVEM SER EXECUTADAS JUNTAS OU NÃO EXECUTADAS.
    COMANDOS RELACIONADOS: BEGIN/START TRANSACTION, COMMIT, ROLLBACK, SABEPOINT

    EXEMPLOS:
    START TRANSACTION nome_transacao
        INSERT INTO ... 
    COMMIT; --SE CASO FOI TUDO CERTO

    START TRANSACTION
        UPDATE ...
    ROLLBACK; --SE ALGO DER ERRADO

    RELEASE SAVEPOINT nome_transacao