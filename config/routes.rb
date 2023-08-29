Rails.application.routes.draw do
  resources :discounts, defaults: { format: 'json' }
  resources :categories, defaults: { format: 'json' }
  resources :addresses
  resources :shipping_methods
  resources :payment_methods
  resources :orders
  devise_for :users
  
  resources :products, defaults: { format: 'json' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
