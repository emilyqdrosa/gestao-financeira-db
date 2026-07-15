INSERT INTO pessoa(nome, saldo)
VALUES ('Nícolas', 30), 
	   ('Emily', 80), 
	   ('Luana', 50);

UPDATE pessoa 
SET saldo = 3000 WHERE id_pessoa = 1;

UPDATE pessoa 
SET saldo = 8000 WHERE id_pessoa = 2;

UPDATE pessoa 
SET saldo = 5000 WHERE id_pessoa = 3;

SELECT * FROM pessoa;

INSERT INTO forma_de_pagamento(nome)
VALUES ('PIX'), 
	   ('DÉBITO'), 
	   ('CRÉDITO'), 
	   ('BOLETO'), 
	   ('DINHEIRO');

SELECT * FROM forma_de_pagamento;

-- exemplo com erro: saldo insuficiente
INSERT INTO gasto (compra, local_de_compra, data_de_compra, id_pessoa, categoria, valor)
VALUES  ('Brinquedo pra cachorro', 'Pet Shop', '2026-07-06', 1, 'Presente', 4000);

INSERT INTO gasto (compra, local_de_compra, data_de_compra, id_pessoa, categoria, valor)
VALUES  ('Brinquedo pra cachorro', 'Pet Shop', '2026-07-06', 1, 'Presente', 3000), 
		('Blusa', 'Renner', '2026-06-08', 2, 'Vestuário', 6000), 
		('Youtube Premium', 'Youtube', '2026-06-12', 3, 'Assinatura', 1700),
		('Ingresso cinema', 'Cinemark', '2026-07-15', 2, 'Lazer', 1000), 
		('Uber', 'Uber', '2026-05-29', 3, 'Transporte', 2000);

SELECT * FROM gasto;

-- exemplo com erro: valores diferentes
INSERT INTO gasto_pagamento (id_gasto, id_forma_de_pagamento, valor)
VALUES (2, 3, 1000),
	   (2, 2, 3000);	
	   
INSERT INTO gasto_pagamento (id_gasto, id_forma_de_pagamento, valor)
VALUES (3, 1, 5000);

INSERT INTO gasto_pagamento (id_gasto, id_forma_de_pagamento, valor)
VALUES (2, 3, 1000),
       (2, 2, 2000),	   
	   (3, 1, 6000),
	   (4, 5, 1700),
	   (5, 5, 1000),
	   (6, 1, 2000);	   

SELECT * FROM gasto_pagamento;
