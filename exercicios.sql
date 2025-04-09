--- 1. Liste todos os produtos com suas respectivas categorias
SELECT 
produtos.nome,
categorias.titulo 
FROM 
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id

--- 2. Liste todos os produtos, com ou sem categoria
SELECT 
produtos.nome,
categorias.titulo
FROM
produtos
LEFT JOIN categorias ON produtos.from_categorias = categorias.id

--- 3. Liste os produtos que pertencem a categorias ativas
SELECT
produtos.nome
FROM
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id WHERE categorias.ativo = 1

--- 4. Liste quantos produtos existem por categoria
SELECT 
COUNT(*) as total,
from_categorias,
categorias.titulo
FROM
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id
GROUP BY from_categorias

--- 5. Liste o produto mais caro de cada categoria
SELECT 
MAX(preco),
categorias.titulo
FROM
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id
GROUP BY categorias.titulo

/* 6. DESAFIO - MONTE UMA CONSULTA COM AS REGRAS ABAIXO
Traga o nome do produto, o preço, a categoria
Filtre os produtos com preço entre X e Y
Mostre somente as categorias ativas.
Só traga os produtos cujo nome contenha uma palavra específica 
Agrupe os resultados por categoria.
Mostre também:
	•	A quantidade de produtos por categoria.
	•	O preço médio dos produtos daquela categoria.
	•	O produto mais caro da categoria.
*/
SELECT 
produtos.nome,
produtos.preco,
categorias.titulo,
COUNT(*) as total,
AVG(produtos.preco) AS media,
MAX(produtos.preco) AS maisCaro
FROM
produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id 
WHERE
(preco BETWEEN 10 AND 500) 
AND
(categorias.ativo = 1)
AND
produtos.nome LIKE '%a%'
GROUP BY  
categorias.titulo,
categorias.ativo;

---------------------------------------
SELECT 
nome,
nota1,
nota2,
nota3,
ROUND((nota1 + nota2 + nota3) /3,2) AS media,
IF ((nota1 + nota2 + nota3)/3 >= 6 ,'Aprovado','Reprovado') AS situacao
FROM
alunos;