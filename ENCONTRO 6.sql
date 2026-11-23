USE `DB_T05429_ORLANDOJR`;

/*
Crie 3 tabelas. Atenção:  Colunas em INGLÊS e MAIÚSCULO
 Utilizar tipos adequados
Tabela: PRODUCT
 ID: inteiro, chave primária, auto incremento
 NAME: nome do doce
 CATEGORY: categoria
 PRICE: valor 
 STOCK: quantid
*/

CREATE TABLE PRODUCT(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (120),
CATEGORY VARCHAR (120),
PRICE DECIMAL (10,2),
STOCK INT
);

INSERT INTO PRODUCT ( NAME, CATEGORY, PRICE, STOCK)
VALUES
('Notebook', 'Informatica', 3500.90, 10),
('Mouse', 'Perifericos', 89.90, 25),
('Teclado', 'Perifericos', 150.50, 15),
('Monitor', 'Informatica', 1200.00, 8),
('Headset', 'Audio', 199.90, 12);
/*
 Insira mais 5 registros sem especificar campos
*/
INSERT INTO PRODUCT
VALUES
(NULL, 'Smartphone', 'Eletronicos', 2200.00, 15),
(NULL, 'Tablet', 'Eletronicos', 1800.00, 10),
(NULL, 'Impressora', 'Informatica', 750.00, 8),
(NULL, 'Webcam', 'Perifericos', 150.00, 20),
(NULL, 'Cadeira Gamer', 'Moveis', 950.00, 5);

/*
Tabela: CUSTOMER
 ID: inteiro, chave primária, auto incremento
 NAME: nome
 AGE: idade
 CITY: cidade
 EMAIL: e
*/

CREATE TABLE CUSTOMER(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (120),
AGE INT,
CITY VARCHAR(120),
EMAIL VARCHAR (120)
);

INSERT INTO CUSTOMER (NAME, AGE, CITY,EMAIL)
VALUES
('Joao', 30, 'Maua', 'joao@email.com'),
('Maria', 25, 'Santo Andre', 'maria@email.com'),
('Pedro', 35, 'Sao Paulo', 'pedro@email.com'),
('Ana', 28, 'Sao Bernardo', 'ana@email.com'),
('Carlos', 40, 'Maua', 'carlos@email.com');
/*
 Insira mais 5 registros sem especificar campos
*/
INSERT INTO CUSTOMER
VALUES
(NULL, 'Roberto Alves', 35, 'Sao Paulo', 'roberto@email.com'),
(NULL, 'Fernanda Costa', 28, 'Maua', 'fernanda@email.com'),
(NULL, 'Lucas Mendes', 42, 'Santo Andre', 'lucas@email.com'),
(NULL, 'Juliana Rocha', 31, 'Sao Bernardo', 'juliana@email.com'),
(NULL, 'Marcos Lima', 25, 'Ribeirao Pires', 'marcos@email.com');


/*
Tabela: ORDERS_TABLE
 ID: inteiro, chave primária, auto incremento
 CUSTOMER_NAME: nome do cliente
 PRODUCT_NAME: nome do produto
 QUANTITY: quantidade
 TOTAL_VALUE: valor

*/

CREATE TABLE ORDERS (
ID INT AUTO_INCREMENT PRIMARY KEY,
CUSTOMER_NAME VARCHAR (120),
PRODUCT_NAME VARCHAR (120),
QUANTITY INT,
TOTAL_VALUE DECIMAL (10,2)
);

INSERT INTO ORDERS (CUSTOMER_NAME, PRODUCT_NAME, QUANTITY, TOTAL_VALUE)
VALUES
('Carlos Silva', 'Notebook', 1, 3500.90),
('Ana Souza', 'Mouse', 2, 179.80),
('Pedro Santos', 'Teclado', 1, 150.50),
('Mariana Lima', 'Monitor', 2, 2400.00),
('Joao Oliveira', 'Headset', 3, 599.70);

/*
 Insira mais 5 registros sem especificar campos
*/
INSERT INTO ORDERS 
VALUES
(NULL, 'Roberto Alves', 'Smartphone', 1, 2200.00),
(NULL, 'Fernanda Costa', 'Tablet', 2, 1800.00),
(NULL, 'Lucas Mendes', 'Impressora', 1, 750.00),
(NULL, 'Juliana Rocha', 'Webcam', 2, 300.00),
(NULL, 'Marcos Lima', 'Cadeira Gamer', 1, 950.00);

/*
Parte 4 – Consultas com SELECT (40 minutos)
Consultas básicas
 Exibir todos os dados das tabelas
*/

SELECT * FROM PRODUCT;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

/*
Filtros com WHERE
 Produtos com PRICE maior que um valor  Clientes com AGE maior que 18
 Pedidos com QUANTITY maior que 2
*/
SELECT * FROM PRODUCT
WHERE PRICE > 500;

SELECT * FROM CUSTOMER
WHERE AGE > 18;

SELECT * FROM ORDERS
WHERE QUANTITY > 2;

/*
Ordenação
 Produtos ordenados por PRICE em ordem decrescente
 Clientes ordenados por AGE em ordem decrescente
*/
SELECT * FROM PRODUCT
ORDER BY PRICE DESC;

SELECT * FROM CUSTOMER
ORDER BY AGE DESC;

/*
LIMIT
 Exibir apenas 5 produtos
 Exibir apenas 5 cliente
*/
SELECT * FROM PRODUCT
LIMIT 5;
# teste com order by 
SELECT * FROM PRODUCT
ORDER BY PRICE DESC
LIMIT 3;

/*
LIKE
 Nome que começa com padrão (ex: palavra%) 
 Nome que termina com padrão (ex: %palavra)
 Nome que contém padrão (ex: %palavra%) 
 Nome com padrão de letras desconhecidas (ex: ___palavra)

*/

SELECT * FROM PRODUCT 
WHERE NAME LIKE 'N%';

SELECT * FROM PRODUCT 
WHERE NAME LIKE '%K';

SELECT * FROM PRODUCT 
WHERE NAME LIKE '%EBO%';

SELECT * FROM PRODUCT 
WHERE NAME LIKE '____BOOK';

