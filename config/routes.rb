Rails.application.routes.draw do

  resources :courses do 
    # Think I need most here as they are all nested
    resources :reviews
  end

  # Not entirely sure I need any here
  resources :reviews, only: [:create, :update]

  # Think I only need index and show, not sure about creation stuff
  resources :languages

  # Same as language
  resources :authors

  # Show page is all I have, don't need any CRUD, do I need routes for creation actions?
  resources :users

  root 'users#home'

  get '/signup' => "users#new"
  post '/users' => "users#create"
  get '/login' => "sessions#new"
  # Want to look at this one as I don't think it's best practice
  post '/' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
 

  
end
