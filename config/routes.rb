Rails.application.routes.draw do
 
  # resources 
  resources :projects, only: [:index, :show, :create, :update, :destroy, :filtered_words]
  resources :users, only: [:index, :show, :create, :update, :destroy]

  patch "/projects/archive/:id", to:"projects#archive"
    patch "/projects/approve/:id", to:"projects#approve"
  post "auth/signin", to:"session#signin"
  delete "auth/signout", to:"session#signout"
   get "/current_user", to:"users#signedin_user"
   get "/approvedprojects", to:"projects#approvedprojects"
  # resources :profanity_filter
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
