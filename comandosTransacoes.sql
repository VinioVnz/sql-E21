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
UPDATE contas SET saldo = saldo + 300 WHERE nome = 'Fernanda';
SAVEPOINT depois_fernanda;
UPDATE contas SET saldo = saldo - 100 WHERE nome = 'Vinicius';


ROLLBACK TO depois_fernanda;

COMMIT;


