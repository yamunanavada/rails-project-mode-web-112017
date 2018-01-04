Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :teams
  resources :leagues
  resources :players, only: [:index, :show]
  resources :games, only: [:index, :show, :new, :create]
  resources :team_players, only: [:create]

  root 'sessions#index'
  get '/sessions', to: 'sessions#index'
  get "/signup", to: "users#new", as: "signup"
  get "/signin", to: "sessions#new",  as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: 'delete_session'
  delete "/team_players", to: "team_players#destroy", as: "delete_team_player"

end
