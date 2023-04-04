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
CREATE OR REPLACE TYPE tp_dependente AS OBJECT ( 
	cliente REF tp_cliente,
	nome VARCHAR2(25),
	data_nascimento DATE,
	sexo CHAR(1)
);
/

-- Nested Table
CREATE OR REPLACE TYPE tp_nt_dependentes AS TABLE OF tp_dependente;
/

-- Funcionário 
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
	salario NUMBER(6,2),
	OVERRIDING MEMBER PROCEDURE exibirInformacoes(SELF tp_funcionario),
	MEMBER FUNCTION salarioBonusNatal RETURN NUMBER
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

	MEMBER FUNCTION salarioBonusNatal RETURN NUMBER IS --Todos os funcionários recebem um bónus de 20% no salário no natal
	BEGIN
		RETURN Salario * 1.2;
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
    	restricao_de_altura NUMBER(3,2), --Altura em metros
    	dependentes tp_nt_dependentes,

	FINAL ORDER MEMBER FUNCTION comparaQtd(B tp_brinquedo) RETURN INTEGER
);
/

CREATE OR REPLACE TYPE BODY tp_brinquedo AS 
	FINAL ORDER MEMBER FUNCTION comparaQtd(B tp_brinquedo) RETURN INTEGER IS
	BEGIN
		RETURN SELF.capacidade - B.capacidade;
	END;
END;
/

-- Operador 
CREATE OR REPLACE TYPE tp_operador UNDER tp_funcionario (
	brinquedo REF tp_brinquedo
);
/

ALTER TYPE tp_operador 
ADD ATTRIBUTE (cpf_supervisor REF tp_operador)
CASCADE;

-- Atendente
CREATE OR REPLACE TYPE tp_atendente UNDER tp_funcionario (
	banca VARCHAR2(25)
);
/

ALTER TYPE tp_atendente 
ADD ATTRIBUTE (cpf_supervisor REF tp_atendente)
CASCADE;

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
	data_termino DATE,

	MAP MEMBER FUNCTION descontoPorc RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_promocao AS
	MAP MEMBER FUNCTION descontoPorc RETURN NUMBER IS
		p NUMBER(3,2) := 1 - desconto/100;
	BEGIN
		RETURN p;
	END;
END;
/

-- Bilheteria 
CREATE OR REPLACE TYPE tp_bilheteria AS OBJECT (
	ingresso REF tp_ingresso,
	cliente REF tp_cliente,
	atendente REF tp_atendente,
	promocao REF tp_promocao,
	data_e_hora TIMESTAMP,

	CONSTRUCTOR FUNCTION tp_bilheteria (SELF IN OUT NOCOPY tp_bilheteria, 
		ingresso REF tp_ingresso, 
		cliente REF tp_cliente, 
		atendente REF tp_atendente,
		promocao REF tp_promocao, 
		data_e_hora TIMESTAMP) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_bilheteria AS 

	CONSTRUCTOR FUNCTION tp_bilheteria (SELF IN OUT NOCOPY tp_bilheteria, 
		ingresso REF tp_ingresso, 
		cliente REF tp_cliente, 
		atendente REF tp_atendente,
		promocao REF tp_promocao, 
		data_e_hora TIMESTAMP) RETURN SELF AS RESULT IS

	BEGIN 

		SELF.ingresso := ingresso;
		SELF.cliente := cliente;
		SELF.atendente := atendente;
		SELF.promocao := promocao;
		SELF.data_e_hora := data_e_hora;

	END;
END;
/
