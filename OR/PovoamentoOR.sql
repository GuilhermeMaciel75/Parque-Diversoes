-- POVOAMENTO OR

/*
INSERT INTO <tb_nome_da_tabela> VALUES <tp_nome_do_tipo> (<nomes dos atributos>) VALUES (<valores>);
*/

-- Pessoa
-- (Não vai ter tabela)

-- Endereço 
-- (Não vai ter tabela)**

-- Telefone 
-- (não vai ter tabela)** Vai ser varray

-- Cliente 
INSERT INTO tb_cliente VALUES (tp_cliente('999.999.999-99', 'Jubileu Amorim', to_date('14/03/1992', 'dd/mm/yy'), 'M', 
	tp_endereco('99999-999', 128, 'Rua do Espinheiro', 'Espinheiro', 'Recife', 'PE'), 
	tp_arrray_fones(tp_telefone('+55 81 99902 2762'), tp_telefone('+55 81 98417 1256'), tp_telefone('+55 81 98284 5843')),
	'Cartao de Credito', 
	tp_nt_dependentes(tp_dependente('Pietir Pires', to_date('27/08/2010', 'dd/mm/yy'), 'F'), 
					  tp_dependente('Raiane Pinheiro', to_date('07/03/2008', 'dd/mm/yy'), 'F'),
					  tp_dependente('Geneval Silvino', to_date('11/01/2012', 'dd/mm/yy'), 'M'))));

INSERT INTO tb_cliente VALUES (tp_cliente('888.888.888-88', 'Adalto Joaquim', to_date('20/09/1988', 'dd/mm/yy'), 'M', 
	tp_endereco('88888-888', 13, 'Estrada dos Viajantes', 'Goiabeiras', 'Vitória', 'ES'), 
	tp_arrray_fones(tp_telefone('+55 27 98431 0816'), tp_telefone('+55 27 98741 2487')),
	'Cartao de Debito', NULL));

INSERT INTO tb_cliente VALUES (tp_cliente('777.777.777-77', 'Maria Joaquina', to_date('27/04/2000', 'dd/mm/yy'), 'F', 
	tp_endereco('77777-777', 55, 'Avenida 1º de Maio', 'Ponta Verde', 'Maceió', 'AL'), 
	tp_arrray_fones(tp_telefone('+55 82 99768 8281')),
	'Cartao de Debito', 
	tp_nt_dependentes(tp_dependente('Telma Cordeiro', to_date('01/11/2012', 'dd/mm/yy'), 'F'), 
					  tp_dependente('Rosane Vaz', to_date('18/12/2009', 'dd/mm/yy'), 'F'))));

INSERT INTO tb_cliente VALUES (tp_cliente('666.666.666-66', 'Ana Vitória', to_date('15/11/1997', 'dd/mm/yy'), 'F', 
	tp_endereco('66666-666', 23, 'Rua Açai', 'Castanheira', 'Boa Vista', 'RO'), 
	tp_arrray_fones(tp_telefone('+55 69 96765 2831'), tp_telefone('+55 69 99991 2587')),
	'Cartao de Credito', NULL));

INSERT INTO tb_cliente VALUES (tp_cliente('555.555.555-55', 'Júlia Pereira', to_date('28/05/1999', 'dd/mm/yy'), 'F', 
	tp_endereco('55555-555', 88, 'Rua do Sol', 'São Marcos', 'São Luís', 'MA'), 
	tp_arrray_fones(tp_telefone('+55 98 99680 1715'), tp_telefone('+55 98 99787 1785'), tp_telefone('+55 98 99177 9686'), tp_telefone('+55 98 97994 2094')),
	'Pix', NULL));

INSERT INTO tb_cliente VALUES (tp_cliente('444.444.444-44', 'Luís Amilton', to_date('07/01/1985', 'dd/mm/yy'), 'M', 
	tp_endereco('44444-444', 1042, 'Avenida Almirante', 'Coqueiros', 'Florianópolis', 'SC'), 
	tp_arrray_fones(tp_telefone('+55 49 98526 2678'), tp_telefone('+1 408 987 4345')),
	'Pix', 
	tp_nt_dependentes(tp_dependente('Rone Gadelha', to_date('22/02/2010', 'dd/mm/yy'), 'M'))));

INSERT INTO tb_cliente VALUES (tp_cliente('333.333.333-33', 'Karen Cabral', to_date('25/08/1980', 'dd/mm/yy'), 'F', 
	tp_endereco('33333-333', 102, 'Rua Paysandu', 'Cidade Velha', 'Belém', 'PA'), 
	tp_arrray_fones(tp_telefone('+55 91 99547 0563'), tp_telefone('+54 9 432 929 1497'), tp_telefone('+54 9 532 999 9915')),
	'Cartao de Debito', NULL));

INSERT INTO tb_cliente VALUES (tp_cliente('222.222.222-22', 'Abelardo Barbosa', to_date('30/09/1977', 'dd/mm/yy'), 'M', 
	tp_endereco('22222-222', 10, 'Avenida Pantanal', 'Amambaí', 'Campo Grande', 'MS'), 
	tp_arrray_fones(tp_telefone('+55 67 96917 4131')),
	'Cartao de Credito', 
	tp_nt_dependentes(tp_dependente('Guilherme Araujo', to_date('12/06/2009', 'dd/mm/yy'), 'M'))));

INSERT INTO tb_cliente VALUES (tp_cliente('111.111.111-11', 'Joel Müller', to_date('26/09/1967', 'dd/mm/yy'), 'M', 
	tp_endereco('11111-111', 111, 'Avenida Santa Catarina', 'Água Verde', 'Blumenau', 'SC'), 
	tp_arrray_fones(tp_telefone('+55 49 98234 8053')),
	'Dinheiro', NULL));

INSERT INTO tb_cliente VALUES (tp_cliente('100.100.100-10', 'Carla Ramos', to_date('03/12/2001', 'dd/mm/yy'), 'F', 
	tp_endereco('10010-010', 84, 'Rua Chico Anysio', 'Aldeota', 'Fortaleza', 'CE'), 
	tp_arrray_fones(tp_telefone('+55 85 98570 7654')),
	'Cartao de Debito', 
	tp_nt_dependentes(tp_dependente('Nicollas Eger', to_date('14/09/2008', 'dd/mm/yy'), 'M'))));

-- Dependente
-- Nested Table (?)

-- Funcionário 
-- (Não vai ter tabela)

-- Área OK
INSERT INTO tb_area VALUES (tp_area('Radical', 4));
INSERT INTO tb_area VALUES (tp_area('Aquatico', 2));
INSERT INTO tb_area VALUES (tp_area('Aterrorizante', 2));
INSERT INTO tb_area VALUES (tp_area('Infantil', 3));
INSERT INTO tb_area VALUES (tp_area('Familiar', 3));

-- Brinquedo OK
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Super Tornado', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Radical'), 30, 12, 1.35));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Thunder', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Radical'), 35, 12, 1.30));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Over Loop', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Radical'), 25, 12, 1.35));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Samba', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Radical'), 25, 12, 1.30));

INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Splash', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Aquatico'), 5, 6, 1.00));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Tchibum', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Aquatico'), 5, 10, 1.25));

INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Mansao do Terror', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Aterrorizante'), 10, 12, 1.30));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Trem Fantasma', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Aterrorizante'), 2, 8, 1.20));

INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Carrocel', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Infantil'), 15, 3, 0.85));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Trampolim', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Infantil'), 15, 3, 0.85));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Trenzinho', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Infantil'), 25, 3, 0.85));

INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Roda Gigante', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Familiar'), 40, 6, 1.00));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Barca', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Familiar'), 30, 6, 1.00));
INSERT INTO tb_brinquedo VALUES (tp_brinquedo('Ciclone', (SELECT REF (A) FROM tb_area A WHERE A.categoria = 'Familiar'), 8, 8, 1.20));

-- Operador 
INSERT INTO tb_operador VALUES (tp_operador('500.500.500-50', 'Juma Marruá', to_date('23/06/1990', 'dd/mm/yy'), 'F',
	tp_endereco('50050-050', 121, 'Avenida Central', 'Afogados', 'Recife', 'PE'),
	tp_arrray_fones(tp_telefone('+55 22 99184 4150')), NULL));

-- Atendente OK
INSERT INTO tb_atendente VALUES (tp_atendente('200.200.200-20', 'Leonardo Lopes', to_date('29/02/1996', 'dd/mm/yy'), 'M',
	tp_endereco('20020-020', 99, 'Rua do Futuro', 'Iputinga', 'Recife', 'PE'),
	tp_arrray_fones(tp_telefone('+55 12 97288 8966'), tp_telefone('+1 678 799 3007')), 'Banca A', NULL));

INSERT INTO tb_atendente VALUES (tp_atendente('300.300.300-30', 'Leônidas Silva', to_date('09/03/1980', 'dd/mm/yy'), 'M',
	tp_endereco('30030-030', 300, 'Estrada da Batalha', 'Prazeres', 'Jaboatão dos Guararapes', 'PE'),
	tp_arrray_fones(tp_telefone('+55 12 97288 8966'), tp_telefone('+1 678 799 3007')), 'Banca B', 
	(SELECT REF(A) FROM tb_atendente A WHERE A.cpf = '200.200.200-20')));

INSERT INTO tb_atendente VALUES (tp_atendente('400.400.400-40', 'Helena Souza', to_date('02/10/1988', 'dd/mm/yy'), 'F',
	tp_endereco('40040-040', 40, 'Avenida Caxangá', 'Cordeiro', 'Recife', 'PE'),
	tp_arrray_fones(tp_telefone('+55 12 97288 8966'), tp_telefone('+1 678 799 3007')), 'Banca C', 
	(SELECT REF(A) FROM tb_atendente A WHERE A.cpf = '200.200.200-20')));

-- Joga ****** Ver como vai ser Dependentes...
INSERT INTO tb_joga VALUES (tp_joga((SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '999.999.999-99'), 
	(SELECT REF(D) FROM tb_dependente D WHERE D.nome = 'Pietir Pires'),
	(SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Carrocel')));

-- Brinca OK
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Super Tornado'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '999.999.999-99')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Mansao do Terror'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '100.100.100-10')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Thunder'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '888.888.888-88')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Thunder'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '111.111.111-11')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Tchibum'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '333.333.333-33')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Barca'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '100.100.100-10')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Mansao do Terror'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '666.666.666-66')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Over Loop'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '444.444.444-44')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Splash'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '555.555.555-55')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Roda Gigante'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '222.222.222-22')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Ciclone'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '444.444.444-44')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Trem Fantasma'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '888.888.888-88')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Roda Gigante'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '777.777.777-77')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Samba'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '999.999.999-99')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Trem Fantasma'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '111.111.111-11')));
INSERT INTO tb_brinca VALUES (tp_brinca((SELECT REF(B) FROM tb_brinquedo B WHERE B.nome = 'Samba'),
	(SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '222.222.222-22')));

-- Ingresso OK
INSERT INTO tb_ingresso VALUES (tb_ingresso(1, 110.00));
INSERT INTO tb_ingresso VALUES (tp_ingresso(2, 150.00)); 
INSERT INTO tb_ingresso VALUES (tp_ingresso(3, 200.00)); 
INSERT INTO tb_ingresso VALUES (tp_ingresso(4, 110.00));
INSERT INTO tb_ingresso VALUES (tp_ingresso(5, 150.00)); 
INSERT INTO tb_ingresso VALUES (tp_ingresso(6, 200.00)); 
INSERT INTO tb_ingresso VALUES (tp_ingresso(7, 110.00));
INSERT INTO tb_ingresso VALUES (tp_ingresso(8, 150.00)); 
INSERT INTO tb_ingresso VALUES (tp_ingresso(9, 200.00));

-- Promoção OK
INSERT INTO tb_promocao VALUES (tp_promocao(1, 10, 'Pagamento em Dinheiro ou PIX', to_date('02/03/2023', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy')));
INSERT INTO tb_promocao VALUES (tp_promocao(2, 40, 'Desconto Funcionário',  to_date('01/01/2023', 'dd/mm/yy'),  to_date('01/01/2024', 'dd/mm/yy')));
INSERT INTO tb_promocao VALUES (tp_promocao(3, 50, 'Desconto estudante, professor, idoso',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy')));
INSERT INTO tb_promocao VALUES (tp_promocao(4, 60, 'Desconto Aniversário',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy')));
INSERT INTO tb_promocao VALUES (tp_promocao(5, 70, 'Sem acesso aos brinquedos do parque',  to_date('13/07/2012', 'dd/mm/yy'),  to_date('31/12/2026', 'dd/mm/yy')));
INSERT INTO tb_promocao VALUES (tp_promocao(6, 0, 'Sem Promocçao',  to_date('08/10/2015', 'dd/mm/yy'),  to_date('31/12/2023', 'dd/mm/yy')));

-- Bilheteria 
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 1), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '666.666.666-66'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '300.300.300-30'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 6), to_timestamp('03/03/2023 02:35:18', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 2), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '222.222.222-22'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '300.300.300-30'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 5), to_timestamp('03/03/2023 04:05:44', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 3), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '111.111.111-11'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '300.300.300-30'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 3), to_timestamp('03/03/2023 11:56:02', 'DD/MM/YYYY HH:MI:SS'));

INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 4), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '777.777.777-77'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '400.400.400-40'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 4), to_timestamp('27/04/2022 10:32:57', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 5), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '333.333.333-33'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '400.400.400-40'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 2), to_timestamp('02/01/2023 08:15:33', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 6), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '444.444.444-44'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '400.400.400-40'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 1), to_timestamp('13/07/2012 05:22:41', 'DD/MM/YYYY HH:MI:SS'));

INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 7), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '999.999.999-99'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '200.200.200-20'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 6), to_timestamp('03/03/2023 02:35:18', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 8), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '555.555.555-55'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '200.200.200-20'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 1), to_timestamp('03/03/2023 02:35:18', 'DD/MM/YYYY HH:MI:SS'));
INSERT INTO tb_bilheteria VALUES (tp_bilheteria(SELECT REF(I) FROM tb_ingresso I WHERE I.codigo_ingresso = 9), 
	(SELECT REF(C) FROM tb_cliente C WHERE tb_cliente C WHERE C.cpf = '100.100.100-10'),
	(SELECT REF(A) FROM tb_atendente A WHERE tb_atendente A WHERE A.cpf = '200.200.200-20'),
	(SELECT REF(P) FROM tb_promocao P WHERE tb_promocao P WHERE P.codigo_promocao = 3), to_timestamp('03/03/2023 02:35:18', 'DD/MM/YYYY HH:MI:SS'));
