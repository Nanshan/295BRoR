SelfTracking295B::Application.routes.draw do
  root to: "places#index" 

  resources :places

  resources :logins

  resources :histories
  resources :locations 
  resources :alerts

  post '/login', to: 'users#login'
  post '/register', to: 'users#register'
  
end
