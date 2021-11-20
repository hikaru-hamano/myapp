Rails.application.routes.draw do
 
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  resources :tasks
  get "/search", to: "rooms#search"
  post 'reserve/create',as:"reserve"
  
  resources :rooms do
    resources :reservations
  end 
  
  resources :reservations
end
