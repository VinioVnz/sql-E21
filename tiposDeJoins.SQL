TIPOS DE JOINS

INNER JOIN -> RETORNA DADOS QUE TENHAM CORRESPONDENCIA EM AMBAS AS TABELAS
LEFT JOIN -> RETORNA TODOS OS DADOS DA TABELA DA ESQUERDA E OS QUE TENHAM 
CORRESPONDENCIA NA TABELA DA DIREITA
LEFT JOIN tabela_esquerda ON tabela_esquerda.relacao = tabela_direita.id

RIGHT JOIN -> RETORNA TODOS OS REGISTROS DA TABELA DA DIREITA E TODOS QUE TENHAM 
CORRESPONDENCIA NA TABELA DA ESQUERDA(SO MENOS COMUM)
SELECT
produtos.id,
produtos.nome,
produtos.preco,
categorias.titulo
FROM 
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id



--RETORNA TODOS OS PRODUTOS E SO AS CATEGORIAS QUE TIVEREM CORRESPONDENCIA

SELECT
produtos.id,
produtos.nome,
produtos.preco,
categorias.titulo
FROM 
produtos
LEFT JOIN categorias ON produtos.from_categorias = categorias.id

--RETORNA TODAS AS CATEGORIAS E SO OS PRODUTOS QUE TIVEREM CORRESPONCIA

SELECT
produtos.id,
produtos.nome,
produtos.preco,
categorias.titulo
FROM 
produtos
RIGHT JOIN categorias ON produtos.from_categorias = categorias.id
