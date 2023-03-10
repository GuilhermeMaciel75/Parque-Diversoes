/*
    INSTRUÇÕES SQL
                    */


-- ALTER TABLE --
-- Enunciado: Adicione uma nova coluna na tabela de funcionarios, onde nela será armazenada se o funcionario está de ferias
ALTER TABLE Funcionario
ADD esta_de_ferias NUMBER(1)
DEFAULT 0 NOT NULL;

-- CREATE INDEX --
-- Enunciado: Criando um indice
CREATE INDEX indice
ON Pessoa (cpf);

-- INSERT INTO --
-- Enunciado: Adicione ao sistema um novo brinquedo que que foi construido recentemente
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Tapete Mágico','Familiar', 20, 8, 1.20);

-- UPDATE --
-- Enunciado: Muda o nome de Karen Cabral para Josuina Maria na tabela Pessoa
UPDATE Pessoa P
SET nome = 'Josuina Maria'
WHERE nome = 'Karen Cabral';

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
-- Enunciado: Seleciona o valor dos Ingressos cujos codigos estão entre 1 e 2
SELECT I.valor
FROM Ingresso I
WHERE I.codigo_sequencia BETWEEN 1 AND 2;


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
-- Enunciado: Seleciona o codigo dos ingressos de maior valor, ou seja, os mais caros
SELECT I.codigo_sequencia
FROM Ingresso I
WHERE I.valor = (SELECT MAX(valor) FROM Ingresso);

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
-- Enunciado: Seleciona o codigo dos ingressos cujos valores forem iguais ou maior do que 150
SELECT I.codigo_sequencia
FROM Ingresso I
WHERE I.valor = ANY(
    SELECT Ing.valor
    FROM Ingresso Ing
    WHERE Ing.valor >=150
    );

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
-- Enunciado: Criar um registro para Pessoa e insira a nova pessoa na tabela
DECLARE
   pessoa1 pessoa%ROWTYPE;
BEGIN
   pessoa1.cpf := '123.456.789-10';
   pessoa1.nome := 'Erlan Lira';
   pessoa1.data_nascimento := TO_DATE('01-01-1980', 'DD-MM-YYYY');
   pessoa1.sexo := 'M';
   
   INSERT INTO Pessoa VALUES pessoa1;
   
	DBMS_OUTPUT.PUT_LINE('CPF: ' || pessoa1.cpf);
  	DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoa1.nome);
	DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || pessoa1.data_nascimento);
  	DBMS_OUTPUT.PUT_LINE('Sexo: ' || pessoa1.sexo);
END;
/

-- USO DE ESTRUTURA DE DADOS DO TIPO TABLE --
-- Enunciado: Armazene em uma variável tabela, a quantidade de pessoas das seguintes tabelas (Pessoa. Cliente, Dependente, Funcionario, Operador, Atendente)
DECLARE
	TYPE Tabela_resultados IS RECORD(nome_categoria VARCHAR2(25), n_pessoas NUMBER);
    
    TYPE Tabela IS TABLE OF Tabela_resultados 
	INDEX BY BINARY_INTEGER;

	v_modelo Tabela;
	i INTEGER:= 1;
BEGIN

    v_modelo(1).nome_categoria := 'Pessoa';
	v_modelo(2).nome_categoria := 'Cliente';
    v_modelo(3).nome_categoria := 'Dependente';
    v_modelo(4).nome_categoria := 'Funcionario';
    v_modelo(5).nome_categoria := 'Operador';
    v_modelo(6).nome_categoria := 'Atendente';

	SELECT COUNT(*) INTO  v_modelo(1).n_pessoas FROM Pessoa;
	SELECT COUNT(*) INTO  v_modelo(2).n_pessoas FROM Cliente;	
	SELECT COUNT(*) INTO  v_modelo(3).n_pessoas FROM Dependente;
	SELECT COUNT(*) INTO  v_modelo(4).n_pessoas FROM Funcionario;
	SELECT COUNT(*) INTO  v_modelo(5).n_pessoas FROM Operador;
	SELECT COUNT(*) INTO  v_modelo(6).n_pessoas FROM Atendente;
   

   	WHILE i <= 6 LOOP
		DBMS_OUTPUT.PUT_LINE('Classe: ' ||  v_modelo(i).nome_categoria);	
		DBMS_OUTPUT.PUT_LINE('Número Pessoas: ' || v_modelo(i).n_pessoas);
    	i:= i+1;
    END LOOP;

END;

-- IF ELSIF --
-- Enunciado: Diz qual o papel do funcionário do parque com base em seu salário
CREATE OR REPLACE PROCEDURE InserirFuncao (
    p_cpf Pessoa.cpf%TYPE,
    p_salario Funcionario.salario%TYPE,
    p_banca Atendente.banca%TYPE,
    p_brinquedo Operador.brinquedo%TYPE
) IS
    BEGIN
        IF p_salario = 5000.00 OR p_salario = 4700.00 THEN
        	INSERT INTO Atendente (cpf_atendente, banca) VALUES (p_cpf, p_banca);
    	ELSIF p_salario = 6000.00 OR p_salario = 5500.00 THEN
            INSERT INTO Operador (cpf_operador, brinquedo) VALUES (p_cpf, p_brinquedo);
    	ELSE 
            DBMS_OUTPUT.PUT_LINE('Não é possível identificar a função desse funcionário com base no seu salário');
    	END IF;
END InserirFuncao;
/

-- CREATE PROCEDURE --
-- Enunciado: Criando um procedimento que insere um funcionario nas tabelas Pessoa, Funcionario e Endereco
CREATE OR REPLACE PROCEDURE InsereFuncionario (
    c_cpf Pessoa.cpf%TYPE,
    c_nome Pessoa.nome%TYPE,
    c_dataNascimento Pessoa.data_nascimento%TYPE,
    c_sexo Pessoa.sexo%TYPE,
    c_salario Funcionario.salario%TYPE,
    c_supervisor_cpf Funcionario.cpf_supervisor%TYPE,
    c_cep Endereco.cep%TYPE,
    c_numero Endereco.numero%TYPE,
    c_rua Endereco.rua%TYPE,
    c_bairro Endereco.bairro%TYPE,
    c_cidade Endereco.cidade%TYPE,
    c_estado Endereco.estado%TYPE,
    c_banca Atendente.banca%TYPE,
    c_brinquedo Operador.brinquedo%TYPE
) IS
	BEGIN
    	INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES (c_cpf, c_nome, c_dataNascimento, c_sexo);
		INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES (c_cpf, c_salario, c_supervisor_cpf);
		INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES (c_cpf, c_cep, c_numero, c_rua, c_bairro, c_cidade, c_estado);
        InserirFuncao(c_cpf, c_salario, c_banca, c_brinquedo);
END InsereFuncionario;
/

-- BLOCO ANÔNIMO --
-- Enunciado: Mostra que o procedimento InsereFuncionario está também chamando a tabela Atendente quando necessario
DECLARE
    teste_cpf Atendente.cpf_Atendente%TYPE;
BEGIN
    InsereFuncionario('760.403.486-15', 'Kauan Barros', to_date('03/04/1997', 'dd/mm/yy'), 'M', 5000.00, '200.200.200-20', '50980-410', 860, 'Rua Diogo de Vasconcelos', 'Várzea', 'Recife', 'PE', 'Banca D', NULL);

	SELECT A.cpf_atendente
    INTO teste_cpf
    FROM Atendente A
    WHERE A.cpf_atendente = '760.403.486-15';

	DBMS_OUTPUT.PUT_LINE(teste_cpf);
END;
/

-- SELECT … INTO e %TYPE--
-- Enunciado: Crie um procedimento que dado uma data de inicio e fim, retorne a quantidade de ingressos vendidos nesse periodo de tempo
CREATE OR REPLACE PROCEDURE TOTAL_INGRESSOS_VENDIDOS (
    data_inicial IN Bilheteria.data_e_hora%TYPE,
    data_final IN Bilheteria.data_e_hora%TYPE,
    TOTAL_VENDIDOS OUT INT
)
IS
BEGIN
    SELECT COUNT(*) INTO TOTAL_VENDIDOS
    FROM Bilheteria
    WHERE data_e_hora BETWEEN data_inicial AND data_final;
END;
/

DECLARE
    data_inicio TIMESTAMP := TO_TIMESTAMP('01/01/2012 01:00:00' , 'DD/MM/YYYY HH:MI:SS');
    data_final TIMESTAMP := TO_TIMESTAMP('12/12/2023 01:00:00', 'DD/MM/YYYY HH:MI:SS');
    total_vendidos INT;
BEGIN
    TOTAL_INGRESSOS_VENDIDOS(data_inicio, data_final, total_vendidos);
    DBMS_OUTPUT.PUT_LINE('Total de ingressos vendidos: ' || total_vendidos);
END;
/

-- LOOP EXIT WHEN --
-- Enunciado:

-- WHILE LOOP --
-- Enunciado: Crie um procedimento que imprima a quantidade de ingressos vendidos por um determinado preço (o qual será recebido como parâmetro)
CREATE OR REPLACE PROCEDURE ingressos_vendidos
(preco_analisado IN Ingresso.valor%type) IS
    valor Ingresso.valor%type;
    i INTEGER;
    n INTEGER;
	cont INTEGER;

BEGIN
    i := 1;
	cont := 0;

    SELECT COUNT(*) INTO n FROM Ingresso;
    WHILE i < n LOOP
        SELECT I.valor INTO valor
        FROM Ingresso I WHERE I.codigo_sequencia = i;
        IF valor = preco_analisado THEN
            cont := cont + 1;
        END IF;
        i := i + 1;
    END LOOP;
	dbms_output.put_line('A quantidade de ingressos com o valor ' || preco_analisado || ' é: ' || cont);
END;

EXECUTE ingressos_vendidos(200);

-- FOR IN LOOP --
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
