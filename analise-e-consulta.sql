SELECT * FROM pessoa;
SELECT * FROM forma_de_pagamento;
SELECT * FROM gasto;
SELECT * FROM gasto_pagamento;

SELECT nome, saldo FROM pessoa ORDER BY saldo DESC;

SELECT compra, local_de_compra, categoria, valor, data_de_compra FROM gasto ORDER BY data_de_compra DESC;

SELECT id_pessoa, compra, valor, data_de_compra FROM gasto WHERE categoria = 'Vestuário';

SELECT compra, valor, categoria, data_de_compra FROM gasto WHERE id_pessoa = 1;
SELECT compra, valor, categoria, data_de_compra FROM gasto WHERE id_pessoa = 2;

SELECT SUM(valor) AS total_gastos FROM gasto WHERE id_pessoa = 3;

SELECT id_pessoa, AVG(valor) AS media_gastos FROM gasto GROUP BY id_pessoa;
