Rails.application.routes.draw do
  devise_for :users
  resources :rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rooms#index"
end
