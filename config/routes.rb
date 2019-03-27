Rails.application.routes.draw do


  get '/carts/index', to: 'carts#index'
  get '/carts', to: 'carts#show'
  get '/carts/ty', to: 'carts#ty'
  post '/carts', to: 'carts#create'
  post '/carts/order', to: 'carts#order'
  post '/carts/remove', to: 'carts#remove_item'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/analyticpage', to: 'users#index'
  resources :users, except: [:index]
  root 'users#home'

  resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
