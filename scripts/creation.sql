CREATE TABLE Pessoa ( 
  CPF varchar(14), 
  Data_Nasc date NOT NULL, 
  Nome varchar(255) NOT NULL, 
  Sobrenome varchar(255) NOT NULL, 
  CONSTRAINT Pessoa_pkey PRIMARY KEY (CPF) 
);

CREATE TABLE Endereco (   
  CEP varchar(9),   
  Numero number(4),   
  Cidade varchar(255) NOT NULL,   
  Bairro varchar(255) NOT NULL,  
  Rua varchar(255) NOT NULL,  
  CONSTRAINT Endereco_pkey PRIMARY KEY (Numero, CEP)  
);

CREATE TABLE Clube (     
  CNPJ varchar(18),     
  Nome_clube varchar(255) NOT NULL,     
  Email varchar(255) NOT NULL,      
  CEP varchar(9) NOT NULL,     
  Number_endereco number(4) NOT NULL,    
  CONSTRAINT Clube_pkey PRIMARY KEY (CNPJ),    
  CONSTRAINT Clube_fkey1 FOREIGN KEY (Number_endereco, CEP) REFERENCES Endereco(Numero, CEP) 
);

CREATE TABLE Time (    
  Divisao varchar(5),    
  Modalidade varchar(255) NOT NULL,   
  Liga varchar(255) NOT NULL,   
  CNPJ_Clube varchar(18) NOT NULL,   
  CONSTRAINT Time_pkey PRIMARY KEY (Divisao),   
  CONSTRAINT Time_fkey FOREIGN KEY (CNPJ_Clube) REFERENCES Clube(CNPJ)   
);

CREATE TABLE Estadio (
  Nome varchar(255),
  Numero number(4) NOT NULL,
  CEP varchar(9) NOT NULL,
  CNPJ_Clube varchar(18),
  Aluguel decimal(8,2) NOT NULL,
  Lotacao number(6) NOT NULL,
  CONSTRAINT Estadio_pkey PRIMARY KEY (Nome),
  CONSTRAINT Estadio_fkey1 FOREIGN KEY (Numero, CEP) REFERENCES Endereco (Numero, CEP),
  CONSTRAINT Estadio_fkey2 FOREIGN KEY (CNPJ_Clube) REFERENCES Clube (CNPJ)
);

CREATE TABLE Partida (
  Data_Part date,
  Adversario varchar(255) NOT NULL,
  Vencedor varchar(255) NOT NULL,
  CONSTRAINT Partida_pkey PRIMARY KEY (Data_Part),
);

CREATE TABLE Cargos (
  Funcao varchar(255),
  Salario decimal(10,2) NOT NULL,
  CONSTRAINT Cargos_pkey PRIMARY KEY (FUNCAO)
)
  
CREATE TABLE Telefone (
  Pessoa varchar(14),
  Num_Telefone number(11),
  CONSTRAINT Telefone_pkey PRIMARY KEY (Pessoa, Num_Telefone),
  CONSTRAINT Telefone_fkey FOREIGN KEY (Pessoa) REFERENCES Pessoa (CPF)
)
  
CREATE TABLE Jogador (
  CPF varchar(14),
  Numero number(2) NOT NULL,
  Posicao varchar(255) NOT NULL,
  Time varchar(5) NOT NULL,
  Escalacao varchar(3) NOT NULL,
  CONSTRAINT Jogador_pkey PRIMARY KEY (CPF),
  CONSTRAINT Jogador_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Jogador_fkey1 FOREIGN KEY (Time) REFERENCES Time(Divisao)
)

CREATE TABLE Funcionario (
  CPF varchar(14),
  Supervisor varchar(14),
  CNPJ varchar(255) NOT NULL,
  Cargo varchar(5) NOT NULL,
  CONSTRAINT Funcionario_pkey PRIMARY KEY (CPF),
  CONSTRAINT Funcionario_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF), 
  CONSTRAINT Funcionario_fkey1 FOREIGN KEY (Supervisor) REFERENCES Funcionario(CPF), 
  CONSTRAINT Funcionario_fkey2 FOREIGN KEY (CNPJ) REFERENCES Clube(CNPJ),
  CONSTRAINT Funcionario_fkey3 FOREIGN KEY (Cargo) REFERENCES Cargos(Funcao)
)

CREATE TABLE Cliente (
  CPF varchar(14),
  CONSTRAINT Cliente_pkey PRIMARY KEY (CPF),
  CONSTRAINT Cliente_fkey FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
)

CREATE TABLE Loja (
  ID varchar(2), -- defini com 2 numeros pq clube nao tem mta loja
  CEP varchar(9) NOT NULL,
  Numero number(4) NOT NULL,
  CONSTRAINT Loja_pkey PRIMARY KEY (ID),
  CONSTRAINT Loja_fkey FOREIGN KEY (Numero, CEP) REFERENCES Endereco (Numero, CEP)
)

CREATE TABLE Cupom (
  Codigo varchar(6), -- defini que vai ter 6 codigos como cupons da shopee, ifood etc
  Desconto_porcentagem varchar(3) NOT NULL,
  CONSTRAINT Cupom_pkey PRIMARY KEY (Codigo)
)

CREATE TABLE Cliente_loja (
  Data_venda varchar(8), -- modelo dd/mm/yyyy
  Produto varchar(255),
  ID varchar(2),
  CPF varchar(14),
  Codigo varchar(6),
  Forma_pagamento varchar(255) NOT NULL,
  Preco number(3) NOT NULL,
  CONSTRAINT Cliente_loja_primkey PRIMARY KEY (Data_venda, Produto, ID, CPF),
  CONSTRAINT Cliente_loja_fkey FOREIGN KEY (ID) REFERENCES Loja(ID),
  CONSTRAINT Cliente_loja_fkey1 FOREIGN KEY (CPF) REFERENCES Cliente(CPF),
  CONSTRAINT Cliente_loja_fkey2 FOREIGN KEY (Codigo) REFERENCES Cupom(CODIGO)
)

-- precisa ver isso daqui em relação a tabela de partida pq tem o problema
CREATE TABLE Jogar (
  Time varchar(5),
  Nome_Estadio varchar(255),
  Data_Partida date,
  CONSTRAINT Jogar_pkey PRIMARY KEY (Time, Nome_Estadio, Data_Partida),
  CONSTRAINT Jogar_fkey1 FOREIGN KEY (Time) REFERENCES Time (Nome),
  CONSTRAINT Jogar_fkey2 FOREIGN KEY (Nome_Estadio) REFERENCES Estadio(Nome),
  CONSTRAINT Jogador_fkey3 FOREIGN KEY (Data_Partida) REFERENCES Partida(Data_Part)
)