Rails.application.routes.draw do
  resources :favorite_stores
  resources :reviews
  resources :ice_cream_stores
  resources :ice_creams
  resources :stores
  resources :users, only: [:create, :index]
  
  post '/login', to: 'auth#create'
  get '/check-favorite-store', to: 'favorite_stores#is_user_favorite'
  get '/delete-favorite-store', to: 'favorite_stores#delete_favorite_store'
end
