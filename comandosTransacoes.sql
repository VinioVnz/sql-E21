CREATE TABLE contas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    saldo DECIMAL(10,2)
);

INSERT INTO contas(nome,saldo) VALUES 
('Vinicius', 100.00),
('Fernanda',500.00);

/*
	CRIANDO UMA TRANSAÇÃO DE TRANSFERENCIA DE VALORES
*/

START TRANSACTION;
UPDATE contas SET saldo = saldo - 200 WHERE nome = 'Fernanda';
UPDATE contas SET saldo = saldo + 200 WHERE nome = 'Vinicius';
COMMIT;


ROLLBACK; -- DESFAZ

