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

-- BLOCO ANÔNIMO:
-- Criando um bloco anônimo com um record de loja e printando o ID*/
DECLARE
    TYPE cupom IS RECORD (
        ID NUMBER,
        Desconto_porcentagem NUMBER);
        cupom_03 cupom;
BEGIN
    cupom_03.ID := 3;
    cupom_03.Desconto_porcentagem := 30;
    DBMS_OUTPUT.PUT_LINE(cupom_03.ID);
END;

-- %TYPE, CASE WHEN, LOOP EXIT WHEN, CURSOR (OPEN, FETCH, CLOSE) E WHILE LOOP: 
-- Loop que analisa os jogadores cadastrados, contabilizando de acordo com a posicao
-- Cursor foi usado para pegar a posicao na tabela Jogador
DECLARE 
    count_goleiro BINARY_INTEGER;
    count_zagueiro BINARY_INTEGER;
    count_lateralE BINARY_INTEGER;
    count_lateralD BINARY_INTEGER;
    count_atacante BINARY_INTEGER;
    i BINARY_INTEGER;
    q BINARY_INTEGER;
    aux_jogador Jogador.Posicao%TYPE;

    CURSOR c_jogador IS
        SELECT J.Posicao
        FROM Jogador J;
BEGIN
    OPEN c_jogador;
    count_goleiro := 0;
    count_zagueiro := 0;
    count_lateralE := 0;
    count_lateralD := 0;
    count_atacante := 0;
    i := 0;
    SELECT COUNT(*) INTO q FROM Jogador;
    WHILE i < q LOOP
        FETCH c_jogador INTO aux_jogador;
        EXIT WHEN c_jogador%NOTFOUND;
        CASE aux_jogador
            WHEN 'Goleiro' THEN
                count_goleiro := count_goleiro + 1;
            WHEN 'Zagueiro' THEN
                count_zagueiro := count_zagueiro + 1;
            WHEN 'Lateral Esquerdo' THEN
                count_lateralE := count_lateralE + 1;
            WHEN 'Lateral Direito' THEN
                count_lateralD := count_lateralD + 1;
            ELSE
                count_atacante := count_atacante + 1;
        END CASE;
        i := i + 1;
    END LOOP;
    CLOSE c_jogador;
    DBMS_OUTPUT.PUT_LINE('Goleiro: ' || count_goleiro || ', Zagueiro: ' || count_zagueiro ||
                         ', Lateral Esquerdo: ' || count_lateralE || ', Lateral Direito: ' || count_lateralD ||
                         ', Atacante: ' || count_atacante);
END;

-- CREATE PROCEDURE, ROWTYPE, CREATE OR REPLACE PACKAGE/BODY:
-- Packages com procedures para inserção de elementos do tipo Equipe e Estadio na tabela. */
CREATE OR REPLACE PACKAGE cadastros AS
PROCEDURE new_Equipe(aux Equipe%ROWTYPE);
PROCEDURE new_Estadio(
    e_nome Estadio.Nome%TYPE,
    e_numero Estadio.Numero%TYPE,
    e_cep Estadio.CEP%TYPE,
    e_cnpjC Estadio.CNPJ_Clube%TYPE,
    e_alugel Estadio.Aluguel%TYPE,
    e_lotacao Estadio.Lotacao%TYPE
);
END cadastros;
/
CREATE OR REPLACE PACKAGE BODY cadastros AS
PROCEDURE new_Equipe(aux Equipe%ROWTYPE) IS
BEGIN
    INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
        VALUES(aux.Divisao, aux.Modalidade, aux.Liga, aux.CNPJ_Clube);
END new_Equipe;
PROCEDURE new_Estadio(
    e_nome Estadio.Nome%TYPE,
    e_numero Estadio.Numero%TYPE,
    e_cep Estadio.CEP%TYPE,
    e_cnpjC Estadio.CNPJ_Clube%TYPE,
    e_alugel Estadio.Aluguel%TYPE,
    e_lotacao Estadio.Lotacao%TYPE
) IS
    BEGIN
        INSERT INTO Estadio(Nome, Numero, CEP, CNPJ_Clube, Aluguel, Lotacao)
            VALUES (e_nome, e_numero, e_cep, e_cnpjC, e_alugel, e_lotacao);
        END new_Estadio;
END cadastros;

