# spec/integration/items_spec.rb
require 'swagger_helper'

RSpec.describe 'Items API', type: :request do
  path '/items' do
    get 'Listar todos os itens' do
      tags 'Items'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, description: 'Número da página'
      parameter name: :per_page, in: :query, type: :integer, description: 'Itens por página'

      response '200', 'Itens listados com sucesso' do
        schema type: :array, items: { 
          type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            description: { type: :string },
            user_id: { type: :integer }
          }
        }

        let!(:items) { create_list(:item, 10) }
        run_test!
      end

      response '401', 'Não autorizado' do
        let(:Authorization) { 'invalid token' }
        run_test!
      end
    end
  end
end

RSpec.describe 'Items API', type: :request do
  path '/items' do
    post 'Criar um novo item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          user_id: { type: :integer }
        },
        required: [ 'title', 'description', 'user_id' ]
      }

      response '201', 'Item criado com sucesso' do
        let(:item) { { title: 'Novo item', description: 'Descrição do item', user_id: 1 } }
        run_test!
      end

      response '422', 'Parâmetros inválidos' do
        let(:item) { { title: '' } }
        run_test!
      end
    end
  end
end
