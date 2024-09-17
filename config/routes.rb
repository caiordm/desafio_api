Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    patch 'users/password', to: 'users/registrations#update_password'
  end
  
  get "/items", to: "items#index"
  post "/items", to: "items#create"
  get "item/:id", to: "items#show"
  put "/item/:id", to: "items#update"
  delete "/item/:id", to: "items#destroy"

  put 'users/:id', to: 'users#update'
end
