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
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('200.200.200-20', 'Leonardo Lopes', to_date('29/02/1996', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('300.300.300-30', 'Leônidas Silva', to_date('09/03/1980', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('400.400.400-40', 'Helena Souza', to_date('02/10/1988', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('500.500.500-50', 'Juma Marruá', to_date('23/06/1990', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('600.600.600-60', 'José Leôncio', to_date('01/07/1972', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('700.700.700-70', 'Tereza Soares', to_date('31/01/1982','dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('800.800.800-80', 'Clara Nascimento', to_date('28/10/1979', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('900.900.900-90', 'Jaime Almeida', to_date('21/08/1991', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('101.101.101.01', 'Charles Xavier', to_date('13/05/1987', 'dd/mm/yy'), 'M');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('202.202.202-02', 'Ana Nóbrega', to_date('25/12/1984', 'dd/mm/yy'), 'F');
INSERT INTO Pessoa (cpf, nome, data_nascimento, sexo) VALUES ('303.303.303-03', 'Marcos Antônio', to_date('07/02/1988', 'dd/mm/yy'), 'M');

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
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('101.101.101.01', '+55 31 98050 6343');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('101.101.101.01', '+55 31 99631 3695');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('202.202.202-02', '+55 98 99284 3640');
INSERT INTO Telefone (cpf_pessoa, numero_telefone) VALUES ('303.303.303-03', '+55 85 97250 2315');
