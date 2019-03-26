Rails.application.routes.draw do



  get '/carts', to: 'carts#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/analyticpage', to: 'users#index'
  resources :users, except: [:index]
  root 'users#home'

  resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
