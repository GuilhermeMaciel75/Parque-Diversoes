/*
    INSTRUÇÕES SQL
                    */


-- ALTER TABLE --
-- Enunciado:

-- CREATE INDEX --
-- Enunciado:

-- INSERT INTO --
-- Enunciado:

-- UPDATE --
-- Enunciado:

-- DELETE --
-- Enunciado: Funcionário de CPF '101.101.101-01', foi desligado da empresa, logo, retire ele da função de operador do seu referido brinquedo e do quadro de funcionários
DELETE FROM OPERADOR
WHERE CPF_OPERADOR = '101.101.101-01';

DELETE FROM funcionario
WHERE CPF_funcionario = '101.101.101-01';

-- SELECT-FROM-WHERE E IS NULL ou IS NOT NULL--
-- Enunciado: Retorne os nomes, CPF e o salário dos funcionários que possuem um supervisor, bem como o nome e o CPF do seu supervisor
SELECT P.nome as Nome_FUNCIONARIO, F.cpf_funcionario, F.salario AS SALARIO_FUNCIONARIO, P2.nome AS NOME_SUPERVISOR, F.cpf_supervisor FROM Pessoa P, Funcionario F
JOIN Pessoa P2 ON P2.cpf = F.cpf_supervisor
WHERE P.cpf = F.cpf_funcionario
AND F.cpf_supervisor IS NOT NULL;

-- BETWEEN --
-- Enunciado:

-- IN --
-- Enunciado: Retorne nome, cpf e o método de pagamento dos clientes que efetuaram compra em pix ou dinheiro, assim como todas as informações sobre a compra mas em vez de retornar o CPF do atendente retorne apenas seu nome (use a clausula usando IN)
SELECT P.nome, P.cpf, C.metodo_pagamento, B.ingresso, F.nome, B.promocao, B.data_e_hora
FROM Pessoa P, Cliente C, Bilheteria B, Pessoa F
WHERE P.cpf = C.cpf_cliente
AND C.cpf_cliente = B.cliente
AND C.metodo_pagamento IN ('Pix', 'Dinheiro')
AND F.cpf = B.atendete;

-- LIKE --
-- Enunciado:

-- INNER JOIN --
-- Enunciado:

-- MAX --
-- Enunciado:

-- MIN --
-- Enunciado: Retorne a idade mínima e a altura mínima para poder andar em um brinquedo da área radical
SELECT MIN(B.restricao_de_idade), MIN(B.restricao_de_altura)
FROM Brinquedo B
WHERE B.area = 'Radical';

-- AVG --
-- Enunciado: Retorne a média salarial dos funcionarios
SELECT AVG(F.salario) AS MEDIA_SALARIAL
FROM Pessoa P, Funcionario F
WHERE P.cpf = F.cpf_funcionario;

-- COUNT --
-- Enunciado:

-- LEFT ou RIGHT ou FULL OUTER JOIN --
-- Enunciado:

-- SUBCONSULTA COM OPERADOR RELACIONAL --
-- Enunciado:

-- SUBCONSULTA COM IN --
-- Enunciado:

-- SUBCONSULTA COM ANY --
-- Enunciado:

-- SUBCONSULTA COM ALL --
-- Enunciado: Retorne os brinquedos, e suas respectivas áreas, com a maior restrição de altura
SELECT B.nome, B.area
FROM Brinquedo B
WHERE B.restricao_de_altura >= ALL(SELECT B.restricao_de_altura FROM Brinquedo B);

-- GROUP BY --
-- Enunciado: Retorne o sexo e a quantidade de funcionário e a média salarial, de acordo com o sexo, utilize a clausula GROUP BY
SELECT P.sexo, COUNT(*) AS QNT_FUNCIONARIOS, AVG(F.salario) AS MEDIA_SALARIAL
FROM Pessoa P, Funcionario F
WHERE P.cpf = F.cpf_funcionario
GROUP BY sexo;

-- HAVING --
-- Enunciado: Retorne os salários que tenham mais de uma ocorrência no sistem, com a respectiva quantidade de vezes em que eles aparecem
SELECT F.salario, COUNT(F.salario)
FROM Funcionario F
GROUP BY F.salario
HAVING COUNT(F.salario) > 1;

-- UNION ou INTERSECT ou MINUS  E ORDER BY--
-- Enunciado: Retorne o nome, data de nascimento e a idade atual de todos os clientes e seus depedentes que frequentaram o parque
SELECT *
FROM (
    SELECT P.nome, P.data_nascimento, TRUNC(MONTHS_BETWEEN(SYSDATE, P.data_nascimento)/12) AS IDADE 
    FROM Pessoa P, Cliente C
    WHERE P.cpf = C.cpf_cliente
    UNION
    SELECT D.nome, D.data_nascimento, TRUNC(MONTHS_BETWEEN(SYSDATE, D.data_nascimento)/12) AS IDADE 
    FROM Dependente D
)
ORDER BY data_nascimento;

-- CREATE VIEW --
-- Enunciado:



/*
    INSTRUÇÕES PL
                    */


-- USO DE RECORD --
-- Enunciado:

-- USO DE ESTRUTURA DE DADOS DO TIPO TABLE --
-- Enunciado:

-- BLOCO ANÔNIMO --
-- Enunciado:

-- CREATE PROCEDURE --
-- Enunciado:

-- CREATE FUNCTION --
-- Enunciado:

-- %TYPE --
-- Enunciado:

-- IF ELSIF --
-- Enunciado:

-- CASE WHEN --
-- Enunciado:

-- LOOP EXIT WHEN --
-- Enunciado:

-- WHILE LOOP --
-- Enunciado:

-- FOR IN LOOP --
-- Enunciado:

-- SELECT … INTO --
-- Enunciado:

-- CURSOR (OPEN, FETCH e CLOSE) --
-- Enunciado:

-- EXCEPTION WHEN --
-- Enunciado:

-- USO DE PAR METROS (IN, OUT ou IN OUT) --
-- Enunciado:

-- CREATE OR REPLACE PACKAGE --
-- Enunciado:

-- CREATE OR REPLACE PACKAGE BODY --
-- Enunciado:

-- CREATE OR REPLACE TRIGGER (COMANDO) --
-- Enunciado:

-- CREATE OR REPLACE TRIGGER (LINHA) --
-- Enunciado: