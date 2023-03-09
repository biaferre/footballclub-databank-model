-- Selecione todos os jogadores de um time específico
SELECT P.Nome, J.Numero, J.Posicao, J.Escalacao FROM Jogador J
INNER JOIN Equipe E ON E.Divisao = J.Equipe_Jogador
INNER JOIN Pessoa P ON P.CPF = J.CPF 
WHERE E.Divisao = 'Sub17';

-- Quantidade de vitorias de cada time
SELECT J.Equipe_Jogo, COUNT(*) AS Vitorias FROM Jogar J
INNER JOIN Partida P ON J.Data_jogo = P.Data_Partida
WHERE P.Resultado = 'Vitoria'
GROUP BY J.Equipe_Jogo;

-- Retorne todos os cliente que já compraram na loja 2, retorne as informações da compra e ordene pelo nome
SELECT P.Nome, CL.Data_Venda, CL.Produto, CL.Forma_pagamento, CL.Preco FROM Pessoa P
INNER JOIN Cliente_Loja CL ON CL.CPF = P.CPF
WHERE CL.CNPJ_Loja = 2
ORDER BY P.Nome;

-- Selecione os times que já jogaram no estádio com maior público
SELECT DISTINCT J.Equipe_Jogo FROM Jogar J
JOIN Estadio E ON J.Nome_Estadio = E.Nome
WHERE E.Lotacao IN (SELECT MAX(Lotacao) FROM Estadio);

-- Retorne a média de idade dos jogadores do clube
SELECT AVG(Idade) FROM (
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, P.Data_Nasc) / 12) AS Idade FROM Pessoa P
		INNER JOIN Jogador J ON P.CPF = J.CPF
);

-- Quantidade de compras acima de 100 reais
SELECT COUNT(*) From Cliente_Loja 
WHERE Preco > 100;

-- Selecione todos os funcionários que possuem um supervisor e relate seu nome e o nome do supervisor
SELECT P.Nome, P2.Nome FROM Pessoa P
INNER JOIN Funcionario F ON F.CPF = P.CPF
INNER JOIN Funcionario F2 ON F.Supervisor = F2.CPF
INNER JOIN Pessoa P2 ON F2.CPF = P2.CPF
WHERE F.Supervisor IS NOT NULL ;

-- LIKE: Selecionar todas os adversários que têm a letra B no nome (seja começando ou no meio)
SELECT P.Adversario
FROM Partida P
WHERE P.Adversario LIKE '%b%'
OR P.Adversario LIKE 'B%'
OR P.Adversario LIKE '%b';

-- SUBCONSULTA COM OPERADOR RELACIONAL + UPDATE: O estádio que tem aluguel maior que 14000.00, vai aumentar 2000.00
UPDATE Estadio E
SET E.Aluguel = E.Aluguel + 2000.00
WHERE E.Aluguel = (SELECT E2.Aluguel FROM Estadio E2
                    INNER JOIN Endereco Ed ON E2.Numero = Ed.Numero AND E2.CEP = Ed.CEP
                    INNER JOIN Clube C ON E2.CNPJ_Clube = C.CNPJ
                    WHERE E2.Aluguel > 14000.00);

-- UNION: Selecionar o CPF de todos os jogadores que são Laterais (esquerdo ou direito)
SELECT J.CPF FROM Jogador J
INNER JOIN Pessoa P ON P.CPF = J.CPF
INNER JOIN Equipe E ON E.Divisao = J.Equipe_Jogador
WHERE J.Posicao = 'Lateral Esquerdo'
UNION
SELECT J2.CPF FROM Jogador J2
INNER JOIN Pessoa P2 ON P2.CPF = J2.CPF
INNER JOIN Equipe E2 ON E2.Divisao = J2.Equipe_Jogador
WHERE J2.Posicao = 'Lateral Direito'






