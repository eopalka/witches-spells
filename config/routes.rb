Rails.application.routes.draw do

  root to: 'sessions#welcome'
  match '/auth/:google_oauth2/callback' => 'sessions#omniauth', via: [:get, :post]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
 

  get '/signup', to: 'users#new', as: "signup"
  post '/signup', to: 'users#create'

 
  resources :users
  resources :wands
  resources :spells
  resources :books do 
    resources :spells
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
