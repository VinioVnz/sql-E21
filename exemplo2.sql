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
);

