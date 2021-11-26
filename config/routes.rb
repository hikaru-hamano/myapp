Rails.application.routes.draw do
 
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  resources :tasks
  get "/search", to: "rooms#search"
  get "/check", to: "rooms#check"
  post 'reserve/create',as:"reserve"
  get "/myrooms/:id", to: "users#myrooms"
  post "/reservations/new", to: "reservations#new"
  resources :rooms do
    resources :reservations
    member do
      get :'checks',to: "rooms#check"
    end
  end 
  
  resources :reservations
end
