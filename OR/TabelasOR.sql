-- CRIAÇÃO DE TABELAS

/*
CREATE TABLE <nome da tabela> OF <nome do tipo> (
	<lista de propriedades dos atributos>
);
*/
-- Pessoa
-- (Não vai ter tabela)

-- Endereço 
-- (Não vai ter tabela)**

-- Telefone 
-- (não vai ter tabela)** Vai ser varray

-- Cliente 
CREATE TABLE tb_cliente OF tp_cliente (
	cpf PRIMARY KEY,
	metodo_pagamento NOT NULL
);
/

-- Dependente
-- Nested Table

-- Funcionário 
-- (Não vai ter tabela)

-- Área
CREATE TABLE tb_area OF tp_area (
	categoria PRIMARY KEY,
	quantidade_de_brinquedos NOT NULL
); 
/

-- Brinquedo
CREATE TABLE tb_brinquedo OF tp_brinquedo (
	nome PRIMARY KEY,
    area SCOPE IS tb_area,
    capacidade NOT NULL,
    restricao_de_idade NOT NULL,
    restricao_de_altura NOT NULL
) NESTED TABLE dependentes STORE AS nt_dependentes;
/

-- Operador 
CREATE TABLE tb_operador OF tp_operador (
	cpf PRIMARY KEY,
	brinquedo WITH ROWID REFERENCES tb_brinquedo
);
/

-- Atendente
CREATE TABLE tb_atendente OF tp_atendente (
	cpf PRIMARY KEY,
	banca NOT NULL
);
/

-- Brinca
CREATE TABLE tb_brinca OF tp_brinca (
	nome_brinquedo WITH ROWID REFERENCES tb_brinquedo,
	cliente WITH ROWID REFERENCES tb_cliente
);
/

-- Ingresso 
CREATE TABLE tb_ingresso OF tp_ingresso (
	codigo_ingresso PRIMARY KEY,
	valor NOT NULL
);
/

-- Promoção 
CREATE TABLE tb_promocao OF tp_promocao (
	codigo_promocao PRIMARY KEY, 
	desconto NOT NULL,
	restricao NOT NULL,
	data_inicio NOT NULL,
	data_termino NOT NULL
);
/

-- Bilheteria 
CREATE TABLE tb_bilheteria OF tp_bilheteria (
	ingresso WITH ROWID REFERENCES tb_ingresso,
	cliente WITH ROWID REFERENCES tb_cliente,
	atendente WITH ROWID REFERENCES tb_atendente,
	promocao WITH ROWID REFERENCES tb_promocao,
	data_e_hora PRIMARY KEY
);
/
