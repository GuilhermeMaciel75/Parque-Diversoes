-- Consultas OR

/*
SELECT REF 
SELECT DEREF 
CONSULTA À VARRAY 
CONSULTA À NESTED TABLE
*/

-- Selecionar alguns dados dos atendentes
SELECT nome AS Nome, cpf AS CPF, A.endereco.rua AS Rua, A.endereco.numero AS Número, 
A.endereco.bairro AS Bairro, A.endereco.cidade AS Cidade, A.endereco.estado AS Estado
FROM tb_atendente A;
/

-- Contar quantos clientes brincam em cada brinquedo
SELECT (B.nome_brinquedo).nome, COUNT((B.cliente).nome)
FROM tb_brinca B
GROUP BY B.nome_brinquedo;
/

-- Contar quantos brinquedos cada cliente brinca
SELECT (B.cliente).nome, COUNT((B.nome_brinquedo).nome)
FROM tb_brinca B
GROUP BY (B.cliente).nome;
/

-- SELECT DEREF
-- Selecionar os clientes que foram no Trem Fantasma
SELECT C.nome AS Nome
FROM tb_brinca B, tb_cliente C
WHERE DEREF(B.cliente).cpf = C.cpf AND
DEREF(B.nome_brinquedo).nome = 'Trem Fantasma';
/

-- O preço do ingresso comprado com 'Desconto de Aniversário'
SELECT DEREF(B.ingresso).valor - DEREF(B.promocao).desconto AS Valor
FROM tb_bilheteria B 
WHERE DEREF(B.promocao).restricao = 'Desconto Aniversário';
/

-- Verifica quantos clientes burlaram a restrição de idade de um brinquedo
SELECT DEREF(b.nome_brinquedo).nome, COUNT(*)
FROM tb_brinca b
WHERE DEREF(b.nome_brinquedo).restricao_de_idade > SOME(SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, DEREF(b.cliente).data_nascimento)/12) FROM dual)
GROUP BY DEREF(b.nome_brinquedo).nome;
/

-- Pegar nomes e endereços dos operadores de brinquedos aquáticos
SELECT nome, O.endereco.rua AS Rua, O.endereco.numero AS Número, 
O.endereco.bairro AS Bairro, O.endereco.cidade AS Cidade, O.endereco.estado AS Estado
FROM tb_operador O
WHERE DEREF(DEREF(O.brinquedo).area).categoria = 'Aquatico';
/

-- Nomes e CPF dos clientes atendidos pelo atendente da Banca A
SELECT DEREF(B.cliente).nome AS Nome, DEREF(B.cliente).cpf AS CPF
FROM tb_bilheteria B
WHERE DEREF(B.atendente).banca = 'Banca A';
/


-- Retorna o cliente mais antigo, seu nome, CPF e quantidade de ingressos comprados 
SELECT DEREF(B.cliente).nome, DEREF(B.cliente).cpf, COUNT(*) AS num_ingressos_comprados
FROM tb_bilheteria B
WHERE B.data_e_hora = (SELECT MIN(data_e_hora) FROM tb_bilheteria)
GROUP BY DEREF(B.cliente).nome, DEREF(B.cliente).cpf, DEREF(B.promocao);
/

-- CONSULTA À VARRAY

-- Mostrar nome, cpf e telefones do "Atendente Chefe" (supervisor)
SELECT nome, cpf, T.* 
FROM tb_atendente A, TABLE(A.telefone) T 
WHERE cpf_supervisor IS NULL;
/

-- Mostra nome, cpf e estado dos clientes cujos números de telefone são de Pernambuco
SELECT c.nome, c.cpf, c.endereco.estado
FROM tb_cliente c, TABLE(c.telefone) T
WHERE REGEXP_LIKE(T.numero_telefone, '\+55 81');
/

-- Mostra os telefones dos operadores que trabalham na área aquatica do parque, com o nome de seus respectivos donos 
SELECT O.nome, T.* 
FROM tb_operador O, TABLE(O.telefone) T
WHERE O.brinquedo.area.categoria = 'Aquatico';
/

-- Mostra a quantidade total de numeros de telefone dos operadores da área aquática
DECLARE
	QT_SPLASH NUMBER(1);
	QT_TCHIBUM NUMBER(1);
	RESULTADO NUMBER(2);
BEGIN
    SELECT COUNT(*) INTO QT_SPLASH
        FROM tb_operador O, TABLE(O.telefone) T
        WHERE O.brinquedo.nome = 'Splash';

	SELECT COUNT(*) INTO QT_TCHIBUM
        FROM tb_operador O, TABLE(O.telefone) T
        WHERE O.brinquedo.nome = 'Tchibum';

	RESULTADO := QT_SPLASH + QT_TCHIBUM;

	DBMS_OUTPUT.PUT_LINE('A quantidade total de telefones dos operadores na área quática é: ' || RESULTADO);
	DBMS_OUTPUT.PUT_LINE('Sendo ' || QT_SPLASH || ' do operador do Splash e ' || QT_TCHIBUM || ' do operador do Tchibum');
    
END;
/

-- CONSULTA À NESTED TABLE 

-- Consultar os nomes dos dependentes que foram no Carrocel
SELECT nome FROM TABLE(SELECT B.dependentes FROM tb_brinquedo B WHERE nome = 'Carrocel');
/

--Retorne a quantidade e a idade média dos dependentes de clientes que frequentam o parque e brincam no carrosel
SELECT COUNT(*) AS QTD_DEPENDENTES ,AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, D.data_nascimento)/12)) AS IDADE_MEDIA FROM TABLE (
    SELECT B.dependentes FROM tb_brinquedo B
    WHERE B.nome = 'Carrocel'
) D;
/

-- Contar a quantidade de dependentes por brinquedo
SELECT B.nome, COUNT(*)
FROM tb_brinquedo B, TABLE(SELECT B1.dependentes FROM tb_brinquedo B1 WHERE B1.nome = B.nome)
GROUP BY B.nome;
/

--Exiba as informações de todos os Funcionários do parque
DECLARE 
    CURSOR C_INFO IS
    SELECT VALUE(O) FROM tb_operador O;

	 CURSOR C_INFO2 IS
    SELECT VALUE(A) FROM tb_atendente A;

    V_operador tp_operador;
	V_atendente tp_atendente;
BEGIN
    OPEN C_INFO;
	DBMS_OUTPUT.PUT_LINE('Informações Sobre os Operadores' || CHR(10));
    LOOP
        FETCH C_INFO INTO V_operador;
        EXIT WHEN C_INFO%NOTFOUND;
        V_operador.EXIBIRINFORMACOES();
		DBMS_OUTPUT.PUT_LINE(CHR(10));
        
    END LOOP;
	CLOSE C_INFO;

	OPEN C_INFO2;
	DBMS_OUTPUT.PUT_LINE('Informações Sobre os Atendentes' || CHR(10));
    LOOP
        FETCH C_INFO2 INTO V_atendente;
        EXIT WHEN C_INFO2%NOTFOUND;
        V_atendente.EXIBIRINFORMACOES();
		DBMS_OUTPUT.PUT_LINE(CHR(10));
        
    END LOOP;
	CLOSE C_INFO2;
END;
/

--Retorne o CPF do cliente, bem como o valor do ingresso, a porcentagem a ser paga, e o valor efetivamente pago por cada ingresso
SELECT DEREF(B.cliente).cpf as CPF_CLIENTE,
    DEREF(B.ingresso).valor AS VALOR_INGRESSO, 
    DEREF(B.promocao).descontoPorc() AS VALOR_DESCONTO,
    DEREF(B.ingresso).valor * DEREF(B.promocao).descontoPorc() AS VALOR_PAGO
    FROM tb_bilheteria B
/

