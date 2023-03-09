-- POVOAMENTO

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

--Povoando Pessoa

-- Clientes
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('999.999.999-99', 'Jubileu Amorim', to_date('14/03/1992', 'dd/mm/yy'), 'M'); 
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('888.888.888-88', 'Adalto Joaquim', to_date('20/09/1988', 'dd/mm/yy'), 'M'); 
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('777.777.777-77', 'Maria Joaquina', to_date('27/04/2000', 'dd/mm/yy'), 'F'); 
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('666.666.666-66', 'Ana Vitória', to_date('15/11/1997', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('555.555.555-55', 'Júlia Pereira', to_date('28/05/1999', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('444.444.444-44', 'Luís Amilton', to_date('07/01/1985', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('333.333.333-33', 'Karen Cabral', to_date('25/08/1980', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('222.222.222-22', 'Abelardo Barbosa', to_date('30/09/1977', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('111.111.111-11', 'Joel Müller', to_date('26/09/1967', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('100.100.100-10', 'Carla Ramos', to_date('03/12/2001', 'dd/mm/yy'), 'F');

-- Atendentes
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('200.200.200-20', 'Leonardo Lopes', to_date('29/02/1996', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('300.300.300-30', 'Leônidas Silva', to_date('09/03/1980', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('400.400.400-40', 'Helena Souza', to_date('02/10/1988', 'dd/mm/yy'), 'F');

-- Operadores 
-- Radicais
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('500.500.500-50', 'Juma Marruá', to_date('23/06/1990', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('600.600.600-60', 'José Leôncio', to_date('01/07/1972', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('700.700.700-70', 'Tereza Soares', to_date('31/01/1982','dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('800.800.800-80', 'Clara Nascimento', to_date('28/10/1979', 'dd/mm/yy'), 'F');
-- Aquáticos
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('900.900.900-90', 'Jaime Almeida', to_date('21/08/1991', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('101.101.101-01', 'Charles Xavier', to_date('13/05/1987', 'dd/mm/yy'), 'M');
-- Terror
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('202.202.202-02', 'Ana Nóbrega', to_date('25/12/1984', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('303.303.303-03', 'Marcos Antônio', to_date('07/02/1988', 'dd/mm/yy'), 'M');
-- Infantil
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('404.404.404-04', 'Luiza Texeira', to_date('24/11/1983', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('505.505.505-05', 'Rafael Martins', to_date('07/10/1985', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('606.606.606-06', 'Angélica Moraes', to_date('20/02/1989', 'dd/mm/yy'), 'F');
-- Familiar
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('707.707.707-07', 'Horácio Espíndola', to_date('09/06/1970', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('808.808.808-08', 'Solange Aguiar', to_date('28/12/1984', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('909.909.909-09', 'Fátima Alves', to_date('13/05/1980', 'dd/mm/yy'), 'F');

-- Povoando Endereço
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('999.999.999-99', '99999-999', 128, 'Rua do Espinheiro', 'Espinheiro', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('888.888.888-88', '88888-888', 13, 'Estrada dos Viajantes', 'Goiabeiras', 'Vitória', 'ES');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('777.777.777-77', '77777-777', 55, 'Avenida 1º de Maio', 'Ponta Verde', 'Maceió', 'AL');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('666.666.666-66', '66666-666', 23, 'Rua Açai', 'Castanheira', 'Boa Vista', 'RO');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('555.555.555-55', '55555-555', 88, 'Rua do Sol', 'São Marcos', 'São Luís', 'MA');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('444.444.444-44', '44444-444', 1042, 'Avenida Almirante', 'Coqueiros', 'Florianópolis', 'SC');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('333.333.333-33', '33333-333', 102, 'Rua Paysandu', 'Cidade Velha', 'Belém', 'PA');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('222.222.222-22', '22222-222', 10, 'Avenida Pantanal', 'Amambaí', 'Campo Grande', 'MS');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('111.111.111-11', '11111-111', 111, 'Avenida Santa Catarina', 'Água Verde', 'Blumenau', 'SC');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('100.100.100-10', '10010-010', 84, 'Rua Chico Anysio', 'Aldeota', 'Fortaleza', 'CE');

INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('200.200.200-20', '20020-020', 99, 'Rua do Futuro', 'Iputinga', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('300.300.300-30', '30030-030', 300, 'Estrada da Batalha', 'Prazeres', 'Jaboatão dos Guararapes', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('400.400.400-40', '40040-040', 40, 'Avenida Caxangá', 'Cordeiro', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('500.500.500-50', '50050-050', 121, 'Avenida Central', 'Afogados', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('600.600.600-60', '60060-060', 67, 'Rua da Praia', 'Pilar', 'Ilha de Itamaracá', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('700.700.700-70', '70070-070', 31, 'Avenida Luiz Gonzaga', 'Bela Vista', 'Moreno', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('800.800.800-80', '80080-080', 101, 'Estrada Nova', 'São Francisco', 'Cabo de Santo Agostinho', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('900.900.900-90', '90090-090', 72, 'Rua do Navio', 'Piedade', 'Jaboatão dos Guararapes', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('101.101.101-01', '10110-101', 2034, 'Rua dos Girassóis', 'Centro', 'Camaragibe', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('202.202.202-02', '20220-202', 27, 'Rua Machado de Assis', 'Madalena', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('303.303.303-03', '30330-303', 99, 'Estrada da Glória', 'Campo Grande', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('404.404.404-04', '40440-404', 38, 'Avenida Ipiranga', 'Casa Amarela', 'Recife', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('505.505.505-05', '50550-505', 341, 'Rua do Beija-flor', 'Rio Doce', 'Olinda', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('606.606.606-06', '60660-606', 29, 'Rua Capibaribe', 'Jardim Atlântico', 'Olinda', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('707.707.707-07', '70770-707', 97, 'Rua Almirante', 'Centro', 'São Lourenço da Mata', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('808.808.808-08', '80880-808', 126, 'Estrada dos Alfaiates', 'Caetés I', 'Abreu e Lima', 'PE');
INSERT INTO Endereco (cpf_pessoa, cep, numero, rua, bairro, cidade, estado) VALUES ('909.909.909-09', '90990-909', 202, 'Avenida dos Poetas', 'Várzea', 'Recife', 'PE');

--Povoando Telefone
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('999.999.999-99', '+55 81 99902 2762');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('999.999.999-99', '+55 81 98417 1256');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('999.999.999-99', '+55 81 98284 5843');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('888.888.888-88', '+55 27 98431 0816');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('888.888.888-88', '+55 27 98741 2487');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('777.777.777-77', '+55 82 99768 8281');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('666.666.666-66', '+55 69 96765 2831');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('666.666.666-66', '+55 69 99991 2587');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('555.555.555-55', '+55 98 99680 1715');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('555.555.555-55', '+55 98 99787 1785');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('555.555.555-55', '+55 98 99177 9686');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('555.555.555-55', '+55 98 97994 2094');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('444.444.444-44', '+55 49 98526 2678');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('444.444.444-44', '+1 408 987 4345');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('333.333.333-33', '+55 91 99547 0563');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('333.333.333-33', '+54 9 432 929 1497');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('333.333.333-33', '+54 9 532 999 9915');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('222.222.222-22', '+55 67 96917 4131');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('111.111.111-11', '+55 49 98234 8053');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('100.100.100-10', '+55 85 98570 7654');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('200.200.200-20', '+55 12 97288 8966');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('200.200.200-20', '+1 678 799 3007');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('300.300.300-30', '+55 91 96869 7810');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('400.400.400-40', '+55 71 98379 5684');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('500.500.500-50', '+55 22 99184 4150');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('600.600.600-60', '+55 84 99747 6532');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('600.600.600-60', '+1 408 788 3477');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('700.700.700-70', '+55 92 99957 0516');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('800.800.800-80', '+55 79 98230 6697');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('900.900.900-90', '+55 86 96947 4295');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('101.101.101-01', '+55 31 98050 6343');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('101.101.101-01', '+55 31 99631 3695');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('202.202.202-02', '+55 98 99284 3640');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('303.303.303-03', '+55 85 97250 2315');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('404.404.404-04', '+55 81 97954 0000');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('505.505.505-05', '+55 81 98787 0808');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('606.606.606-06', '+55 81 98090 7040');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('707.707.707-07', '+55 81 95455 5675');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('707.707.707-07', '+55 81 94345 7809');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('808.808.808-08', '+55 81 97050 0101');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('909.909.909-09', '+55 81 92109 6700');

--Povoando Cliente
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('999.999.999-99', 'Cartao de Credito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('888.888.888-88', 'Cartao de Debito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('777.777.777-77', 'Cartao de Debito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('666.666.666-66', 'Cartao de Credito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('555.555.555-55', 'Pix');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('444.444.444-44', 'Pix');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('333.333.333-33', 'Cartao de Debito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('222.222.222-22', 'Cartao de Credito');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('111.111.111-11', 'Dinheiro');
INSERT INTO Cliente (cpf_cliente, metodo_pagamento) VALUES ('100.100.100-10', 'Cartao de Debito');

--Povoando Dependente
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('999.999.999-99', 'Pietir Pires', to_date('27/08/2010', 'dd/mm/yy'), 'F');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('999.999.999-99', 'Raiane Pinheiro', to_date('07/03/2008', 'dd/mm/yy'), 'F');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('999.999.999-99', 'Geneval Silvino', to_date('11/01/2012', 'dd/mm/yy'), 'M');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('777.777.777-77', 'Telma Cordeiro', to_date('01/11/2012', 'dd/mm/yy'), 'F');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('777.777.777-77', 'Rosane Vaz', to_date('18/12/2009', 'dd/mm/yy'), 'F');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('444.444.444-44', 'Rone Gadelha', to_date('22/02/2010', 'dd/mm/yy'), 'M');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('222.222.222-22', 'Guilherme Araujo', to_date('12/06/2009', 'dd/mm/yy'), 'M');
INSERT INTO Dependente (cpf_cliente, nome, data_nascimento, sexo) VALUES ('100.100.100-10', 'Nicollas Eger', to_date('14/09/2008', 'dd/mm/yy'), 'M');

-- Povoando Funcionário 
-- Atendentes
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('200.200.200-20', 5000.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('300.300.300-30', 4700.00, '200.200.200-20');
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('400.400.400-40', 4700.00, '200.200.200-20');
-- Operadores
-- Brinquedos Radicais
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('500.500.500-50', 6000.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('600.600.600-60', 5500.00, '500.500.500-50');
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('700.700.700-70', 5500.00, '500.500.500-50');
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('800.800.800-80', 5500.00, '500.500.500-50');
-- Brinquedos Aquáticos
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('900.900.900-90', 5500.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('101.101.101-01', 5500.00, '900.900.900-90');
-- Brinquedos Terror 
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('202.202.202-02', 6000.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('303.303.303-03', 5500.00, '202.202.202-02');
-- Brinquedos Infantis
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('404.404.404-04', 6000.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('505.505.505-05', 5500.00, '404.404.404-04');
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('606.606.606-06', 5500.00, '404.404.404-04');
-- Brinquedos Familiares 
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('707.707.707-07', 6000.00, NULL);
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('808.808.808-08', 5500.00, '707.707.707-07');
INSERT INTO Funcionario (cpf_funcionario, salario, cpf_supervisor) VALUES ('909.909.909-09', 5500.00, '707.707.707-07');

--Povoando Atendente
INSERT INTO Atendente (cpf_atendente, banca) VALUES ('200.200.200-20', 'Banca A');
INSERT INTO Atendente (cpf_atendente, banca) VALUES ('300.300.300-30', 'Banca B');
INSERT INTO Atendente (cpf_atendente, banca) VALUES ('400.400.400-40', 'Banca C');

--Povoando Area
INSERT INTO Area (categoria, quantidade_de_brinquedos) VALUES ('Radical', 4); 
INSERT INTO Area (categoria, quantidade_de_brinquedos) VALUES ('Aquatico', 2); 
INSERT INTO Area (categoria, quantidade_de_brinquedos) VALUES ('Aterrorizante', 2); 
INSERT INTO Area (categoria, quantidade_de_brinquedos) VALUES ('Infantil', 3); 
INSERT INTO Area (categoria, quantidade_de_brinquedos) VALUES ('Familiar', 3);

--Povoando Brinquedo
-- Radicais
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Super Tornado','Radical', 30, 12, 1.35);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Thunder','Radical', 35, 12, 1.30);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Over Loop','Radical', 25, 12, 1.35);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Samba','Radical', 25, 12, 1.30);
-- Aquáticos
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Splash','Aquatico', 5, 6, 1.00);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Tchibum','Aquatico', 5, 10, 1.25);
-- Terror
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Mansao do Terror','Aterrorizante', 10, 12, 1.30);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Trem Fantasma','Aterrorizante', 2, 8, 1.20);
-- Infantil
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Carrocel','Infantil', 15, 3, 0.85);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Trampolim','Infantil', 15, 3, 0.85);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Trenzinho','Infantil', 25, 3, 0.85); 
-- Familiar
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Roda Gigante','Familiar', 40, 6, 1.00);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Barca','Familiar', 30, 6, 1.00);
INSERT INTO Brinquedo (nome, area, capacidade, restricao_de_idade, restricao_de_altura) VALUES ('Ciclone','Familiar', 8, 8, 1.20); 

--Povoando Operador
    --Radicais
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('500.500.500-50', 'Super Tornado');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('600.600.600-60', 'Thunder');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('700.700.700-70', 'Over Loop');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('800.800.800-80', 'Samba');
    --Aquáticos
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('900.900.900-90', 'Splash');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('101.101.101-01', 'Tchibum');
    --Terror
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('202.202.202-02', 'Mansao do Terror');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('303.303.303-03', 'Trem Fantasma');
    --Infantil
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('404.404.404-04', 'Carrocel');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('505.505.505-05', 'Trampolim');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('606.606.606-06', 'Trenzinho');
    --Familiar
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('707.707.707-07', 'Roda Gigante');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('808.808.808-08', 'Barca');
INSERT INTO Operador (cpf_operador, brinquedo) VALUES ('909.909.909-09', 'Ciclone');

-- Povoando Joga
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('999.999.999-99', 'Pietir Pires', 'Carrocel');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('999.999.999-99', 'Raiane Pinheiro', 'Trampolim');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('999.999.999-99', 'Geneval Silvino','Carrocel');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('777.777.777-77', 'Telma Cordeiro', 'Trenzinho');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('777.777.777-77', 'Rosane Vaz', 'Roda Gigante');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('444.444.444-44', 'Rone Gadelha', 'Trenzinho');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('222.222.222-22', 'Guilherme Araujo', 'Carrocel');
INSERT INTO Joga (cliente, nome_dependente, nome_brinquedo) VALUES ('100.100.100-10', 'Nicollas Eger', 'Barca');

--Povoando Brinca
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Super Tornado',  '999.999.999-99');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Mansao do Terror', '100.100.100-10');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Thunder', '888.888.888-88');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Thunder', '111.111.111-11');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Tchibum', '333.333.333-33');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Barca', '100.100.100-10');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Mansao do Terror', '666.666.666-66');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Over Loop', '444.444.444-44');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Splash', '555.555.555-55');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Roda Gigante', '222.222.222-22');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Ciclone', '444.444.444-44');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Trem Fantasma', '888.888.888-88');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Roda Gigante', '777.777.777-77');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Samba', '999.999.999-99');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Trem Fantasma', '111.111.111-11');
INSERT INTO Brinca (nome_brinquedo, cliente) VALUES ('Samba', '222.222.222-22');

--Povoamento Ingresso
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 110.00);
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 150.00); 
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 200.00); 
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 110.00);
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 150.00); 
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 200.00); 
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 110.00);
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 150.00); 
INSERT INTO Ingresso (codigo_sequencia, valor) VALUES (codigo_sequencia.nextval, 200.00); 

---Povoamento Promocao
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 10, 'Pagamento em Dinheiro ou PIX', to_date('02/03/2023', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy'));
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 40, 'Desconto Funcionário',  to_date('01/01/2023', 'dd/mm/yy'),  to_date('01/01/2024', 'dd/mm/yy'));
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 50, 'Desconto estudante, professor, idoso',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy'));
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 60, 'Desconto Aniversário',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy'));
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 70, 'Sem acesso aos brinquedos do parque',  to_date('13/07/2012', 'dd/mm/yy'),  to_date('31/12/2026', 'dd/mm/yy'));
INSERT INTO Promocao (codigo_promocao, desconto, restricao, data_inicio, data_termino) VALUES (codigo_promocao.nextval, 0, 'Sem Promocçao',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy'));

--Povoamento Bilheteria
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(1, '666.666.666-66', '300.300.300-30', 6, to_timestamp('03/03/2023 02:35:18', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(2, '222.222.222-22', '300.300.300-30', 5, to_timestamp('03/03/2023 04:05:44', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(3, '111.111.111-11', '300.300.300-30', 3, to_timestamp('03/03/2023 11:56:02', 'DD/MM/YYYY HH:MI:SS'));

INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(4, '777.777.777-77', '400.400.400-40', 4, to_timestamp('27/04/2022 10:32:57', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(5, '333.333.333-33', '400.400.400-40', 2, to_timestamp('02/01/2023 08:15:33', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(6, '444.444.444-44', '400.400.400-40', 1, to_timestamp('13/07/2012 05:22:41', 'DD/MM/YYYY HH:MI:SS'));

INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(7, '999.999.999-99', '200.200.200-20', 6, to_timestamp('22/12/2013 09:05:59', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(8, '555.555.555-55', '200.200.200-20', 1, to_timestamp('13/12/2019 04:44:29', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO Bilheteria(ingresso, cliente, atendente, promocao, data_e_hora) VALUES(9, '100.100.100-10', '200.200.200-20', 3, to_timestamp('13/12/2019 04:44:29', 'DD/MM/YYYY HH:MI:SS'));
