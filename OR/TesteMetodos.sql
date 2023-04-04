--Teste CONSTRUCTOR FUNCTION tp_endereco
DECLARE
    endereco tp_endereco;
BEGIN
    endereco := tp_endereco('99999-999', '888', 'Rua Professor Severino', 'Varzea', 'Recife', 'PE');
	DBMS_OUTPUT.PUT_LINE('CEP: ' || endereco.cep || ', Numero: ' || endereco.numero || ', Rua: ' || endereco.rua || ', Bairro: ' || endereco.bairro ||
        ', Cidade: ' || endereco.cidade || ', Estado: ' || endereco.estado);
END;
/

--Teste PROCEDURE exibirInformacoes 
DECLARE
    cliente tp_cliente;
BEGIN
    SELECT VALUE(P) INTO cliente FROM tb_cliente P
    WHERE P.cpf = '111.111.111-11';

    cliente.exibirInformacoes();
END;
/

--OVERRIDING e de MEMBER FUNCTION salarioBonusNatal
DECLARE
    V_atendente tp_atendente;
	V_SALARIO NUMBER;
BEGIN
	SELECT VALUE(A) INTO V_atendente FROM tb_atendente A WHERE A.cpf = '300.300.300-30';
	V_atendente.exibirInformacoes();
    V_SALARIO := V_atendente.salarioBonusNatal();
	DBMS_OUTPUT.PUT_LINE('Salario com Bonus: ' || V_SALARIO);
END;
/

--Teste FINAL ORDER MEMBER FUNCTION comparaQtd
DECLARE
    brinquedo_1 tp_brinquedo;
	brinquedo_2 tp_brinquedo;
	diff NUMBER;
BEGIN
    SELECT VALUE(B) INTO brinquedo_1 FROM tb_brinquedo B
    WHERE B.nome = 'Barca';

	SELECT VALUE(B2) INTO brinquedo_2 FROM tb_brinquedo B2
    WHERE B2.nome = 'Roda Gigante';

	diff := brinquedo_1.comparaQtd(brinquedo_2);

    IF diff > 0 THEN 
        DBMS_OUTPUT.PUT_LINE('O brinquedo do tipo ' || brinquedo_1.nome || ' tem maior capacidade do que do tipo ' || brinquedo_2.nome);
    END IF;
    IF diff = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('As capacidades dos brinquedos do tipo ' || brinquedo_1.nome || ' e do que do tipo ' || brinquedo_2.nome || ' são iguais.');
    END IF;
    IF diff < 0 THEN 
        DBMS_OUTPUT.PUT_LINE('O brinquedo do tipo ' || brinquedo_2.nome || ' tem maior capacidade do que do tipo ' || brinquedo_1.nome);
    END IF;
	
END;
/

--Teste MAP MEMBER FUNCTION descontoPorc
DECLARE
    porcentagem NUMBER;
	promocao tp_promocao;
BEGIN
    SELECT VALUE(P) INTO promocao FROM tb_promocao P WHERE P.codigo_promocao = 1;
	porcentagem := promocao.descontoPorc();
	DBMS_OUTPUT.PUT_LINE('Porcentagem paga: 0.' || porcentagem);
END;
/