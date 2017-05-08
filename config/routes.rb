Rails.application.routes.draw do
  resources :users
  get 'products', to: 'products#index'
end
