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

-- SELECT REF
-- Insere um estádio na tabela de estadio referenciando um clube específico
DECLARE
    clube  REF tp_clube;
BEGIN
    SELECT  REF(c)
    INTO    clube
    FROM    tb_clube c
    WHERE   CNPJ = '150319'; 

    INSERT INTO tb_estadio VALUES (
        tp_estadio(
        	'Arruda',
        	tp_endereco(
        	    15,
        	    '325',
        	    'Recife',
        	    'Madalena',
        	    'Rua Amada Lena'
        	),
        	clube, 
        	22000.00, 
        	110000
        )
	);
END;

-- Selecione a quantidade de vitórias que um time possui
SELECT DEREF(P.Equipe).Divisao AS Divisao, COUNT(*) AS N_Vitorias FROM tb_partida P
WHERE P.resultado = 'Vitoria'
AND DEREF(P.Equipe).Divisao = 'sub15'
GROUP BY DEREF(P.Equipe).Divisao;

-- Seleciona uma lista com as equipes com maior número de vitorias
SELECT DEREF(P.Equipe).Divisao AS Divisao, COUNT(*) AS N_Vitorias FROM tb_partida P
WHERE P.resultado = 'Vitoria'
GROUP BY DEREF(P.Equipe).Divisao
ORDER BY COUNT(*) DESC;

-- Selecione todos os dados de um estádio
SELECT E.Nome, 
    E.Endereco.numero AS Numero, 
    E.Endereco.cep AS CEP, 
    E.Endereco.Cidade AS Cidade, 
    E.Endereco.Bairro AS Bairro, 
    E.Endereco.Rua AS Rua 
    FROM tb_estadio E;

-- Exibe o codigo e o desconto em porcentagem de todos os cupons
 SELECT c.id_cupom() AS Codigo, c.desconto() AS Desconto FROM tb_cupom c;

 -- Diferença entre o salário de cada cargo e a média salarial
 SELECT 
     c.FUNCAO,
     c.salario,
     media_salarios AS Media,
     (c.salario - media_salarios) AS diferenca
 FROM 
     tb_cargo c,
     (SELECT AVG(salario) AS media_salarios FROM tb_cargo) 
 ORDER BY 
     diferenca DESC;

-- TESTE DO BODY DE PESSOA
-- Seleciona a quantidade de telefones de um cliente
SELECT c.nome ,c.qntd_telefones() AS QNT_Telefones FROM tb_cliente c WHERE c.nome = 'Rogério';

-- Seleciona o nome completo do cliente
SELECT c.nome_completo() AS Nome_completo FROM tb_cliente c WHERE c.cpf = '001';

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


-- Associação funcionário - clube e seu cargo
SELECT DEREF(F.CNPJ).nome_clube AS Clube, DEREF(F.cargo).funcao AS Cargo, F.nome_completo() AS Nome FROM tb_funcionario F

-- Pegar todas as informações de todos os jogos existentes
SELECT DEREF(equipe_jogo).divisao AS Equipe, 
       DEREF(nome_estadio).nome AS Estadio, 
       DEREF(data_jogo).adversario AS Adversario, 
       DEREF(data_jogo).resultado AS Resultado FROM tb_jogar;

-- Some quanto uma loja especifica faturou
SELECT SUM(Preco) FROM tb_cliente_loja 
WHERE DEREF(CNPJ_Loja).CNPJ = '222334';

-- Consulta do nome e o número de telefones de todos os funcionários
SELECT f.CPF AS cpf, f.nome_completo() AS nome, f.qntd_telefones() AS qtd_telefones
FROM tb_funcionario f