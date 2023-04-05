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

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('011', TO_DATE('21/10/2002', 'dd/mm/yy'), 'Mirella', 'Sarubbo');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('012', TO_DATE('08/12/2002', 'dd/mm/yy'), 'Bruna', 'Queiroz');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('013', TO_DATE('02/10/2002', 'dd/mm/yy'), 'Analice', 'Azevedo');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('014', TO_DATE('24/07/2003', 'dd/mm/yy'), 'Manuela', 'Duarte');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('015', TO_DATE('02/09/2002', 'dd/mm/yy'), 'Mariah', 'Lustosa');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('016', TO_DATE('05/08/1998', 'dd/mm/yy'), 'João', 'Duarte');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('017', TO_DATE('26/09/2000', 'dd/mm/yy'), 'Lucas', 'Torres');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('018', TO_DATE('04/08/2001', 'dd/mm/yy'), 'Vitoria', 'Lucena');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('019', TO_DATE('29/07/2001', 'dd/mm/yy'), 'Roberto', 'Cavalcanti');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('020', TO_DATE('07/04/2003', 'dd/mm/yy'), 'Sofia', 'Costa');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('021', TO_DATE('06/09/2001', 'dd/mm/yy'), 'Pedro', 'Castro');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('022', TO_DATE('26/01/2000', 'dd/mm/yy'), 'Roberto', 'Almeida');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('023', TO_DATE('05/05/2002', 'dd/mm/yy'), 'Camille', 'Macedo');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('024', TO_DATE('28/01/1997', 'dd/mm/yy'), 'Gabriela', 'Lucena');

INSERT INTO Pessoa(CPF, Data_Nasc, Nome, Sobrenome)
VALUES ('025', TO_DATE('31/07/2001', 'dd/mm/yy'), 'Leticia', 'Bueno');

-- Endereco
INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('51030-400', 1, 'Recife', 'Boa Viagem', 'Rua Dona Uzinha Nunes');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('02001-000', 2, 'Recife', 'Aflitos', 'Rua Voluntarios da Patria');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('03001-000', 3, 'Sao Paulo', 'Bras', 'Rua Barao de Ladario');

INSERT INTO Endereco(CEP, Numero, Cidade, Bairro, Rua)
VALUES ('04001-000', 4, 'Sao Paulo', 'Moema', 'Av. Ibirapuera');


-- Clube
INSERT INTO Clube(CNPJ, Nome_clube, Email, CEP, Num_endereco)
VALUES ('12345678901234', 'Clube Clara', 'clara@email.com', '51030-400', 1);

-- Equipe
INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub20', 'Feminino', 'Liga 1', '12345678901234');

INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub17', 'Masculino', 'Liga 2', '12345678901234');

INSERT INTO Equipe(Divisao, Modalidade, Liga, CNPJ_Clube)
VALUES ('Sub15', 'Feminino', 'Liga 3', '12345678901234');

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

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('24/02/2023', 'dd/mm/yy'), 'Bayer', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('22/02/2023', 'dd/mm/yy'), 'Tottenham', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('20/02/2023', 'dd/mm/yy'), 'Liverpool', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('18/02/2023', 'dd/mm/yy'), 'Manchester', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('16/02/2023', 'dd/mm/yy'), 'Chelsea', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('05/01/2023', 'dd/mm/yy'), 'Juventus', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('07/01/2023', 'dd/mm/yy'), 'Arsenal', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('13/01/2023', 'dd/mm/yy'), 'Santos', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('18/01/2023', 'dd/mm/yy'), 'Flamengo', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('20/01/2023', 'dd/mm/yy'), 'Palmeiras', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('24/01/2023', 'dd/mm/yy'), 'Fluminense', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('26/01/2023', 'dd/mm/yy'), 'Corinthians', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('28/01/2023', 'dd/mm/yy'), 'Sport Popoti', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('31/01/2023', 'dd/mm/yy'), 'Santinha', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('03/12/2022', 'dd/mm/yy'), 'Nautico', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('07/12/2022', 'dd/mm/yy'), 'Botafuego', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('09/12/2022', 'dd/mm/yy'), 'Milan', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('11/12/2022', 'dd/mm/yy'), 'Boca Juniors', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('15/12/2022', 'dd/mm/yy'), 'Ibis', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('25/12/2022', 'dd/mm/yy'), 'Vasco', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('01/11/2022', 'dd/mm/yy'), 'Internacional', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('05/11/2022', 'dd/mm/yy'), 'Cruzeiro', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('07/11/2022', 'dd/mm/yy'), 'Afeta o Grêmio', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('14/11/2022', 'dd/mm/yy'), 'São Paulo', 'Derrota');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('19/11/2022', 'dd/mm/yy'), 'Benfica', 'Vitoria');

INSERT INTO Partida(Data_Partida, Adversario, Resultado) 
VALUES (TO_DATE('28/11/2022', 'dd/mm/yy'), 'Ajax', 'Vitoria');


-- Cargos
INSERT INTO Cargos(Funcao, Salario) VALUES ('Tecnico', 15000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Preparador fisico', 8000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Medico', 10000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Massagista', 3000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Psicologo', 5000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Administrador', 20000.00);
INSERT INTO Cargos(Funcao, Salario) VALUES ('Nutricionista', 5000.00);


-- Telefone
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('006', 12345678901);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('007', 23456789012);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('008', 34567890123);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('009', 45678901234);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('009', 76548901234);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('011', 56789012345);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('019', 67890123456);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('019', 67890432156);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('021', 78901234567);
INSERT INTO Telefone(Pessoa, Num_Telefone) VALUES ('022', 89012345678);


-- Jogador
-- obs : sub 20 e sub 15: feminino
-- sub 17 e sub 13: masculino
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

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('011', 7, 'Atacante', 'Sub20', 'Reserva');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('012', 15, 'Goleiro', 'Sub15', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('015', 20, 'Lateral Esquerdo', 'Sub20', 'Reserva');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('016', 2, 'Goleiro ', 'Sub17', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('017', 3, 'Lateral Direito', 'Sub13', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('019', 11, 'Atacante', 'Sub17', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('020', 9, 'Atacante', 'Sub17', 'Reserva');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('022', 14, 'Atacante', 'Sub13', 'Titular');

INSERT INTO Jogador(CPF, Numero, Posicao, Equipe_Jogador, Escalacao)
VALUES ('024', 4, 'Zagueiro', 'Sub20', 'Reserva');


-- Funcionario
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('006', NULL, '12345678901234', 'Tecnico');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('007', '006', '12345678901234', 'Preparador fisico');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('009', '006', '12345678901234', 'Massagista');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('013', '006', '12345678901234', 'Psicologo');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('014', NULL, '12345678901234', 'Administrador');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('018', NULL, '12345678901234', 'Tecnico');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('020', '018', '12345678901234', 'Massagista');
INSERT INTO Funcionario(CPF, Supervisor, CNPJ, Cargo) VALUES ('025', '018', '12345678901234', 'Nutricionista');


-- Cliente
INSERT INTO Cliente(CPF) VALUES ('008');
INSERT INTO Cliente(CPF) VALUES ('010');
INSERT INTO Cliente(CPF) VALUES ('011');
INSERT INTO Cliente(CPF) VALUES ('013');
INSERT INTO Cliente(CPF) VALUES ('016');
INSERT INTO Cliente(CPF) VALUES ('018');
INSERT INTO Cliente(CPF) VALUES ('020');
INSERT INTO Cliente(CPF) VALUES ('021');
INSERT INTO Cliente(CPF) VALUES ('023');
INSERT INTO Cliente(CPF) VALUES ('025');

-- Loja
CREATE SEQUENCE loja_seq START WITH 1;
INSERT INTO Loja(ID, CEP, Numero) VALUES (loja_seq.NEXTVAL, '51030-400', 1);
INSERT INTO Loja(ID, CEP, Numero) VALUES (loja_seq.NEXTVAL, '02001-000', 2);
INSERT INTO Loja(ID, CEP, Numero) VALUES (loja_seq.NEXTVAL, '03001-000', 3);


-- Cupom
INSERT INTO Cupom(Codigo, Desconto_porcentagem) VALUES ('ABCD01', 10);
INSERT INTO Cupom(Codigo, Desconto_porcentagem) VALUES ('EFGH02', 20);


-- Cliente_loja
INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('01/03/2023', 'dd/mm/yy'), 'Camiseta', 1, '008', 'ABCD01', 'Cartão de credito', 49.99);


INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('28/02/2023', 'dd/mm/yy'), 'Tenis', 2, '008', NULL, 'Pix', 199.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('02/03/2023', 'dd/mm/yy'), 'Bolsa', 2, '011', 'EFGH02', 'Pix', 59.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('02/03/2023', 'dd/mm/yy'), 'Bola', 2, '013', NULL, 'Pix', 79.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('15/02/2023', 'dd/mm/yy'), 'Camiseta', 1, '016', NULL, 'Cartão de Debito', 49.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('16/02/2023', 'dd/mm/yy'), 'Tenis', 3, '018', 'ABCD01', 'Cartão de credito', 199.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('25/02/2023', 'dd/mm/yy'), 'Camiseta', 2, '020', 'ABCD01', 'Pix', 49.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('02/03/2023', 'dd/mm/yy'), 'Garrafa', 1, '021', NULL, 'Pix', 39.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('02/03/2023', 'dd/mm/yy'), 'Camiseta', 3, '021', NULL, 'Pix', 49.99);

INSERT INTO Cliente_loja(Data_venda, Produto, ID, CPF, Codigo, Forma_pagamento, Preco)
VALUES (TO_DATE('25/02/2023', 'dd/mm/yy'), 'Tenis', 1, '025', 'EFGH02', 'Pix', 199.99);


-- Jogar
INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Estadio Municipal', TO_DATE('26/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Nacional', TO_DATE('28/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('01/03/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Arena do Povo', TO_DATE('24/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Estadio Municipal', TO_DATE('22/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Arena do Povo', TO_DATE('20/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('18/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Arena do Povo', TO_DATE('16/02/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Municipal', TO_DATE('05/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Nacional', TO_DATE('07/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Estadio Nacional', TO_DATE('13/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Arena do Povo', TO_DATE('18/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Arena do Povo', TO_DATE('20/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Municipal', TO_DATE('24/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('26/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Arena do Povo', TO_DATE('28/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Estadio Municipal', TO_DATE('31/01/2023', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Arena do Povo', TO_DATE('03/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Nacional', TO_DATE('07/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Estadio Municipal', TO_DATE('09/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('11/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Estadio Nacional', TO_DATE('15/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Estadio Municipal', TO_DATE('25/12/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Estadio Municipal', TO_DATE('01/11/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Arena do Povo', TO_DATE('05/11/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub17', 'Arena do Povo', TO_DATE('07/11/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub15', 'Estadio Nacional', TO_DATE('14/11/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub13', 'Estadio Municipal', TO_DATE('19/11/2022', 'dd/mm/yy'));

INSERT INTO Jogar(Equipe_Jogo, Nome_Estadio, Data_Jogo)
VALUES ('Sub20', 'Arena do Povo', TO_DATE('28/11/2022', 'dd/mm/yy'));

SELECT * FROM Pessoa;
SELECT * FROM Jogador;
SELECT * FROM Funcionario;
SELECT * FROM Cliente;
SELECT * FROM Clube;
SELECT * FROM Equipe;
SELECT * FROM Estadio;
SELECT * FROM Partida;
SELECT * FROM Jogar;
SELECT * FROM Loja;
SELECT * FROM Cupom;
SELECT * FROM Cliente_Loja;

