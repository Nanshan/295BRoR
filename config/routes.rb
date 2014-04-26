SelfTracking295B::Application.routes.draw do
  root to: "places#index" 
  resources :places
  resources :histories
  resources :locations 
  resources :alerts

  get '/users', to: 'users#index'
  get '/users/:name', to: 'users#show'
  get '/login', to: 'users#login'
  get '/register', to: 'users#register'
  get '/near', to: 'places#near'
  
end
