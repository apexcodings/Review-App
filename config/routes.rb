Rails.application.routes.draw do

  resources :courses do 
    resources :reviews
  end

  resources :reviews, only: [:create, :update]

  resources :languages

  resources :authors

  resources :users

  root 'users#home'

  get '/signup' => "users#new"
  post '/users' => "users#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  # get '/auth/some_platform/callback' => 'sessions#create'
 

  
end
