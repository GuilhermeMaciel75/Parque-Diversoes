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


-- O preço do ingresso comprado com 'Desconto de Aniversário'
SELECT DEREF(B.ingresso).valor - DEREF(B.promocao).desconto AS Valor
FROM tb_bilheteria B 
WHERE DEREF(B.promocao).restricao = 'Desconto Aniversário';

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

--Retorne a quantidade e a idade média dos dependentes de clientes que frequentam o parque e brincam no carrosel
SELECT COUNT(*) AS QTD_DEPENDENTES ,AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, D.data_nascimento)/12)) AS IDADE_MEDIA FROM TABLE (
    SELECT B.dependentes FROM tb_brinquedo B
    WHERE B.nome = 'Carrocel'
) D;

