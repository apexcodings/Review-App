Rails.application.routes.draw do
  resources :reviews
  resources :languages
  resources :authors
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
