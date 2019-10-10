Rails.application.routes.draw do
  resources :foods
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
end