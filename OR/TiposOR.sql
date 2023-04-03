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
	estado CHAR(2),
	CONSTRUCTOR FUNCTION tp_endereco (SELF IN OUT NOCOPY tp_endereco, 
		cep VARCHAR2, 
		numero VARCHAR2, 
		rua VARCHAR2,
		bairro VARCHAR2, 
		cidade VARCHAR2,
		estado CHAR) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_endereco AS 
	CONSTRUCTOR FUNCTION tp_endereco (SELF IN OUT NOCOPY tp_endereco, 
		cep VARCHAR2, 
		numero VARCHAR2, 
		rua VARCHAR2, 
		bairro VARCHAR2, 
		cidade VARCHAR2, 
		estado CHAR) RETURN SELF AS RESULT IS 
		BEGIN 

			SELF.cep := cep;
			SELF.numero := numero;
			SELF.rua := rua;
			SELF.bairro := bairro;
			SELF.cidade := cidade;
			SELF.estado := estado;

		END;

END;
/

-- Telefone 
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
	numero_telefone VARCHAR2(20)
);
/

-- VARRAY DE TELEFONE
CREATE OR REPLACE TYPE tp_array_fones AS VARRAY(5) OF tp_telefone;
/

-- Pessoa
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
	cpf VARCHAR2(14),
	nome VARCHAR2(25),
	data_nascimento DATE,
	sexo CHAR(1),
	endereco tp_endereco,
	telefone tp_array_fones,

	MEMBER PROCEDURE exibirInformacoes(SELF tp_pessoa)

) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS 
	MEMBER PROCEDURE exibirInformacoes(SELF tp_pessoa) IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Informações de uma Pessoa');
		DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf);
		DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
		DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || data_nascimento);
		DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);

	END;
END;
/
-- Cliente 
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
	metodo_pagamento VARCHAR2(20)
);
/

-- Dependente
-- (Pode ser uma Nested Table(?))
CREATE OR REPLACE TYPE tp_dependente AS OBJECT ( 
	cpf_cliente REF tp_cliente, 
	nome VARCHAR2(25),
	data_nascimento DATE,
	sexo CHAR(1)
);
/
-- Funcionário 
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
	salario NUMBER(6,2),
	OVERRIDING MEMBER PROCEDURE exibirInformacoes(SELF tp_funcionario)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS 
	OVERRIDING MEMBER PROCEDURE exibirInformacoes(SELF tp_funcionario) IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Informações de uma Pessoa');
		DBMS_OUTPUT.PUT_LINE('CPF: ' || cpf);
		DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
		DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || data_nascimento);
		DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
		DBMS_OUTPUT.PUT_LINE('Salario: ' || salario);

	END;
END;
/

-- Área
CREATE OR REPLACE TYPE tp_area AS OBJECT (
	categoria VARCHAR2(25),
	quantidade_de_brinquedos NUMBER(2)
);
/ 

-- Brinquedo
CREATE OR REPLACE TYPE tp_brinquedo AS OBJECT (
	nome VARCHAR2(25),
    area REF tp_area,
    capacidade NUMBER(2),
    restricao_de_idade NUMBER(2),
    restricao_de_altura NUMBER(3,2) --Altura em metros
);
/

-- Operador 
CREATE OR REPLACE TYPE tp_operador UNDER tp_funcionario (
	brinquedo REF tp_brinquedo,
	cpf_supervisor REF tp_operador
);
/

-- Atendente
CREATE OR REPLACE TYPE tp_atendente UNDER tp_funcionario (
	banca VARCHAR2(25),
	cpf_supervisor REF tp_atendente
);
/

-- Joga 
CREATE OR REPLACE TYPE tp_joga AS OBJECT (
	cliente REF tp_cliente, 
	nome_dependente REF tp_dependente, -- ********* VAI SER ASSIM? ********* 
	nome_brinquedo REF tp_brinquedo
);
/

-- Brinca
CREATE OR REPLACE TYPE tp_brinca AS OBJECT (
	nome_brinquedo REF tp_brinquedo,
	cliente REF tp_cliente
);
/

-- Ingresso 
CREATE OR REPLACE TYPE tp_ingresso AS OBJECT (
	codigo_ingresso INTEGER,
	valor NUMBER(5,2)
);
/

-- Promoção 
CREATE OR REPLACE TYPE tp_promocao AS OBJECT (
	codigo_promocao INTEGER, --Tipo de promocao 
	desconto NUMBER(2), --Em porcentual
	restricao VARCHAR2(50),
	data_inicio DATE,
	data_termino DATE
);
/

-- Bilheteria 
CREATE OR REPLACE TYPE tp_bilheteria AS OBJECT (
	ingresso REF tp_ingresso,
	cliente REF tp_cliente,
	atendente REF tp_atendente,
	promocao REF tp_promocao,
	data_e_hora TIMESTAMP
);
/
