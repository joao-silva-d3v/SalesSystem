CREATE DATABASE SistemaVendas
GO

USE SistemaVendas
GO

CREATE TABLE CadastroFornecedores(
    ID_Fornecedor INT PRIMARY KEY,
    NomeEmpresa VARCHAR(100),
    Endereco VARCHAR(255),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    CPF_CNPJ VARCHAR(20)
)
INSERT INTO CadastroFornecedores (ID_Fornecedor, NomeEmpresa, Endereco, Email, Telefone, CPF_CNPJ)
VALUES (1, 'Fornecedor A', 'Rua C, 789', 'fornecedor@email.com', '987254321', '987.654.321-00')

CREATE TABLE CadastroProdutos(
    ID_Produto INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    DescricaoProduto VARCHAR(255),
    PrecoProduto DECIMAL(10, 2),
    ID_Fornecedor INT,
    QuantidadeEstoque INT,
    FOREIGN KEY (ID_Fornecedor) REFERENCES CadastroFornecedores(ID_Fornecedor)
)
INSERT INTO CadastroProdutos (ID_Produto, NomeProduto, DescricaoProduto, PrecoProduto, ID_Fornecedor, QuantidadeEstoque)
VALUES (1, 'Martelo', 'Martelo de aço', 15.99, 1, 50);

CREATE TABLE CadastroClientes(
    ID_Cliente INT PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Endereco VARCHAR(255),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    CPF_CNPJ VARCHAR(20)
)
INSERT INTO CadastroClientes (ID_Cliente, NomeCompleto, Endereco, Email, Telefone, CPF_CNPJ)
VALUES (1, 'João', 'Rua A, 123', 'joao@email.com', '123456789', '123.456.789-00')

INSERT INTO CadastroClientes (ID_Cliente, NomeCompleto, Endereco, Email, Telefone, CPF_CNPJ)
VALUES (2, 'Emily', 'Rua B, 456', 'emily@email.com', '121525232', '128.476.739-00')

CREATE TABLE CadastroVendedores(
    ID_Vendedor INT PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Endereco NVARCHAR(255),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    CPF VARCHAR(20),
    DataAdmissao DATE,
    Salario DECIMAL(10, 2),
    HistoricoVendas VARCHAR(MAX)
)
INSERT INTO CadastroVendedores (ID_Vendedor, NomeCompleto, Endereco, Email, Telefone, CPF, DataAdmissao, Salario, HistoricoVendas)
VALUES (1, 'Carlos Eduardo', 'Rua D, 101112', 'carlos@example.com', '987774321', '153.756.789-01', '2020-01-02', 3000.00, 'Vendas realizadas nos últimos meses')

CREATE TABLE CadastroPedidos(
    ID_Pedido INT PRIMARY KEY,
    DataPedido DATE,
    ID_Cliente INT,
    ID_Vendedor INT,
    PrecoTotal DECIMAL(10, 2),
    StatusPedido VARCHAR(50),
    FOREIGN KEY (ID_Cliente) REFERENCES CadastroClientes(ID_Cliente),
    FOREIGN KEY (ID_Vendedor) REFERENCES CadastroVendedores(ID_Vendedor)
)
INSERT INTO CadastroPedidos (ID_Pedido, DataPedido, ID_Cliente, ID_Vendedor, PrecoTotal, StatusPedido)
VALUES (1, '2024-04-01', 1, 1, 50.00, 'Em andamento')


CREATE TABLE ControleEstoque(
    ID_Produto INT PRIMARY KEY,
    QuantidadeEstoque INT,
    QuantidadeMinimaEstoque INT,
    QuantidadeMaximaEstoque INT,
    AlertaEstoqueMinimo INT,
    FOREIGN KEY (ID_Produto) REFERENCES CadastroProdutos(ID_Produto)
)
INSERT INTO ControleEstoque (ID_Produto, QuantidadeEstoque, QuantidadeMinimaEstoque, QuantidadeMaximaEstoque, AlertaEstoqueMinimo)
VALUES (1, 50, 10, 100, 0);

CREATE TABLE CadastroTransportadoras(
    ID_Transportadora INT PRIMARY KEY,
    NomeTransportadora VARCHAR(100),
    Endereco VARCHAR(255),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
)
INSERT INTO CadastroTransportadoras (ID_Transportadora, NomeTransportadora, Endereco, Email, Telefone)
VALUES (1, 'Transportadora SAS', 'Av. Principal, 123', 'transportadora@example.com', '987632351');

CREATE TABLE Administradores(
    ID_Administrador INT PRIMARY KEY,
    Nome VARCHAR(100),
    Senha VARCHAR(50)
)
INSERT INTO Administradores (ID_Administrador, Nome, Senha)
VALUES (1, 'AdminJO', 'senha123')
INSERT INTO Administradores (ID_Administrador, Nome, Senha)
VALUES (2, 'AdminEM', 'senha456')