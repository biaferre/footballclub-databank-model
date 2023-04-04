-- TIPO TELEFONE 
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR(10)
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
    FINAL MEMBER FUNCTION qntd_telefones RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/

-- TIPO CLIENTE
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
	fidelidade NUMBER(1)
)FINAL;
/
    
-- CORPO DO TIPO CLIENTE
CREATE OR REPLACE TYPE BODY tp_cliente AS 
    
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
    cargo REF tp_cargo
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

MEMBER FUNCTION nome_completo RETURN VARCHAR IS
    BEGIN
        RETURN  ''||nome||' '||sobrenome;
    END;
END;
/