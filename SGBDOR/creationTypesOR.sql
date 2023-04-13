-- TIPO TELEFONE 
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR(10)
);
/
-- TIPO ARRAY DE TELEFONES
CREATE OR REPLACE TYPE tp_varray_telefone AS VARRAY(5) OF tp_telefone;
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
-- TIPO CUPOM
CREATE OR REPLACE TYPE tp_cupom AS OBJECT (
  ID NUMBER,
  Desconto_porcentagem NUMBER,
  MEMBER FUNCTION id_cupom RETURN NUMBER,
  MEMBER FUNCTION desconto RETURN NUMBER
 )FINAL;
 /

 CREATE OR REPLACE TYPE BODY tp_cupom AS 
   MEMBER FUNCTION id_cupom RETURN NUMBER IS
   BEGIN
     RETURN ID;
   END;

   MEMBER FUNCTION desconto RETURN NUMBER IS
   BEGIN
     RETURN Desconto_porcentagem;
   END;
 END;
 /

-- TIPO LOJA
CREATE OR REPLACE TYPE tp_loja AS OBJECT (
    CNPJ VARCHAR2(18),
    endereco tp_endereco
);
/

-- TIPO PESSOA
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    CPF VARCHAR2 (11),
    data_nascimento DATE,
    nome VARCHAR2 (50),
    sobrenome VARCHAR2 (50),
    telefone tp_varray_telefone,
    MEMBER FUNCTION nome_completo RETURN VARCHAR,
    MEMBER PROCEDURE print_info,
    FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_pessoa AS 
	MEMBER FUNCTION nome_completo RETURN VARCHAR IS
    	BEGIN
        	RETURN  ''||nome|| ' '|| sobrenome;
    	END;
	MEMBER PROCEDURE print_info IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE(nome);
            DBMS_OUTPUT.PUT_LINE(cpf);
            DBMS_OUTPUT.PUT_LINE(data_nascimento);
        END;
    FINAL MAP MEMBER FUNCTION qntd_telefones RETURN NUMBER IS
    amount NUMBER;
    	BEGIN
        	SELECT COUNT(*) INTO amount
        	FROM TABLE(SELF.telefone);
        	RETURN amount;
    	END;
END;
/

-- TIPO ESTÁDIO
CREATE OR REPLACE TYPE tp_estadio AS OBJECT(
    nome VARCHAR2(255),
    endereco tp_endereco,
    cnpj_clube REF tp_clube,
    aluguel DECIMAL(8,2),
    lotacao NUMBER(6)
)FINAL;
/

-- TIPO JOGADOR
CREATE OR REPLACE TYPE tp_jogador UNDER tp_pessoa(
    numero NUMBER(2),
    posicao VARCHAR2(255),
    escalacao VARCHAR2(7)
)FINAL;
/

-- NESTED JOGADOR
CREATE OR REPLACE TYPE tp_nt_jogadores AS TABLE OF tp_jogador
/

-- TIPO EQUIPE
CREATE OR REPLACE TYPE tp_equipe AS OBJECT(
    divisao VARCHAR2(5),
    modalidade VARCHAR2(255),
    liga VARCHAR2(255),
    cnpj_clube REF tp_clube,
    jogadores tp_nt_jogadores
)FINAL;
/

-- TIPO PARTIDA
CREATE OR REPLACE TYPE tp_partida AS OBJECT(
    data_partida DATE,
    adversario VARCHAR2(255),
    resultado VARCHAR2(255),
    equipe REF tp_equipe,
    estadio REF tp_estadio
)FINAL;
/
-- TIPO JOGAR
CREATE OR REPLACE TYPE tp_jogar AS OBJECT(
    equipe_jogo REF tp_equipe,
    nome_estadio REF tp_estadio,
    data_jogo REF tp_partida
)FINAL;
/
    
-- TIPO CLIENTE
CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
	fidelidade NUMBER(1)
)FINAL;
/
-- TIPO CLIENTE-LOJA
CREATE OR REPLACE TYPE tp_cliente_loja AS OBJECT (
    ID NUMBER(5),
    data_venda DATE,
    produto VARCHAR2(255),
    forma_pagamento VARCHAR(255),
    preco DECIMAL(10,2),
    ID_cupom REF tp_cupom,
    CPF_cliente REF tp_cliente,
    CNPJ_loja REF tp_loja
);
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
    OVERRIDING MEMBER PROCEDURE print_info IS
    	BEGIN 
    		DBMS_OUTPUT.PUT_LINE(nome);
        	DBMS_OUTPUT.PUT_LINE(cpf);
        	DBMS_OUTPUT.PUT_LINE(CNPJ);
        	DBMS_OUTPUT.PUT_LINE(cargo);
    	END;
END;
/