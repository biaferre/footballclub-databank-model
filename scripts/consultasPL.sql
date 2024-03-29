-- CREATE FUNCTION + CASE WHEN + SELECT INTO: Função que recebe o CPF do cliente e a data do pagamento, e retorna uma mensagem de avaliação de acordo com a loja que ele foi.
CREATE OR REPLACE FUNCTION Avaliar (CP IN Cliente_loja.CPF%TYPE, Data_Venda IN Cliente_loja.Data_venda%TYPE)
RETURN VARCHAR2
IS
    Loja Cliente_loja.CNPJ_Loja%TYPE;
    resultado VARCHAR2(255);
BEGIN
    SELECT Cl.CNPJ_Loja INTO Loja
    FROM Cliente_loja Cl
    WHERE Cl.CPF= CP;

    CASE Loja 
    WHEN '0000' THEN
        resultado := 'Você comprou na loja 1! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    WHEN '0001' THEN
        resultado := 'Você comprou na loja 2! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    WHEN '0002' THEN
        resultado := 'Você comprou na loja 3! Gostaríamos muito da sua avaliação. Se possível, deixe um comentário no nosso site! Volte sempre!';
    ELSE
        resultado := 'Loja inválida!';
    END CASE;
    RETURN resultado;
END Avaliar;

--SELECT Avaliar('008', TO_DATE('01/03/2023', 'dd/mm/yy')) FROM DUAL;

-- BLOCO ANÔNIMO
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

-- %TYPE / CASE WHEN / LOOP EXIT WHEN / CURSOR (OPEN, FETCH, CLOSE) / WHILE LOOP: 
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

-- CREATE PROCEDURE / ROWTYPE / CREATE OR REPLACE PACKAGE/BODY:
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

-- SELECT * FROM Equipe;
-- SELECT * FROM Estadio;

-- USO DE ESTRUTURA DE DADOS DO TIPO TABLE: Aumenta o valor do aluguel em 10% de todos os estádios, por meio de um cursor iterando sobre os dados e atualizando os valores.
-- USO DE ESTRUTURA DE DADOS DO TIPO TABLE
DECLARE
  TYPE EstadioTableType IS TABLE OF Estadio%ROWTYPE;
BEGIN
      DECLARE
      cur SYS_REFCURSOR;
      Nome_Estadio Estadio.Nome%TYPE;
      Aluguel_Atual Estadio.Aluguel%TYPE;
      Novo_Aluguel Estadio.Aluguel%TYPE;
    BEGIN
      OPEN cur FOR
        SELECT E.Nome, E.Aluguel
        FROM Estadio E;
      
      LOOP
        FETCH cur INTO Nome_Estadio, Aluguel_Atual;
        EXIT WHEN cur%NOTFOUND;
        
        Novo_Aluguel := Aluguel_Atual * 1.1; -- Aumenta o aluguel em 10%
        
        UPDATE Estadio E2
        SET E2.Aluguel = Novo_Aluguel
        WHERE E2.Nome = Nome_Estadio;
      END LOOP;
      
      CLOSE cur;
    END;
END;

--SELECT E3.Nome, E3.Aluguel FROM Estadio E3;

-- CREATE OR REPLACE PACKAGE

CREATE OR REPLACE PACKAGE MinhasConsultas AS
  FUNCTION ConsultarJogar RETURN SYS_REFCURSOR;
END MinhasConsultas;
/

CREATE OR REPLACE PACKAGE BODY MinhasConsultas AS
  FUNCTION ConsultarJogar RETURN SYS_REFCURSOR AS
    c SYS_REFCURSOR;
  BEGIN
    OPEN c FOR
      SELECT J.Equipe_Jogo, J.Nome_Estadio, J.Data_Jogo
      FROM Jogar J;
      
    RETURN c;
  END ConsultarJogar;
END MinhasConsultas;
/
DECLARE
  cur SYS_REFCURSOR;
  Equipe Jogar.Equipe_Jogo%TYPE;
  Estadio Jogar.Nome_Estadio%TYPE;
  Data_Jogo Jogar.Data_Jogo%TYPE;
BEGIN
  cur := MinhasConsultas.ConsultarJogar;
  
  LOOP
    FETCH cur INTO Equipe, Estadio, Data_Jogo;
    EXIT WHEN cur%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE(Equipe || ' jogou em ' || Estadio || ' no dia ' || Data_Jogo);
  END LOOP;
  
  CLOSE cur;
END;
/

-- RECORD, IF
DECLARE
  resultado Partida.Resultado%TYPE;
	vitorias NUMBER;
  quantidade_partidas NUMBER;
	percentual_vitorias DECIMAL (3,2);

CURSOR winrate IS
SELECT P.resultado FROM Partida P WHERE P.Adversario = 'Bayer';

BEGIN
vitorias := 0;
quantidade_partidas := 0;

OPEN winrate;
	LOOP
    	FETCH winrate INTO resultado;
			IF winrate%FOUND THEN
			quantidade_partidas := quantidade_partidas + 1;
				IF resultado = 'Vitoria' THEN
        	    	vitorias := vitorias + 1;
				END IF;
			END IF;
		EXIT WHEN winrate%NOTFOUND;
	END LOOP;
CLOSE winrate;

percentual_vitorias := (vitorias/quantidade_partidas);
dbms_output.put_line('Porcentagem_vitorias: ' || percentual_vitorias*100 || '%');

END;

-- FOR IN LOOP / USO DE PARÂMETROS
CREATE OR REPLACE PROCEDURE estadios_cidade(cidade_desejada IN Endereco.Cidade%TYPE)
IS	
	CEP Endereco.CEP%type;
	nome Estadio.Nome%type;
	lotacao Estadio.Lotacao%type;
	cidade Endereco.Cidade%TYPE;
	i INTEGER;
	x INTEGER;

BEGIN
	i := 1;
	SELECT COUNT(*) INTO x FROM Endereco;
	FOR i IN 1..x LOOP
		SELECT E.CEP, E.Cidade, EST.Nome, EST.Lotacao INTO CEP, Cidade, Nome, Lotacao
		FROM Endereco E 
        LEFT OUTER JOIN Estadio EST ON EST.CEP = E.CEP
        WHERE E.Numero = i;
		IF Cidade = cidade_desejada THEN
			dbms_output.put_line('Nome: ' || Nome || '   Lotacao: ' || Lotacao);
		END IF;
	END LOOP;
END;
-- DEPOIS DE RODAR EXECUTE
EXECUTE estadios_cidade('Sao Paulo');


-- CREATE OR REPLACE TRIGGER (LINHA)
CREATE OR REPLACE TRIGGER antes_atualizacao_cargo
BEFORE UPDATE ON Cargos
FOR EACH ROW
BEGIN
    IF :NEW.Salario < 1302 THEN
    	RAISE_APPLICATION_ERROR(-20101, 'Salário não pode ser menor que o salário mínimo: 1302,00');
    END IF;
END;
-- DEPOIS DE RODAR
UPDATE Cargos SET Salario = 1200
WHERE Funcao = 'Massagista';
-- DEPOIS DE TENTAR ATUALIZAR
SELECT C.Salario FROM Cargos C 
WHERE C.Funcao = 'Massagista';
-- Procedure pra mudar de reserva pra titula e vice versa
CREATE OR REPLACE PROCEDURE mudar_escalacao (
    cpf_jogador IN Jogador.CPF%TYPE
)
IS
    antiga_escalacao Jogador.Escalacao%TYPE;
    nova_escalacao Jogador.Escalacao%TYPE;
    to_print VARCHAR2(255);
BEGIN

    SELECT Escalacao INTO antiga_escalacao
    FROM Jogador WHERE CPF = cpf_jogador;
	DBMS_OUTPUT.PUT_LINE(antiga_escalacao);

    IF antiga_escalacao = 'Reserva' THEN
        nova_escalacao := 'titular';
        to_print := 'Parabéns! Agora esse jogador é titular';
    ELSIF antiga_escalacao = 'Titular' THEN
        nova_escalacao := 'reserva';
        to_print := 'Ah não! Agora esse jogador virou um reserva, é preciso treinar mais!';
	ELSE
        nova_escalacao := antiga_escalacao;
		to_print:= 'Ops! Parece que esse jogador não está escalado, vamos manter como estava!';
    END IF;

    DBMS_OUTPUT.PUT_LINE(to_print);
	UPDATE Jogador
        SET Escalacao = nova_escalacao
        WHERE CPF = cpf_jogador;
    
END;

/* BEGIN 
    mudar_escalacao('001');
END; */


-- CREATE PROCEDURA
CREATE OR REPLACE PROCEDURE cadastro_equipe (
    nova_equipe IN Equipe%ROWTYPE
)
IS
BEGIN
    INSERT INTO Equipe (Divisao, Modalidade, Liga, CNPJ_Clube)
    VALUES (nova_equipe.Divisao, nova_equipe.Modalidade, nova_equipe.Liga, nova_equipe.CNPJ_Clube)
END;

CREATE OR REPLACE TRIGGER data_igual_partida
BEFORE INSERT ON Partida
DECLARE data_existente EXCEPTION
BEGIN
    IF EXISTS(SELECT * FROM Partida WHERE Data_Partida = NEW.Data_Partida) THEN
    RAISE data_existente;
    END IF;
EXCEPTION 
    WHEN data_existente THEN
    	Raise_application_error(-20003, 'Já existe uma partida com essa data!');
END;

-- EXCEPTION
CREATE OR REPLACE TRIGGER partida_nao_existente
BEFORE INSERT ON Partida
FOR EACH ROW
DECLARE 
  partida_nao_aconteceu EXCEPTION;
  x date;
BEGIN
  --SELECT Data_partida INTO x FROM Partida WHERE Data_Partida = :NEW.Data_Partida;
  IF :NEW.Data_Partida > SYSDATE THEN
    RAISE partida_nao_aconteceu;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20002, 'Data de partida não encontrada na tabela!');
  WHEN partida_nao_aconteceu THEN
    RAISE_APPLICATION_ERROR(-20001, 'Essa partida ainda não aconteceu!');
END;

/* INSERT INTO Partida(Data_Partida, Adversario, Resultado, Equipe, Estadio) 
VALUES (TO_DATE('18/03/2023', 'dd/mm/yy'), 'Real Medeiros', 'Derrota', 'Sub20', 'Estadio Municipal');
 */

-- TRIGGER COMANDO
CREATE OR REPLACE TRIGGER loja_fechada
BEFORE INSERT ON Cliente_Loja
DECLARE
    nao_esta_aberta EXCEPTION;
BEGIN 
    IF EXTRACT(HOUR FROM SYSTIMESTAMP) > 19 OR EXTRACT(HOUR FROM SYSTIMESTAMP) < 8 THEN 
        RAISE nao_esta_aberta;
    END IF;
EXCEPTION 
WHEN nao_esta_aberta THEN
    Raise_application_error(-20004,'Nossas lojas não abrem fora do horário comercial! Tente novamente amanhã :)');
END;

/* BEGIN
    INSERT INTO Cliente_loja(Data_venda, Produto, CNPJ_Loja, CPF, ID_Cupom, Forma_pagamento, Preco)
		VALUES (TO_DATE('01/03/2023', 'dd/mm/yy'), 'Camiseta', '0000', '001', 1, 'Cartão de débito', 49.99);
END; */

