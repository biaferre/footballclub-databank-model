-- CREATE FUNCTION + CASE WHEN + SELECT INTO: Função que recebe o CPF do cliente e a data do pagamento, e retorna uma mensagem de avaliação de acordo com a loja que ele foi.
CREATE OR REPLACE FUNCTION Avaliar (CPF Cliente_loja.CPF%TYPE, Data_Venda Cliente_loja.Data_venda%TYPE)
RETURN VARCHAR2
IS
    Loja Cliente_loja.CNPJ_Loja%TYPE;
    resultado VARCHAR2(255);
BEGIN
    SELECT Cl.CNPJ_Loja INTO Loja
    FROM Cliente_loja Cl
    WHERE Cl.CPF= CPF AND Cl.Data_venda = Data_Venda
    AND ROWNUM = 1;

    CASE WHEN Loja = '0000' THEN
        resultado := 'Você comprou na loja 1! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    WHEN Loja = '0001' THEN
        resultado := 'Você comprou na loja 2! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    WHEN Loja = '0002' THEN
        resultado := 'Você comprou na loja 3! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    ELSE
        resultado := 'Loja inválida!';
    END CASE;
    RETURN resultado;
END Avaliar;

--SELECT Avaliar('008', TO_DATE('01/03/2023', 'dd/mm/yy')) FROM DUAL;
