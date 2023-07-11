-- Inserção na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (CPF, NOME, DATA_NASCIMENTO, TELEFONE, ENDERECO)
VALUES
  (111111111, 'João Silva', '1990-01-01', '1234567890', 'Rua A, 123'),
  (222222222, 'Maria Santos', '1985-05-10', '9876543210', 'Avenida B, 456'),
  (333333333, 'Pedro Oliveira', '1995-09-15', '5555555555', 'Rua C, 789'),
  (444444444, 'Ana Pereira', '1992-03-20', '9999999999', 'Avenida D, 987'),
  (555555555, 'Lucas Souza', '1988-11-25', '7777777777', 'Rua E, 654');

-- Inserção na tabela CORRETOR
INSERT INTO CORRETOR (CRECI, ESPECIALIDADE, CPF)
VALUES
  (111, 'Vendas', 111111111),
  (222, 'Locação', 222222222),
  (333, 'Vendas', 333333333),
  (444, 'Administração de Condomínios', 444444444),
  (555, 'Vendas', 555555555);

-- Inserção na tabela FUNCIONARIO_ADM
INSERT INTO FUNCIONARIO_ADM (MATRICULA, CARGO, CPF)
VALUES
  (1001, 'Gerente', 111111111),
  (1002, 'Supervisor', 222222222),
  (1003, 'Administrador', 333333333),
  (1004, 'Coordenador', 444444444),
  (1005, 'Supervisor', 555555555);

-- Inserção na tabela INQUILINO
INSERT INTO INQUILINO (CODIGO_INQ, ENDERECO, TELEFONE_1, TELEFONE_2, EMAIL)
VALUES
  (10001, 'Rua X, 789', '11111111', '22222222', 'inquilino1@example.com'),
  (10002, 'Avenida Y, 456', '33333333', '44444444', 'inquilino2@example.com'),
  (10003, 'Rua Z, 123', '55555555', '66666666', 'inquilino3@example.com'),
  (10004, 'Avenida W, 987', '77777777', '88888888', 'inquilino4@example.com'),
  (10005, 'Rua V, 654', '99999999', '00000000', 'inquilino5@example.com');

-- Inserção na tabela INQUILINO_PF
INSERT INTO INQUILINO_PF (CPF, NOME, CODIGO_INQ)
VALUES
  (111111111, 'João Silva', 10001),
  (222222222, 'Maria Santos', 10002),
  (333333333, 'Pedro Oliveira', 10003),
  (444444444, 'Ana Pereira', 10004),
  (555555555, 'Lucas Souza', 10005);

-- Inserção na tabela INQUILINO_PJ
INSERT INTO INQUILINO_PJ (CNPJ, RAZAO_SOCIAL, CPF_RESP, NOME_RESP, CODIGO_INQ)
VALUES
  (123456789, 'Empresa A', 111111111, 'João Silva', 10001),
  (987654321, 'Empresa B', 222222222, 'Maria Santos', 10002),
  (456789123, 'Empresa C', 333333333, 'Pedro Oliveira', 10003),
  (321654987, 'Empresa D', 444444444, 'Ana Pereira', 10004),
  (789123456, 'Empresa E', 555555555, 'Lucas Souza', 10005);

-- Inserção na tabela ATENDIMENTO
INSERT INTO ATENDIMENTO (CRECI, COD_INQ)
VALUES
  (111, 10001),
  (222, 10002),
  (333, 10003),
  (444, 10004),
  (555, 10005);

-- Inserção na tabela PROPRIETARIO
INSERT INTO PROPRIETARIO (CODIGO_PROP, ENDERECO, TELEFONE_1, TELEFONE_2, EMAIL)
VALUES
  (20001, 'Rua M, 789', '111111111', '222222222', 'proprietario1@example.com'),
  (20002, 'Avenida N, 456', '333333333', '444444444', 'proprietario2@example.com'),
  (20003, 'Rua O, 123', '555555555', '666666666', 'proprietario3@example.com'),
  (20004, 'Avenida P, 987', '777777777', '888888888', 'proprietario4@example.com'),
  (20005, 'Rua Q, 654', '999999999', '000000000', 'proprietario5@example.com');

-- Inserção na tabela PROPRIETARIO_PF
INSERT INTO PROPRIETARIO_PF (CPF, NOME, CODIGO_PROP)
VALUES
  (111111111, 'João Silva', 20001),
  (222222222, 'Maria Santos', 20002),
  (333333333, 'Pedro Oliveira', 20003),
  (444444444, 'Ana Pereira', 20004),
  (555555555, 'Lucas Souza', 20005);

-- Inserção na tabela PROPRIETARIO_PJ
INSERT INTO PROPRIETARIO_PJ (CNPJ, RAZAO_SOCIAL, CPF_RESP, NOME_RESP, CODIGO_PROP)
VALUES
  (987654321, 'Empresa F', 111111111, 'João Silva', 20001),
  (123456789, 'Empresa G', 222222222, 'Maria Santos', 20002),
  (789456123, 'Empresa H', 333333333, 'Pedro Oliveira', 20003),
  (321654987, 'Empresa I', 444444444, 'Ana Pereira', 20004),
  (654789321, 'Empresa J', 555555555, 'Lucas Souza', 20005);

-- Inserção na tabela CONDOMINIO
INSERT INTO CONDOMINIO (CODIGO_COND, NOME, ADMINISTRADORA, TELEFONE, EMAIL)
VALUES
  (30001, 'Condomínio A', 'Administradora X', '11111111', 'condominio1@example.com'),
  (30002, 'Condomínio B', 'Administradora Y', '22222222', 'condominio2@example.com'),
  (30003, 'Condomínio C', 'Administradora Z', '33333333', 'condominio3@example.com'),
  (30004, 'Condomínio D', 'Administradora W', '44444444', 'condominio4@example.com'),
  (30005, 'Condomínio E', 'Administradora V', '55555555', 'condominio5@example.com');

-- Inserção na tabela IMOVEL
INSERT INTO IMOVEL (CODIGO_IM, ENDERECO, IPTU, COD_PROP, COD_COND)
VALUES
  (40001, 'Rua S, 789', 1000, 20001, 30001),
  (40002, 'Avenida T, 456', 2000, 20002, 30002),
  (40003, 'Rua U, 123', 1500, 20003, 30003),
  (40004, 'Avenida V, 987', 1800, 20004, 30004),
  (40005, 'Rua W, 654', 1200, 20005, 30005);

-- Inserção na tabela ALUGUEL
INSERT INTO ALUGUEL (ID_CONTRATO, CRECI_CORRETOR, DATA_INICIO, DATA_FIM, VALOR, GARANTIA, COD_INQ, COD_IM)
VALUES
  (50001, 111, '2023-01-01', '2023-12-31', 1000.00, 'Caução', 10001, 40001),
  (50002, 222, '2023-02-01', '2024-01-31', 1500.00, 'Fiador', 10002, 40002),
  (50003, 333, '2023-03-01', '2024-02-29', 1200.00, 'Depósito', 10003, 40003),
  (50004, 444, '2023-04-01', '2024-03-31', 1800.00, 'Seguro Fiança', 10004, 40004),
  (50005, 555, '2023-05-01', '2024-04-30', 2000.00, 'Caução', 10005, 40005),
  (50006, 555, '2023-06-01', '2024-05-30', 3000.00, 'Caução 2x', 10005, 40001);

-- Inserção na tabela PAGAMENTOS
INSERT INTO PAGAMENTOS (ID_CONTRATO, DATA_VENCIMENTO, DATA_PAGAMENTO, VALOR_PAGO)
VALUES
  (50001, '2023-01-05', '2023-01-05', 1000.00),
  (50002, '2023-02-05', '2023-02-05', 1500.00),
  (50003, '2023-03-05', '2023-03-05', 1200.00),
  (50004, '2023-04-05', '2023-04-05', 1800.00),
  (50005, '2023-05-05', '2023-05-05', 2000.00);

-- Inserção na tabela PRESTADOR_SERVICO
INSERT INTO PRESTADOR_SERVICO (CPF, NOME, ESPECIALIDADE)
VALUES
  (666666666, 'Fulano Prestador', 'Encanador'),
  (777777777, 'Ciclano Serviços', 'Eletricista'),
  (888888888, 'Beltrano Reparos', 'Pintor'),
  (999999999, 'Empresa Serviços Gerais', 'Limpeza'),
  (101010101, 'Outro Prestador', 'Diversos');

-- Inserção na tabela MANUTENCAO
INSERT INTO MANUTENCAO (COD_MANUT, TITULO, DESCRICAO, DATA, VALOR, COD_IM, CPF, MATRICULA)
VALUES
  (60001, 'Vazamento no banheiro', 'Reparo no encanamento do banheiro', '2023-01-10', 500.00, 40001, 666666666, 1001),
  (60002, 'Problema na instalação elétrica', 'Conserto de fiação elétrica', '2023-02-15', 800.00, 40002, 777777777, 1002),
  (60003, 'Pintura da sala', 'Pintura das paredes da sala', '2023-03-20', 600.00, 40003, 888888888, 1003),
  (60004, 'Limpeza geral', 'Limpeza completa do imóvel', '2023-04-25', 400.00, 40004, 999999999, 1004),
  (60005, 'Reparo na porta', 'Conserto da porta do quarto', '2023-05-30', 300.00, 40005, 101010101, 1005);
