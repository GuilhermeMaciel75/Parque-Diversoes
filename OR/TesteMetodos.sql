--Teste CONSTRUCTOR FUNCTION tp_endereco

--Teste PROCEDURE exibirInformacoes
DECLARE
    cliente tp_cliente;
BEGIN
    SELECT VALUE(P) INTO cliente FROM tb_cliente P
    WHERE P.cpf = '111.111.111-11';

    cliente.exibirInformacoes();
END;
/

--OVERRIDING
DECLARE
    operador tp_operador;
BEGIN
    SELECT VALUE(P) INTO operador FROM tb_operador P
    WHERE P.cpf = '808.808.808-08';

    operador.exibirInformacoes();
END;
/

--Teste MEMBER FUNCTION salarioBonusNatal

--Teste FINAL ORDER MEMBER FUNCTION comparaQtd

--Teste MAP MEMBER FUNCTION descontoPorc
