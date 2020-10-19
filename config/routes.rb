Rails.application.routes.draw do
  devise_for :users
  resources :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get 'about', to: 'pages#about'
  get 'contacts', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]


  get "profile", to: "pages#profile", as: "profile"

end
