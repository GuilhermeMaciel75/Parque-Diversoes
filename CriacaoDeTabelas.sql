-- CRIAÇÃO DAS TABELAS --

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

DROP TABLE Pessoa;
DROP TABLE Endereco;
DROP TABLE Telefone;
DROP TABLE Cliente;
DROP TABLE Dependente;
DROP TABLE Funcionário;
DROP TABLE Operador;
DROP TABLE Atendente;
DROP TABLE Area;
DROP TABLE Brinquedo;
DROP TABLE Joga;
DROP TABLE Brinca;
DROP TABLE Ingresso;
DROP TABLE Promocao;
DROP TABLE Bilheteria;

-- PESSOA
CREATE TABLE Pessoa (
	cpf varchar2(14) NOT NULL,
	nome varchar2(25) NOT NULL,
	data_nascimento date NOT NULL,
	sexo char(1) NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (cpf)
);

-- ENDEREÇO
CREATE TABLE Endereco (
	cpf_pessoa
	cep varchar2(9) NOT NULL,
	numero number NOT NULL,
	rua varchar2(30) NOT NULL,
	bairro varchar2(25) NOT NULL,
	cidade varchar2(25) NOT NULL,
	estado char(2)
);

-- TELEFONE

-- CLIENTE

-- DEPENDENTE

-- FUNCIONÁRIO
CREATE TABLE Funcionário (
	cpf_funcionario varchar2(14) NOT NULL,
	salario number(5,2) NOT NULL,
	cpf_supervisor varchar2(14),
	CONSTRAINT funcionario_pkey PRIMARY KEY (cpf_funcionario),
	CONSTRAINT funcionario_fkey1 FOREIGN KEY (cpf_funcionario) REFERENCES Pessoa (cpf),
	CONSTRAINT funcionario_fkey2 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionário (cpf_funcionario)

);

-- OPERADOR

-- ATENDENTE

-- AREA

-- BRINQUEDO

-- JOGA
CREATE TABLE Joga (
	cliente varchar2(14) NOT NULL,
	nome_dependente varchar2(25) NOT NULL,
	nome_brinquedo varchar2(25) NOT NULL,
	CONSTRAINT joga_pkey PRIMARY KEY (cliente, nome_dependente, nome_brinquedo),
	CONSTRAINT joga_fkey1 FOREIGN KEY (cliente) REFERENCES Cliente (cpf_cliente),
	CONSTRAINT joga_fkey2 FOREIGN KEY (nome_dependente) REFERENCES Dependente (nome),
	CONSTRAINT joga_fkey3 FOREIGN KEY (nome_brinquedo) REFERENCES Brinquedo (nome)
);

-- BRINCA

-- INGRESSO

-- PROMOÇÃO

-- BILHETERIA