Rails.application.routes.draw do
  resources :favorite_stores
  resources :reviews
  resources :ice_cream_stores
  resources :ice_creams
  resources :stores
  resources :users, only: [:create, :index]
  
  post '/login', to: 'auth#create'
end
