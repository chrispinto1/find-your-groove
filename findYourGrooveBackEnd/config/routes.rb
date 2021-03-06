Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/genres", to: "genres#index"
  get "/subgenres", to: "subgenres#index"
  get "/subgenres/:id", to: "subgenres#show"
  get "/bands", to: "bands#index"
  get "/bands/:id", to: "bands#show"
  get "/users", to: "users#index"
  post "/users", to: "users#create"
  # resourses :genres
  # resources :subgenres
  # resources :bands
  # resources :users
end
