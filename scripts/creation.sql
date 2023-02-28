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
  CONSTRAINT Partida_fkey FOREIGN KEY (Time) REFERENCES Time (Divisao)
);

CREATE TABLE Cargos (
  Funcao varchar(255) NOT NULL,
  Salario decimal(10,2) NOT NULL,
  CONSTRAINT Cargos_pkey PRIMARY KEY (FUNCAO)
)
  
CREATE TABLE Telefone (
  Pessoa varchar(14) NOT NULL,
  Num_Telefone number(11) NOT NULL,
  CONSTRAINT Telefone_pkey PRIMARY KEY (Pessoa, Num_Telefone),
  CONSTRAINT Telefone_fkey FOREIGN KEY (Pessoa) REFERENCES Pessoa (CPF)
)
  
CREATE TABLE Jogador (
  CPF varchar(14) NOT NULL,
  Numero number(2) NOT NULL,
  Posicao varchar(255) NOT NULL,
  Time varchar(5) NOT NULL,
  Escalacao varchar(3) NOT NULL,
  CONSTRAINT Jogador_pkey PRIMARY KEY (CPF),
  CONSTRAINT Jogador_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Jogador_fkey1 FOREIGN KEY (Time) REFERENCES Time(Divisao)
)

CREATE TABLE Funcionario (
  CPF varchar(14) NOT NULL,
  Supervisor varchar(14) NOT NULL,
  CNPJ varchar(255) NOT NULL,
  Cargo varchar(5) NOT NULL,
  CONSTRAINT Funcionario_pkey PRIMARY KEY (CPF),
  CONSTRAINT Funcionario_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Funcionario_fkey1 FOREIGN KEY (Supervisor) REFERENCES Funcionario(CPF), 
  CONSTRAINT Funcionario_fkey2 FOREIGN KEY (CNPJ) REFERENCES Clube(CNPJ),
  CONSTRAINT Funcionario_fkey3 FOREIGN KEY (Cargo) REFERENCES Cargos(Funcao)
)