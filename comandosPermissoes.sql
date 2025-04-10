-- LISTA AS PERMISSÕES DO USUÁRIO ATUAL
SHOW GRANTS FOR CURRENT_USER;

-- CRIA UM NOVO USUÁRIO
CREATE USER 'vinicius'@'localhost'  IDENTIFIED BY '123';

-- ATRIBUIR PERMISSÕES PARA O USUÁRIO
GRANT SELECT ON vinicius.* TO 'vinicius'@'localhost';
GRANT SELECT,INSERT, UPDATE ON vinicius.* TO 'vinicius'@'localhost';

-- ATRIBUIR TODOS OS PRIVIÇÉGIOS PARA UM USUÁRIO (CUIDADO)
GRANT ALL PRIVILEGES ON vinicius.* TO 'vinicius'@'localhost';

-- REVOGAR PERMISSÃO DO USUÁRIO (FAZER ANTES DE DEMITIR)
REVOKE ALL PRIVILEGES ON vinicius.* FROM 'vinicius'@'localhost';

-- LIMPAR CACHE E ATUALIZAR PERMISSÕES
FLUSH PRIVILEGES;

-- LISTAR TODOS USUÁRIOS;
SELECT user,host FROM mysql.user;

-- ALTERAR SENHA DE UM USUARIO
ALTER USER 'vinicius'@'localhost' IDENTIFIED BY '12345'