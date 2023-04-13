
-- TABELA CLUBE
CREATE TABLE tb_clube OF tp_clube(
    CNPJ PRIMARY KEY,     
  	Nome_clube NOT NULL,     
  	Email NOT NULL,      
  	endereco NOT NULL
);
/

-- TABELA DE CUPOM
CREATE TABLE tb_cupom OF tp_cupom(
    ID PRIMARY KEY,
    Desconto_porcentagem NOT NULL
);
/

-- TABELA LOJA
CREATE TABLE tb_loja OF tp_loja(
    CNPJ PRIMARY KEY,
    endereco NOT NULL
);
/

-- TABELA DE CARGO
CREATE TABLE tb_cargo OF tp_cargo(
    FUNCAO PRIMARY KEY,
    salario NOT NULL
);
/

-- TABELA DE FUNCIONARIO
CREATE TABLE tb_funcionario OF tp_funcionario(
    CPF PRIMARY KEY,
    data_nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL,
    supervisor WITH ROWID REFERENCES tb_funcionario,
    CNPJ WITH ROWID REFERENCES tb_clube NOT NULL,
    cargo WITH ROWID REFERENCES tb_cargo NOT NULL
);
/

-- TABELA CLIENTE
CREATE TABLE tb_cliente OF tp_cliente (

    CPF PRIMARY KEY,
    data_nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL,
    fidelidade NOT NULL

);
/

-- TABELA CLIENTE_LOJA
CREATE TABLE tb_cliente_loja OF tp_cliente_loja (
    PRIMARY KEY(data_venda, produto),
    forma_pagamento NOT NULL,
    preco NOT NULL,
    ID_cupom WITH ROWID REFERENCES tb_cupom NOT NULL,
    CNPJ_loja WITH ROWID REFERENCES tb_loja NOT NULL,
    CPF_cliente WITH ROWID REFERENCES tb_cliente NOT NULL
);
/

-- TABELA EQUIPE
CREATE TABLE tb_equipe OF tp_equipe(
    Divisao PRIMARY KEY,
    Modalidade NOT NULL,
    Liga NOT NULL,
    cnpj_clube SCOPE IS tb_clube
)NESTED TABLE jogadores STORE AS jogadores_equipe;
/

-- ESTADIO
CREATE TABLE tb_estadio OF tp_estadio(
    nome PRIMARY KEY,
    aluguel NOT NULL,
    lotacao NOT NULL,
    endereco NOT NULL,
    cnpj_clube WITH ROWID REFERENCES tb_clube NOT NULL
);
/

-- PARTIDA
CREATE TABLE tb_partida OF tp_partida(
    data_partida PRIMARY KEY,
    adversario NOT NULL,
    resultado NOT NULL,
    equipe WITH ROWID REFERENCES tb_equipe NOT NULL,
    estadio WITH ROWID REFERENCES tb_estadio NOT NULL
);
/
    
-- TABELA JOGAR
CREATE TABLE tb_jogar OF tp_jogar (
    equipe_jogo WITH ROWID REFERENCES tb_equipe NOT NULL,
    nome_estadio WITH ROWID REFERENCES tb_estadio NOT NULL,
    data_jogo WITH ROWID REFERENCES tb_partida NOT NULL
);
