CREATE TABLE pessoa ( 
	id_pessoa SERIAL PRIMARY KEY,  
	nome VARCHAR(100) NOT NULL,  
	saldo INT DEFAULT 0,
); 

SELECT * FROM pessoa;

CREATE TABLE forma_de_pagamento( 
	id_forma_de_pagamento SERIAL PRIMARY KEY,  
	nome VARCHAR(20) NOT NULL
); 

SELECT * FROM forma_de_pagamento;

CREATE TABLE gasto(
	id_gasto SERIAL PRIMARY KEY,  
 	id_pessoa INT NOT NULL, 
 	compra VARCHAR(255) NOT NULL,  
 	local_de_compra VARCHAR(255),  
 	data_de_compra DATE
);

ALTER TABLE gasto ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa);

ALTER TABLE gasto ADD COLUMN valor INT;

CREATE TYPE categoria_enum AS ENUM ('Alimentação', 'Transporte', 'Lazer', 'Moradia', 'Saúde', 'Conta fixa', 
'Presente', 'Educação', 'Assinatura', 'Cuidado pessoal', 'Vestuário', 'Reserva');

ALTER TABLE gasto ADD COLUMN categoria categoria_enum;

SELECT * FROM gasto;

CREATE TABLE gasto_pagamento(
	id_gasto INT NOT NULL,
	id_forma_de_pagamento INT NOT NULL,
	valor INT NOT NULL, 

	PRIMARY KEY (id_gasto, id_forma_de_pagamento)
);

ALTER TABLE gasto_pagamento ADD FOREIGN KEY(id_gasto) REFERENCES gasto (id_gasto);
ALTER TABLE gasto_pagamento ADD FOREIGN KEY(id_forma_de_pagamento) REFERENCES forma_de_pagamento (id_forma_de_pagamento);

SELECT * FROM gasto_pagamento;
