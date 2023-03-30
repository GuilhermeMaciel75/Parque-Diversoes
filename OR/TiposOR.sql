-- CRIAÇÃO DOS TIPOS

/*
CREATE [OR REPLACE] TYPE <nome do tipo> AS OBJECT (
	<lista de atributos> 
	<lista de métodos>
);

CREATE OR REPLACE TYPE tp_nome-do-tipo AS OBJECT(
	ATRIBUTOS
);
*/

/*
Tabelas:

Pessoa (1)
Endereço (2)
Telefone (3)
Cliente (4)
Dependente (5)
Funcionário (1)
Operador (2)
Atendente (3)
Área (4)
Brinquedo (5)
Joga (1)
Brinca (2)
Ingresso (3)
Promoção (4)
Bilheteria (5)

*/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cep VARCHAR2(9),
	numero NUMBER,
	rua VARCHAR2(30),
	bairro VARCHAR2(25),
	cidade VARCHAR2(25),
	estado CHAR(2)
	CONSTRUCTOR FUNCTION tp_endereco (SELF IN OUT NOCOPY tp_endereco, 
		cep VARCHAR2, 
		numero VARCHAR2, 
		rua VARCHAR2, 
		bairro VARCHAR2, 
		cidade VARCHAR2, 
		estado CHAR) RETURN SELF AS RESULT
	);

CREATE OR REPLACE TYPE BODY tp_endereco AS 
	CONSTRUCTOR FUNCTION tp_endereco (SELF IN OUT NOCOPY tp_endereco, 
		cep VARCHAR2, 
		numero VARCHAR2, 
		rua VARCHAR2, 
		bairro VARCHAR2, 
		cidade VARCHAR2, 
		estado CHAR) RETURN SELF AS RESULT IS 
		BEGIN 

			SELF.cep = cep;
			SELF.numero = numero;
			SELF.rua = rua;
			SELF.bairro = bairro;
			SELF.cidade = cidade;
			SELF.estado = estado;

		END;

END;


-- Telefone 
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
	numero_telefone VARCHAR2(20)
);

-- Pessoa
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
	cpf VARCHAR2(14),
	nome VARCHAR2(25),
	data_nascimento DATE,
	endereco tp_endereco,
	telefone tp_telefone
);

-- Cliente 
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
	metodo_pagamento VARCHAR2(20)
);

-- Dependente
CREATE OR REPLACE TYPE tp_dependente AS OBJECT (
	cpf_cliente RE
);

-- Funcionário 
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
	salario NUMBER(6,2),
	cpf_supervisor REF tp_pessoa
); NOT FINAL NOT INSTANTIABLE

-- Operador 
CREATE OR REPLACE TYPE tp_operador UNDER tp_funcionario (
	
);
-- Atendente
-- Área 
-- Brinquedo
-- Joga 
-- Brinca 
-- Ingresso 
-- Promoção 
-- Bilheteria 

/*

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
	id NUMBER,
	nome VARCHAR2(25),
	endereco tp_endereco
);

CREATE TEBLE tb_pessoa OF tp_pwsssoa (
	id PRIMARY KEY
);

INSERT INTO tb_pessoa VALUES tp_pessoa ();