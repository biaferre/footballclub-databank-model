-- CREATE INDEX
CREATE INDEX Equipe_Info ON Equipe(Divisao, Modalidade, Liga)

-- SELECT WHERE / INNER JOIN
SELECT P.Nome, J.Numero, J.Posicao, J.Escalacao, E.Divisao FROM Jogador J
INNER JOIN Equipe E ON E.Divisao = J.Equipe_Jogador
INNER JOIN Pessoa P ON P.CPF = J.CPF 
WHERE E.Divisao = 'Sub17';

-- GROUP BY / COUNT(*)
SELECT J.Equipe_Jogo, COUNT(*) AS Vitorias FROM Jogar J
INNER JOIN Partida P ON J.Data_jogo = P.Data_Partida
WHERE P.Resultado = 'Vitoria'
GROUP BY J.Equipe_Jogo;

-- ORDER BY
SELECT P.Nome, CL.Data_Venda, CL.Produto, CL.Forma_pagamento, CL.Preco FROM Pessoa P
INNER JOIN Cliente_Loja CL ON CL.CPF = P.CPF
WHERE CL.CNPJ_Loja = '0001'
ORDER BY P.Nome;

-- MAX / SUBCONSULTA IN
SELECT DISTINCT J.Equipe_Jogo FROM Jogar J
JOIN Estadio E ON J.Nome_Estadio = E.Nome
WHERE E.Lotacao IN (SELECT MAX(Lotacao) FROM Estadio);

-- AVG
SELECT AVG(Idade) FROM (
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, P.Data_Nasc) / 12) AS Idade FROM Pessoa P
		INNER JOIN Jogador J ON P.CPF = J.CPF
);

-- COUNT
SELECT COUNT(*) From Cliente_Loja 
WHERE Preco > 100;

-- IS NOT NULL
INNER JOIN Funcionario F ON F.CPF = P.CPF
INNER JOIN Funcionario F2 ON F.Supervisor = F2.CPF
INNER JOIN Pessoa P2 ON F2.CPF = P2.CPF
WHERE F.Supervisor IS NOT NULL ;

-- LIKE 
SELECT P.Adversario
FROM Partida P
WHERE P.Adversario LIKE '%b%'
OR P.Adversario LIKE 'B%'
OR P.Adversario LIKE '%b';

-- UPDATE 
UPDATE Estadio E
SET E.Aluguel = E.Aluguel + 2000.00
WHERE E.Aluguel = (SELECT E2.Aluguel FROM Estadio E2
                    INNER JOIN Endereco Ed ON E2.Numero = Ed.Numero AND E2.CEP = Ed.CEP
                    INNER JOIN Clube C ON E2.CNPJ_Clube = C.CNPJ
                    WHERE E2.Aluguel > 14000.00);

-- SUBCONSULTA COM OPERADOR RELACIONAL
SELECT E3.Aluguel, E3.Nome, Ed2.Rua, Ed2.Numero, C2.Nome_clube FROM Estadio E3, Endereco Ed2, Clube C2
WHERE E3.Aluguel = (SELECT E4.Aluguel FROM Estadio E4
                    INNER JOIN Endereco Ed2 ON E4.Numero = Ed2.Numero AND E4.CEP = Ed2.CEP
                    INNER JOIN Clube C2 ON E4.CNPJ_Clube = C2.CNPJ
                    WHERE E4.Aluguel > 16000.00);

-- UNION
SELECT J.CPF, P.Nome FROM Jogador J
INNER JOIN Pessoa P ON P.CPF = J.CPF
INNER JOIN Equipe E ON E.Divisao = J.Equipe_Jogador
WHERE J.Posicao = 'Lateral Esquerdo'
UNION
SELECT J2.CPF, P2.Nome FROM Jogador J2
INNER JOIN Pessoa P2 ON P2.CPF = J2.CPF
INNER JOIN Equipe E2 ON E2.Divisao = J2.Equipe_Jogador
WHERE J2.Posicao = 'Lateral Direito'

-- BETWEEN
SELECT P.Nome, C.Fidelidade, Cl.Produto, Cl.Preco, Cl.Forma_pagamento FROM Cliente_Loja Cl
INNER JOIN Cliente C ON CL.CPF = C.CPF
INNER JOIN Pessoa P ON P.CPF = C.CPF
WHERE Cl.Preco BETWEEN (99.99) AND ((199.99));

-- ALTER TABLE
ALTER TABLE Cupom
ADD CHECK (Desconto_porcentagem <= 100); 

-- MIN
SELECT MIN(Vendas) FROM (
    SELECT CNPJ_Loja, COUNT(*) AS Vendas FROM Cliente_Loja
	GROUP BY CNPJ_Loja
);

-- DELETE
DELETE FROM Jogador
WHERE (cpf = 022);

-- IS NULL
SELECT CPF
FROM Funcionario
WHERE Supervisor IS NULL;

-- SUBCONSULTA COM ANY
SELECT Funcao, Salario FROM Cargos 
WHERE Salario > ANY (SELECT Salario FROM Cargos WHERE Funcao = 'Nutricionista');

-- CREATE VIEW
CREATE VIEW view_pagIntegral AS 
SELECT * FROM Cliente_loja
WHERE ID_Cupom IS NULL;

-- INSERT INTO
INSERT INTO Cliente_loja (Data_venda, Produto, CNPJ_Loja, CPF, ID_Cupom, Forma_pagamento, Preco)
VALUES (TO_DATE('01/03/2023', 'dd/mm/yy'), 'Short', '0000', '008', 
        (SELECT ID FROM Cupom WHERE Desconto_porcentagem = 20), 'Cartão de credito', 69.99);
-- SELECT * FROM Cliente_loja


-- IN
SELECT Data_Jogo FROM Jogar J WHERE Equipe_Jogo IN ('Sub20', 'Sub13')

-- RIGHT OUTER JOIN
SELECT Data_Jogo, Produto FROM Cliente_loja C 
RIGHT OUTER JOIN Jogar J ON C.Data_venda = J.Data_Jogo
WHERE J.Equipe_Jogo IN('Sub17', 'Sub15')

-- HAVING
SELECT Nome, COUNT(*) AS compras_totais 
FROM Cliente_loja C
JOIN Pessoa P ON P.CPF = C.CPF
GROUP BY Nome
HAVING COUNT(*) > 1;

-- SUBCONSULTA COM ALL
SELECT P.Nome, P.CPF, F.Cargo, C.Salario FROM Pessoa P
INNER JOIN Funcionario F ON F.CPF = P.CPF
INNER JOIN Cargos C ON C.Funcao = F.Cargo 
WHERE C.Salario > ALL(
    SELECT C.Salario FROM Funcionario F
		JOIN Cargos C ON F.Cargo = C.Funcao
		WHERE F.Supervisor IS NOT NULL
);

-- GRANT / REVOKE
GRANT INSERT ON Jogador TO PUBLIC;
REVOKE INSERT ON Jogador FROM PUBLIC;
