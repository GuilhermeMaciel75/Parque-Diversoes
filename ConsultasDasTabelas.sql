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
-- Retornar os clientes que pagaram com cartão, independente se foi no débito ou no crédito
SELECT P.nome, C.metodo_pagamento
FROM Pessoa P, Cliente C
WHERE P.cpf = C.cpf_cliente 
AND C.metodo_pagamento LIKE 'Cart%'
ORDER BY P.nome;

-- Brinquedos que começam com 'S' e suas respectivas áreas
SELECT B.nome, B.area
FROM Brinquedo B
WHERE B.nome LIKE 'S%'
ORDER BY B.nome;

-- INNER JOIN --
-- Retornar o nome dos operadores que trabalham com brinquedos radicais 
SELECT P.nome, B.nome as Brinquedo
FROM Pessoa P
INNER JOIN Operador O ON P.cpf = O.cpf_operador
INNER JOIN Brinquedo B ON O.brinquedo = B.nome
WHERE B.area = 'Radical'
ORDER BY P.nome;

-- Retornar o Nome e Salario do Funcionário responsável por operar o 'Trem Fantasma'
SELECT P.nome, F.salario
FROM Pessoa P 
INNER JOIN Funcionario F ON P.cpf = F.cpf_funcionario
INNER JOIN Operador O ON O.cpf_operador = F.cpf_funcionario
INNER JOIN Brinquedo B ON O.brinquedo = B.nome
WHERE B.nome = 'Trem Fantasma';

-- Retornar dados do Cliente que comprou seu ingresso com o maior desconto
SELECT P.nome as NOME, P.cpf AS CPF, C.metodo_pagamento AS MÉTODO, P.desconto AS DESCONTO_em_R$
FROM Pessoa P
INNER JOIN Cliente C ON P.cpf = C.cpf_cliente
INNER JOIN Bilheteria B ON C.cpf_cliente = B.cliente
INNER JOIN Promocao P ON B.promocao = P.codigo_promocao
WHERE P.desconto IN (SELECT MAX(desconto)
					 FROM Promocao);
                     
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
  (SELECT AVG(F.salario) FROM Funcionario F JOIN Atendente A ON F.cpf_funcionario = A.cpf_atendente) AS MEDIA_SALARIAL_ATENDENTES,
  (SELECT COUNT(cpf_atendente) FROM Atendente) AS QNT_ATENDENTES,
  (SELECT AVG(F.salario) FROM Funcionario F JOIN Operador O ON F.cpf_funcionario = O.cpf_operador) AS MEDIA_SALARIAL_OPERADORES,
  (SELECT COUNT(cpf_operador) FROM Operador) AS QNT_OPERADORES
FROM Funcionario;

-- COUNT --
-- Quantidade de vezes que um determinado brinquedo foi usado por um cliente
SELECT B.nome_brinquedo, COUNT(*)
FROM Brinca B
GROUP BY B.nome_brinquedo;

-- Quantidade de vezes que um determinado brinquedo foi usado por um dependente 
SELECT J.nome_brinquedo, COUNT(*)
FROM Joga J
GROUP BY J.nome_brinquedo;

-- Quantidade de números de telefone da cliente 'Júlia Pereira'
SELECT P.nome, COUNT (*) as QTD_de_telefones
FROM Telefone T, Pessoa P
WHERE P.cpf = T.cpf_pessoa AND P.nome = 'Júlia Pereira';

-- LEFT ou RIGHT ou FULL OUTER JOIN --
-- Enunciado: Retorne cpf dos funcionários e o cpf dos seus supervisores, mesmo os funcionários não tenham supervisor devem estar presentes na tabela, se houver supervisor sem supervisado, ele não aparecera na tabela.
SELECT F.cpf_funcionario AS CPF_FUNCIONARIO, S.cpf_funcionario as CPF_SUPERVISOR
FROM Funcionario F
LEFT OUTER JOIN Funcionario S ON F.cpf_supervisor = S.cpf_funcionario;

-- SUBCONSULTA COM OPERADOR RELACIONAL --
-- Enunciado:

-- SUBCONSULTA COM IN --
-- Retornar o nome dos funcionários que moram em Olinda ou Jaboatão dos Guararapes
SELECT P.nome
FROM Pessoa P
WHERE P.cpf IN (SELECT F.cpf_funcionario
				FROM Funcionario F
				INNER JOIN Endereco E ON F.cpf_funcionario = E.cpf_pessoa
				AND E.cidade IN ('Olinda','Jaboatão dos Guararapes'));

-- Retornar o nome dos clientes que foram no Samba ou no Thunder
SELECT P.nome
FROM Pessoa P
WHERE P.cpf IN (SELECT C.cpf_cliente
				FROM Cliente C
				INNER JOIN Brinca B ON C.cpf_cliente = B.cliente
				AND B.nome_brinquedo IN ('Samba', 'Thunder'));

-- SUBCONSULTA COM ANY --
-- Funcionários que recebem mais que 5500 reais
SELECT P.nome
FROM Pessoa P, Funcionario F
WHERE P.cpf = F.cpf_funcionario
AND F.salario > ANY (SELECT F.salario
						FROM Funcionario F
    					WHERE F.salario >= 5500);


-- Brinquedos com capacidade maior que 20
SELECT B.nome, B.capacidade
FROM Brinquedo B
WHERE B.capacidade >= ANY (SELECT B.capacidade
						  FROM Brinquedo B
						  WHERE B.capacidade > 20);



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
SELECT P.nome, 
(SELECT AVG(salario) FROM Funcionario) AS MEDIA_SALARIAL, F.salario AS SALARIO_ANTIGO, 
((SELECT AVG(salario) FROM Funcionario) - F.salario) AS VALOR_REAJUSTE, 
(F.salario + ((SELECT AVG(salario) FROM Funcionario) - F.salario)) AS NOVO_SALARIO
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

-- CREATE FUNCTION E CASE WHEN E EXCEPTION WHEN--
-- Enunciado: Calcular o quanto o cliente irá pagar pelo ingresso

CREATE OR REPLACE FUNCTION FINAL_TICKET_PAYMENT(
    seq_ingresso IN Ingresso.codigo_sequencia%TYPE,
    seq_pormocao IN Promocao.codigo_promocao%TYPE
) RETURN NUMBER

IS
	v_ingresso Ingresso.valor%TYPE;
	V_desconto_valor Promocao.desconto%TYPE;
	V_desconto_restricao Promocao.restricao%TYPE;
BEGIN
    SELECT Promocao.desconto, Promocao.restricao INTO V_desconto_valor, V_desconto_restricao 
    FROM Promocao
	WHERE seq_pormocao = Promocao.codigo_promocao;

    SELECT Ingresso.valor INTO v_ingresso 
    FROM Ingresso
	WHERE seq_ingresso = Ingresso.codigo_sequencia;

	DBMS_OUTPUT.PUT_LINE('Restricao: ' || V_desconto_restricao);
	return (1 - V_desconto_valor/100) * v_ingresso;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Restricao ou valor inválido');
	return 0;
END;


DECLARE
 valor NUMBER;

BEGIN 
	valor := FINAL_TICKET_PAYMENT(1, 1);
	case valor
    WHEN 0 THEN DBMS_OUTPUT.PUT_LINE('Valor a ser Pago: Não foi possível realizar esse cálculo');
	ELSE DBMS_OUTPUT.PUT_LINE('Valor a ser Pago: '||valor);
	END CASE;
END;

-- %TYPE --
-- Enunciado:

-- IF ELSIF --
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
