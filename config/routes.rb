Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "todos", to: "todos#index"
  # post "todos/create", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  get "/" => "home#index"
  resources :todos

  resources :users

  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
