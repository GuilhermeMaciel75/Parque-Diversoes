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
DROP TABLE Funcionario;
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
	cpf VARCHAR2(14) NOT NULL,
	nome VARCHAR2(25) NOT NULL,
	data_nascimento DATE NOT NULL,
	sexo CHAR(1) NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (cpf)
);

-- ENDEREÇO
CREATE TABLE Endereco (
	cpf_pessoa VARCHAR2(14) NOT NULL,
	cep VARCHAR2(9) NOT NULL,
	numero NUMBER NOT NULL,
	rua VARCHAR2(30) NOT NULL,
	bairro VARCHAR2(25) NOT NULL,
	cidade VARCHAR2(25) NOT NULL,
	estado CHAR(2),
	CONSTRAINT endereco_pkey PRIMARY KEY (cpf_pessoa),
	CONSTRAINT endereco_fkey FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa (cpf)
);

-- TELEFONE
CREATE TABLE Telefone (
  cpf_pessoa VARCHAR2(14) NOT NULL,
  numero_telefone VARCHAR2(20) NOT NULL,
  CONSTRAINT telefone_pkey PRIMARY KEY (cpf_pessoa, numero_telefone),
  CONSTRAINT telefone_fkey FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa (cpf)
);

-- CLIENTE
CREATE TABLE Cliente (
  cpf_cliente VARCHAR2(14) NOT NULL,
  metodo_pagamento VARCHAR2(20) NOT NULL,
  CONSTRAINT cliente_pkey PRIMARY KEY (cpf_cliente),
  CONSTRAINT cliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES Pessoa (cpf)
);

-- DEPENDENTE
CREATE TABLE Dependente (
  cpf_cliente VARCHAR2(14) NOT NULL,
  nome VARCHAR2(25) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  CONSTRAINT dependente_pkey PRIMARY KEY (cpf_cliente, nome),
  CONSTRAINT dependente_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente (cpf_cliente)
);

-- FUNCIONÁRIO
CREATE TABLE Funcionario (
	cpf_funcionario VARCHAR2(14) NOT NULL,
	salario NUMBER(5,2) NOT NULL,
	cpf_supervisor VARCHAR2(14),
	CONSTRAINT funcionario_pkey PRIMARY KEY (cpf_funcionario),
	CONSTRAINT funcionario_fkey1 FOREIGN KEY (cpf_funcionario) REFERENCES Pessoa (cpf),
	CONSTRAINT funcionario_fkey2 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario (cpf_funcionario),
	CONSTRAINT funcionario_check CHECK (salario >= 1310.00) -- CLÁUSULA CHECK
);

-- OPERADOR

-- ATENDENTE

-- AREA
CREATE TABLE Area (
	categoria VARCHAR2(25) NOT NULL,
    quantidade_de_brinquedos NUMBER(2) NOT NULL,
    
    CONSTRAINT area_pkey PRIMARY KEY (categoria)
);

-- BRINQUEDO
CREATE TABLE Brinquedo (
	nome VARCHAR2(25) NOT NULL,
    area VARCHAR2(25) NOT NULL,
    capacidade NUMBER(2) NOT NULL,
    restricao_de_idade NUMBER(2) NOT NULL,
    restricao_de_altura NUMBER(3,2) NOT NULL,
    
    CONSTRAINT brinquedo_pkey PRIMARY KEY (nome),
    CONSTRAINT area_fkey FOREIGN KEY (area) REFERENCES Area (categoria)
);

-- JOGA
CREATE TABLE Joga (
	cliente VARCHAR2(14) NOT NULL,
	nome_dependente VARCHAR2(25) NOT NULL,
	nome_brinquedo VARCHAR2(25) NOT NULL,
	CONSTRAINT joga_pkey PRIMARY KEY (cliente, nome_dependente, nome_brinquedo),
	CONSTRAINT joga_fkey1 FOREIGN KEY (cliente) REFERENCES Cliente (cpf_cliente),
	CONSTRAINT joga_fkey2 FOREIGN KEY (nome_dependente) REFERENCES Dependente (nome),
	CONSTRAINT joga_fkey3 FOREIGN KEY (nome_brinquedo) REFERENCES Brinquedo (nome)
);

-- BRINCA

-- INGRESSO
CREATE TABLE Ingresso (
	codigo NUMBER(3) NOT NULL,
	valor NUMBER(3,2) NOT NULL,
	CONSTRAINT ingresso_pkey PRIMARY KEY (codigo),
);

-- PROMOÇÃO
CREATE TABLE Promocao (
	codigo_promocao NUMBER(3) NOT NULL,
	desconto NUMBER(2) NOT NULL,
	restricao char(1) NOT NULL, -- S (Sim) / N(Não)??
	data_inicio DATE NOT NULL,
	data_termino DATE NOT NULL,

	CONSTRAINT promocao_pkey PRIMARY KEY(codigo_promocao)

);

-- BILHETERIA
CREATE TABLE Bilheteria (
	ingresso NUMBER(3) NOT NULL,
	cliente VARCHAR2(14) NOT NULL,
	atendete VARCHAR2(14) NOT NULL,
	promocao NUMBER(3) NOT NULL,
	data_e_hora TIMESTAMP NOT NULL,


	CONSTRAINT bilheteria_pkey PRIMARY KEY (ingresso, data_e_hora),
	CONSTRAINT bilheteria_fkey1 FOREIGN KEY (ingresso) REFERENCES Ingresso (codigo)
	CONSTRAINT bilheteria_fkey2 FOREIGN KEY (cliente) REFERENCES Cliente (cpf_cliente),
	CONSTRAINT bilheteria_fkey3 FOREIGN KEY (atendete) REFERENCES Atendente (cpf_atendente),
	CONSTRAINT bilheteria_fkey4 FOREIGN KEY (promocao) REFERENCES Promocao (codigo)
);
