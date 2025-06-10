CREATE DATABASE IF NOT EXISTS pizzaria;
USE pizzaria;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    quadra VARCHAR(50),
    casa VARCHAR(20),
    cep VARCHAR(20)
);

CREATE TABLE pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    ingredientes TEXT,
    preco DECIMAL(10,2)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    pizza_id INT,
    pagamento VARCHAR(50),
    observacoes TEXT,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id)
);


CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL, 
    nome VARCHAR(100)
);

INSERT INTO pizzas (nome, ingredientes, preco) VALUES
('Pizza Italiana', 'Molho de tomate artesanal, mussarela e manjericão fresco', 35.00),
('Pizza Havaiana', 'Molho de tomate, mussarela, presunto e pedaços de abacaxi', 34.00),
('Pizza Grega', 'Queijo, tomate, cebola roxa, azeitonas pretas, orégano grego', 33.00),
('Bacon Crispy Thins', 'Massa fininha, bacon crocante, queijo derretido', 32.00),
('Havaiana Especial', 'Mais queijo, presunto, abacaxi caramelizado, borda recheada', 49.90),
('Ultimate Overload', 'Muito queijo, pepperoni, bacon, calabresa, cebola, azeitonas', 45.00),
('Pizza de Bacon', 'Massa tradicional, bacon, queijo e toque especial', 36.00),
('Presunto & Abacaxi', 'Massa tradicional, bacon, queijo e toque especial', 36.00);
   -- INSERT INTO funcionarios (usuario, senha, nome) VALUES ('admin', 'SEU_HASH_DA_SENHA_AQUI', 'Administrador');

-- CONSULTAS BÁSICAS

-- 1. Selecionar todos os clientes
-- SELECT * FROM clientes;

-- 2. Selecionar nome e telefone dos clientes
-- SELECT nome, telefone FROM clientes;

-- 3. Selecionar todas as pizzas disponíveis
-- SELECT * FROM pizzas;

-- CONSULTAS INTERMEDIÁRIAS

-- 4. Selecionar pizzas com preço maior que R$ 35
-- SELECT * FROM pizzas WHERE preco > 35;

-- 5. Selecionar pizzas com preço entre R$30 e R$40
-- SELECT * FROM pizzas WHERE preco BETWEEN 30 AND 40;

-- 6. Selecionar pizzas com nome que contenha 'Bacon'
-- SELECT * FROM pizzas WHERE nome LIKE '%Bacon%';

-- 7. Selecionar os diferentes tipos de pagamento registrados
-- SELECT DISTINCT pagamento FROM pedidos;

-- 8. Total gasto por cada cliente
-- SELECT cliente_id, SUM(p.preco) AS total_gasto
-- FROM pedidos AS pe
-- JOIN pizzas AS p ON pe.pizza_id = p.id
-- GROUP BY cliente_id;

-- 9. Média de preço das pizzas
-- SELECT AVG(preco) AS media_preco FROM pizzas;

-- 10. Número total de pedidos por cliente
-- SELECT cliente_id, COUNT(*) AS total_pedidos
-- FROM pedidos
-- GROUP BY cliente_id;

-- 11. Pizzas mais caras primeiro
-- SELECT * FROM pizzas ORDER BY preco DESC;

-- 12. Clientes que moram na quadra 'Q1' ou 'Q2'
-- SELECT * FROM clientes WHERE quadra IN ('Q1', 'Q2');

-- CONSULTAS AVANÇADAS

-- TRIGGER: Atualiza data de cadastro ao atualizar pedido
-- DELIMITER //

-- CREATE TRIGGER atualiza_data_pedido
-- BEFORE UPDATE ON pedidos
-- FOR EACH ROW
-- BEGIN
--    SET NEW.data_cadastro = CURRENT_TIMESTAMP;
-- END //

-- DELIMITER ;

-- Listar pedidos de um cliente
-- DELIMITER //

-- CREATE PROCEDURE listar_pedidos_cliente(IN clienteId INT)
-- BEGIN
    -- SELECT pe.id, p.nome AS pizza, pe.pagamento, pe.observacoes, pe.data_cadastro
    --FROM pedidos pe
    --JOIN pizzas p ON pe.pizza_id = p.id
    --WHERE pe.cliente_id = clienteId;
--END //

--DELIMITER ;
