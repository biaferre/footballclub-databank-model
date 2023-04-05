
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

-- TABELA DE JOGADOR
CREATE TABLE tb_jogador OF tp_jogador(
    CPF PRIMARY KEY,
    data_nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL,
    numero NOT NULL,
    posicao NOT NULL,
    escalacao NOT NULL,
    equipe_jogador WITH ROWID REFERENCES tp_equipe NOT NULL
);
/

-- TABELA DE FUNCIONARIO
CREATE TABLE tb_funcionario OF tp_funcionario(
    CPF PRIMARY KEY,
    data_nascimento NOT NULL,
    nome NOT NULL,
    sobrenome NOT NULL,
    telefone NOT NULL,
    supervisor WITH ROWID REFERENCES tb_funcionario NOT NULL,
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

-- Tem que rodar o povoamento antes
SELECT c.qntd_telefones() FROM tb_cliente c WHERE p.nome = 'Felipo'
SELECT c.nome_completo() FROM tb_cliente c WHERE p.cpf = 1

-- TABELA CLIENTE_LOJA
CREATE TABLE tb_cliente_loja OF tp_cliente_loja (
    ID PRIMARY KEY,
    data_venda NOT NULL,
    produto NOT NULL,
    forma_pagamento NOT NULL,
    preco NOT NULL,
    ID_cupom WITH ROWID REFERENCES tb_cupom NOT NULL,
    CNPJ_loja WITH ROWID REFERENCES tb_loja NOT NULL,
    CPF_cliente WITH ROWID REFERENCES tb_cliente NOT NULL
);
/
