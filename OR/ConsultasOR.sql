-- Consultas OR

/*
SELECT REF 
SELECT DEREF 
CONSULTA À VARRAY 
CONSULTA À NESTED TABLE
*/

-- SELECT REF


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

-- CONSULTA À VARRAY

-- Mostrar nome, cpf e telefones do "Atendente Chefe" (supervisor)
SELECT nome, cpf, T.* 
FROM tb_atendente A, TABLE(A.telefone) T 
WHERE cpf_supervisor IS NULL;

-- Mostra nome, cpf e estado dos clientes cujos números de telefone são de Pernambuco
SELECT c.nome, c.cpf, c.endereco.estado
FROM tb_cliente c, TABLE(c.telefone) T
WHERE REGEXP_LIKE(T.numero_telefone, '\+55 81');

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

