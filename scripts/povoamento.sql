ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';

-- Pessoa
INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome) 
VALUES ('001', TO_DATE('25/12/2003', 'dd/mm/yy'), 'Clara', 'Kenderessy');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('002', TO_DATE('05/07/2001', 'dd/mm/yy'), 'Felipo', 'Raeli');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('003', TO_DATE('28/11/1997', 'dd/mm/yy'), 'Lucas', 'Souza');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('004', TO_DATE('31/07/2003', 'dd/mm/yy'), 'Beatriz', 'Ferre');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('005', TO_DATE('27/06/2003', 'dd/mm/yy'), 'Luiza', 'Diniz');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome) 
VALUES ('006', TO_DATE('12/12/1980', 'dd/mm/yy'), 'Paulo', 'Marcos');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('007', TO_DATE('11/07/1985', 'dd/mm/yy'), 'Roberto', 'Delirio');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('008', TO_DATE('28/05/1997', 'dd/mm/yy'), 'Jonas', 'Denis');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('009', TO_DATE('05/02/1999', 'dd/mm/yy'), 'Joao', 'Lendo');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('010', TO_DATE('22/03/2005', 'dd/mm/yy'), 'Ringo', 'Estrela');


-- Endereco
INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('51030-400', 1, 'Recife', 'Boa Viagem', 'Rua Dona Uzinha Nunes');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('02001-000', 2, 'Recife', 'Aflitos', 'Rua Voluntários da Pátria');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('03001-000', 3, 'São Paulo', 'Brás', 'Rua Barão de Ladário');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('04001-000', 4, 'São Paulo', 'Moema', 'Av. Ibirapuera');


-- Clube
INSERT INTO Clube(CNPJ, Nome_clube, Email, CEP, Num_endereco)
VALUES ('12345678901234', 'Clube Clara', 'clara@email.com', '51030-400', 1);

-- Equipe
INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub20', 'Feminino', 'Liga 1', '12345678901234');

INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub17', 'Masculino', 'Liga 2', '12345678901234');

INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub15', 'Femino', 'Liga 3', '12345678901234');

INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub13', 'Masculino', 'Liga 4', '12345678901234');


-- Estadio
INSERT INTO Estadio(Nome, Numero, CEP, CNPJ_Clube, Aluguel, Lotacao) 
VALUES ('Estadio Municipal', 2, '02001-000', '12345678901234', 10000.00, 50000);

INSERT INTO Estadio(Nome, Numero, CEP, CNPJ_Clube, Aluguel, Lotacao) 
VALUES ('Estadio Nacional', 3, '03001-000', '12345678901234', 15000.00, 75000);

INSERT INTO Estadio(Nome, Numero, CEP, CNPJ_Clube, Aluguel, Lotacao) 
VALUES ('Arena do Povo', 4, '04001-000', '12345678901234', 12000.00, 60000);



-- Partida
INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('26/02/2023', 'dd/mm/yy'), 'Real Medeiros', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('28/02/2023', 'dd/mm/yy'), 'Barcelombra', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('01/03/2023', 'dd/mm/yy'), 'Paris Santo Germano', 'Vitoria');



-- Cargos
INSERT INTO Cargos(Funcao, Salario) VALUES ('Técnico', 15000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Preparador físico', 8000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Médico', 10000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Massagista', 3000.00);


-- Telefone
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('006', 12345678901);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('007', 23456789012);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('008', 34567890123);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('009', 45678901234);


-- Jogador
INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('001', 13, 'Lateral Esquerdo', 'Sub20', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('002', 5, 'Zagueiro', 'Sub17', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('003', 1, 'Goleiro', 'Sub13', 'Reserva');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('004', 22, 'Lateral Direito', 'Sub15', 'Reserva');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('005', 10, 'Atacante', 'Sub15', 'Titular');

-- Funcionario
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('006', NULL, '12345678901234', 'Técnico');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('007', '006', '12345678901234', 'Preparador físico');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('009', '006', '12345678901234', 'Massagista');


-- Cliente
INSERT INTO Cliente(CPF) VALUES ('008');
INSERT INTO Cliente(CPF) VALUES ('010');


-- Loja
CREATE SEQUENCE loja_seq START WITH 1;
INSERT INTO Loja(ID, CEP, Numero) VALUES (loja_seq.NEXTVAL, '51030-400', 1);
INSERT INTO Loja(ID, CEP, Numero) VALUES (loja_seq.NEXTVAL, '02001-000', 2);


-- Cupom
INSERT INTO Cupom(Codigo, Desconto_porcentagem) VALUES ('ABCD01', 10);
INSERT INTO Cupom(Codigo, Desconto_porcentagem) VALUES ('EFGH02', 20);


-- Cliente_loja
INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('01/03/2023', 'dd/mm/yy'), 'Camiseta', 1, '008', 'ABCD01', 'Cartão de crédito', 49.99);


INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('28/02/2023', 'dd/mm/yy'), 'Tênis', 2, '008', NULL, 'Pix', 199.99);


-- Jogar
INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Estadio Municipal', TO_DATE('26/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Nacional', TO_DATE('28/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('01/03/2023', 'dd/mm/yy'));