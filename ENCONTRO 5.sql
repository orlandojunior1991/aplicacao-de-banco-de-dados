CREATE DATABASE DB_T05429_ORLANDOJR;

#Parte 1– Criação do Banco de Dados 
/*Crie um banco de dados seguindo o padrão:
• O nomedeve começar com DB_T05429_
• Em seguida, utilize o seu nome em maiúsculas
ex: DB_T05429_JOAO_DA_SILVA
*/
USE DB_T05429_ORLANDOJR;
SHOW DATABASES;

#Parte 2– Criação das Tabelas
/* Você deverá criar 3 tabelas, seguindo o modelo apresentado no slide.
Atenção:
• Os nomes das colunas devem estar em INGLÊS e MAIÚSCULO
• Utilize tipos de dados adequados (INT, VARCHAR, FLOAT, etc.
*/

/* Tabela: NOVELA
• ID: inteiro, chave primária, auto incremento
• NAME: nome da novela
• YEAR: ano de lançamento
• GENRE: gênero
• AUDIENCE: audiência média
*/

CREATE TABLE NOVEL(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(128) NOT NULL,
YEAR YEAR, 
GENRE VARCHAR(64),
AUDIENCE VARCHAR(32)
);

/* 
Tabela: ACTOR • ID: inteiro, chave primária, auto incremento
• NAME: nome do ator
• AGE: idade
• CHARACTER_NAME: personagem
• SALARY: cachê
*/

CREATE TABLE ACTOR(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (120) NOT NULL,
AGE VARCHAR(120),
CHARACTER_NAME VARCHAR(120),
SALARY VARCHAR(120)
);

INSERT INTO ACTOR (NAME, AGE, CHARACTER_NAME, SALARY) VALUES
('Lazaro Ramos', '47 anos','Foguinho','R$90.000'),
('Murilo Benício', '54 anos', 'Tufão', 'R$ 1.000.000'),
('Cauã Reymond', '46 anos', 'Jorginho', 'Não divulgado'),
('Adriana Esteves', '56 anos', 'Carminha', 'R$ 1.000.000'),
('Débora Falabella', '47 anos', 'Nina', 'Não divulgado');


CREATE TABLE BROADCASTER(
ID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR (120) NOT NULL,
COUNTRY VARCHAR(120),
FOUNDATION_YEAR VARCHAR(120)

);

INSERT INTO BROADCASTER (NAME, COUNTRY,FOUNDATION_YEAR) VALUES
('TV Record', 'Brasil', '1953'),
('TV Cultura', 'Brasil', '1960'),
('TV Globo', 'Brasil', '1965'),
('TV Bandeirantes', 'Brasil', '1967'),
('SBT', 'Brasil', '1981');


#INSERT INTO NOVEL (NAME, YEAR, GENRE, AUDIENCE) VALUES
('CADERUDO', 2012, 'DRAMA', '14 ANOS'),
('O CLONE', 2001, 'ROMANCE', '12 ANOS');

INSERT INTO NOVEL (NAME, YEAR, GENRE, AUDIENCE) VALUES
('Cobras & Lagartos', '2006', 'Comédia romântica', '38,26 pontos'),
('Avenida Brasil', '2012', 'Drama', '38,71 pontos'),
('Avenida Brasil', '2012', 'Drama', '38,71 pontos'),
('Avenida Brasil', '2012', 'Drama', '38,71 pontos'),
('Avenida Brasil', '2012', 'Drama', '38,71 pontos');

ALTER TABLE NOVEL
MODIFY COLUMN YEAR INT;


#INSERT INTO NOVEL VALUES
(NULL, ' Chocolate com pimenta', 2003,'Comedia', 'Livre');

SELECT * FROM NOVEL;
SELECT NAME, YEAR FROM NOVEL;
SELECT * FROM ACTOR;
SELECT * FROM BROADCASTER;

SELECT NAME, AGE FROM ACTOR;
SELECT NAME , SALARY FROM ACTOR;

SELECT NAME FROM BROADCASTER;

SELECT * FROM NOVEL ORDER BY YEAR ASC;

SELECT * FROM ACTOR ORDER BY AGE ASC;

SELECT * FROM BROADCASTER ORDER BY FOUNDATION_YEAR;

#INSERT INTO NOVEL VALUES
(NULL, 'Caverna do Dragão',ABC,'Comedia', 'livre');


#TRUNCATE TABLE NOVEL;