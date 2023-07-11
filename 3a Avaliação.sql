-- Tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
  CPF INT PRIMARY KEY,
  NOME VARCHAR(100),
  DATA_NASCIMENTO DATE,
  TELEFONE VARCHAR(20),
  ENDERECO VARCHAR(200)
);

-- Tabela CORRETOR
CREATE TABLE CORRETOR (
  CRECI INT PRIMARY KEY,
  ESPECIALIDADE VARCHAR(100),
  CPF INT REFERENCES FUNCIONARIO(CPF)
);

-- Tabela FUNCIONARIO_ADM
CREATE TABLE FUNCIONARIO_ADM (
  MATRICULA INT PRIMARY KEY,
  CARGO VARCHAR(100),
  CPF INT REFERENCES FUNCIONARIO(CPF)
);

-- Tabela INQUILINO
CREATE TABLE INQUILINO (
  CODIGO_INQ INT PRIMARY KEY,
  ENDERECO VARCHAR(200),
  TELEFONE_1 VARCHAR(20),
  TELEFONE_2 VARCHAR(20),
  EMAIL VARCHAR(100)
);

-- Tabela INQUILINO_PF
CREATE TABLE INQUILINO_PF (
  CPF INT PRIMARY KEY,
  NOME VARCHAR(100),
  CODIGO_INQ INT REFERENCES INQUILINO(CODIGO_INQ)
);

-- Tabela INQUILINO_PJ
CREATE TABLE INQUILINO_PJ (
  CNPJ INT PRIMARY KEY,
  RAZAO_SOCIAL VARCHAR(100),
  CPF_RESP INT,
  NOME_RESP VARCHAR(100),
  CODIGO_INQ INT REFERENCES INQUILINO(CODIGO_INQ)
);

-- Tabela ATENDIMENTO
CREATE TABLE ATENDIMENTO (
  CRECI INT REFERENCES CORRETOR(CRECI),
  COD_INQ INT REFERENCES INQUILINO(CODIGO_INQ),
  PRIMARY KEY (CRECI, COD_INQ)
);

-- Tabela PROPRIETARIO
CREATE TABLE PROPRIETARIO (
  CODIGO_PROP INT PRIMARY KEY,
  ENDERECO VARCHAR(200),
  TELEFONE_1 VARCHAR(20),
  TELEFONE_2 VARCHAR(20),
  EMAIL VARCHAR(100)
);

-- Tabela PROPRIETARIO_PF
CREATE TABLE PROPRIETARIO_PF (
  CPF INT PRIMARY KEY,
  NOME VARCHAR(100),
  CODIGO_PROP INT REFERENCES PROPRIETARIO(CODIGO_PROP)
);

-- Tabela PROPRIETARIO_PJ
CREATE TABLE PROPRIETARIO_PJ (
  CNPJ INT PRIMARY KEY,
  RAZAO_SOCIAL VARCHAR(100),
  CPF_RESP INT,
  NOME_RESP VARCHAR(100),
  CODIGO_PROP INT REFERENCES PROPRIETARIO(CODIGO_PROP)
);

-- Tabela CONDOMINIO
CREATE TABLE CONDOMINIO (
  CODIGO_COND INT PRIMARY KEY,
  NOME VARCHAR(100),
  ADMINISTRADORA VARCHAR(100),
  TELEFONE VARCHAR(20),
  EMAIL VARCHAR(100)
);

-- Tabela IMOVEL
CREATE TABLE IMOVEL (
  CODIGO_IM INT PRIMARY KEY,
  ENDERECO VARCHAR(200),
  IPTU INT,
  COD_PROP INT REFERENCES PROPRIETARIO(CODIGO_PROP),
  COD_COND INT REFERENCES CONDOMINIO(CODIGO_COND)
);

-- Tabela ALUGUEL
CREATE TABLE ALUGUEL (
  ID_CONTRATO INT PRIMARY KEY,
  CRECI_CORRETOR INT REFERENCES CORRETOR(CRECI),
  DATA_INICIO DATE,
  DATA_FIM DATE,
  VALOR DECIMAL(10, 2),
  GARANTIA TEXT,
  COD_INQ INT REFERENCES INQUILINO(CODIGO_INQ),
  COD_IM INT REFERENCES IMOVEL(CODIGO_IM)
);

-- Tabela PAGAMENTOS
CREATE TABLE PAGAMENTOS (
  ID_CONTRATO INT REFERENCES ALUGUEL(ID_CONTRATO),
  DATA_VENCIMENTO DATE,
  DATA_PAGAMENTO DATE,
  VALOR_PAGO DECIMAL(10, 2),
  PRIMARY KEY (ID_CONTRATO, DATA_VENCIMENTO)
);

-- Tabela PRESTADOR_SERVICO
CREATE TABLE PRESTADOR_SERVICO (
  CPF INT PRIMARY KEY,
  NOME VARCHAR(100),
  ESPECIALIDADE VARCHAR(100)
);

-- Tabela MANUTENCAO
CREATE TABLE MANUTENCAO (
  COD_MANUT INT PRIMARY KEY,
  TITULO VARCHAR(100),
  DESCRICAO TEXT,
  DATA DATE,
  VALOR DECIMAL(10, 2),
  COD_IM INT REFERENCES IMOVEL(CODIGO_IM),
  CPF INT REFERENCES PRESTADOR_SERVICO(CPF),
  MATRICULA INT REFERENCES FUNCIONARIO_ADM(MATRICULA)
);




-- CONSULTA UTILIZANDO EXISTS: MOSTRE QUAIS IMÓVEIS ESTÃO ALUGADOS 
SELECT *
FROM IMOVEL i
WHERE EXISTS (
  SELECT *
  FROM ALUGUEL a
  WHERE a.COD_IM = i.CODIGO_IM
);



-- CONSULTA UTILIZANDO HAVING: MOSTRE QUAL CORRETOR ALUGOU MAIS IMÓVEIS (CRECI E NOME) E A RESPECTIVA QUANTIDADE 
SELECT c.CRECI, f.NOME, COUNT(*) AS total_alugueis
FROM CORRETOR c
JOIN ALUGUEL a ON c.CRECI = a.CRECI_CORRETOR
JOIN FUNCIONARIO f ON c.CPF = f.CPF
GROUP BY c.CRECI, f.NOME
HAVING COUNT(*) = (
  SELECT MAX(alugueis_count)
  FROM (
    SELECT COUNT(*) AS alugueis_count
    FROM ALUGUEL
    GROUP BY CRECI_CORRETOR
  ) AS count
);



-- FUNÇÃO: MOSTRAR OS CONTRATOS (ID_CONTRATO, IMÓVEL E INQUILINO) QUE POSSUEM PAGAMENTOS EM ATRASO 
CREATE FUNCTION contratos_com_pagamentos_atrasados()
RETURNS TABLE (
  id_contrato INT,
  imovel INT,
  inquilino INT
) AS $$
BEGIN
  RETURN QUERY
  SELECT a.ID_CONTRATO, a.COD_IM, a.COD_INQ
  FROM ALUGUEL a
  INNER JOIN PAGAMENTOS p ON a.ID_CONTRATO = p.ID_CONTRATO
  WHERE p.DATA_VENCIMENTO < CURRENT_DATE AND p.DATA_PAGAMENTO IS NULL;
END;
$$ LANGUAGE plpgsql;

-- Consulta para rodar a função:
SELECT * FROM contratos_com_pagamentos_atrasados();



-- TRIGGER: ATUALIZAR O VALOR TOTAL DE MANUTENÇÕES EM UM IMÓVEL SEMPRE QUE UM NOVA MANUTENÇÃO FOR ADICIONADA

-- Adicionar a coluna VALOR_TOTAL_MANUTENCOES na tabela IMOVEL
ALTER TABLE IMOVEL
ADD COLUMN VALOR_TOTAL_MANUTENCOES DECIMAL(10, 2) DEFAULT 0;

-- Criar a trigger de atualização do valor total de manutenções em um imóvel

-- Criação da função
CREATE OR REPLACE FUNCTION calcular_valor_total_manutencoes()
RETURNS TRIGGER AS $$
DECLARE
  valor_total DECIMAL(10, 2);
BEGIN
  SELECT COALESCE(SUM(VALOR), 0) INTO valor_total
  FROM MANUTENCAO
  WHERE COD_IM = NEW.COD_IM;
  UPDATE IMOVEL
  SET VALOR_TOTAL_MANUTENCOES = valor_total
  WHERE CODIGO_IM = NEW.COD_IM;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação da trigger
CREATE TRIGGER atualizar_valor_total_manutencoes
AFTER INSERT ON MANUTENCAO
FOR EACH ROW
EXECUTE FUNCTION calcular_valor_total_manutencoes();
