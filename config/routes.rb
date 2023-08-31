Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :products, defaults: { format: 'json' }
  resources :payments, defaults: { format: 'json' }
  resources :discounts, defaults: { format: 'json' }
  resources :categories, defaults: { format: 'json' }
  resources :addresses
  resources :shipping_methods
  resources :payment_methods
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
