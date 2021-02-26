Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'carts/:id', to: 'carts#show', as: 'cart'
  delete 'carts/:id', to: 'carts#destroy'

  get 'about', to: 'pages#about'
  get 'contacts', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end

  post 'line_items/:id/add', to: 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items', to: 'line_items#create'
  get 'line_items/:id', to: 'line_items#show', as: 'line_item'
  delete 'line_items/:id', to: 'line_items#destroy'


  get "profile", to: "pages#profile", as: "profile"

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
