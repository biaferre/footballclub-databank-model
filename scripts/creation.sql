CREATE TABLE Pessoa ( 
  CPF VARCHAR2(14), 
  Data_Nasc DATE NOT NULL, 
  Nome VARCHAR2(255) NOT NULL, 
  Sobrenome VARCHAR2(255) NOT NULL, 
  CONSTRAINT Pessoa_pkey PRIMARY KEY (CPF) 
);

CREATE TABLE Endereco (   
  CEP VARCHAR2(9),   
  Numero NUMBER(4),   
  Cidade VARCHAR2(255) NOT NULL,   
  Bairro VARCHAR2(255) NOT NULL,  
  Rua VARCHAR2(255) NOT NULL,  
  CONSTRAINT Endereco_pkey PRIMARY KEY (Numero, CEP)  
);

CREATE TABLE Clube (     
  CNPJ VARCHAR2(18),     
  Nome_clube VARCHAR2(255) NOT NULL,     
  Email VARCHAR2(255) NOT NULL,      
  CEP VARCHAR2(9) NOT NULL,     
  Num_endereco NUMBER(4) NOT NULL,    
  CONSTRAINT Clube_pkey PRIMARY KEY (CNPJ),    
  CONSTRAINT Clube_fkey1 FOREIGN KEY (Num_endereco, CEP) REFERENCES Endereco(Numero, CEP) 
);

CREATE TABLE Equipe (    
  Divisao VARCHAR2(5),    
  Modalidade VARCHAR2(255) NOT NULL,   
  Liga VARCHAR2(255) NOT NULL,   
  CNPJ_Clube VARCHAR2(18) NOT NULL,   
  CONSTRAINT Equipe_pkey PRIMARY KEY (Divisao),   
  CONSTRAINT Equipe_fkey FOREIGN KEY (CNPJ_Clube) REFERENCES Clube(CNPJ)   
);

CREATE TABLE Estadio (
  Nome VARCHAR2(255),
  Numero NUMBER(4) NOT NULL,
  CEP VARCHAR2(9) NOT NULL,
  CNPJ_Clube VARCHAR2(18),
  Aluguel DECIMAL(8,2) NOT NULL,
  Lotacao NUMBER(6) NOT NULL,
  CONSTRAINT Estadio_pkey PRIMARY KEY (Nome),
  CONSTRAINT Estadio_fkey1 FOREIGN KEY (Numero, CEP) REFERENCES Endereco (Numero, CEP),
  CONSTRAINT Estadio_fkey2 FOREIGN KEY (CNPJ_Clube) REFERENCES Clube (CNPJ)
);

CREATE TABLE Partida (
  Data_Partida DATE,
  Adversario VARCHAR2(255) NOT NULL,
  Resultado VARCHAR2(255) NOT NULL,
  CONSTRAINT Partida_pkey PRIMARY KEY (Data_Partida)
);

CREATE TABLE Cargos (
  Funcao VARCHAR2(255),
  Salario DECIMAL(10,2) NOT NULL CHECK (Salario >= 1320.00),
  CONSTRAINT Cargos_pkey PRIMARY KEY (Funcao)
);
  
CREATE TABLE Telefone (
  Pessoa VARCHAR2(14),
  Num_Telefone NUMBER(11),
  CONSTRAINT Telefone_pkey PRIMARY KEY (Pessoa, Num_Telefone),
  CONSTRAINT Telefone_fkey FOREIGN KEY (Pessoa) REFERENCES Pessoa (CPF)
);
  
CREATE TABLE Jogador (
  CPF VARCHAR2(14),
  Numero NUMBER(2) NOT NULL,
  Posicao VARCHAR2(255) NOT NULL,
  Equipe_Jogador VARCHAR2(5) NOT NULL,
  Escalacao VARCHAR2(7) NOT NULL,
  CONSTRAINT Jogador_pkey PRIMARY KEY (CPF),
  CONSTRAINT Jogador_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Jogador_fkey1 FOREIGN KEY (Equipe_Jogador) REFERENCES Equipe(Divisao)
);

CREATE TABLE Funcionario (
  CPF VARCHAR2(14),
  Supervisor VARCHAR2(14),
  CNPJ VARCHAR2(255) NOT NULL,
  Cargo VARCHAR2(255) NOT NULL,
  CONSTRAINT Funcionario_pkey PRIMARY KEY (CPF),
  CONSTRAINT Funcionario_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Funcionario_fkey1 FOREIGN KEY (Supervisor) REFERENCES Funcionario(CPF), 
  CONSTRAINT Funcionario_fkey2 FOREIGN KEY (CNPJ) REFERENCES Clube(CNPJ),
  CONSTRAINT Funcionario_fkey3 FOREIGN KEY (Cargo) REFERENCES Cargos(Funcao)
);

CREATE TABLE Cliente (
  CPF VARCHAR2(14),
  Fidelidade NUMBER(1),
  CONSTRAINT Cliente_pkey PRIMARY KEY (CPF),
  CONSTRAINT Cliente_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Loja (
  CNPJ VARCHAR2(18), -- mudei para number para usarmos o create sequence
  CEP VARCHAR2(9) NOT NULL,
  Numero NUMBER(4) NOT NULL,
  CONSTRAINT Loja_pkey PRIMARY KEY (CNPJ),
  CONSTRAINT Loja_fkey FOREIGN KEY (Numero, CEP) REFERENCES Endereco (Numero, CEP)
);

CREATE TABLE Cupom (
  ID NUMBER, -- defini que vai ter 6 codigos como cupons da shopee, ifood etc
  Desconto_porcentagem NUMBER NOT NULL,
  CONSTRAINT Cupom_pkey PRIMARY KEY (ID)
);

CREATE TABLE Cliente_loja (
  Data_venda DATE NOT NULL, -- modelo dd/mm/yyyy
  Produto VARCHAR2(255),
  CNPJ_Loja VARCHAR2(18),
  CPF VARCHAR2(14),
  ID_Cupom NUMBER, 
  Forma_pagamento VARCHAR2(255) NOT NULL, 
  Preco NUMBER NOT NULL,
  CONSTRAINT Cliente_loja_primkey PRIMARY KEY (Data_venda, Produto, CNPJ_Loja, CPF),
  CONSTRAINT Cliente_loja_fkey FOREIGN KEY (CNPJ_Loja) REFERENCES Loja(CNPJ),
  CONSTRAINT Cliente_loja_fkey1 FOREIGN KEY (CPF) REFERENCES Cliente(CPF),
  CONSTRAINT Cliente_loja_fkey2 FOREIGN KEY (ID_Cupom) REFERENCES Cupom(ID)
);

-- precisa ver isso daqui em relação a tabela de partida pq tem o problema
CREATE TABLE Jogar (
  Equipe_Jogo VARCHAR2(5),
  Nome_Estadio VARCHAR2(255),
  Data_Jogo DATE,
  CONSTRAINT Jogar_pkey PRIMARY KEY (Equipe_Jogo, Nome_Estadio, Data_Jogo),
  CONSTRAINT Jogar_fkey1 FOREIGN KEY (Equipe_Jogo) REFERENCES Equipe(Divisao),
  CONSTRAINT Jogar_fkey2 FOREIGN KEY (Nome_Estadio) REFERENCES Estadio(Nome),
  CONSTRAINT Jogador_fkey3 FOREIGN KEY (Data_Jogo) REFERENCES Partida(Data_Partida)
);