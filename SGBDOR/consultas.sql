-- CONSULTA EM VARRAY
-- Pegar todos os telefones de um cliente específico
SELECT C.nome, C.cpf, T.* FROM tb_cliente C, TABLE(C.telefone) T 
WHERE C.cpf = '001';

-- SELECT DEREF
-- Consultar quantidade de equipes por clube
SELECT DEREF(cnpj_clube).nome_clube AS clube,COUNT(*) FROM tb_equipe
GROUP BY DEREF(cnpj_clube).nome_clube;

-- CONSULTA A NESTED TABLE
-- Consultas informações de todos os jogadores de alguma divisão específica
SELECT J.nome_completo() AS Nome, J.posicao, J.escalacao FROM TABLE(
	SELECT jogadores FROM tb_equipe E WHERE E.Divisao = 'sub20'
) J;

-- Selecione a quantidade de vitórias que um time possui
SELECT DEREF(P.Equipe).Divisao AS Divisao, COUNT(*) FROM tb_partida P
WHERE P.resultado = 'Vitoria'
AND DEREF(P.Equipe).Divisao = 'sub15'
GROUP BY DEREF(P.Equipe).Divisao;

-- Selecione todos os dados de um estádio
SELECT E.Nome, 
    E.Endereco.numero AS Numero, 
    E.Endereco.cep AS CEP, 
    E.Endereco.Cidade AS Cidade, 
    E.Endereco.Bairro AS Bairro, 
    E.Endereco.Rua AS Rua 
    FROM tb_estadio E;

-- Exibe o valor do ID e do desconto em porcentagem de todos os cupons
SELECT ID, c.id_cupom(), c.desconto() FROM tb_cupom c;

-- Diferença entre o salário de cada cargo e a média salarial
SELECT 
    c.FUNCAO,
    c.salario,
    (c.salario - media_salarios) AS diferenca
FROM 
    tb_cargo c,
    (SELECT AVG(salario) AS media_salarios FROM tb_cargo) m
ORDER BY 
    diferenca DESC;
