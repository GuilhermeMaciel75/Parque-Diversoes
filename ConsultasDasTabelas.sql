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
-- Enunciado:

-- SELECT-FROM-WHERE --
-- Enunciado:

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

-- IS NULL ou IS NOT NULL --
-- Enunciado:

-- INNER JOIN --
-- Enunciado:

-- MAX --
-- Enunciado:

-- MIN --
-- Enunciado:

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
-- Enunciado:

-- ORDER BY --
-- Enunciado:

-- GROUP BY --
-- Enunciado: Retorne o sexo e a quantidade de funcionário e a média salarial, de acordo com o sexo, utilize a clausula GROUP BY
SELECT P.sexo, COUNT(*) AS QNT_FUNCIONARIOS, AVG(F.salario) AS MEDIA_SALARIAL
FROM Pessoa P, Funcionario F
WHERE P.cpf = F.cpf_funcionario
GROUP BY sexo;

-- HAVING --
-- Enunciado:

-- UNION ou INTERSECT ou MINUS --
-- Enunciado:

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