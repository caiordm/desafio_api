# README

Para o projeto estou usando Ruby 3.3.0, Rails 7.1.4 e SQLite 1.4
A API está disponível em: https://capyba-desafio-autumn-moon-9335.fly.dev/

## Para rodar o projeto pela primeira vez use os comandos:

- `bundle install` - Para instalar as dependências
- `rails db:create` - Para criar o banco de dados
- `rails db:migrate` - Para aplicar as migrações
- `rails db:seed` - Para popular o banco com dados iniciais
- `rails s` - Para iniciar o servidor


## Documentação

Para ver a documentação entre na pasta "documentation" e use o comando:

- `npx serve`


## Endpoints Implementados

- **Cadastro de Usuário**
- **Login e Logout**
- **Alterar Senha** (com confirmação da senha atual)
- **Atualizar Usuário**
- **Listagem de Itens** (disponível apenas para usuários logados)
- **Requisição com Paginação**
- **Listagem com Filtro de Texto**
- **Listagem com Filtro de Opções de Ordenação**