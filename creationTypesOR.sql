-- TIPO TELEFONE 
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR(10)
);
/

-- TIPO CUPOM
CREATE OR REPLACE TYPE tp_cupom AS OBJECT (
  ID NUMBER,
  Desconto_porcentagem NUMBER,
  MEMBER FUNCTION id_cupom RETURN NUMBER,
  MEMBER FUNCTION desconto RETURN NUMBER
)FINAL;
/

CREATE OR REPLACE tp_loja AS OBJECT(
    CNPJ VARCHAR2(18),
    enderecos tb_endereco,
)NESTED TABLE enderecos STORE AS tb_endereco;
/

-- TIPO CLIENTE-LOJA
CREATE OR REPLACE TYPE tp_cliente_loja AS OBJECT (
    data_venda DATE,
    produto VARCHAR2(255),
    forma_pagamento VARCHAR(255),
    preco NUMBER,
    ID_cupom ref tp_cupom,
    CNPJ_loja ref tp_loja,
    CPF_cliente ref tp_cliente
);
/

-- TIPO ARRAY DE TELEFONES
CREATE OR REPLACE TYPE tp_varray_telefone AS VARRAY(5) OF tp_telefone;
/

-- TIPO PESSOA
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    CPF VARCHAR2 (11),
    data_nascimento DATE,
    nome VARCHAR2 (50),
    sobrenome VARCHAR2 (50),
    telefone tp_varray_telefone,
    MEMBER FUNCTION nome_completo RETURN VARCHAR,
    MEMBER FUNCTION print_info,
    FINAL MEMBER FUNCTION qntd_telefones RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS 
    MEMBER FUNCTION nome_completo RETURN VARCHAR IS
        BEGIN
            RETURN  ''||nome||' '||sobrenome;
        END;
    MEMBER FUNCTION print_info IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE(nome);
            DBMS_OUTPUT.PUT_LINE(cpf);
            DBMS_OUTPUT.PUT_LINE(data_nascimento);
        END;
END;

-- TIPO  JOGADOR
CREATE OR REPLACE TYPE tp_jogador UNDER tp_pessoa(
    numero NUMBER(2),
    posicao VARCHAR2(255),
    escalacao VARCHAR2(7),
    equipe_jogador REF tp_equipe,
    MEMBER FUNCTION posicao RETURN VARCHAR2,
    MAP ORDER
)FINAL;

-- TIPO CLIENTE
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
	fidelidade NUMBER(1)
)FINAL;
/
    
-- CORPO DO TIPO CLIENTE
    
FINAL MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
qntTel NUMBER;
    BEGIN
        SELECT COUNT(*) INTO quantTel
        FROM TABLE(SELF.telefone);
        RETURN quantTel;
    END;

MEMBER FUNCTION nome_completo RETURN VARCHAR IS
    BEGIN
        RETURN  ''||nome||' '||sobrenome;
    END;
END;
/

-- TIPO ENDERECO
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    numero NUMBER(4),
    CEP VARCHAR2(9),
    cidade VARCHAR2(50),
    bairro VARCHAR2(50),
    rua VARCHAR2(50)
)FINAL;
/
    
-- TIPO CLUBE
CREATE OR REPLACE TYPE tp_clube AS OBJECT(
    CNPJ VARCHAR2(18),     
  	Nome_clube VARCHAR2(255),     
  	Email VARCHAR2(255),      
  	endereco tp_endereco
)FINAL;
/

-- TIPO CARGO
CREATE OR REPLACE TYPE tp_cargo AS OBJECT (
    FUNCAO VARCHAR2(18),
    salario DECIMAL(10,2)
)FINAL;
/

-- TIPO FUNCIONARIO
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
    supervisor REF tp_funcionario,
    CNPJ REF tp_clube,
    cargo REF tp_cargo,
    OVERRIDING MEMBER PROCEDURE print_info
)FINAL;
/

-- CORPO DO TIPO FUNCIONARIO
CREATE OR REPLACE TYPE BODY tp_funcionario AS 
    
FINAL MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
qntTel NUMBER;
    BEGIN
        SELECT COUNT(*) INTO quantTel
        FROM TABLE(SELF.telefone);
        RETURN quantTel;
    END;
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(supervisor);
        DBMS_OUTPUT.PUT_LINE(CNPJ);
    END;
END;
/
