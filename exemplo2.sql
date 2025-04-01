CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(14) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE clientes_enderecos (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(150) NOT NULL,
    numero CHAR(4) NOT NULL DEFAULT 'S/N',
    complemento VARCHAR(45),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    principal TINYINT(1) NOT NULL DEFAULT 0,
    clientes_id INT NOT NULL, 
    CONSTRAINT `fk_clientes`
    FOREIGN KEY (clientes_id) REFERENCES clientes (id)
);

CREATE TABLE funcionarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE funcionarios_funcoes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    funcao VARCHAR(50) NOT NULL,
    cbo CHAR(7) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    funcionarios_id INT NOT NULL,
    CONSTRAINT `fk_funcionarios`
    FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE  
);

CREATE TABLE pedidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DOUBLE NOT NULL DEFAULT 0,
    nf VARCHAR(255),
    clientes_id INT NOT NULL,
    funcionarios_id INT NOT NULL,
    INDEX idx_pedidos_id_clientes_id (clientes_id ASC) VISIBLE,
    INDEX idx_funcionarios (funcionarios_id ASC) VISIBLE,
    CONSTRAINT `fk_pedidos_clientes`
        FOREIGN KEY (clientes_id) REFERENCES clientes(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,

    CONSTRAINT `fk_pedidos_funcionarios`
        FOREIGN KEY (funcionarios_id) REFERENCES funcionarios(id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* 
    NESSA TABELA TEMOS UMA RELAÇÃO DUPLA, DE UMA TABELA "NETA"(PEDIDOS_ITENS)
    E UMA TABELA "AVÔ"(CLIENTES)
 */
CREATE TABLE pedidos_itens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(150) NOT NULL,
    quantidade INT NOT NULL,
    valor DOUBLE NOT NULL,
    pedidos_id INT NOT NULL,
    clientes_id INT NOT NULL,
    
    CONSTRAINT `fk_pedidos_itens`
        FOREIGN KEY (pedidos_id)
            REFERENCES pedidos (id)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION,
        
	CONSTRAINT `fk_clientes_itens`
       FOREIGN KEY(clientes_id)
			REFERENCES clientes(id)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE categorias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    ativo TINYINT(1) NOT NULL DEFAULT 1
);
/* SE APAGAR UM PRODUTO QUE TEM UMA CATEGORIA, VAI DEIXAR
   SE APAGAR UMA CATEGORIA Q TEM UM PRODUTO RELACIONADO ELE VAI RESTRINGIR
 */
CREATE TABLE produtos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100),
    preco DOUBLE NOT NULL DEFAULT 0,
    categorias_id INT NOT NULL,
    from_categorias INT NOT NULL,
    CONSTRAINT `fk_categorias`
    FOREIGN KEY (from_categorias) REFERENCES categorias(id)
    ON UPDATE NO ACTION
    ON DELETE RESTRICT
);

