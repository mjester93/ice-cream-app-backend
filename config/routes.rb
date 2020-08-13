Rails.application.routes.draw do
  resources :favorite_stores
  resources :reviews
  resources :ice_cream_stores
  resources :ice_creams
  resources :stores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
