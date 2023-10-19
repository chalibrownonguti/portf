Rails.application.routes.draw do
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end