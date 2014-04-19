SelfTracking295B::Application.routes.draw do
  root to: "places#index" 
  resources :places
  resources :histories
  resources :locations 
  resources :alerts
  resources :users

  get '/login', to: 'users#login'
  get '/register', to: 'users#register'
  
end
