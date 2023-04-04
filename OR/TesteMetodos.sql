--Teste CONSTRUCTOR FUNCTION tp_endereco

--Teste PROCEDURE exibirInformacoes OVERRIDING e de MEMBER FUNCTION salarioBonusNatal
DECLARE
    V_atendente tp_atendente;
	V_SALARIO NUMBER;
BEGIN
	SELECT VALUE(A) INTO V_atendente FROM tb_atendente A WHERE A.cpf = '300.300.300-30';
	V_atendente.exibirInformacoes();
    V_SALARIO := V_atendente.salarioBonusNatal();
	DBMS_OUTPUT.PUT_LINE('Salario com Bonus: ' || V_SALARIO);
END;

--Teste FINAL ORDER MEMBER FUNCTION comparaQtd

--Teste MAP MEMBER FUNCTION descontoPorc
DECLARE
    porcentagem NUMBER;
	promocao tp_promocao;
BEGIN
    SELECT VALUE(P) INTO promocao FROM tb_promocao P WHERE P.codigo_promocao = 1;
	porcentagem := promocao.descontoPorc();
	DBMS_OUTPUT.PUT_LINE('Porcentagem paga: ' || porcentagem);
END;
