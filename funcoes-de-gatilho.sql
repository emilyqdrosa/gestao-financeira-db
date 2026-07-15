CREATE OR REPLACE FUNCTION verificar_valor_gasto_pagamento()
RETURNS TRIGGER AS $$
DECLARE
    v_id_gasto INT;
    v_valor INT;
    v_soma INT;
BEGIN
    FOR v_id_gasto IN SELECT DISTINCT id_gasto FROM novas_linhas LOOP
        
        SELECT valor INTO v_valor FROM gasto WHERE id_gasto = v_id_gasto;

        SELECT COALESCE(SUM(valor), 0) INTO v_soma FROM gasto_pagamento WHERE id_gasto = v_id_gasto;
        
        IF NOT v_soma = v_valor THEN
            RAISE EXCEPTION '[ERRO] A soma dos pagamentos (%) não é igual ao valor total da compra (%)', v_soma, v_valor;
        END IF;

    END LOOP;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_verificar_valor_gasto_pagamento
AFTER INSERT ON gasto_pagamento
REFERENCING NEW TABLE AS novas_linhas
FOR EACH STATEMENT
EXECUTE FUNCTION verificar_valor_gasto_pagamento();

CREATE OR REPLACE FUNCTION debitar_saldo()
RETURNS TRIGGER AS $$
DECLARE
    v_id_pessoa INT;
    v_saldo_atual INT;
BEGIN
    SELECT id_pessoa INTO v_id_pessoa FROM gasto WHERE id_gasto = NEW.id_gasto;
    SELECT saldo INTO v_saldo_atual FROM pessoa WHERE id_pessoa = v_id_pessoa;

    IF v_saldo_atual < NEW.valor THEN
        RAISE EXCEPTION '[ERRO] Saldo insuficiente. Compra de % e saldo é de %.', NEW.valor, v_saldo_atual;
    END IF;

    UPDATE pessoa 
	SET saldo = saldo - NEW.valor 
	WHERE id_pessoa = v_id_pessoa;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_debitar_saldo
AFTER INSERT OR UPDATE ON gasto
FOR EACH ROW
EXECUTE FUNCTION debitar_saldo();
