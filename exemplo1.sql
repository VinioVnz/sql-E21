CREATE TABLE cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL  
);

-- CRIANDO A ESTRUTURA DA TABELA PRODUTO
/* 
comentário de multiplas linhas
 */

CREATE TABLE produto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    valor DOUBLE NOT NULL
);

/* 
    tabela de pedidos se não existir */
CREATE TABLE IF NOT EXISTS pedidos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
/* 
    pedidos itens
 */
CREATE TABLE pedido_items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    valor_total DOUBLE NOT NULL,
    pedidos_id INT NOT NULL,
    FOREIGN KEY (pedidos_id) REFERENCES pedidos (id)

);