CREATE TABLE Pessoa ( 
  CPF varchar(14) NOT NULL, 
  Data_Nasc date NOT NULL, 
  Nome varchar(255) NOT NULL, 
  Sobrenome varchar(255) NOT NULL, 
  CONSTRAINT Pessoa_pkey PRIMARY KEY (CPF) 
);

CREATE TABLE Endereco (   
  CEP varchar(9) NOT NULL,   
  Numero number(4) NOT NULL,   
  Cidade varchar(255) NOT NULL,   
  Bairro varchar(255) NOT NULL,  
  Rua varchar(255) NOT NULL,  
  CONSTRAINT Endereco_pkey PRIMARY KEY (Numero, CEP)  
);

CREATE TABLE Clube (     
  CNPJ varchar(18) NOT NULL,     
  Nome_clube varchar(255) NOT NULL,     
  Email varchar(255) NOT NULL,      
  CEP varchar(9) NOT NULL,     
  Number_endereco number(4) NOT NULL,    
  CONSTRAINT Clube_pkey PRIMARY KEY (CNPJ),    
  CONSTRAINT Clube_fkey1 FOREIGN KEY (Number_endereco, CEP) REFERENCES Endereco(Numero, CEP) 
);

CREATE TABLE Time (    
  Divisao varchar(5) NOT NULL,    
  Modalidade varchar(255) NOT NULL,   
  Liga varchar(255) NOT NULL,   
  CNPJ_Clube varchar(18) NOT NULL,   
  CONSTRAINT Time_pkey PRIMARY KEY (Divisao),   
  CONSTRAINT Time_fkey FOREIGN KEY (CNPJ_Clube) REFERENCES Clube(CNPJ)   
);

CREATE TABLE Estadio (
  Nome varchar(255) NOT NULL,
  Numero number(4) NOT NULL,
  CEP varchar(9) NOT NULL,
  CNPJ_Clube varchar(18) NOT NULL,
  Aluguel decimal(8,2) NOT NULL,
  Lotacao number(6) NOT NULL,
  CONSTRAINT Estadio_pkey PRIMARY KEY (Nome),
  CONSTRAINT Estadio_fkey1 FOREIGN KEY (Numero, CEP) REFERENCES Endereco (Numero, CEP),
  CONSTRAINT Estadio_fkey2 FOREIGN KEY (CNPJ_Clube) REFERENCES Clube (CNPJ)
);

CREATE TABLE Partida (
  Time varchar(5) NOT NULL,
  Data_Part date NOT NULL,
  Adversario varchar(255) NOT NULL,
  Vencedor varchar(255) NOT NULL,
  CONSTRAINT Partida_pkey PRIMARY KEY (Time, Data_Part),
  CONSTRAINT Estadio_fkey FOREIGN KEY (Time) REFERENCES Time (Divisao)
);