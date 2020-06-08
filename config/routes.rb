Rails.application.routes.draw do

  resources :courses, only: [:new, :index, :create, :show] do 
    resources :reviews, except: [:index]
  end

  # # Not entirely sure I need any here
  resources :reviews, only: [:create, :update]

  resources :languages, only: [:index, :show]

  resources :authors, only: [:index, :show]

  resources :users, only: [:index, :show, :home]

  root 'users#home'

  get '/signup' => "users#new"
  post '/users' => "users#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
 
end
