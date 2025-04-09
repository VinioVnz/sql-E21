SELECT c.id, c.nome,
COUNT(e.id) AS total_enderecos,
CONCAT(
    e.logradouro, ", ", 
    e.numero, " | ",
    IF(e.complemento IS NOT NULL, CONCAT(e.complemento, " | "), " "),
    e.bairro, " | ",
    e.cidade, " - ",
    e.estado, " | CEP ",
    e.cep
    ) AS endereco
FROM clientes c
INNER JOIN clientes_enderecos e ON e.clientes_id = c.id AND e.principal = 1
GROUP BY e.clientes_id
ORDER BY c.nome ASC


-------------------------------------------------------------------

SELECT
nome,
CONCAT(
	SUBSTRING(cpf, 1, 3), '.',
    SUBSTRING(cpf, 4, 3), '.',
    SUBSTRING(cpf, 7, 3), '-',
    SUBSTRING(cpf, 10, 2)
    
) AS cpf,

idade,
CASE
	WHEN idade < 18 THEN 'Adolescente'
    WHEN idade BETWEEN 18 AND 30 THEN 'Jovem'
    WHEN idade BETWEEN 30 AND 60 THEN 'Adulto'
    ELSE 'Idoso'
END AS faixa_etaria
FROM
funcionarios
