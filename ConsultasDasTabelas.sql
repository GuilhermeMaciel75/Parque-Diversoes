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
-- Enunciado: Retorne a média salarial de cada setor, assim como a quantidade de pessoas que trabalham nele
SELECT DISTINCT
  (SELECT AVG(F.salario) FROM Funcionario F JOIN Atendente A ON F.cpf_funcionario = A.cpf_atendente) AS Media_Salarial_Atendentes,
  (SELECT COUNT(cpf_atendente) FROM Atendente) AS Qnt_Atendentes,
  (SELECT AVG(F.salario) FROM Funcionario F JOIN Operador O ON F.cpf_funcionario = O.cpf_operador) AS Media_Salarial_Operadores,
  (SELECT COUNT(cpf_operador) FROM Operador) AS Qnt_Operadores
FROM Funcionario;

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
-- Enunciado: Considerando que haverá um recálculo no salário dos funcionários com o salário menor que a média, mostre quanto teria que ser adicionado ao salário antigo para que atinga a média, o salário antigo e o salário novo, assim cmo a média salarial
CREATE VIEW Reajuste_Salarial AS 
SELECT P.nome, (SELECT AVG(salario) FROM Funcionario) AS Media_Salarial, F.salario AS Salario_Antigo, ((SELECT AVG(salario) FROM Funcionario) - F.salario) AS Valor_Reajuste, (F.salario + ((SELECT AVG(salario) FROM Funcionario) - F.salario)) AS Novo_Salario
FROM Pessoa P
JOIN Funcionario F ON P.cpf = F.cpf_funcionario
WHERE F.salario < (SELECT AVG(salario) FROM Funcionario);


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