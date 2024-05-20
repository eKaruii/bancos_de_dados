CREATE SCHEMA IF NOT EXISTS BDEX4_ESTOQUE;
USE BDEX4_ESTOQUE;

CREATE TABLE IF NOT EXISTS PRODUTOS(
ID_PRODUTO INT PRIMARY KEY,
NOME_PRO VARCHAR(100) NOT NULL,
DESCRICAO TEXT NOT NULL,
PRECO DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS FORNECEDORES(
ID_FORNECEDOR INT PRIMARY KEY,
CNPJ VARCHAR(20) NOT NULL,
NOME_FOR VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ARMAZENS(
ID_ARMAZEM INT PRIMARY KEY,
NOME_ARMAZEM VARCHAR(100) NOT NULL,
LOG_ARMAZEM VARCHAR(100) NOT NULL,
NUMLOG_ARMAZEM INT,
BAIRRO_ARMAZEM VARCHAR(100) NOT NULL,
CIDADE_ARMAZEM VARCHAR(100) NOT NULL,
UF_ARMAZEM CHAR(2) NOT NULL);

CREATE TABLE IF NOT EXISTS PEDIDOS_COMPRA(
ID_PEDIDO INT PRIMARY KEY,
DATA_PEDIDO DATE NOT NULL,
HORA_PEDIDO TIME NOT NULL,
FORNECEDOR INT NOT NULL,
CONSTRAINT FORNECEDOR_PEDIDO FOREIGN KEY(FORNECEDOR) 
REFERENCES FORNECEDORES(ID_FORNECEDOR));

CREATE TABLE IF NOT EXISTS PRODUTOS_FORNECEDORES(
PRODUTO INT,
FORNECEDOR INT,
PRIMARY KEY(PRODUTO,FORNECEDOR),
CONSTRAINT PROD_FORN FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO),
CONSTRAINT FORN_PROD FOREIGN KEY(FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR)
);

CREATE TABLE IF NOT EXISTS PRODUTOS_ARMAZENS(
PRODUTO INT,
ARMAZEM INT,
PRIMARY KEY(PRODUTO,ARMAZEM),
CONSTRAINT PROD_ARMZ FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO),
CONSTRAINT ARMZ_PROD FOREIGN KEY(ARMAZEM) REFERENCES ARMAZENS(ID_ARMAZEM));

ALTER TABLE PRODUTOS_ARMAZENS
ADD QUANTIDADE INT NOT NULL;

USE BDEX4_ESTOQUE;
INSERT INTO PRODUTOS (ID_PRODUTO, NOME_PRO, DESCRICAO, PRECO) VALUES
(1, 'Camiseta', 'Camiseta branca de algodão', 25.90),
(2, 'Calça Jeans', 'Calça jeans slim azul', 59.99),
(3, 'Tênis', 'Tênis esportivo preto', 79.50),
(4, 'Relógio', 'Relógio de pulso analógico', 99.00),
(5, 'Mochila', 'Mochila escolar resistente', 39.90),
(6, 'Notebook', 'Notebook Intel Core i5', 1899.99),
(7, 'Smartphone', 'Smartphone Android com câmera de alta resolução', 799.00),
(8, 'Fones de Ouvido', 'Fones de ouvido sem fio', 129.90),
(9, 'Cadeira', 'Cadeira de escritório ergonômica', 199.00),
(10, 'Mesa', 'Mesa de jantar retangular', 299.99),
(11, 'Luminária', 'Luminária de mesa LED', 49.90),
(12, 'Tapete', 'Tapete felpudo para sala', 79.00),
(13, 'Panela', 'Panela de pressão antiaderente', 39.99),
(14, 'Liquidificador', 'Liquidificador potente com várias velocidades', 89.90),
(15, 'Ventilador', 'Ventilador de mesa com 3 velocidades', 69.00),
(16, 'Cama', 'Cama box casal com colchão ortopédico', 799.00),
(17, 'Travesseiro', 'Travesseiro de espuma viscoelástica', 29.90),
(18, 'Toalha de Banho', 'Toalha de banho felpuda', 19.99),
(19, 'Guarda-chuva', 'Guarda-chuva dobrável resistente ao vento', 15.00),
(20, 'Cadeado', 'Cadeado de segredo premium para bagagem', 9.99);

INSERT INTO FORNECEDORES (ID_FORNECEDOR, CNPJ, NOME_FOR, CIDADE) VALUES
(1, '12345678901', 'MegaTech Distribuidora', 'São Paulo'),
(2, '23456789012', 'Fashion Supplier', 'Rio de Janeiro'),
(3, '34567890123', 'Food King', 'Belo Horizonte'),
(4, '45678901234', 'ElectroParts', 'Curitiba'),
(5, '56789012345', 'Aqua Supplies', 'Porto Alegre'),
(6, '67890123456', 'Natureza & Cia', 'Recife'),
(7, '78901234567', 'PetLove', 'Salvador'),
(8, '89012345678', 'TechWiz', 'Fortaleza'),
(9, '90123456789', 'BioFarm', 'Brasília'),
(10, '01234567890', 'HomeDecor', 'Manaus'),
(11, '98765432109', 'Books & More', 'Belém'),
(12, '87654321098', 'Fit&Fab', 'Goiânia'),
(13, '76543210987', 'Healthy Supplies', 'Porto Velho'),
(14, '65432109876', 'BeautyHub', 'Florianópolis'),
(15, '54321098765', 'PhotoGear', 'Vitória'),
(16, '43210987654', 'GameZone', 'Natal'),
(17, '32109876543', 'EduCorp', 'João Pessoa'),
(18, '21098765432', 'OfficeTech', 'Maceió'),
(19, '10987654321', 'History Emporium', 'Teresina'),
(20, '09876543210', 'Adventure Gear', 'Cuiabá');

INSERT INTO ARMAZENS (ID_ARMAZEM, NOME_ARMAZEM, LOG_ARMAZEM, NUMLOG_ARMAZEM, BAIRRO_ARMAZEM, CIDADE_ARMAZEM, UF_ARMAZEM) VALUES
(1, 'MegaDepot', 'Avenida das Indústrias', 100, 'Industrial', 'São Paulo', 'SP'),
(2, 'FashionHub', 'Rua das Tendências', 200, 'Moda', 'Rio de Janeiro', 'RJ'),
(3, 'Food Central', 'Rua dos Alimentos', 300, 'Culinária', 'Belo Horizonte', 'MG'),
(4, 'ElectroStore', 'Avenida da Tecnologia', 400, 'Tecnopark', 'Curitiba', 'PR'),
(5, 'AquaWarehouse', 'Rua dos Aquários', 500, 'Aquatic', 'Porto Alegre', 'RS'),
(6, 'NatureShed', 'Rua das Plantas', 600, 'Green Valley', 'Recife', 'PE'),
(7, 'PetDepot', 'Avenida dos Pets', 700, 'Animalia', 'Salvador', 'BA'),
(8, 'TechZone', 'Rua da Inovação', 800, 'Techville', 'Fortaleza', 'CE'),
(9, 'BioMarket', 'Avenida da Saúde', 900, 'Health District', 'Brasília', 'DF'),
(10, 'HomeBase', 'Rua dos Lares', 1000, 'Residential', 'Manaus', 'AM'),
(11, 'BookEmporium', 'Avenida das Páginas', 1100, 'Literary', 'Belém', 'PA'),
(12, 'FitWarehouse', 'Rua do Fitness', 1200, 'Active', 'Goiânia', 'GO'),
(13, 'HealthSpot', 'Avenida do Bem-Estar', 1300, 'Healthy Living', 'Porto Velho', 'RO'),
(14, 'BeautyBazaar', 'Rua da Beleza', 1400, 'Glamour', 'Florianópolis', 'SC'),
(15, 'PhotoHouse', 'Avenida das Fotos', 1500, 'Snapshot', 'Vitória', 'ES'),
(16, 'GameEmpire', 'Rua dos Jogos', 1600, 'Gamer District', 'Natal', 'RN'),
(17, 'EduCenter', 'Avenida do Conhecimento', 1700, 'Educational', 'João Pessoa', 'PB'),
(18, 'OfficeHub', 'Rua do Trabalho', 1800, 'Business District', 'Maceió', 'AL'),
(19, 'HistoryHall', 'Avenida da História', 1900, 'Historical', 'Teresina', 'PI'),
(20, 'AdventureBase', 'Rua da Aventura', 2000, 'Explorer', 'Cuiabá', 'MT');

-- Inserção na tabela PRODUTOS_FORNECEDORES
INSERT INTO PRODUTOS_FORNECEDORES (PRODUTO, FORNECEDOR) VALUES
    (1, 1), (3, 1), (5, 1),
    (2, 8), (4, 9), (6, 10),
    (7, 3), (1, 7), (9, 5),
    (10, 4),
    (11, 6), (12, 12),
    (13, 2), (14, 4),
    (15, 10), (16, 11),
    (17, 7), (18, 6),
    (19, 8), (2, 9),
    (20, 1), (2, 3), (13, 5),
    (4, 2), (5, 4), (16, 6),
    (7, 8), (8, 10), (19, 12),
    (3, 11),
    (1, 9), (2, 7),
    (3, 6), (4, 4),
    (5, 2), (6, 1),
    (7, 10), (8, 5),
    (9, 3), (4, 8);

-- Inserção na tabela PRODUTOS_ARMAZENS
INSERT INTO PRODUTOS_ARMAZENS (PRODUTO, ARMAZEM, QUANTIDADE) VALUES
    (1, 1, 50), (3, 1, 80), (5, 1, 120),
    (2, 2, 100), (4, 2, 70), (6, 2, 90),
    (7, 3, 50), (8, 3, 200), (9, 3, 70),
    (10, 4, 80),
    (11, 5, 30), (12, 5, 40),
    (13, 6, 100), (14, 6, 80),
    (15, 8, 150), (16, 8, 60),
    (17, 10, 200), (18, 10, 120),
    (19, 12, 50), (20, 12, 70),
    (2, 1, 25), (12, 2, 45), (13, 3, 65),
    (4, 4, 35), (15, 5, 55), (16, 6, 75),
    (7, 7, 95), (18, 8, 115), (19, 9, 135),
    (3, 10, 155),
    (1, 11, 175), (2, 12, 195),
    (9, 1, 215), (14, 2, 235),
    (5, 3, 255), (6, 4, 275),
    (7, 5, 295), (8, 6, 315),
    (9, 7, 335), (4, 8, 355);
    
    
    
   
    
    
    
