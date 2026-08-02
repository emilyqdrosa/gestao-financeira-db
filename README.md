# 📌 Gestão Financeira

> Desafio proposto pela Residência Fullstack (Instituto Eldorado), onde era preciso criar uma solução que fosse
capaz de registrar, organizar, analisar e consultar dados de gastos pessoais.

* Diagrama conceitual e lógico do banco de dados
* Estrutura do banco de dados
* Funções de gatilho usando plpgsql
    * Validação de Pagamentos: Impede o registro no banco se a soma dos pagamentos por forma de pagamento diferente não for exatamente igual ao valor total da compra.
    * Débito Automático: Confere se o usuário tem saldo antes da compra. Se tiver, desconta o valor automaticamente; se não, bloqueia a operação.
* Registro de dados fictícios
* Análises e consultas simples

## Tecnologias 

| Tecnologia | Finalidade |
| :--- | :--- |
| **PostgreSQL** | Banco de dados principal |

<!--
## 🛠️ Pré-requisitos

Antes de começar, você vai precisar ter as seguintes ferramentas instaladas na sua máquina:

* Git
* PostgreSQL
* Um cliente de banco de dados (exemplo: pgAdmin)

## ⚙️ Instalação e Execução

Siga os passos abaixo para baixar e rodar os scripts SQL no seu ambiente de banco de dados local.

```bash
# Clone este repositório
git clone [https://github.com/emilyqdrosa/gestao-financeira-db.git](https://github.com/emilyqdrosa/gestao-financeira-db.git)

# Acesse a pasta do projeto
cd gestao-financeira-db
# Execute a aplicação em modo de desenvolvimento
npm start
