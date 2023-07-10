-- Inserção de dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (CPF, NOME, DATA_NASCIMENTO, TELEFONE, ENDERECO)
VALUES
(12345678901, 'João Silva', '1990-05-15', '987654321', 'Rua A, 123'),
(23456789012, 'Maria Santos', '1988-10-20', '987654322', 'Rua B, 456'),
(34567890123, 'Pedro Oliveira', '1995-03-10', '987654323', 'Rua C, 789'),
(45678901234, 'Ana Souza', '1992-07-05', '987654324', 'Rua D, 987'),
(56789012345, 'Carlos Mendes', '1993-12-25', '987654325', 'Rua E, 654');

-- Inserção de dados na tabela CORRETOR
INSERT INTO CORRETOR (CRECI, ESPECIALIDADE, TOTAL_ALUGUEIS, CPF)
VALUES
(12345, 'Apartamentos', 10, 12345678901),
(23456, 'Casas', 5, 23456789012),
(34567, 'Terrenos', 3, 34567890123),
(45678, 'Comercial', 8, 45678901234),
(56789, 'Rural', 2, 56789012345);

-- Inserção de dados na tabela FUNCIONARIO_ADM
INSERT INTO FUNCIONARIO_ADM (MATRICULA, CARGO, CPF)
VALUES
(1234, 'Gerente', 12345678901),
(2345, 'Supervisor', 23456789012),
(3456, 'Assistente Administrativo', 34567890123),
(4567, 'Contador', 45678901234),
(5678, 'Recursos Humanos', 56789012345);

-- Inserção de dados na tabela INQUILINO
INSERT INTO INQUILINO (CODIGO_INQ, ENDERECO, TELEFONE_1, TELEFONE_2, EMAIL)
VALUES
(1, 'Rua X, 123', '876543210', '876543211', 'inquilino1@example.com'),
(2, 'Rua Y, 456', '876543212', '876543213', 'inquilino2@example.com'),
(3, 'Rua Z, 789', '876543214', '876543215', 'inquilino3@example.com'),
(4, 'Rua W, 987', '876543216', '876543217', 'inquilino4@example.com'),
(5, 'Rua V, 654', '876543218', '876543219', 'inquilino5@example.com');

-- Inserção de dados na tabela INQUILINO_PF
INSERT INTO INQUILINO_PF (CPF, NOME, CODIGO_INQ)
VALUES
(12345678901, 'Lucas Lima', 1),
(23456789012, 'Laura Fernandes', 2),
(34567890123, 'Luiz Castro', 3),
(45678901234, 'Lívia Almeida', 4),
(56789012345, 'Leonardo Gomes', 5);

-- Inserção de dados na tabela INQUILINO_PJ
INSERT INTO INQUILINO_PJ (CNPJ, RAZAO_SOCIAL, CPF_RESP, NOME_RESP, CODIGO_INQ)
VALUES
(12345678901234, 'Empresa A', 12345678901, 'João Silva', 1),
(23456789012345, 'Empresa B', 23456789012, 'Maria Santos', 2),
(34567890123456, 'Empresa C', 34567890123, 'Pedro Oliveira', 3),
(45678901234567, 'Empresa D', 45678901234, 'Ana Souza', 4),
(56789012345678, 'Empresa E', 56789012345, 'Carlos Mendes', 5);

-- Inserção de dados na tabela ATENDIMENTO
INSERT INTO ATENDIMENTO (CRECI, COD_INQ)
VALUES
(12345, 1),
(23456, 2),
(34567, 3),
(45678, 4),
(56789, 5);

-- Inserção de dados na tabela PROPRIETARIO
INSERT INTO PROPRIETARIO (CODIGO_PROP, ENDERECO, TELEFONE_1, TELEFONE_2, EMAIL)
VALUES
(1, 'Rua P, 123', '765432109', '765432110', 'proprietario1@example.com'),
(2, 'Rua Q, 456', '765432111', '765432112', 'proprietario2@example.com'),
(3, 'Rua R, 789', '765432113', '765432114', 'proprietario3@example.com'),
(4, 'Rua S, 987', '765432115', '765432116', 'proprietario4@example.com'),
(5, 'Rua T, 654', '765432117', '765432118', 'proprietario5@example.com');

-- Inserção de dados na tabela PROPRIETARIO_PF
INSERT INTO PROPRIETARIO_PF (CPF, NOME, CODIGO_PROP)
VALUES
(12345678901, 'Rafaela Alves', 1),
(23456789012, 'Rodrigo Castro', 2),
(34567890123, 'Renata Sousa', 3),
(45678901234, 'Ricardo Lima', 4),
(56789012345, 'Roberta Gomes', 5);

-- Inserção de dados na tabela PROPRIETARIO_PJ
INSERT INTO PROPRIETARIO_PJ (CNPJ, RAZAO_SOCIAL, CPF_RESP, NOME_RESP, CODIGO_PROP)
VALUES
(12345678901234, 'Empresa F', 12345678901, 'Rafaela Alves', 1),
(23456789012345, 'Empresa G', 23456789012, 'Rodrigo Castro', 2),
(34567890123456, 'Empresa H', 34567890123, 'Renata Sousa', 3),
(45678901234567, 'Empresa I', 45678901234, 'Ricardo Lima', 4),
(56789012345678, 'Empresa J', 56789012345, 'Roberta Gomes', 5);

-- Inserção de dados na tabela CONDOMINIO
INSERT INTO CONDOMINIO (CODIGO_COND, NOME, ADMINISTRADORA, TELEFONE, EMAIL)
VALUES
(1, 'Condomínio A', 'Administradora A', '654321098', 'condominio1@example.com'),
(2, 'Condomínio B', 'AdministradoraB', '654321099', 'condominio2@example.com'),
(3, 'Condomínio C', 'Administradora C', '654321100', 'condominio3@example.com'),
(4, 'Condomínio D', 'Administradora D', '654321101', 'condominio4@example.com'),
(5, 'Condomínio E', 'Administradora E', '654321102', 'condominio5@example.com');

-- Inserção de dados na tabela IMOVEL
INSERT INTO IMOVEL (CODIGO_IM, ENDERECO, IPTU, COD_PROP, COD_COND)
VALUES
(1, 'Rua U, 123', 1000, 1, 1),
(2, 'Rua V, 456', 1500, 2, 2),
(3, 'Rua W, 789', 2000, 3, 3),
(4, 'Rua X, 987', 2500, 4, 4),
(5, 'Rua Y, 654', 3000, 5, 5);

-- Inserção de dados na tabela ALUGUEL
INSERT INTO ALUGUEL (ID_CONTRATO, CRECI_CORRETOR, DATA_INICIO, DATA_FIM, VALOR, GARANTIA, COD_INQ, COD_IM)
VALUES
(1, 12345, '2023-01-01', '2023-12-31', 1000.00, 'Caução', 1, 1),
(2, 23456, '2023-02-01', '2023-11-30', 1500.00, 'Fiança', 2, 2),
(3, 34567, '2023-03-01', '2023-10-31', 2000.00, 'Caução', 3, 3),
(4, 45678, '2023-04-01', '2023-09-30', 2500.00, 'Fiança', 4, 4),
(5, 56789, '2023-05-01', '2023-08-31', 3000.00, 'Caução', 5, 5);

-- Inserção de dados na tabela PAGAMENTOS
INSERT INTO PAGAMENTOS (ID_CONTRATO, DATA_VENCIMENTO, DATA_PAGAMENTO, VALOR_PAGO)
VALUES
(1, '2023-02-01', '2023-02-05', 1000.00),
(1, '2023-03-01', '2023-03-07', 1000.00),
(2, '2023-03-01', '2023-03-05', 1500.00),
(2, '2023-04-01', '2023-04-08', 1500.00),
(3, '2023-04-01', '2023-04-06', 2000.00),
(3, '2023-05-01', '2023-05-07', 2000.00),
(4, '2023-05-01', '2023-05-05', 2500.00),
(4, '2023-06-01', '2023-06-06', 2500.00),
(5, '2023-06-01', '2023-06-07', 3000.00),
(5, '2023-07-01', NULL, 3000.00);

-- Inserção de dados na tabela PRESTADOR_SERVICO
INSERT INTO PRESTADOR_SERVICO (CPF, NOME, ESPECIALIDADE)
VALUES
(12345678901, 'Fulano Silva', 'Encanador'),
(23456789012, 'Ciclano Souza', 'Eletricista'),
(34567890123, 'Beltrano Santos', 'Pedreiro'),
(45678901234, 'José Oliveira', 'Pintor'),
(56789012345, 'Maria Rodrigues', 'Jardineiro');

-- Inserção de dados na tabela MANUTENCAO
INSERT INTO MANUTENCAO (COD_MANUT, TITULO, DESCRICAO, DATA, VALOR, COD_IM, CPF, MATRICULA)
VALUES
(1, 'Vazamento de Água', 'Consertar vazamento no banheiro', '2023-01-05', 150.00, 1, 12345678901, 1234),
(2, 'Problema Elétrico', 'Verificar falha na iluminação', '2023-02-10', 200.00, 2, 23456789012, 2345),
(3, 'Reforma da Cozinha', 'Realizar reforma completa na cozinha', '2023-03-15', 2500.00, 3, 34567890123, 3456),
(4, 'Pintura da Sala', 'Pintar a sala de estar', '2023-04-20', 300.00, 4, 45678901234, 4567),
(5, 'Manutenção do Jardim', 'Podar árvores e plantas do jardim', '2023-05-25', 100.00, 5, 56789012345, 5678);
