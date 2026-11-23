/*
Objetivo da Aula

Manipular dados, realizar consultas com filtros avançados e controlar o acesso de
usuários.

 Parte 1 – Utilização do Banco
Selecione o banco DB_T2_SEUNOME já existente
*/
use `DB_T05429_ORLANDOJR`;

/*
Parte 2 – Criação das Tabelas

Crie as tabelas PLAYER, TEAM e MATCHES com colunas em inglês
 e maiúsculas, conforme definido em aula.
*/


/*PLAYER tem as colunas ID (INT), NAME (VARCHAR(100)), AGE (INT), POSITION
(VARCHAR(50)), SALARY (DECIMAL(10,2)) e TEAM_ID (INT).
*/
CREATE TABLE PLAYER (
ID INT  AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (100),
AGE INT,
POSITION VARCHAR (50),
SALARY DECIMAL (10,2),
TEAM_ID INT
);

/*
Parte 3– Inserção de Dados

Insira jogadores com idades maiores e menores que 25 anos e salários maiores e
menores que 100000.
Insira times com anos maiores e menores que 1900
*/
INSERT INTO PLAYER (NAME, AGE, POSITION, SALARY, TEAM_ID)
VALUES
('Zakaria Taifi', 21, 'Defender', 88025.00, 1),
('Nolan Miller', 22, 'Defender', 88025.00, 1),
('Robin Jansson', 35, 'Defender', 500000.00, 1),
('Martin Ojeda', 27, 'Midfielder', 1600000.00, 1),
('Wilder Cartagena', 32, 'Midfielder', 480000.00, 1);

/*
Parte 4– Manipulação de Dados

Atualize o salário de um jogador e a cidade de um time, utilizando WHERE.
Exemplo:
UPDATE PRODUCT SET PRICE = 20 WHERE ID = 1;
*/
UPDATE PLAYER 
SET SALARY 10
WHERE NAME = 'Martin Ojeda';

/*Remova um registro ID = 5:
DELETE FROM PRODUCT WHERE ID = 5
*/
DELETE FROM PLAYER
WHERE ID = 5;

/*
TEAM tem as colunas ID (INT), NAME (VARCHAR(100)),
 CITY (VARCHAR(100)),FOUNDATION_YEAR (INT) e STADIUM (VARCHAR(100))
*/
CREATE TABLE TEAM (
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (100),
CITY VARCHAR (100),
FOUNDATION_YEAR INT,
STADIUM VARCHAR (100)
);

INSERT INTO TEAM ( NAME, CITY, FOUNDATION_YEAR, STADIUM)
VALUES
('Orlando City', 'Orlando', 2010, 'Inter&Co Stadium'),
('Atlanta United', 'Atlanta', 2014, 'Mercedes-Benz Stadium'),
('Chicago Fire', 'Chicago', 1997, 'Soldier Field'),
('Seattle Sounders', 'Seattle', 1974, 'Lumen Field'),
('LA Galaxy', 'Los Angeles', 1994, 'Dignity Health Sports Park');
DESCRIBE TEAM;
# "FOUNDATION_YAER" estava errado FOUNDATION_YEAR é o correto
ALTER TABLE TEAM 
CHANGE FOUNDATION_YAER FOUNDATION_YEAR INT;

/*
MATCHES tem ascolunas ID (INT), HOME_TEAM_ID (INT), 
AWAY_TEAM_ID (INT),
MATCH_DATE (DATE), HOME_SCORE (INT), AWAY_SCORE (INT)
 e STADIUM
(VARCHAR(100))
*/
CREATE TABLE MATCHES (
ID INT AUTO_INCREMENT PRIMARY KEY,
HOME_TEAM_ID INT,
AWAY_TEAM_ID INT,
MATE_DATE DATE,
HOME_SCORE INT,
AWAY_SCORE INT,
STADIUM VARCHAR (100)
);

INSERT INTO MATCHES (HOME_TEAM_ID, AWAY_TEAM_ID, MATE_DATE, HOME_SCORE, AWAY_SCORE, STADIUM)
VALUES
(1, 2, '2026-03-10', 2, 1, 'Inter&Co Stadium'),
(2, 3, '2026-03-15', 1, 1, 'Mercedes-Benz Stadium'),
(3, 4, '2026-04-05', 3, 0, 'Soldier Field'),
(4, 5, '2026-04-12', 2, 2, 'Lumen Field'),
(5, 1, '2026-04-20', 0, 1, 'Dignity Health Sports Park');

/*
Parte 5– Consultas com WHERE

Agora você deverá realizar consultas utilizando filtros.
Cada item abaixo deve ser executado separadamente.
 Comparações simples (>, <, =)
1. Liste jogadores com AGE maior que25
2. Liste jogadores com SALARY menor que 100000
3. Liste times com FOUNDATION_YEAR maior que 1900
Exemplo(supermercado):
SELECT * FROM PRODUCT
WHERE PRICE > 10;
*/
SELECT * FROM PLAYER 
WHERE AGE > 25;

SELECT * FROM PLAYER 
WHERE SALARY <100000;

SELECT * FROM TEAM
WHERE FOUNDATION_YEAR > 1900;

/*
2. Operador AND

1. Liste jogadores com AGE maior que 25 E SALARY maior que 100000
2. Liste times com FOUNDATION_YEAR maior que 1900 E CITY igual a um valor
definido por você
Exemplo(supermercado):
SELECT * FROM PRODUCT
WHERE PRICE > 10 AND STOCK > 5;
*/
SELECT * FROM PLAYER 
WHERE AGE > 25 AND SALARY > 100000;

SELECT * FROM TEAM
WHERE FOUNDATION_YEAR > 1900 AND CITY = 'ORLANDO';

/*
3. Operador OR

Liste jogadores com AGE menor que 25 OU SALARY menor que 100000
Liste times de duas cidades diferentes
*/
SELECT * FROM PLAYER
WHERE AGE < 25 OR SALARY < 100000;

SELECT * FROM TEAM
WHERE CITY = 'ORLANDO' OR CITY = 'ATLANTA';

/*
4. Operador BETWEEN (intervalo de valores)

Liste jogadores com AGE entre 20 e 30
Liste times com FOUNDATION_YEAR entre 1950 e 2020
*/
SELECT * FROM PLAYER
WHERE AGE BETWEEN 20 AND 30;

SELECT * FROM TEAM
WHERE FOUNDATION_YEAR BETWEEN 1950 AND 2020;

/* 
5.  IN (valores múltiplos)
	NOT IN (exceto)
    
1. Liste jogadores que possuem POSITION em dois ou mais valores definidos por
você
2. Liste times que pertencem a mais de uma cidade específica que você escreveu
*/
SELECT * FROM PLAYER 
WHERE POSITION IN ('DEFENDER', 'MIDFIELDER');

SELECT * FROM PLAYER 
WHERE POSITION NOT IN ('MIDFIELDER');

SELECT * FROM TEAM
WHERE CITY IN ('ORLANDO', 'LOS ANGELES', 'ATLANTA');

/*
6. LIKE(busca por padrão)

1. Liste jogadores com nome começando com uma letra (ex: A%)
2. Liste jogadores com nome terminando com uma palavra (%silva)
3. Liste jogadores com nome contendo uma palavra (%junior%)
4. Liste jogadores com padrão de letras desconhecidas (___nome)
*/
SELECT * FROM PLAYER 
WHERE NAME LIKE 'A%';

SELECT * FROM PLAYER 
WHERE NAME LIKE '%SILVA';

SELECT * FROM PLAYER 
WHERE NAME LIKE '%JUNIOR%';

SELECT * FROM PLAYER
WHERE NAME LIKE 'NOLAN_______';

# Minha tabela havia duplicado os PLAYER equivocadamente, então deletei os dados duplicados.
DELETE FROM PLAYER 
WHERE ID BETWEEN 6 AND 10;

/*
7. IS NULL (valores nulos)

Realize as etapas:
1. Insira um registro com algum campo vazio
2. Liste os registros que possuem esse campo nulo
*/
INSERT INTO PLAYER ( NAME, AGE, POSITION, TEAM_ID)
VALUES
 ('Joao Silva', 24, 'Defender', 1);

SELECT * FROM PLAYER;

SELECT * FROM PLAYER 
WHERE SALARY IS NULL;

/*
8. ORDER BY + LIMIT

Liste jogadores ordenados por SALARY em ordem decrescente
Liste times ordenados por FOUNDATION_YEAR em ordem decrescente
1. Exiba apenas os 5 primeiros registros de cada consulta
*/
SELECT * FROM PLAYER
ORDER BY  SALARY DESC
LIMIT 5;

SELECT * FROM TEAM 
ORDER BY FOUNDATION_YEAR DESC
LIMIT 5;

/*
Parte 6 – Criação de Usuário (DCL)

Nesta parte você irá simular a criação de um usuário.  Escreva o comando para criar um usuário com:
o Seu nome como usuário
o Uma senha definida por você
 O usuário deve permitir acesso remoto ('%')  Como você não possui permissão para executar esse comando:
o Apenas escreva o comando
o Explique o que cada parte faz

O que explicar:  Nome do usuário
 Host (%)  Senha

Comando:

CREATE USER 'orlando'@'%' IDENTIFIED BY 'MinhaSenha123!';
Explicação:
CREATE USER: comando utilizado para criar um usuário no MySQL.
'orlando': nome escolhido para o usuário.
'%': permite conexões provenientes de qualquer endereço de origem, conforme as configurações do servidor.
IDENTIFIED BY: define a senha de autenticação.
'MinhaSenha123!': senha escolhida para o usuário.
*/
CREATE USER 'ORLANDOJR'@'%'
IDENTIFIED BY 'MINHASENHA123!';

/*
Parte 7 – Concessão de Privilégios (DCL)

Agora você irá simular permissões de acesso.  Escreva o comando para conceder:
o Apenas permissão de leitura (SELECT)
o Permissão total (ALL PRIVILEGES)  Utilize o banco:
o DB_T2_SEUNOME
 Explique a diferença entre:
o Permissão de leitura
o Permissão total

Exemplo (supermercado):
GRANT SELECT ON DB_SUPERMERCADO.* TO 'usuario_teste'@'%';
GRANT ALL PRIVILEGES ON DB_SUPERMERCADO.* TO 'usuario_teste'@'%'; TO 'usuario_teste'@'%';

Nesse caso, o usuário recebe todas as permissões disponíveis naquela tabela.

Guarde esta regra:
Código	Significado
BANCO.*	----> Todas as tabelas do banco
BANCO.PLAYER -->Somente a tabela PLAYER
BANCO.TEAM ---> Somente a tabela TEAM
*/

GRANT SELECT ON `DB_T05429_ORLANDOJR`.* TO 'ORLANDOJR'@'%';
GRANT ALL PRIVILEGES ON `DB_T05429_ORLANDOJR`.* TO 'ORLANDOJR'@'%';

/*
Parte 8 – Atualização de Privilégios

Agora você deverá entender como aplicar as permissões.

 Tarefas:
1. Escreva o comando necessário para atualizar os privilégios
2. Explique por que esse comando é necessário

Exemplo (supermercado):
FLUSH PRIVILEGES;

Explicação:

O comando FLUSH PRIVILEGES é utilizado para recarregar as informações de permissões dos usuários no MySQL.
Ele permite que o sistema atualize as informações de controle de acesso.
Quando utilizamos comandos como GRANT e CREATE USER, o MySQL atualiza as permissões automaticamente, 
não sendo necessário executar o FLUSH PRIVILEGES nesses casos.
NÃO É MUITO USADO.
*/
FLUSH PRIVILEGES;

/*
Parte 9 – Controle de Transações (DTL)

Agora você irá trabalhar com controle de alterações no banco. 

Etapa 1 – Cancelando alterações

Tarefas:  Escreva um comando para:
o Iniciar uma transação
o Alterar o SALARY de um jogador
o Cancelar a operação
 Explique o que acontece após o cancelamento
Exemplo (supermercado):
START TRANSACTION;
UPDATE PRODUCT SET PRICE = 50 WHERE ID = 1;
ROLLBACK;
*/
SELECT * FROM PLAYER;

START TRANSACTION;
UPDATE PLAYER 
SET SALARY = 999999
WHERE ID = 3;
ROLLBACK;
/* 
O que você acabou de aprender?
- WHERE NAME = ... → procura pelo nome.
- WHERE ID = 3 → procura pela chave identificadora do jogador.
SEMPRE PELO ID
*/

/*
Etapa 2 – Confirmando alterações

Tarefas:  Escreva um comando para:
o Iniciar uma transação
o Alterar o SALARY de um jogador
o Confirmar a operação
 Explique a diferença entre:
o ROLLBACK
o COMMIT
*/
START TRANSACTION;
UPDATE PLAYER
SET SALARY = 999999
WHERE ID = 3;
COMMIT;

SELECT NAME, AGE, SALARY FROM PLAYER;

/*
Parte 10 – Exercício de Fixação

Agora você deverá combinar tudo que aprendeu.
 Tarefas: Crie uma consulta que utilize:
WHERE
AND
ORDER BY em ordem decrescente
LIMIT

 A consulta deve:
o Filtrar jogadores por idade e salário
o Ordenar pelo salário
o Limitar em 5 resultados

Tarefas adicionais: 
Escreva uma consulta usando: OR
Escreva uma consulta usando: LIKE
Explique o que cada consulta faz
*/
SELECT * FROM PLAYER
WHERE AGE > 25 AND SALARY > 1000000
ORDER BY SALARY DESC
LIMIT 5;

SELECT * FROM PLAYER 
WHERE AGE > 25 OR SALARY > 1000000
ORDER BY SALARY DESC
LIMIT 5;

SELECT * FROM PLAYER
WHERE NAME LIKE 'NOL%';

SELECT * FROM TEAM
WHERE NAME LIKE '%TY';

SELECT * FROM MATCHES
WHERE STADIUM LIKE '%FIELD';