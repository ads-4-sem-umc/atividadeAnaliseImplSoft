CREATE TABLE produto (
	id int PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255) NOT NULL,
	codigo_barra VARCHAR(255) NOT NULL,
	estoque int NOT NULL,
	nome_vendedor VARCHAR(255) NOT NULl,
	custo DECIMAL(38,2) NOT NULL,
	valor_venda DECIMAL(38,2) NOT NULL
);
