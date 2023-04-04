
-- TABELA CLUBE
CREATE TABLE tb_clube OF tp_clube(
    CNPJ PRIMARY KEY,     
  	Nome_clube NOT NULL,     
  	Email NOT NULL,      
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